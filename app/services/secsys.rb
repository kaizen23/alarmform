class Secsys 
  def initialize(breed, name)  
    # Instance variables  
    @breed = breed  
    @name = name  
  end  
  
  def bark  
    puts 'Ruff! Ruff!'  
  end  
  
  def date(x: 2)
  @x = x 
  sql = "SELECT * from notifications limit #{@x} "
	result = ActiveRecord::Base.connection.execute(sql)
	result.to_a
  end
  
  def display  
    puts "I am of #{@breed} breed and my name is #{@name}"  
  end  
end 
