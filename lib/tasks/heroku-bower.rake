task 'assets:precompile' => ["heroku:node:install[0.8.25]"]

namespace :heroku do
  namespace :node do
    desc "install node"
    task :install, 'version'
    task :install do |t, args|
      version = args.version
      `(cd /tmp && curl -O https://heroku-buildpack-nodejs.s3.amazonaws.com/nodejs-#{version}.tgz)`
      `(mkdir -p bin/nodejs && cd bin/nodejs && tar xzf /tmp/nodejs-#{version}.tgz)`
      `(cd bin && ln -s nodejs/bin/node node)`
      `node bin/nodejs/bin/npm install`
    end
  end
end
