	#all testing in rails console
class Secsys 
  #x is number of quantity record you want download
  def display(x= '1', hash = {})
  
  #example of arguments
  #display(2,{:category=>'Awaria', :cost=>'100', :email=>'it@szpital4.bytom.pl'})
  @x = x 
  
  if (hash[:category] =='Uszkodzenie' || hash[:category] =='Awaria' || hash[:category] =='Usterka') 
  @category = 'AND category = "' + hash[:category] + '"'
  end
  
  #Don't enough time to end rest hash
  #SELECT notifications.id FROM notifications LEFT OUTER JOIN orders ON notifications.id=orders.notification_id where cost = 50;
  #if (hash[:cost] =='100' || hash[:cost] =='50' || hash[:cost] =='10' || hash[:cost] =='1') 
  #@id_cost = 'AND notifications.id = "' + hash[:cost] + '"'
  #end
  
  #fetch date
  sql = "SELECT * FROM notifications WHERE status = 1  #{@category} ORDER BY created_at ASC LIMIT #{@x} "
  #change status to read which equal 0
  update_sql = "UPDATE notifications SET status = 0 WHERE status = 1 ORDER BY created_at ASC LIMIT #{@x} "
  #execute sql using ActiveRecord
	result = ActiveRecord::Base.connection.execute(sql)
	execute_update = ActiveRecord::Base.connection.execute(update_sql)
	#return the score
	return result
  end
  
end 
