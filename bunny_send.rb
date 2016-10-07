#!/usr/bin/env ruby
# encoding: utf-8

require "rubygems"
require "bunny"

STDOUT.sync = true

conn = Bunny.new
conn.start

ch = conn.create_channel
q = ch.queue("bunny.examples.hello_world", :auto_delete => true)
x = ch.default_exchange

10.times do |n|
  x.publish("Hello! #{n}", :routing_key => q.name)
  sleep 1.0/10
end

conn.close
