ActiveSupport::Reloader.to_prepare do
  paths = '/lib/redmine_issue_title_changer/{patches/*_patch,hooks/*_hook}.rb'
  Dir.glob(File.dirname(__FILE__) + paths).each do |file|
    require_dependency file
  end
end

Redmine::Plugin.register :redmine_issue_title_changer do
  name 'Redmine Issue Title Changer plugin'
  author 'sk-ys'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/sk-ys/redmine_issue_title_changer'
  author_url 'https://github.com/sk-ys'
end
