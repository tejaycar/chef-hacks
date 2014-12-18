# Author: Tejay Cardon
# Cookbook: hacks
# Recipe: remove_notification.rb

file 'delete the file' do
  path '/tmp/somefile'
  action :delete
end

file '/tmp/test.kept' do
  action :delete
  subscribes :create, 'file[/tmp/somefile]'
end

file '/tmp/test.cancelled' do
  action :delete
  subscribes :create, 'file[/tmp/somefile]'
end

file '/tmp/immediate.kept' do
  action :delete
  subscribes :create, 'file[/tmp/somefile]', :immediately
end

file '/tmp/immediate.cancelled' do
  action :delete
  subscribes :create, 'file[/tmp/somefile]', :immediately
end

file '/tmp/also.kept' do
  action :delete
  subscribes :create, 'file[/tmp/somefile]'
end

file '/tmp/checks_notifier' do
  action :delete
  subscribes :create, 'file[/tmp/somefile]'
end

file '/tmp/somefile' do
  content 'this is me'
end

remove_notification 'file[/tmp/test.cancelled]'
remove_notification 'file[/tmp/immediate.cancelled]'
remove_notification 'file[/tmp/also.kept]', :create_if_missing # shouldn't matter
remove_notification 'file[/tmp/checks_notifier]', :create, 'file[/tmp/somefile]' # shouldn't matter
