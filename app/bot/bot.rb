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
    message.mark_seen
    fb_user.step = 0
    fb_user.save
    Message.destroy_all
    next
  end

  case fb_user.step
  when 0
    message.mark_seen
    message.reply(text: "Hey there! 👋 My name is Rose - I'm here to help you find the right gift for your next event 🎁")
    message.typing_on
    message.reply(text: "Let's start with your maximum budget so you don't break the bank 💳")
    fb_user.step += 1
    fb_user.save
  when 1
    message.mark_seen
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
    message.mark_seen
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
    message.mark_seen
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
    message.mark_seen
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
    message.mark_seen
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
    message.mark_seen
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
    message.mark_seen
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
    message.mark_seen
    Message.create(facebook_user_id: fb_user.id, text: message.text, question_id: 8)
    fb_user.step += 1
    fb_user.save
    message.reply(text: "Yay! I think I got what you need...")

    ############### Gift Recommendation Algorithm #########################

    #### FB user answers ###
    budget = fb_user.messages.where(question_id: 1)[0].text.to_i
    answer_2 = fb_user.messages.where(question_id: 2)[0].text
    answer_3 = fb_user.messages.where(question_id: 3)[0].text
    answer_4 = fb_user.messages.where(question_id: 4)[0].text
    answer_5 = fb_user.messages.where(question_id: 5)[0].text
    answer_6 = fb_user.messages.where(question_id: 6)[0].text
    answer_7 = fb_user.messages.where(question_id: 7)[0].text
    answer_8 = fb_user.messages.where(question_id: 8)[0].text

    ### Filter gifts by budget ###
    gifts = Gift.where("price < ?", budget)

    ### Answers score ###

    birthday = 0
    party = 0
    anniversary = 0
    wedding = 0
    graduation = 0
    babyshower = 0
    christmas = 0
    housewarming = 0
    officeparty = 0
    friend = 0
    family = 0
    partner = 0
    coworker = 0
    acquaintance = 0
    kid = 0
    teen = 0
    young_adult = 0
    adult = 0
    elderly = 0
    male = 0
    female = 0
    outgoing = 0
    practicality = 0
    foodie = 0
    techie = 0
    fashionista = 0
    sports = 0

    # Q.2 #
    if answer_2 == "Birthday"
      birthday = 10
    elsif answer_2 == "Party"
      party = 10
    elsif answer_2 == "Anniversary"
      anniversary = 10
    elsif answer_2 == "Wedding"
      wedding = 10
    elsif answer_2 == "Graduation"
      graduation = 10
    elsif answer_2 == "Babyshower"
      babyshower = 10
    elsif answer_2 == "Christmas"
      christmas = 10
    elsif answer_2 == "Housewarming"
      housewarming = 10
    elsif answer_2 == "Officeparty"
      officeparty = 10
    end
    # Q.3 #
    if answer_3 == "Friend"
      friend = 10
    elsif answer_3 == "Family"
      family = 10
    elsif answer_3 == "Partner"
      partner = 10
    elsif answer_3 == "Coworker"
      coworker = 10
    elsif answer_3 == "Acquaintance"
      acquaintance = 10
    end
    # Q.4 #
    if answer_4 == "Kid"
      kid = 10
    elsif answer_4 == "Teen"
      teen = 10
    elsif answer_4 == "Young adult"
      young_adult = 10
    elsif answer_4 == "Adult"
      adult = 10
    elsif answer_4 == "Elderly"
      elderly = 10
    end
    # Q.5 #
    if answer_5 == "Male ♂️"
      male = 10
    elsif answer_5 == "Female ♀️"
      female = 10
    elsif answer_5 == "Other"
      male = 5
      female = 5
    elsif answer_5 == "Prefer not to say"
      male = 5
      female = 5
    end
    # Q.6 #
    if answer_6 == "Party animal 🌟"
      outgoing = 10
    elsif answer_6 == "Couch potatoe 💤"
      outgoing = 0
    elsif answer_6 == "No freakin clue ⁉️"
      outgoing = 5
    end
    # Q.7 #
    if answer_7 == "Yes"
      practicality = 10
    elsif answer_7 == "Not really"
      practicality = 0
    end
    # Q.8 #
    if answer_8 == "Foodie 🍰"
      foodie = 10
    elsif answer_8 == "Techie 💻"
      techie = 10
    elsif answer_8 == "Fashionista 💃"
      fashionista = 10
    elsif answer_8 == "Sports 🏈"
      sports = 10
    end
    ### User & gift distance score ###
    results = gifts.map do |gift|

      p gift

      gift_birthday = gift.gift_features.joins(:feature).find_by(features: { name: "birthday" }).strength
      birthday_distance = (gift_birthday - birthday).abs

      gift_party = gift.gift_features.joins(:feature).find_by(features: { name: "party" }).strength
      party_distance = (gift_party - party).abs

      gift_anniversary = gift.gift_features.joins(:feature).find_by(features: { name: "anniversary" }).strength
      anniversary_distance = (gift_anniversary - anniversary).abs

      gift_wedding = gift.gift_features.joins(:feature).find_by(features: { name: "wedding" }).strength
      wedding_distance = (gift_wedding - wedding).abs

      gift_graduation = gift.gift_features.joins(:feature).find_by(features: { name: "graduation" }).strength
      graduation_distance = (gift_graduation - graduation).abs

      gift_babyshower = gift.gift_features.joins(:feature).find_by(features: { name: "babyshower" }).strength
      babyshower_distance = (gift_babyshower - babyshower).abs

      gift_christmas = gift.gift_features.joins(:feature).find_by(features: { name: "christmas" }).strength
      christmas_distance = (gift_christmas - christmas).abs

      gift_housewarming = gift.gift_features.joins(:feature).find_by(features: { name: "housewarming" }).strength
      housewarming_distance = (gift_housewarming - housewarming).abs

      gift_officeparty = gift.gift_features.joins(:feature).find_by(features: { name: "officeparty" }).strength
      officeparty_distance = (gift_officeparty - officeparty).abs

      gift_friend = gift.gift_features.joins(:feature).find_by(features: { name: "friend" }).strength
      friend_distance = (gift_friend - friend).abs

      gift_family = gift.gift_features.joins(:feature).find_by(features: { name: "family" }).strength
      family_distance = (gift_family - family).abs

      gift_partner = gift.gift_features.joins(:feature).find_by(features: { name: "partner" }).strength
      partner_distance = (gift_partner - partner).abs

      gift_coworker = gift.gift_features.joins(:feature).find_by(features: { name: "coworker" }).strength
      coworker_distance = (gift_coworker - coworker).abs

      gift_acquaintance = gift.gift_features.joins(:feature).find_by(features: { name: "acquaintance" }).strength
      acquaintance_distance = (gift_acquaintance - acquaintance).abs

      gift_kid = gift.gift_features.joins(:feature).find_by(features: { name: "kid" }).strength
      kid_distance = (gift_kid - kid).abs

      gift_teen = gift.gift_features.joins(:feature).find_by(features: { name: "teen" }).strength
      teen_distance = (gift_teen - teen).abs

      gift_young_adult = gift.gift_features.joins(:feature).find_by(features: { name: "young adult" }).strength
      young_adult_distance = (gift_young_adult - young_adult).abs

      gift_adult = gift.gift_features.joins(:feature).find_by(features: { name: "adult" }).strength
      adult_distance = (gift_adult - adult).abs

      gift_elderly = gift.gift_features.joins(:feature).find_by(features: { name: "elderly" }).strength
      elderly_distance = (gift_elderly - elderly).abs

      gift_male = gift.gift_features.joins(:feature).find_by(features: { name: "male" }).strength
      male_distance = (gift_male - male).abs

      gift_female = gift.gift_features.joins(:feature).find_by(features: { name: "female" }).strength
      female_distance = (gift_female - female).abs

      gift_outgoing = gift.gift_features.joins(:feature).find_by(features: { name: "outgoing" }).strength
      outgoing_distance = (gift_outgoing - outgoing).abs

      gift_practicality = gift.gift_features.joins(:feature).find_by(features: { name: "practicality" }).strength
      practicality_distance = (gift_practicality - practicality).abs

      gift_foodie = gift.gift_features.joins(:feature).find_by(features: { name: "foodie" }).strength
      foodie_distance = (gift_foodie - foodie).abs

      gift_techie = gift.gift_features.joins(:feature).find_by(features: { name: "techie" }).strength
      techie_distance = (gift_techie - techie).abs

      gift_fashionista = gift.gift_features.joins(:feature).find_by(features: { name: "fashionista" }).strength
      fashionista_distance = (gift_fashionista - fashionista).abs

      gift_sports = gift.gift_features.joins(:feature).find_by(features: { name: "sports" }).strength
      sports_distance = (gift_sports - sports).abs

      total_distance = birthday_distance + party_distance + anniversary_distance + wedding_distance + graduation_distance + babyshower_distance + christmas_distance + housewarming_distance + officeparty_distance + friend_distance + family_distance + partner_distance + coworker_distance + acquaintance_distance + kid_distance + teen_distance + young_adult_distance + adult_distance + elderly_distance + male_distance + female_distance + outgoing_distance + practicality_distance + foodie_distance + techie_distance + fashionista_distance + sports_distance

      { gift: gift, distance: total_distance }
    end

    ### final suggestion ###
    result = results.sort_by {|result| result[:distance]}.first

    message.reply(text: "https://regalo-app.herokuapp.com/gifts/#{result[:gift].id}")
  end
end
