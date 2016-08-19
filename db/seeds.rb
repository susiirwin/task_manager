require 'sqlite3'

database = SQLite3::Database.new("db/task_manager_development.db")

#Delete existing records from the tasks table before inserting these new records; we'll start from scratch.
database.execute("DELETE FROM tasks")

#insert records
database.execute("INSERT INTO tasks
                (title, description)
                VALUES
                  ('Go to the Gym', 'exercise is good for you'),
                  ('Make dinner', 'obviously'),
                  ('Pay the electric bill', 'it is due in 10 days'),
                  ('Book a flight home for vacation', 'End of August');"
                )

#verify that our SQL INSERT statement worked
puts "It worked and:"
p database.execute("SELECT * FROM tasks;")
