# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

my_self = MySelf.new
my_self.name = 'Виктор Голов'
my_self.city = 'Фурманов'
my_self.date_birth = DateTime.new(1990, 3, 24)
my_self.technologies = %w(C# JavaScript)
my_self.interests = %w(PostgreSQL MongoDB GameDevelopment)
my_self.email = 'tohobbit@gmail.com'
my_self.phone = '+7 (960) 50-50-613'
my_self.vk = 'http://vk.com/id136179396'

my_self.save!

work1 = Work.new
work1.from = DateTime.new(2012, 2)
work1.to = DateTime.new(2012, 9)
work1.name = 'MS Group'
work1.profession = 'Эникейщик'
work1.occupation = 'Всякие дела'
work1.my_self = my_self

work1.save!

work2 = Work.new
work2.from = DateTime.new(2012, 11)
work2.to = DateTime.new(2013, 8)
work2.name = 'Garpix'
work2.profession = 'Программист'
work2.occupation = '3д примерочная'
work2.my_self = my_self

work2.save!

work3 = Work.new
work3.from = DateTime.new(2013, 8)
work3.to = nil
work3.name = 'Indusoft'
work3.profession = 'Программист'
work3.occupation = 'Тонкие мнемосхемы'
work3.my_self = my_self

work3.save!

study = Study.new
study.from = DateTime.new(2007)
study.to = DateTime.new(2012)
study.name = 'ИГТА'
study.desc = 'Ивановская государственная текстильная академия, факультет экономики и управления, специальность "Информационные технологии в дизайне"'
study.my_self = my_self

study.save!


user = User.new
user.name = 'hobbit'
user.pass = Digest::SHA1.hexdigest('q1q2q3q4')

user.save!