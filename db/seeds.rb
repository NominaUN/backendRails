# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Area.create!([{area_name: 'Administrativo'},{area_name: 'Investigación y Desarrollo'},{area_name: 'Atención al Cliente'},{area_name: 'Comercial'}])
Position.create!([{position_name: 'Gerente General'},{position_name: 'Director de I+D'},{position_name: 'Director de Atención al Cliente'},{position_name: 'Gerente Comercial'}])
Concept.create!([{concept_name: 'Salario', category: 'Devengado'},{concept_name: 'Auxilio de Transporte', category: 'Devengado'},
	{concept_name: 'Salud', category: 'Deducido'},{concept_name: 'Pensión', category: 'Deducido'},{concept_name: 'Vacaciones', category: 'Provisión'},
	{concept_name: 'Prima', category: 'Provisión'},{concept_name: 'Cesantías', category: 'Provisión'},
	{concept_name: 'Intereses de Cesantías', category: 'Provisión'}])
Fond.create!([{document_type: 'NIT', document_number: '12345', business_name: 'Compensar', fond_type: 'CajaComp'},
				{document_type: 'NIT', document_number: '67890', business_name: 'Positiva', fond_type: 'ARL'},
				{document_type: 'NIT', document_number: '13579', business_name: 'Protección', fond_type: 'Cesantias'},
				{document_type: 'NIT', document_number: '24680', business_name: 'Colpensiones', fond_type: 'Pensiones'},
				{document_type: 'NIT', document_number: '54321', business_name: 'Compensar', fond_type: 'EPS'},
				{document_type: 'NIT', document_number: '98760', business_name: 'Colsubsidio', fond_type: 'CajaComp'},
				{document_type: 'NIT', document_number: '55555', business_name: 'Sura', fond_type: 'ARL'},
				{document_type: 'NIT', document_number: '63451', business_name: 'Porvenir', fond_type: 'Cesantias'},
				{document_type: 'NIT', document_number: '22222', business_name: 'Colfondos', fond_type: 'Pensiones'},
				{document_type: 'NIT', document_number: '12679', business_name: 'Sanitas', fond_type: 'EPS'}])
Employee.create!([{document_type: 'CC', document_number: '123', first_name: 'Andrew', other_name: 'James', last_name: 'Walkan', second_surname: 'Junior',
	birthdate: '01/02/1980', birthplace: 'Astana', address: 'Calle falsa 123', phones: '3213213213', email: 'ajwj@correo.com', admission_date: '01/01/2017', 
	salary: 2000000, transport_aid: false, integral_salary: false, area_id: 1, position_id: 1},
	{document_type: 'CC', document_number: '456', first_name: 'Lucas', other_name: 'Leonardo', last_name: 'Achilier', second_surname: 'Villegas',
	birthdate: '01/07/1984', birthplace: 'Cali', address: 'Calle falsa 456', phones: '3213453453', email: 'llav@correo.com', admission_date: '01/01/2017', 
	salary: 1500000, transport_aid: false, integral_salary: false, area_id: 2, position_id: 2},
	{document_type: 'CC', document_number: '789', first_name: 'Takashi', other_name: '', last_name: 'Yamada', second_surname: 'Perdida',
	birthdate: '01/12/1978', birthplace: 'Sapporo', address: 'Calle falsa 789', phones: '3217498539', email: 'twp@correo.com', admission_date: '01/01/2015', 
	salary: 4000000, transport_aid: false, integral_salary: false, area_id: 3, position_id: 3},
	{document_type: 'CC', document_number: '555', first_name: 'Gerard', other_name: '', last_name: 'López', second_surname: 'Sánchez',
	birthdate: '01/05/1985', birthplace: 'Madrid', address: 'Calle falsa 555', phones: '3218589656', email: 'gls@correo.com', admission_date: '01/01/2017', 
	salary: 900000, transport_aid: true, integral_salary: false, area_id: 4, position_id: 4}])
