module Helpers
  class LikeStatement
    attr_reader :fields, :query, :include_nulls
    def initialize(fields, query, include_nulls=false)
      @fields = fields
      @query = query
      @include_nulls = include_nulls
    end

    def to_array
      (where_clause << tags_with_like_operator).flatten
    end
  
    private

    def tags
      query.split(' ')
    end

    def tags_with_like_operator
      tags.map { |value| like_value(value) } * fields.size
    end

    def where_clause
      if include_nulls
        [fields.map{|field| 
          [like_field(field), null_field(field)] * tags.size 
        }.flatten.join(' OR ')]
      else
        [fields.map{|field| 
          [like_field(field)] * tags.size }.join(' OR ')
        ]
      end
    end
  
    def like_value(value)
      "%#{value}%"
    end
  
    def like_field(field)
      "#{field} #{LIKE} ?"
    end
  
    def null_field(field)
      "#{field} IS NULL"
    end
  end
end
