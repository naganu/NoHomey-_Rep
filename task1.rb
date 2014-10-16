require 'csv'
a = Array.new
h = Hash.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name|

	file_name = dir_file_name.split(/\//).last.to_s
	
	digit = file_name.split(/_/).last.split(/\./).first.to_s
	
	first_name = file_name.split(/_/).first.to_s
	full_first_name = first_name + digit
	full_first_name = full_first_name.to_s
	
	tmp = file_name.split("#{first_name}_")
	full_last_name = tmp.last.split(/_/).first.to_s + digit
	full_last_name = full_last_name.to_s
	
	condition = full_last_name.length - digit.length
	if (condition == 7)
		h[full_first_name.to_s] = full_last_name.to_s
	end	
end

CSV.open("results.csv", "w") do |csv|
	a = h.sort
	a.each do |element|
		csv << element
	end
end

