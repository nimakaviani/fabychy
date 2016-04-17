
<table border="0">
<tr>
<td width="200px">
  <img src="https://s3-us-west-2.amazonaws.com/robochyassets/fabychy/fabychu-150x150.png" alt="Rubychy" height="150px"/> 
</td>
<td>
<h1>fabychy</h1>
A ruby client for <a href="https://messengerplatform.fb.com/">Facebook Messenger's bot API</a> provided by <a href="http://robochy.com">Robochy</a>. 
</td>
</tr>
</table>

## Installation

Add the gem to your application's Gemfile

```ruby
gem 'fabychy'
```

and run the following

```ruby
$ bundle install
```

## Usage
Create a bot using [Facebook Messenger](https://developers.facebook.com/docs/messenger-platform/product-overview) developer portal. Once the registration is complete, copy the `Page Access Token` to be used by this library.

With your `Page Access Token` you can use `fabychy` like the following:

```ruby
require 'fabychy'

bot = Fabychy::Bot.new('[PAGE ACCESS TOKEN]')
```

## Get User Information
You need to have the `USER_ID` for the target user and then call the `get_user` function:

```ruby
require 'fabychy'

bot = Fabychy::Bot.new('[PAGE ACCESS TOKEN]')
bot.get_user('[USER_ID]')
```

## Sending Messages
With a created bot you can create messages of different types, attach custom keyboards, and pass them to the `send_message` function as follows:
```ruby
require 'fabychy'

bot = Fabychy::Bot.new('[PAGE ACCESS TOKEN]')
message = Fabychy::Message.new(
  recipient: {id: [USER_ID] },
  message: {
    text: "hi there"
  },
  notification_type: Fabychy::Notification::REGULAR
)
```

The following notification types can be used:
```ruby
Fabychy::Notification::REGULAR
Fabychy::Notification::SILENT_PUSH
Fabychy::Notification::NO_PUSH
```

## DataTypes and Validations
Fabychy provides some light-weight validation of the generated message. However, when there is too much scaffolding it also allows you to pass the hash object instead of an actual element to create your messages. Below is an example:

```ruby
require 'fabychy/message'

bot = Fabychy::Bot.new('[PAGE ACCESS TOKEN]')
message = Fabychy::Message.new(
  recipient: {id: "1056613714384965"},
  message: Fabychy::DataTypes::MessageBody.new(
    attachment: Fabychy::DataTypes::TemplateAttachment.new(
        payload: Fabychy::DataTypes::GenericTemplatePayload.new(
          elements: [
            Fabychy::DataTypes::GenericElement.new(
                title: 123,
                image_url: "http://wip.org/media/nima-456.jpg",
                subtitle: "This thing is great!",
                buttons: [
                  Fabychy::DataTypes::Button.new(
                    type: "web_url",
                    title: "robochy",
                    url: "http://robochy.com"
                  )
                ]
              ),
            Fabychy::DataTypes::GenericElement.new(
                title: "hello",
                image_url: "http://wip.org/media/nima-456.jpg",
                subtitle: "This thing a second thing great!",
              )
          ]
        )
      )
    )
  )
  bot.send_message(message)
```

### Allowed Object Types

#### Attachments
```ruby
Fabychy::DataTypes::TemplateAttachment
# OR
Fabychy::DataTypes::ImageAttachment
```
#### Payloads
```ruby
# use the following for Fabychy::DataTypes::ImageAttachment
Fabychy::DataTypes::ImagePayload 

# use the following for Fabychy::DataTypes::TemplateAttachment
Fabychy::DataTypes::GenericTemplatePayload 
Fabychy::DataTypes::ButtonTemplatePayload 
Fabychy::DataTypes::ReceiptTemplatePayload 
```

#### Elements
```ruby
# for Fabychy::DataTypes::GenericTemplatePayload 
Fabychy::DataTypes::GenericElement

# for Fabychy::DataTypes::ReceiptTemplatePayload 
Fabychy::DataTypes::ReceiptElement
```

## Parsing the Response

In your callback servlet, pass the received `request` (not the request body) to the `Fabychy::ApiResponse.parse` function and you will get the hash response back:

```ruby
class Simple < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    response = Fabychy::ApiResponse.parse(request) # response is of type Hash
  end
end
```

## Contributing
- Fork it: https://github.com/nkaviani/fabychy/fork
- Create your feature branch (`git checkout -b my-new-feature`)
- Commit your changes (`git commit -am 'Add some feature'`)
- Push to the branch (`git push origin my-new-feature`)
- Create a new Pull Request
