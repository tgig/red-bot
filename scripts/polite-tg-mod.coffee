# Description:
#   Polite.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   dannymcc

responses = [
  "You're welcome.",
  "No problem.",
  "Anytime.",
  "That's what I'm here for!",
  "You are more than welcome.",
  "You don't have to thank me, I'm your loyal servant.",
  "Don't mention it."
]

shortResponses = [
  'vw',
  'np',
  'sure',
  'any time',
  'you\'re welcome'
]

helloResponses = [
  'Hello, it is going to be a beautiful day!',
  'Hi, hope you have a great day!',
  'Howdy',
  'Good day mate!',
  'What\'s up',
  'Hola amigo',
  'I am so glad you\'re here... it was boring in here without you :)',
  'Howdy friend, good to hear your lovely voice again'
]

farewellResponses = [
  'Goodbye',
  'Have a good evening',
  'Bye',
  'Take care',
  'Nice speaking with you',
  'See you later',
  'Adios amigo',
  'Nice chatting with you',
  'Thanks for everything',
  'You\'re a rock star'
]

# http://en.wikipedia.org/wiki/You_talkin'_to_me%3F
youTalkinToMe = (msg, robot) ->
  input = msg.message.text.toLowerCase()
  name = robot.name.toLowerCase()
  input.match(new RegExp('\\b' + name + '\\b', 'i'))?

module.exports = (robot) ->
  robot.hear /\b(thanks|thank you|cheers|nice one)\b/i, (msg) ->
    msg.reply msg.random responses if youTalkinToMe(msg, robot)

  robot.hear /\b(ty|thx)\b/i, (msg) ->
    msg.reply msg.random shortResponses if youTalkinToMe(msg, robot)

  robot.hear /\b(hello|hi|sup|howdy|good (morning|evening|afternoon)|what\'s up|sup)\b/i, (msg) ->
    msg.reply msg.random helloResponses if youTalkinToMe(msg, robot)

  robot.hear /\b(bye|night|goodbye|good night|see ya|adios|later)\b/i, (msg) ->
    msg.reply msg.random farewellResponses if youTalkinToMe(msg, robot)
