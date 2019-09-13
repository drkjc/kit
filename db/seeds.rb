# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {name: "pam", email: "email@email.com", password_digest: "test"},
  {name: "jim", email: "email@email.com", password_digest: "test"},
  {name: "michael", email: "email@email.com", password_digest: "test"},
  {name: "dwight", email: "email@email.com", password_digest: "test"},
  {name: "angela", email: "email@email.com", password_digest: "test"},
  {name: "kelly", email: "email@email.com", password_digest: "test"},
  {name: "andy", email: "email@email.com", password_digest: "test"},
  {name: "ryan", email: "email@email.com", password_digest: "test"},
  {name: "kevin", email: "email@email.com", password_digest: "test"},
  {name: "phyllis", email: "email@email.com", password_digest: "test"},
  {name: "roy", email: "email@email.com", password_digest: "test"},
  {name: "stanley", email: "email@email.com", password_digest: "test"},
  {name: "oscar", email: "email@email.com", password_digest: "test"},
  {name: "meredith", email: "email@email.com", password_digest: "test"},
  {name: "creed", email: "email@email.com", password_digest: "test"},
  {name: "toby", email: "email@email.com", password_digest: "test"},
  {name: "darryl", email: "email@email.com", password_digest: "test"},
  {name: "jan", email: "email@email.com", password_digest: "test"}
])

Room.create([{name: 'sales'}, 
  {name: 'accounting'}, 
  {name: 'party planning committee'}, 
  {name: 'warehouse'}, 
  {name: 'conference room'}])

# # Putting Sales Staff in Sales Room
# sales = Room.find_by(name: 'sales')

#  # Sales Staff
j = User.find_by(name: 'jim')
j.rooms << sales
j.save
s = User.find_by(name: 'stanley')
s.rooms << sales
s.save
d = User.find_by(name: 'dwight')
d.rooms << sales
d.save
p = User.find_by(name: 'phyllis')
p.rooms << sales
p.save
a = User.find_by(name: 'andy')
a.rooms << sales
a.save

# # Putting accoutants in accounting Room
# acc = Room.find_by(name: 'accounting')

# # Accounting Staff
a = User.find_by(name: 'angela')
a.rooms << acc
a.save
o = User.find_by(name:'oscar')
o.rooms << acc 
o.save
k = User.find_by(name:'kevin')
k.rooms << acc 
k.save 

# # Putting warehouse staff in warehouse 
# ware = Room.find_by(name: 'warehouse')

# # warehouse staff
d = User.find_by(name: 'darryl')
d.rooms << ware 
d.save
r = User.find_by(name: 'roy')
r.rooms << ware 
r.save 

# # Putting party planners together 
# party = Room.find_by(name: 'party planning committee')

# # PPC staff 
a.rooms << party
a.save 
p.rooms << party 
p.save 
pam = User.find_by(name: 'pam')
pam.rooms << party 
pam.save

# # Putting everyone in conference room 
# conf = Room.find_by(name: 'conference room')

# # Entire Office 
 a.rooms << conf # angela
 o.rooms << conf # oscar
 k.rooms << conf # kevin 
 d.rooms << conf # darryl
 r.rooms << conf # roy 
 j.rooms << conf # jim 
 s.rooms << conf # stanley 
 pam.rooms << conf # pam 
 p.rooms << conf # phyllis 

# # dwight, andy 

dw = User.find_by(name: 'dwight')
dw.rooms << conf 
dw.save 

andy = User.find_by(name: 'andy')
andy.rooms << conf 
andy.save

# # michael, meredith, creed, ryan, kelly, toby 

mic = User.find_by(name: 'michael')
mic.rooms << conf
mic.save 

mer = User.find_by(name: 'meredith')
mer.rooms << conf 
mer.save 

creed = User.find_by(name: 'creed') 
creed.rooms << conf 
creed.save 

ry = User.find_by(name: 'ryan') 
ry.rooms << conf 
ry.save

kel = User.find_by(name: 'kelly') 
kel.rooms << conf 
kel.save 

toby = User.find_by(name: 'toby')
toby.rooms << conf 
toby.save 

# #DONE 