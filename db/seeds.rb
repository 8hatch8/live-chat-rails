3.times do |number|
  Message.create(
    content:  "#{number + 1}番目のメッセージです",
    user_id:  User.first.id
  )
  puts "#{number + 1}番目のメッセージを作成しました"
end

puts "Created messages!"