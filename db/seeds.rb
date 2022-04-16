
users = [
    {id: 1, username: "administrator", password: "123456789"},
    {id: 2, username: "superintendent", password: "123456789"},
    {id: 3, username: "porter", password: "123456789"}
]

users.each do |u|
    User.create(u)
end



apartments = [
    {id: 1, building: "404B", unit: "1B", number: "404B1B", user_id: 1},
    {id: 2, building: "404B", unit: "2B", number: "404B2B", user_id: 1},   
    {id: 3, building: "404B", unit: "3B", number: "404B3B", user_id: 1},   
    {id: 4, building: "404B", unit: "4B", number: "404B4B", user_id: 1}, 

    {id: 5, building: "404A", unit: "5A", number: "404B5A", user_id: 1}, 
    {id: 6, building: "404A", unit: "6A", number: "404B6A", user_id: 1}, 
    {id: 7, building: "404A", unit: "7A", number: "404B7A", user_id: 1}, 
    {id: 8, building: "404A", unit: "8A", number: "404B8A", user_id: 1} 
]

apartments.each do |a|
    Apartment.create(a)
end

permits = [
    {number: "D-9501", tenant_name: "Rixin Core", contact_number: "(123)456-7890", 
        vehicle_plate: "XRXSS", vehicle_color: "Red", vehicle_year: "1989", 
        vehicle_make_model: "Mazda Maziatah",
        apartment_id: 3, user_id: 1},
    {number: "D-9502", tenant_name: "Pupper Doge", contact_number: "(000)123-4444", 
        vehicle_plate: "XABCX", vehicle_color: "Black", vehicle_year: "2020", 
        vehicle_make_model: "Mercedes Bleeper", 
        apartment_id: 2, user_id: 1},
    {number: "D-9503", tenant_name: "Caterson Kit", contact_number: "(909)123-2346", 
        vehicle_plate: "ABXYZZ", vehicle_color: "Purple", vehicle_year: "1900", 
        vehicle_make_model: "Kioote Quor", 
        apartment_id: 2, user_id: 1},
    {number: "D-9551", tenant_name: "Turtle T. Elter", contact_number: "(959)959-3336", 
        vehicle_plate: "LMNOQ", vehicle_color: "Black", vehicle_year: "2020", 
        vehicle_make_model: "Rio Grenadino", 
        apartment_id: 5, user_id: 1},
    {number: "D-9552", tenant_name: "Blen Der", contact_number: "(000)000-4444", 
        vehicle_plate: "NOLDY4U", vehicle_color: "Pink", vehicle_year: "1980", 
        vehicle_make_model: "Mercedes Bleeper", 
        apartment_id: 6, user_id: 1},
    {number: "D-9553", tenant_name: "Jenni Em", contact_number: "(999)777-8888", 
        vehicle_plate: "AT8VYN", vehicle_color: "Blue", vehicle_year: "1965", 
        vehicle_make_model: "Trucker Pixie",
        apartment_id: 7, user_id: 1}    
]

permits.each do |p|
    Permit.create(p)
end