FondEmployee.create!([{fond_id: 1, employee_id: 1},{fond_id: 2, employee_id: 1},{fond_id: 3, employee_id: 1},{fond_id: 4, employee_id: 1},{fond_id: 5, employee_id: 1},
						{fond_id: 6, employee_id: 2},{fond_id: 7, employee_id: 2},{fond_id: 8, employee_id: 2},{fond_id: 9, employee_id: 2},{fond_id: 10, employee_id: 2},
						{fond_id: 1, employee_id: 3},{fond_id: 2, employee_id: 3},{fond_id: 3, employee_id: 3},{fond_id: 4, employee_id: 3},{fond_id: 5, employee_id: 3},
						{fond_id: 6, employee_id: 4},{fond_id: 7, employee_id: 4},{fond_id: 8, employee_id: 4},{fond_id: 9, employee_id: 4},{fond_id: 10, employee_id: 4}])
PaydayMaster.create!([{payday_type: 'Nomina', payday_date: '15/01/2017', description: 'tengo frio'},
						{payday_type: 'Vacaciones', payday_date: '20/01/2017', description: 'tengo frio'},
						{payday_type: 'Nomina', payday_date: '31/01/2017', description: 'tengo frio'},
						{payday_type: 'Terminacion', payday_date: '10/02/2017', description: 'tengo frio'}])
Vacation.create!([{paid_days: 15, taken_days: 17, start_date: '20/01/2017', end_date: '04/02/2017', employee_id: 4, payday_master_id: 2}])
PaydayDetail.create!([{base_value: 1000000, win: 1000000, loss: 0, appropiation: 0, worked_days: 15, start_date: '01/01/2017', end_date: '15/01/2017',
				concept_id: 1, employee_id: 1, payday_master_id: 1},{base_value: 1000000, win: 1000000, loss: 0, appropiation: 0, worked_days: 15, 
				start_date: '20/01/2017', end_date: '05/02/2017', concept_id: 5, employee_id: 2, payday_master_id: 2},{base_value: 1000000, win: 1000000, 
				loss: 0, appropiation: 0, worked_days: 15, start_date: '01/02/2017', end_date: '15/02/2017', concept_id: 1, employee_id: 3, 
				payday_master_id: 3},{base_value: 1000000, win: 1000000, loss: 0, appropiation: 0, worked_days: 15, start_date: '16/01/2017', 
				end_date: '31/01/2017', concept_id: 1, employee_id: 4, payday_master_id: 4}])
Novelty.create!([{novelty_type: 'Inactividad', category: 'Devengado', novelty_value: 0, period: 1, applied: 0, description: 'Enfermedad General', 
	percentage1: 100, percentage2: 66.67, percentage3: 50, employee_id: 1, payday_detail_id: 1},{novelty_type: 'Otros', category: 'Devengado', 
	novelty_value: 100000, period: 1, applied: 1, description: 'Bonificacion', percentage1: 0, percentage2: 0, percentage3: 0, employee_id: 3, 
	payday_detail_id: 3}])
User.create!([{user_name: 'ajwj', user_pass: '123456', user_role: 'EMPLEADO', employee_id: 1},{user_name: 'llav', user_pass: '12345', user_role: 'EMPLEADO', employee_id: 2},
		{user_name: 'twp', user_pass: '1234567', user_role: 'EMPLEADO', employee_id: 3},{user_name: 'gls', user_pass: '12345678', user_role: 'ADMIN', employee_id: 4}])
Option.create!([{option_name: 'Liquidar', insert_action: true, update_action: true, delete_action: true},
				{option_name: 'Empleados', insert_action: true, update_action: true, delete_action: true},
				{option_name: 'Estadisticas', insert_action: true, update_action: true, delete_action: true}])
Log.create!([{log_time: '01/02/2017', user_id: 4, option_id: 1}])
GeneralParameter.create!([{round_type: 100, laboral_days: 5, payday: 'QUINCENAL', integral_base: 70}])
