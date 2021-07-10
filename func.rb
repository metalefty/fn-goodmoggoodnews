require 'fdk'
require 'goodmoggoodnews'

def goodmogrun(context:, input:)
  input_value = input.respond_to?(:fetch) ? input.fetch('name') : input
  name = input_value.to_s.strip.empty? ? 'World' : input_value
  FDK.log(entry: "Inside Ruby Hello World function")
  
  twitter = Goodmoggoodnews::Twitter.new
  before_location = twitter.location

  Goodmoggoodnews::Runner.go
  
  after_location = twitter.location
  location = after_location.merge(u: !(before_location === after_location))

  location
end

FDK.handle(target: :goodmogrun)
