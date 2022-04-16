R E A D M E ] ]

s h o r t   d e s c r i p t i o n
For an apartment complex that has parking lots intended for residents, mixups can happen when dealing with who can park where. There is a need to distinguish between tenant vehicles and visitors and this particular system utilizes differentiation by permit stickers displayed on windshields. Each sticker has a numerical identifier attached to it, which can then be used to indicate its owner through a database. 
*This* is *that* database.

Tenants interested in registering for a resident vehicle permit, are given vehicle permit registrations that carry a unique number, marked specifically for identification.

This application was developed with the intention to create an interface for record keeping that is simplified, organized, and easily accesible.

Using SQLite3, Sinatra, and ActiveRecord, this project enables a user to create database entries reflecting apartment complex tenant information and their registered vehicles. User can create vehicle permit registrations and associate them with apartments. View a single apartment to see all registered permits that are associated on file, as each apartment can have up to 3 registrations; 1 registration per lease-holder.

Create records of tenants and their associated vehicles with a given permit registration sticker.

c o n t r i b u t o r s   g u i d e
To be completely honest, this project is not for the public as this is my personal project intended for my own private usage. Feedback from caring and respectful individuals is welcome.

i n s t a l l   i n s t r u c t i o n s
in terminal:
    run 'bundle install' 
    run 'shotgun'
open internet browser and enter address: 
    'localhost:9393/'
follow the directions on the page to access:
    - an index page listing all registered permits
    - an index page featuring all apartments on file
    - registration page to create a new permit
    - registration page for new apartment entry into database
    - buttons to edit or delete an existing permit
