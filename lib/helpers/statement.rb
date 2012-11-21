module Helpers
  module Statement
    def like_statement(fields, value, include_nulls=false)
      (where_clause(fields, include_nulls) << like_values(value, fields.size)).flatten
    end
  
    private

    def where_clause(fields, include_nulls)
      if include_nulls
        [fields.map{|field| [like_field(field), null_field(field)] }.flatten.join(' OR ')]
      else
        [fields.map{|field| like_field(field) }.join(' OR ')]
      end
    end
  
    def like_values(value, repetitions)
      values = []
      repetitions.times{ values << "%#{value}%"}
      values
    end
  
    def like_field(field)
      "#{field} #{LIKE} ?"
    end
  
    def null_field(field)
      "#{field} IS NULL"
    end
  end
end
