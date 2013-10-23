require_relative "cookiejar"

c = CookieJar.new("ABCDEFGHIJKLMNOPQRSTUVXYZ".split '')
c.start(times: 26,
		repeat: false,
		delay: true
)