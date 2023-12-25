class SendMessageJob < ApplicationJob
  queue_as :default

def perform_later(message)
  Rails.logger.info("SendMessageJob performing with message: #{message.inspect}")
  
  return if message.nil?

  mine = ApplicationController.render(partial: 'messages/mine', locals: { message: message })
  theirs = ApplicationController.render(partial: 'messages/theirs', locals: { message: message })

  ActionCable.server.broadcast "room_channel_#{message.room_id}",
  {
    mine: mine,
    theirs: theirs,
    message: message
  }
rescue => e
  Rails.logger.error("Error in SendMessageJob: #{e.message}")
  raise e
end
end
