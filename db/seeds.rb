# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


summoner1 = Summoner.find_or_initialize_by(name: "HERPoftheDERP")
summoner2 = Summoner.find_or_initialize_by(name: "Eufo")
summoner3 = Summoner.find_or_initialize_by(name: "kirbyslayer")
summoner4 = Summoner.find_or_initialize_by(name: "Eufonioum")
summoner5 = Summoner.find_or_initialize_by(name: "Yuudee")
summoner6 = Summoner.find_or_initialize_by(name: "PinkTurboRanger")
summoner7 = Summoner.find_or_initialize_by(name: "MIHMAYMAHMOH")

summoner1.save!
summoner2.save!
summoner3.save!
summoner4.save!
summoner5.save!
summoner6.save!
summoner7.save!




match1 = Match.find_or_initialize_by(live: true).save!


