class Secsys 
  #x is number of quantity record you want download
  def display(x: '1')
  @x = x 
  #fetch date
  sql = "SELECT * FROM notifications WHERE status = 1 ORDER BY created_at ASC LIMIT #{@x} "
  #change status to read which equal 0
  update_sql = "UPDATE notifications SET status = 0 WHERE status = 1 ORDER BY created_at ASC LIMIT #{@x} "
  #execute sql using ActiveRecord
	result = ActiveRecord::Base.connection.execute(sql)
	execute_update = ActiveRecord::Base.connection.execute(update_sql)
	#return the score
	return result
  end
  
end 
