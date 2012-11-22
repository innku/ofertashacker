require 'helpers/like_statement'

module Helpers
  class LikeStatement
    LIKE = 'LIKE'
  end
end

describe 'LikeStatement' do
  describe 'to_array' do

    it 'returns a case insensitive search' do
      Helpers::LikeStatement.new(['title'], 'JP').to_array.should == ['(title LIKE ?)', '%JP%']
    end

    it 'returns a case insensitive search for each of the fields passed' do
      Helpers::LikeStatement.new(['title', 'description'], 'JP').to_array.should == ['(title LIKE ? OR description LIKE ?)', '%JP%', '%JP%']
    end

    it 'it returns a case insensitive search for each of the fields and values passed' do
      Helpers::LikeStatement.new(['title', 'description'], 'JP company').to_array.should == ['(title LIKE ? OR description LIKE ?) AND (title LIKE ? OR description LIKE ?)', '%JP%', '%JP%','%company%','%company%']
    end

    it 'it returns a case insensitive or null query if the include_nulls flag is passed' do
      Helpers::LikeStatement.new(['title'], 'JP', true).to_array.should == ['(title LIKE ? OR title IS NULL)', '%JP%']
    end
  end
end
