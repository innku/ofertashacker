module Helpers
  module Statement
    def like_statement(fields, string, include_nulls=false)
      values = string.split(' ')
      vals = values.map { |value| like_values(value, 1) }.flatten * fields.size
      (where_clause(fields, values, include_nulls) << vals).flatten
    end
  
    private

    def where_clause(fields, values, include_nulls)
      if include_nulls
        [fields.map{|field| 
          [like_field(field), null_field(field)] * values.size 
        }.flatten.join(' OR ')]
      else
        [fields.map{|field| 
          [like_field(field)] * values.size }.join(' OR ')
        ]
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
