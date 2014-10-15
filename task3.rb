require 'csv'
a = Hash.new
Dir.glob(ARGV.shift+"/*.rb" ) do |dir_file_name|
	puts "#{file_name}"
	file_name = dir_file_name.split(/\//).last.to_s
	l = file_name.length.to_s
	if(/\w*(_)\w*(_)\d*(.rb)/.match(file_name))
	else
		file_length = file_name.length.to_s
		a[file_length] = file_name
	end
end

CSV.open("results.csv", "w") do |csv|
	a.values.sort
	a.each {|key, value| csv << [value,' ' + key]}
end
