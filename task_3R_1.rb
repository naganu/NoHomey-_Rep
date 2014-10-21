#Develop a program named FirstName_LastName_ClassNumber_04c4c6.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
#3. Calculate the length of their names (including extensions).;
#4. Sort the result by length ;
#5. Produce a result in CSV format named result.csv:
#
#			File1,3
#			File2,4
#			...
#			FileN,3
########################################################################
require 'csv'
h = Hash.new
a = Array.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name_1|
	Dir.glob("#{ARGV[1]}/*.rb") do |dir_file_name_2|
	
		file_name_1 = dir_file_name_1.split(/\//).last.to_s
		file_name_2 = dir_file_name_2.split(/\//).last.to_s
		
		if(file_name_1 != file_name_2)
			if(/[A-Za-z]+(_)[A-Za-z]+(_)\d+(.rb)/.match(file_name_2))
			else
				file_length = file_name_2.length.to_s 
				h[file_name_2] = file_length
			end
		end
		
		if(/[A-Za-z]+(_)[A-Za-z]+(_)\d+(.rb)/.match(file_name_1))
		else
			file_length = file_name_1.length.to_s 
			h[file_name_1] = file_length
		end
		
	end
end

CSV.open("results.csv", "w") do |csv|
	#h = Hash[h.sort]
	a = h.sort_by {|k,v| v}
	a.each do |element|
		csv << element
	end
end
