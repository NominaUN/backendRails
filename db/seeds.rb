# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Area.create!([{name: 'Administrativo'},{name: 'Investigación y Desarrollo'},{name: 'Atención al Cliente'},{name: 'Comercial'}])
Position.create!([{name: 'Gerente General'},{name: 'Gerente Comercial'},{name: 'Director de I+D'},{name: 'Ingeniero I+D Senior'},
	{name: 'Representante de Servicio al Cliente'},{name: 'Asesor Comercial'}])
Concept.create!([{concept_name: 'Salario', category: 'Devengado'},{concept_name: 'Auxilio de Transporte', category: 'Devengado'},
	{concept_name: 'Salud', category: 'Deducido'},{concept_name: 'Pensión', category: 'Deducido'}])
Fond.create!([{document_type: 'NIT.', document_number: '12345', business_name: 'Compensar', type_of_fond: 'CajaComp'},
	{document_type: 'NIT.', document_number: '67890', business_name: 'Positiva', type_of_fond: 'ARL'}])
Employee.create!([{document_type: 'C.C.', document_number: '123', first_name: 'Andrew', other_name: 'James', last_name: 'Walkan', second_surname: 'Junior',
	birthdate: '01/02/1980', birthplace: 'Astana', address: 'Calle falsa 123', phones: '3213213213', email: 'ajwj@correo.com', admission_date: '01/01/2017', 
	salary: 2000000, transport_aid: false, integral_salary: false, area_id: 1, position_id: 1}])
FondEmployee.create!([{fond_id: 1, employee_id: 1},{fond_id: 2, employee_id: 1}])

