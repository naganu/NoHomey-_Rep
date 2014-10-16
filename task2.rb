require 'csv'
a = Array.new
h = Hash.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name_1|
	Dir.glob("#{ARGV[1]}/*.rb") do |dir_file_name_2|

		file_name_1 = dir_file_name_1.split(/\//).last.to_s
		file_name_2 = dir_file_name_2.split(/\//).last.to_s
	
		if(file_name_1 <=> file_name_2) == 0
			
			file_name = file_name_1
			digit = file_name.split(/_/).last.split(/\./).first.to_s
			first_name = file_name.split(/_/).first.to_s
			full_first_name = first_name + digit
			full_first_name = full_first_name.to_s
			tmp = file_name.split("#{first_name}_")
			full_last_name = tmp.last.split(/_/).first.to_s + digit
			full_last_name = full_last_name.to_s
			h[full_last_name] = full_first_name
			
		end
	end
end	

CSV.open("results.csv", "w") do |csv|
	a = h.sort.reverse
	a.each do |element|
		csv << element
	end
end
