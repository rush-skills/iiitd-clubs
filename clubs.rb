iframes = {
	"foobar": "https://sites.google.com/a/iiitd.ac.in/foobar/"
}
descriptions = {
	"foobar": "programming"
}
iframe_base = '<head><title>%s, IIIT-Delhi\'s %s Club</title><link rel="shortcut icon" href="favicon.png?v=2" /><meta http-equiv="Content-Type" content="text/html\; charset=utf-8" /><style type="text/css">body, html{margin: 0\; padding: 0\; height: 100\%\; overflow: hidden\;}#content{position:absolute\; left: 0\; right: 0\; bottom: 0\; top: 0px\; }</style></head><body><div id="content"><iframe width="100\%" height="100\%" frameborder="0" src="%s" /></div></body></html>'
print iframe_base % ("foobar","programming","https://sites.google.com/a/iiitd.ac.in/foobar/")