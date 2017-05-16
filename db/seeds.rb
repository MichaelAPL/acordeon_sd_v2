# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subject.create(id: 1, name:"Arquitectura de sistemas distribuidos")
Subject.create(id: 2, name:"Modelos de comunicación entre procesos")
Subject.create(id: 3, name:"Sincronización de relojes")

Concept.create(id: 1, name: "Concepto 1", definition: "Concepto de prueba 1", subject_id: 1)
Concept.create(id: 2, name: "Concepto 2", definition: "Concepto de prueba 2", subject_id: 1)
Concept.create(id: 3, name: "Concepto 3", definition: "Concepto de prueba 3", subject_id: 1)
Concept.create(id: 4, name: "Concepto 4", definition: "Concepto de prueba 4", subject_id: 2)
Concept.create(id: 5, name: "Concepto 5", definition: "Concepto de prueba 5", subject_id: 2)
Concept.create(id: 6, name: "Concepto 6", definition: "Concepto de prueba 6", subject_id: 2)
Concept.create(id: 7, name: "Concepto 7", definition: "Concepto de prueba 7", subject_id: 3)
Concept.create(id: 8, name: "Concepto 8", definition: "Concepto de prueba 8", subject_id: 3)
Concept.create(id: 9, name: "Concepto 9", definition: "Concepto de prueba 9", subject_id: 3)