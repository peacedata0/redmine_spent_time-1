require 'sptime_hook'

Redmine::Plugin.register :redmine_spent_time do
  name 'Redmine Spent Time plugin'
  author 'Versatile Community Inc'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://www.redmine.org/plugins/redmine_spent_time_versatile'
  author_url 'http://versatilecommunity.com/about'  
  
  menu :top_menu, :spTime, { :controller => 'sptime', :action => 'index' }, :caption => :label_time_sheet, :if => Proc.new { Object.new.extend(SptimeHelper).checkPermission}
end

# Redmine::MenuManager.map :application_menu do |menu|
	# menu.push :sptime, { :controller => 'sptime', :action => 'index' }, :caption => :label_time
# end

# Redmine::MenuManager.map :project_menu do |menu|
	# menu.push :sptime, {:controller => 'sptime', :action => 'index'}, :param => :project_id, :caption => :label_time,
              # :parent => :new_object
# end

Redmine::MenuManager.map :admin_menu do |menu|	
	menu.push :spcompany, { :controller => 'spcompany', :action => 'index' }, :caption => :label_company, :if => Proc.new { Object.new.extend(SptimeHelper).checkCpyPermission}, :html => {:class => 'icon icon-stats'}
end
