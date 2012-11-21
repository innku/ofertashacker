if (ActiveRecord::Base.connection.adapter_name.downcase.include?('postgres'))
  LIKE = 'ILIKE'
else
  LIKE = 'LIKE'
end
