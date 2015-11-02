iframes = {
	"Astronuts":	{
		"site": "https://sites.google.com/a/iiitd.ac.in/astronuts/",
		"description": "Astronamy"
	},
	"Audiobytes": {
		"site":	"https://sites.google.com/a/iiitd.ac.in/audiobytes/",
		"description": "Music"
	},
	"Machaan": {
		"site":	"https://sites.google.com/a/iiitd.ac.in/dramatispersonae/",
		"description": "Theater"
	},
	"Tasveer": {
		"site":	"https://sites.google.com/a/iiitd.ac.in/tasveer/home",
		"description": "Photography"
	},
	"65thSquare": {
		"site":	"https://sites.google.com/a/iiitd.ac.in/chess-iiitd/",
		"description": "Chess"
	},
	"Cyborg": {
		"site":	"https://sites.google.com/a/iiitd.ac.in/robotics_club/home",
		"description": "Robotics"
	},
	"GameCraft": {
		"site":	"https://gamecraftiiitd.wordpress.com/",
		"description": "Game Development"
	},
	"Philosoc": {
		"site": "https://philosocblog.wordpress.com/",
		"description": "Philosophy"
	}
}

reverse_proxies = {
	"madtoes": {
		"site": "http://lohit13.github.io/MadToes/",
		"preserve_host": "Off"
	},
	"electroholics": {
		"site": "http://electroholics.github.io/",
		"preserve_host": "Off"
	},
	"prodigiouspainters": {
		"site": "http://prodigiouspainters.weebly.com/",
		"preserve_host": "Off"
	},
	"ink": {
		"site": "http://ink-iiitd.github.io/",
		"preserve_host": "Off"
	},
	"trivialis": {
		"site": "http://gurshabad.github.io/trivialis/",
		"preserve_host": "Off"
	},
	"voixdeliterati": {
		"site": "http://tansa05.github.io/LitSocIIITD/",
		"preserve_host": "Off"
	},
	"ecoclub": {
		"site": "http://eco.iiitd.club/",
		"preserve_host": "Off"
	}
}

iframe_content = ['<head><title>',' IIIT-Delhi\'s ',' Club</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><style type="text/css">body, html{margin: 0; padding: 0; height: 100%; overflow: hidden;}#content{position:absolute; left: 0; right: 0; bottom: 0; top: 0px; }</style></head><body><div id="content"><iframe width="100%" height="100%" frameborder="0" src="',
										'" /></div></body></html>']

proxy_content = [
"<VirtualHost *:80>
	ServerName ",".iiitd.edu.in

	ProxyPreserveHost ",
"

	ProxyPass / ",
"
	ProxyPassReverse / ",
"
</VirtualHost>

"]
base_dir = "./club/"

iframes.each do |key,data|
	puts data
	url = data[:site]
	desc = data[:description]
	output_html = [iframe_content[0],key,iframe_content[1],desc,iframe_content[2],url,iframe_content[3]].join('')
	dir = Dir.mkdir(base_dir+key.to_s.downcase) unless Dir.exist?(base_dir+key.to_s.downcase)
	file = File.new(base_dir+key.to_s.downcase+"/index.html","w+")
	file << output_html
	file.close
end

conf = File.new("clubs.conf","w+")

reverse_proxies.each do |key,data|
	puts data
	name = key
	preserve_host = data[:preserve_host]
	url = data[:site]
	output = [proxy_content[0],name,proxy_content[1],preserve_host,proxy_content[2],url,proxy_content[3],url,proxy_content[4]].join('')
	conf << output
end

conf.close