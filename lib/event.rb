# -*- encoding : utf-8 -*-
require 'mechanize'
require 'json'
require 'uri'
require 'net/http'


connpass_url = URI.parse("https://connpass.com/api/v1/event/?order=2&keyword=osaka&count=100")
connpass_json = Net::HTTP.get(connpass_url)
connpass_result = JSON.parse(connpass_json)

connpass_events  = connpass_result['events']
connpass_events.each do |e|
  event = Event.where(url: e["event_url"]).first_or_initialize
  event.title = e["title"]
  event.description = e["description"]
  event.location = e["place"]
  event.address = e["address"]
  event.lon = e["lon"]
  event.lat = e["lat"]
  event.started_at = e["started_at"]
  event.ended_at = e["ended_at"]
  event.site = "connpass"
  event.status = 1
  event.save
end

doorkeeper_url = URI.parse("https://api.doorkeeper.jp/events?q=osaka")
doorkeeper_json = Net::HTTP.get(doorkeeper_url)
doorkeeper_result = JSON.parse(doorkeeper_json)


doorkeeper_result.each do |i|
  e = i["event"]
  event = Event.where(url: e["public_url"]).first_or_initialize
  event.title = e["title"]
  event.description = e["description"]
  event.location = e["venue_name"]
  event.address = e["address"]
  event.lon = e["long"]
  event.lat = e["lat"]
  event.started_at = e["starts_at"]
  event.ended_at = e["ends_at"]
  event.site = "doorkeeper"
  event.status = 1
  event.save
end






# class Events
#   def self.connpass_urls
#     date = Date.today
#     links = []
#     agent = Mechanize.new
#
#     for i in 1..14 do
#       url = "https://connpass.com/search/?page=#{i}&q=&selectItem=osaka&prefectures=osaka&start_to=&start_from=#{date.year}%2F#{date.month}%2F#{date.day}"
#       current_page = agent.get(url)
#       elements = current_page.search('.summary')
#       elements.each do |ele|
#         links << ele[:href]
#       end
#     end
#
#     links.each do |link|
#       get_event(link)
#       sleep 5
#     end
#   end
#
#   def self.get_event(link)
#     begin
#       agent = Mechanize.new
#       page = agent.get(link)
#       title = page.at('.event_title').inner_text
#       image = page.at('.event_header_area a')[:href] if page.at('.event_header_area a')
#       location = page.at('.adr').inner_text if page.at('.adr')
#       date = page.at('.ymd').inner_text if page.at('.ymd')
#       owner = page.at(".group_title a").inner_text if page.at("group_title")
#
#       event = Event.where(url: link).first_or_initialize
#       event.title = title
#       event.image = image
#       event.location = location
#       event.date = date
#       event.site = "connpass"
#       event.save
#     rescue => e
#       puts e
#     end
#   end
#
#   def self.techplay_urls
#     url = "https://techplay.jp/event/search?keyword=&pref=27&from="
#     links = []
#     agent = Mechanize.new
#     page = agent.get(url)
#     elements = page.search('.title h3 a')
#     elements.each do |ele|
#       links << ele[:href]
#     end
#     links.each do |link|
#       get_techplay(link)
#     end
#   end
#
#   def self.get_techplay(link)
#     begin
#       agent = Mechanize.new
#       page = agent.get(link)
#       title = page.at('h3 a span').inner_text if page.at('h3 a span')
#       image = page.at('.image img')[:src] if page.at('.image img')
#       location = page.at('//*[@id="mainContentArea"]/div[1]/div[2]/div[2]/div[1]/dl[2]/dd').inner_text if page.at('//*[@id="mainContentArea"]/div[1]/div[2]/div[2]/div[1]/dl[2]/dd')
#       date = page.at('.eventAside-day')[:datetime] if page.at('.eventAside-day')
#
#       if !(title.nil?)
#         event = Event.where(url: link).first_or_initialize
#         event.title = title
#         event.image = image
#         event.location = location
#         event.date = date
#         event.site ="Tech_play"
#         event.save
#       end
#     rescue => e
#       puts e
#     end
#   end
#
#   def self.doorkeeper_urls
#     url = "https://www.doorkeeper.jp/prefectures/osaka/events"
#     links = []
#     agent = Mechanize.new
#     page = agent.get(url)
#     elements = page.search('.events-list-item-title a')
#     elements.each do |ele|
#       links << ele[:href]
#     end
#     links.each do |link|
#       get_doorkeeper(link)
#     end
#   end
#
#   def self.get_doorkeeper(link)
#     begin
#       agent = Mechanize.new
#       page = agent.get(link)
#       title = page.at('.community-content-title').inner_text if page.at('.community-content-title')
#       image = page.at('.event-main-visual')[:src] if page.at('.event-main-visual')
#       location = page.at('.community-event-venue-map span').inner_text if page.at('.community-event-venue-map span')
#       date = page.at('.community-event-info-date').inner_text if page.at('.community-event-info-date')
#
#       event = Event.where(url: link).first_or_initialize
#       event.title = title
#       event.image = image
#       event.location = location
#       event.date = date
#       event.site = "doorkeeper"
#       event.save
#     rescue => e
#       puts e
#     end
#   end

  # def self.peatix_urls
  #   url = "https://peatix.com/search?country=JP&l.ll=34.6413315%2C135.5629394&l.text=%E5%A4%A7%E9%98%AA%E5%BA%9C&p=1&size=10&v=3.4&dr="
  #   links = []
  #   agent = Mechanize.new
  #   page = agent.get(url)
  #   elements = page.search('.event-list__medium .event-thumb_link')
  #   elements.each do |ele|
  #     links << ele[:href]
  #   end
  #   puts links
  #   links.each do |link|
  #     get_peatix(link)
  #   end
  # end

  # def self.get_peatix(link)
  #   agent = Mechanize.new
  #   page = agent.get(link)
  #   title = page.at('.event-name-ttl').inner_text if page.at('.event-name-ttl')
  #   image = page.at('.event-main-visual')[:src] if page.at('.event-main-visual')
  #   location = page.at('#field-event-venue_name a').inner_text if page.at('#field-event-venue_name a')
  #   date = page.at('#field-event-datetime').inner_text if page.at('#field-event-datetime')

  #   event = Event.where(url: link).first_or_initialize
  #   event.title = title
  #   event.image = image
  #   event.location = location
  #   event.date = date
  #   event.save
  # end
#end

#Events.connpass_urls
#Events.techplay_urls

#Events.doorkeeper_urls
