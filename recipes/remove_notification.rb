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

file '/tmp/somefile' do
  content 'this is me'
end

remove_notification 'file[/tmp/test.cancelled]'
