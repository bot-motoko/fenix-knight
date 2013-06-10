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
      lists.each do |list|
        lookbook_idendifier = list.css("img")[0]["alt"]
        permalink = list.css("a")[0]["href"]
        list_image_link = list.css("img")[0]["src"]
        image_link = list_image_link.sub(%r!/files/looks/list/!) { "/files/looks/{{scale}}/" }
        hash = { lookbook_idendifier: lookbook_idendifier, permalink: permalink, image_link: image_link }
        puts hash
        if false
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
    initial_url = "http://lookbook.nu/search?gender=girls&q=glasses&r=1"
    Clawler.new.run!(initial_url)
  end
end
