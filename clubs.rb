iframes = {
	"Astronuts":	"https://sites.google.com/a/iiitd.ac.in/astronuts/",
"Audiobytes":	"https://sites.google.com/a/iiitd.ac.in/audiobytes/",
"Machaan":	"https://sites.google.com/a/iiitd.ac.in/dramatispersonae/",
"Tasveer":	"https://sites.google.com/a/iiitd.ac.in/tasveer/home",
"65thSquare":	"https://sites.google.com/a/iiitd.ac.in/chess-iiitd/",
"VoixDeLiterati":	"https://sites.google.com/a/iiitd.ac.in/literary-club/",
"Cyborg":	"https://sites.google.com/a/iiitd.ac.in/robotics_club/home",
"GameCraft":	"https://gamecraftiiitd.wordpress.com/"
}
descriptions = {
	"Astronuts": "Astronamy",
	"Audiobytes": "Music",
	"Machaan": "Theater",
	"Tasveer": "Photography",
	"65thSquare": "Chess",
	"VoixDeLiterati": "Literature",
	"Cyborg": "Robotics",
	"GameCraft": "Game Development"
}

iframe1 = '<head><title>'
iframe2 = ' IIIT-Delhi\'s '
iframe3 = ' Club</title><link rel="shortcut icon" href="favicon.png?v=2" /><meta http-equiv="Content-Type" content="text/html\; charset=utf-8" /><style type="text/css">body, html{margin: 0\; padding: 0\; height: 100\%\; overflow: hidden\;}#content{position:absolute\; left: 0\; right: 0\; bottom: 0\; top: 0px\; }</style></head><body><div id="content"><iframe width="100\%" height="100\%" frameborder="0" src="'
iframe4 = '" /></div></body></html>'

base_dir = "./club/"
iframes.each do |key,url|
	desc = descriptions[key]
	output_html = [iframe1,key,iframe2,desc,iframe3,url,iframe4].join('')
	dir = Dir.mkdir(base_dir+key.to_s.downcase) unless Dir.exist?(base_dir+key.to_s.downcase)
	file = File.new(base_dir+key.to_s.downcase+"/index.html","a+")
	file << output_html
	file.close
end