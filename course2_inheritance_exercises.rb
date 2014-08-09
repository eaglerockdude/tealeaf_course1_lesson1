# ken mcfadden Tealeaf Academy August 2014

# Course 2 - inheritance exercises from the Into to Ruby/WedDev online book.



# 1. Create a Vehicle class as a super class to car or truck.   DONE
# 2. Add a class variable to your superclass that can keep track of the number
#    .of objects created that inherit from the superclass.    DONE
# 3. Create a module that you can mix in to ONE of your subclasses
#    that describes a behavior unique to that subclass.   DONE see Turbo
# 4. Print the ancestor chain of the classes and subclasses DONE
# 5. No common classes in Car and truck DONE
# 6. Create a private method called age that calculates age of the vehicle DONE


  module Turbo
    def has_turbo?
      true
    end
  end

class Vehicle

  attr_reader   :model_year, :model_color, :model_make ,:model_speed ,:number_of_vehicles
  attr_accessor :model_color

  @@number_of_vehicles = 0

  def initialize(model_year, model_color, model_make)
    @model_year = model_year
    @model_color = model_color
    @model_make = model_make
    @model_speed = 0
    @@number_of_vehicles += 1
  end

  def age_of_vehicle
    "Your #{self.model_year} #{model_make} is #{years_old} years old."
  end

  private
  def years_old
    Time.now.year - self.model_year.to_i
  end

  public

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def spray_paint(model_color)
    self.model_color = model_color
    puts "You have spray painted your car to now be #{model_color}."
  end

  def car_info
    puts "Car information: #{model_year} #{model_color } #{model_make}"
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

    def gas_mileage(gallons,miles)
      if gallons > 0
        miles/gallons
      end

    end

  end

end

class Car   < Vehicle

  include Turbo

  ENGINETYPE = "Hybrid"

end

class Truck  < Vehicle
  ENGINETYPE = "Gasoline"
end

# Ancestors
"Print class and subclass ancestors"
puts "Ancestor chain of Vehicle:"
puts Vehicle.ancestors
puts "Ancestor chain of Car:"
puts Car.ancestors
puts "Ancestor chain of Truck:"
puts Truck.ancestors
puts "Ancestor chain of Turbo module:"
puts Turbo.ancestors



# Car
myCar = Car.new("1964", "Blue", "Corvette Sting-Ray")
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

puts "The engine type of Car is : " + "#{Car::ENGINETYPE}"

  if myCar.has_turbo?    # module include
    puts "This model is equipped with turbo-booster."
  end
puts "#{myCar.age_of_vehicle}"


# Truck
myTruck  = Truck.new("1955", "Two-Tone Red", "Chevy Apache")
myTruck.car_info
myTruck.control_speed(99)
myTruck.control_speed(-15)
myTruck.control_speed(10)
myTruck.control_speed(-94)
myTruck.model_color = "Red"
puts "Your truck color is now #{myTruck.model_color}"
myTruck.model_color= "Grey"
puts "Your Truck color is now #{myTruck.model_color}"
myTruck.spray_paint("Black on Black Chrome")

puts "The engine type of Truck is : " + "#{Truck::ENGINETYPE}"

Vehicle.number_of_vehicles

puts "#{myTruck.age_of_vehicle}"

# 7 Create  Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public,
# so joe.grade will raise an error. Create a better_grade_than? method, \


#Given the following code...
#
#  bob = Person.new
#  bob.hi
#  And the corresponding error message...
#
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
#from (irb):8
#from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'


puts ""
puts "Beginning of Student stuff"

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

jorge  = Student.new("Jorge", 77)
alice = Student.new("Alice", 66)
puts "You are a good guesser!" if jorge.better_grade_than?(alice)

#Given the following code...
#
#                        bob = Person.new
#bob.hi
#And the corresponding error message...
#
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
#from (irb):8
#from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# Answer : hi must be a private method...you can make it public or protected...

