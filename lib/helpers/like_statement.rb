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
      tags.map { |value| like_values(value, fields.size) }.flatten
    end

    def where_clause
      [(["(#{query_for_one_value})"] * tags.size()).join(' AND ')]
    end

    def query_for_one_value
      if include_nulls
        fields.map{|field| 
          [like_field(field), null_field(field)]
        }.flatten.join(' OR ')
      else
        fields.map{|field| 
          [like_field(field)] 
        }.join(' OR ')
      end
    end
  
    def like_values(value, repetition)
      repetition.times.map { "%#{value}%" }
    end
  
    def like_field(field)
      "#{field} #{LIKE} ?"
    end
  
    def null_field(field)
      "#{field} IS NULL"
    end
  end
end
