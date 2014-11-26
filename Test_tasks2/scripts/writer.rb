#promeni .xml sprqmo tova ,koeto trqbva

File.open("result.xml","w") do |f|

	a = "texta na expected"

	f.write(a)

	  #   ^  ako ti e json -> f.write(a).to_josn i otgore require 'json'
	f.close
end
