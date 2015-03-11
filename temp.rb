class Dog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    puts 'woof'
  end
end

class Master
  def command_dog_to_speak(dog)
    dog.speak
  end

  def tell_me_your_name(dog)
    dog.name
  end
end

spot = Dog.new("spot")
steve = Master.new

spot.respond_to?(:speak) # => true
spot.respond_to?(:roll_over) # => false
# Returns false because this dog doesn't know how to roll over

steve.tell_me_your_name(spot)
spot.respond_to?(:name) #=> true
# This will also return true because we've automatically created getter methods for name in the Dog class with the attr_accessor :name 
# Even though we haven't explicitly defined a method, it's there implicitly with the attr_accessor
# Even the name of the respond_to? method contains the language of sending and receiving messages




