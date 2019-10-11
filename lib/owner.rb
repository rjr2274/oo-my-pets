require "pry"
class Owner
  attr_accessor
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name= name
    @species= "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    @owners_cats = []
    Cat.all.map {|cat| 
    if cat.owner == self
      @owners_cats << cat
    end}
    @owners_cats
  end

  def dogs
    @owners_dogs = []
    Dog.all.map {|dog| 
    if dog.owner == self
      @owners_dogs << dog
    end}
    @owners_dogs
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.map {|dog| dog.mood = "nervous"
    dog.owner= nil}
    self.cats.map {|cat| cat.mood = "nervous"
    cat.owner= nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end