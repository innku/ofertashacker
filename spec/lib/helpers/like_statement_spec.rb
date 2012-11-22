require 'helpers/like_statement'

module Helpers
  class LikeStatement
    LIKE = 'LIKE'
  end
end

describe 'LikeStatement' do
  describe 'to_array' do

    it 'returns two sentence, the first is ILIKE of the field and the second the value you are searching' do
      Helpers::LikeStatement.new(['title'], 'JP').to_array.should == ['title LIKE ?', '%JP%']
    end

    it 'for each of the fields passed, it returns the two sentences mentioned before separated by an OR' do
      Helpers::LikeStatement.new(['title', 'description'], 'JP').to_array.should == ['title LIKE ? OR description LIKE ?', '%JP%', '%JP%']
    end

    it 'if passed an array of values it returns a case insensitive search for each of the values passed' do
      Helpers::LikeStatement.new(['title', 'description'], 'JP company').to_array.should == ['title LIKE ? OR title LIKE ? OR description LIKE ? OR description LIKE ?', '%JP%', '%company%','%JP%','%company%']
    end

    it 'if passed a include null flag, for each of the fields passed, it returns a case insensitive query and a null value' do
      Helpers::LikeStatement.new(['title'], 'JP', true).to_array.should == ['title LIKE ? OR title IS NULL', '%JP%']
    end
  end
end
