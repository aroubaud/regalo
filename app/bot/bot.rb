require 'facebook/messenger'

include Facebook::Messenger

# Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  message.reply(text: "Hey there! 👋 My name is Rose - I'm here to help you find the right gift for your next event 🎁")
  message.typing_on
  message.reply(text: "Let's start with your maximum budget so that I can make sure you don't break the bank 💳")
  Bot.on :message do |message|
    unless message.text =~ /\D/
      # Message.create(text: message.text.to_i)
      message.typing_on
      message.reply(
        text: 'Awesome! Now, what event are you going to?',
        quick_replies: [
          {
            content_type: 'text',
            title: 'Birthday',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Party',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Anniversary',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Wedding',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Graduation',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Baby shower',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Christmas',
            payload: 'HARMLESS'
          }
        ]
      )
      Bot.on :message do |message|
        message.reply(text: "Great! I now need to ask you a few questions about the recipient so that I can personalize the gift 😍")
        ###
      end
    else
      message.reply(text: "Please enter a number 😊")
    end
  end
end

# Bot.on :postback do |postback|
#   case postback.payload
#   when 'HUMAN_LIKED'
#     # message save
#   when 'HUMAN_DISLIKED'
#     # message save
#   end
# end

