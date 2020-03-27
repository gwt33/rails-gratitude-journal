# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.create({content: "That's really great man!", user_id: 1, gratitude_id: 1})

User.create([{email:'john@john.com', password: 'johnpassword'}, {email:'sophie@sophie.com', password: 'sophiepassword'}, {email:'devon@devon.com', password: 'devonpassword'}, {email:'michelle@michelle.com', password: 'michellepassword'}])

Gratitude.create([{user_id: 1, title: 'Summer?', content: "I'm so grateful for my sister, she really helped me out. For when my coworker gave a gift to me. And for my boyfriend for being there."}, 
                    {user_id: 2, title:'My day was alright', content:"I'm grateful for a bed to sleep on. For my family! And for my car that never complains."}, 
                    {user_id: 2, title:'Was a Great Day', content:"I'm most grateful for my friends surprising me today. For my daughter and my grandmother."},  
                    {user_id: 2, title:'Good time', content:'I\'m grateful for my job. I get to travel the world. My job. Did I say my job?'},  
                    {user_id: 3, title:'I feel okay.', content:'Today was not good. I\'m just grateful for my family and this bed.'},  
                    {user_id: 3, title:'Fine!', content:'Today was a good day. I\'m just grateful for my wife and kids. That\'s all' } ])