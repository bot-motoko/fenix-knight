class Clawler
  def initialize
    @agent = Mechanize.new
  end

  def run!(url, dry_run: false)
    completed = false
    page = nil
    until completed do
      page = @agent.get(url) unless page
      lists = page.root.css("li.bordertop div.bottomspaced")
      provider = Provider.where(name: 'lookbook').first_or_create
      lists.each do |list|
        identifier = list.css("img")[0]["alt"]
        permalink = list.css("a")[0]["href"]
        list_image_link = list.css("img")[0]["src"]
        imagelink = list_image_link.sub(%r!/files/looks/list/!) { "/files/looks/{{scale}}/" }
        entry = Entry.new(identifier: identifier, provider: provider, permalink: permalink, imagelink: imagelink)
        if ! entry.save(entry)
          completed = true
          break
        end
      end
      if paginator = page.link_with(dom_class: 'paginator')
        page = paginator.click
      else
        completed = true
      end
    end
  end
end

namespace :crawl do
  desc 'run crawler'
  task girls: :environment do
    initial_url = "http://lookbook.nu/search?gender=girls&q=glasses&r=1&sort=newest"
    Clawler.new.run!(initial_url)
  end
end
