require 'csv'
h = Hash.new
a = Array.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name_1|
	Dir.glob("#{ARGV[1]}/*.rb") do |dir_file_name_2|
	
		file_name_1 = dir_file_name_1.split(/\//).last.to_s
		file_name_2 = dir_file_name_2.split(/\//).last.to_s
	
		if(/[A-Za-z]+(_)[A-Za-z]+(_)\d+(.rb)/.match(file_name_1))
		else
			file_length = file_name_1.length.to_s
			h[file_name_1] = file_length
		end
	
		if(/[A-Za-z]+(_)[A-Za-z]+(_)\d+(.rb)/.match(file_name_2))
		else
			file_length = file_name_2.length.to_s
			h[file_name_2] = file_length
		end
	end
end

CSV.open("results.csv", "w") do |csv|
	a = h.sort
	a.each do |element|
		csv << element
	end
end
