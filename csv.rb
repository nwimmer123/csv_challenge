require 'csv'
require 'pry'

class Human 

	attr_accessor :last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth

	def initialize(last_name, first_name, middle_initial, gender, favorite_color, date_of_birth)
		@last_name = last_name
		@first_name = first_name
		@middle_initial = middle_initial
		@gender = gender
		@favorite_color = favorite_color
		@date_of_birth = date_of_birth
	end


end

records = []

CSV.foreach("sample/comma.txt") do |row|
  row = row.join.split
  row.insert(2)
	records << row

end
CSV.foreach("sample/pipe.txt") do |row|
  row = row.join.gsub("-", "/").split
  row.delete_if {|element| element == "|"}
	records << row
end
CSV.foreach("sample/space.txt") do |row|
  row = row.join.gsub("-", "/").split
  row[5], row[4] = row[4], row[5]
  records << row
end

new_records = []
records.each do |element|
  last_name = element[0]
  first_name = element[1]
  middle_initial = element[2]
  gender = element[3]
  favorite_color = element[4]
  date_of_birth = element[5]
  h = Human.new(last_name, first_name, middle_initial, gender, favorite_color, date_of_birth)
  new_records << h
end

new_records

p new_records


