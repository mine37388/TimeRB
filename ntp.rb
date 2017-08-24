#!/usr/bin/ruby1.9.1
require 'socket'

u = UDPSocket.new
data = "\x1b" + "\0" *  47
$port = 123
epoch = 2208988800
/*
Replace <time server> with hostname of relevant time server
*/
hostname = '<time server>'
u.send( data, 0, hostname, $port  )
data, response = u.recvfrom(1024)

if @data.nil?
	puts "NTP server %s" % response[3]
	data = data.unpack('N12')[10].to_i - epoch
	time = Time.at(data)
	
	puts "Time now = %s" % time.asctime

else
	raise "no data returned"

end

u.close
