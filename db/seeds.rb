# Create a member
member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.skip_confirmation!
member.save!
