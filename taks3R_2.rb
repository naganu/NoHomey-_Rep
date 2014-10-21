#Develop a program named FirstName_LastName_ClassNumber_38ae9a.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
#3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
#4. Sort the result by File name ;
#5. Produce a result in CSV format named result.csv:
#
#			File1,3
#			File2,4
#			...
#			FileN,3
######################################################################################################################################
require 'csv'
h = Hash.new
a = Array.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name_1|
	Dir.glob("#{ARGV[1]}/*.rb") do |dir_file_name_2|
	
		file_name_1 = dir_file_name_1.split(/\//).last.to_s
		file_name_2 = dir_file_name_2.split(/\//).last.to_s
		
		if(file_name_1 != file_name_2)
			if(/\d{7}/.match(file_name_2))
				file_length = file_name_2.length.to_s 
				file_length = ((file_length.to_i) / 2).round
				h[file_name_2] = file_length.to_s
			end
		end
		
		if(/\d{7}/.match(file_name_1))
			file_length = file_name_1.length.to_s
			file_length = ((file_length.to_i) / 2).round
			h[file_name_1] = file_length.to_s
		end
		
	end
end

CSV.open("results.csv", "w") do |csv|
	a = h.sort
	a.each do |element|
		csv << element
	end
end
