require 'csv'
student = Array.new
student1 = Array.new
hash = Hash.new
array = Array.new
Dir.glob(ARGV[0]+"/**/*.*").each do |file_name1|
	file_name = file_name1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	student << ["#{first_name}", "#{last_name}"]
end

Dir.glob(ARGV[1]+"/**/*.*").each do  |file_name1|	
	file_name = file_name1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	student1 << ["#{first_name}", "#{last_name}"]
end

student.each do |fn, ln|
	student1.each do |fn1, ln1|
		if fn != fn1 
			if ln != ln1
				hash[ln1.to_s] = fn1.to_s
			end
		end
	end
end		

CSV.open("result.csv", "w") do |csv|
	array = hash.sort_by{|k,v| v}
	array.each do |element|
		csv << element
	end
end	
