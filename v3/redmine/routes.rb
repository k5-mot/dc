Redmine::Utils::relative_url_root = "/redmine"

RedmineApp::Application.routes.draw do
scope Redmine::Utils::relative_url_root do
  root :to => 'welcome#index', :as => 'home'
.....
end
end
