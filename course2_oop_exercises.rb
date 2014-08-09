# ken mcfadden Tealeaf Academy

# Course 2 - OO exercises from the Into to Ruby/WedDev online book.

# Summary - this source member contains all of the exercises.

# BOOK CHAPTER THE OBJECT MODEL.
# ===============================

# Ex 1 how do we create an object?

module Fleas    # module for exercise 2.
  def flea_type
    puts "hairy flees."
  end
end
  class Dog

    include Fleas

    def talk
      puts "woof woof"
    end

  end

  mydog = Dog.new
  mydog.talk
  mydog.flea_type


# Ex 2 What is a module and purpose.  How do we use them.  Use in exercise 1 sample.

#  Answer : they are similar to class in that they can encapsulate code, contain methods etc.  The difference is
#  they do not have to be instantiated.  They use the "method" keyword instead of the class keyword.

#  You can include or "mixin" them into your classes with the include keyword.

#  They allow you to have "multiple"  inheritance so to speak also.

#  They provide a namespace to prevent collisions.

# We’ll make a couple of points about the include statement before we go on. First, it has
# nothing to do with files. C programmers use a preprocessor directive called #include to
# insert the contents of one file into another during compilation. The Ruby include statement
# simply makes a reference to a module. If that module is in a separate file, you must use
# require (or its less commonly used cousin, load) to drag that file in before using include.
# Second, a Ruby include does not simply copy the module’s instance methods into the class.
# Instead, it makes a reference from the class to the included module. If multiple classes
# include that module, they’ll all point to the same thing. If you change the definition of a
# method within a module, even while your program is running, all classes that include that
# module will exhibit the new behavior.7


# CLASSES AND OBJECTS PART 1
# ===============================

# Exercise all combined:. Create a class called MyCar. When you initialize a new instance or object of the class,
# allow the user to define some instance variables that tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantiation of the object to track the current
# speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.

   class Car

     attr_reader  :model_year, :model_color, :model_make ,:model_speed
     attr_accessor :model_color

     #CONSTANT FOR TESTING
     DMVSTATUS = "Good"

     def self.car_class_method
       puts "Output from the #{self} class method."
     end

     def initialize(model_year, model_color, model_make)
       @model_year = model_year
       @model_color = model_color
       @model_make = model_make
       @model_speed = 0
     end

     def spray_paint(model_color)

       self.model_color = model_color

       puts "You have spray painted your car to now be #{model_color}."
     end


     def car_info
       puts "Car information: #{model_year} #{model_color }#{model_make}"
     end

     def to_s
       puts "Car information: #{model_year} #{model_color }#{model_make}"
     end

     def control_speed(acceleration)

       if acceleration < 0
         puts "You are braking..."
       end
       @model_speed += acceleration
        if @model_speed < 0
          @model_speed = 0
          puts "You are at a stop."
        end

       puts "Car is now traveling #{model_speed.to_s} mph."

     end

     def gas_mileage(gallons,miles)
       if gallons > 0
         miles/gallons
       end

     end

   end

  myCar = Car.new("1964", "Blue", "Corvette StingRay")

  myCar.car_info
  myCar.control_speed(99)
  myCar.control_speed(-15)
  myCar.control_speed(10)
  myCar.control_speed(-94)

  myCar.model_color = "Red"
  puts "Your car color is now #{myCar.model_color}"

  myCar.model_color= "Green"
  puts "Your car color is now #{myCar.model_color}"

  myCar.spray_paint("Turquoise Glitter")



# CLASSES AND OBJECTS PART II
# ===========================
 puts ""
 puts "Here begins output from Classes and Objects part II."
#  Example of call to CAR class method

  Car.car_class_method

   class ClassMethod

     @@numberofclasses = 0

     def initialize
       @@numberofclasses += 1
     end

     def self.totalnumberofclasses
        @@numberofclasses
     end

     def self.test
       puts "#{self} test"
     end

   end

  ClassMethod.test    #method prints with no class instance.

  puts "Total number of ClassMethod Classes : " + "#{ClassMethod.totalnumberofclasses}"

  myClassMethod1 = ClassMethod.new
  myClassMethod2 = ClassMethod.new

  puts "Total number of ClassMethod Classes : " + "#{ClassMethod.totalnumberofclasses}"

  puts "DMV status is #{Car::DMVSTATUS}"

# Add a class method to your MyCar class that calculates the gas mileage of any car.

  puts "Gas milage is : " +  "#{myCar.gas_mileage(20,300)} miles per gallon."

  myCar.to_s  # overridden to_s method.

#When running the following code...we get an error undefined method name...How do we fix it?
# Answer : make it "writable" either with a method or using an accessor attribute.  See below.

  class Person
    attr_reader :name
    attr_accessor :name
    def initialize(name)
    @name = name
    end
  end

  bob = Person.new("Steve")
  bob.name = "Bob"

  puts "Person name is has been changed to #{bob.name}"
