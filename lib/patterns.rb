first_name_dot_last_name = -> (name) { name.join('.') }
first_name_dot_last_initial = -> (name) { name.first + '.' + name.last[0] }
first_initial_dot_last_name = -> (name) { name.first[0] + '.' + name.last }
first_initial_dot_last_initial = -> (name) { name.first[0] + '.' + name.last[0] }
