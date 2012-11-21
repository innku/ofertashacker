require 'helpers/statement'

module Helpers
  module Statement
    LIKE = 'LIKE'
  end
end

describe 'Statement' do
  describe 'like_statement' do
    let(:it) { stub.extend(Helpers::Statement)}

    it 'returns two sentence, the first is ILIKE of the field and the second the value you are searching' do
      it.like_statement(['title'], 'JP').should == ['title LIKE ?', '%JP%']
    end

    it 'for each of the fields passed, it returns the two sentences mentioned before separated by an OR' do
      it.like_statement(['title', 'description'], 'JP').should == ['title LIKE ? OR description LIKE ?', '%JP%', '%JP%']
    end

    it 'if passed a include null flag, for each of the fields passed, it returns a case insensitive query and a null value' do
      it.like_statement(['title'], 'JP', true).should == ['title LIKE ? OR title IS NULL', '%JP%']
    end
  end
end
