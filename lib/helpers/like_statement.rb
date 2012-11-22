module Helpers
  class LikeStatement
    attr_reader :fields, :query, :include_nulls
    def initialize(fields, query, include_nulls=false)
      @fields = fields
      @query = query
      @include_nulls = include_nulls
    end

    def to_array
      values = query.split(' ')
      vals = values.map { |value| like_values(value, 1) }.flatten * fields.size
      (where_clause(values) << vals).flatten
    end
  
    private

    def where_clause(values)
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
