require 'facebook/messenger'

include Facebook::Messenger

# Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  facebook_id = message.sender["id"]
  fb_user = FacebookUser.find_by facebook_id: facebook_id
  if fb_user.nil?
    fb_user = FacebookUser.new(facebook_id: facebook_id, step: 0)
    fb_user.save
  end

  if message.text == "bye"
    fb_user.step = 0
    fb_user.save
    Message.destroy_all
    next
  end

  case fb_user.step
  when 0
    message.reply(text: "Hey there! 👋 My name is Rose - I'm here to help you find the right gift for your next event 🎁")
    message.typing_on
    message.reply(text: "Let's start with your maximum budget so you don't break the bank 💳")
    fb_user.step += 1
    fb_user.save
  when 1
    unless message.text =~ /\D/
      Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 1)
      fb_user.step += 1
      fb_user.save
      message.typing_on
      message.reply(
        text: "Awesome! What event are you going to? 🎉",
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
            title: 'Babyshower',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Christmas',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Housewarming',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Officeparty',
            payload: 'HARMLESS'
          }
        ]
      )
    else
      message.reply(text: "Please enter a number 😊")
    end
  when 2
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 2)
    fb_user.step += 1
    fb_user.save
    message.typing_on
    message.reply(text: "Great! Let's make your gift more personal 😍")
    message.typing_on
    message.reply(text: "I will just need a bit more information...")
    message.typing_on
      message.reply(
        text: "How close are you to this person? 👥",
        quick_replies: [
          {
            content_type: 'text',
            title: 'Friend',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Family',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Partner',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Coworker',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Acquaintance',
            payload: 'HARMLESS'
          }
        ]
      )
  when 3
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 3)
    fb_user.step += 1
    fb_user.save
    message.typing_on
      message.reply(
        text: "What group best represents the recipient? 👨‍👩‍👧‍👦",
        quick_replies: [
          {
            content_type: 'text',
            title: 'Kid',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Teen',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Young adult',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Adult',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Elderly',
            payload: 'HARMLESS'
          }
        ]
      )
  when 4
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 4)
    fb_user.step += 1
    fb_user.save
    message.typing_on
      message.reply(
        text: "What is the gender of the recipient?",
        quick_replies: [
          {
            content_type: 'text',
            title: 'Male ♂️',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Female ♀️',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Other',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Prefer not to say',
            payload: 'HARMLESS'
          }
        ]
      )
  when 5
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 5)
    fb_user.step += 1
    fb_user.save
    message.typing_on
    message.reply(text: "Almost done! Just need a few more details 👌")
    message.typing_on
      message.reply(
        text: "Is the recipient a...",
        quick_replies: [
          {
            content_type: 'text',
            title: 'Party animal 🌟',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Couch potatoe 💤',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'No freakin clue ⁉️',
            payload: 'HARMLESS'
          }
        ]
      )
  when 6
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 6)
    fb_user.step += 1
    fb_user.save
    message.typing_on
      message.reply(
        text: "Is the person practical? 🛠️",
        quick_replies: [
          {
            content_type: 'text',
            title: 'Yes',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Not really',
            payload: 'HARMLESS'
          }
        ]
      )
  when 7
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 7)
    fb_user.step += 1
    fb_user.save
    message.typing_on
    message.reply(text: "And here's the last question 😃")
    message.typing_on
      message.reply(
        text: "What team would the recipient choose?",
        quick_replies: [
          {
            content_type: 'text',
            title: 'Foodie 🍰',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Techie 💻',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Fashionista 💃',
            payload: 'HARMLESS'
          },
          {
            content_type: 'text',
            title: 'Sports 🏈',
            payload: 'HARMLESS'
          }
        ]
      )
  when 8
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 8)
    fb_user.step += 1
    fb_user.save
    message.reply(text: "Yay! I think I got what you need...")
  end
end

############### Gift Recommendation Algorithm #########################

# budget = fb_user.messages[0].text.to_i










