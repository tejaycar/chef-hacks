require 'pp'

def remove_notification(notified, action = nil, notifier = nil)
  notified = run_context.resource_collection.find(notified)

  [run_context.delayed_notification_collection, run_context.immediate_notification_collection].each do |notifications|
    notifications.each do |from, notification_array|
      notification_array.reject! do |notification|
        notification.resource.name == notified.name &&
          notification.resource.resource_name == notified.resource_name &&
          (!action || notification.resource.action.include?(action)) &&
          (!notifier || from == notifier)
      end
    end
  end
rescue Chef::Exceptions::ResourceNotFound
  puts "Could not cancel notification on #{notified} because it does not exist"
end
