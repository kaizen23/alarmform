class Secsys 
 
  def display(x: '1')
  @x = x 
  sql = "SELECT * FROM notifications WHERE status = 1 ORDER BY created_at ASC LIMIT #{@x} "
  update_sql = "UPDATE notifications SET status = 0 WHERE status = 1 ORDER BY created_at ASC LIMIT #{@x} "
	result = ActiveRecord::Base.connection.execute(sql)
	execute_update = ActiveRecord::Base.connection.execute(update_sql)
	return result
  end
  
end 