set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'
set :haml, { :ugly => true, :format => :html5 }

configure :build do
  activate :sprockets
  activate :bootstrap
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :relative_assets
end


case ENV['TARGET'].to_s.downcase
  when 'production'
    activate :deploy do |deploy|
    deploy.method   = :ftp
    deploy.host     = 'public_thml'
    deploy.path     = '/'
    deploy.user     = 'ide'
    deploy.password = 'pass'
    deploy.build_before = true
    end
  else ## Otro Ambiente
    activate :deploy do |deploy|
        deploy.method = :git
      deploy.branch   = 'bb-middleman'
      deploy.commit_message = 'Commit - middleman branch'
    end
  end
