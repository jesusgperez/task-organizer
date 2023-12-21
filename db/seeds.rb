# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

names = ['juan', 'andrea', 'leon', 'andres', 'natalia', 'camilo', 'rusbel', 'johan']

names.each do |name|
    User.create(email: "#{name}@gmail.com", password: '123456')
end

puts 'Users have been created'

categories = ['desarrollo', 'mercadeo', 'conceptualización', 'ejercicios']

categories.each do |category|
    Category.create(name: category, description: '--')
end

puts 'Categories have been created'

base = [
    {
        category: 'conceptualización',
        description: 'Bienvenida',
        participants: [
            {name: 'johan', role: 1},
            {name: 'leon', role: 2},
            {name: 'andrea', role: -1},
        ]
    },
    {
        category: 'conceptualización',
        description: '¿Qué es Ruby on Rails y por qué usarlo?',
        participants: [
            {name: 'johan', role: 1},
            {name: 'leon', role: 2},
            {name: 'andrea', role: -1},
        ]
    },
    {
        category: 'conceptualización',
        description: 'Entorno de desarrollo RoR',
        participants: [
            {name: 'johan', role: 1},
            {name: 'leon', role: 2},
            {name: 'andrea', role: -1},
        ]
    },
    {
        category: 'ejercicios',
        description: 'Instalación de Ruby, RoR en windows y Linux',
        participants: [
            {name: 'johan', role: 1},
            {name: 'leon', role: 2},
            {name: 'andrea', role: -1},
        ]
    },
    {
        category: 'conceptualización',
        description: 'Entender la web con Rieles',
        participants: [
            {name: 'johan', role: 1},
            {name: 'leon', role: 2},
            {name: 'andrea', role: -1},
        ]
    }
]

roles = [1, 2]

owner = User.find_by(email: 'johan@gmail.com')

base.each do |task|
    participants = task[:participants].map do |info|
        name = info[:name]
        role = info[:role] == -1 ? roles.sample : info[:role]
        Participant.new(user: User.find_by(email: "#{name}@gmail.com"), role: role)
    end
    category = Category.find_by(name: task[:category])
    Task.create!(
        category: category,
        name: "Tarea #{Task.count + 1}",
        description: task[:description],
        due_date: Date.today + 15.days,
        user: owner,
        participating_users: participants
    )
end

puts "Tasks have been created"
