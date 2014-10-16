require 'csv'
a = Array.new
h = Hash.new
Dir.glob("#{ARGV[0]}/*.rb" ) do |dir_file_name|
	file_name = dir_file_name.split(/\//).last.to_s
	file_name = file_name.split(/\./).first.to_s
	l = file_name.length.to_s
	if(l <=> ARGV[1]) != 0
		file_length = file_name.length.to_s
		h[file_length] = file_name
	end
end

CSV.open("results.csv", "w") do |csv|
	
	a = h.sort

	a.each do |element|
		csv << element
	end
end
