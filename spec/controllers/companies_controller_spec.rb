require 'spec_helper'

describe CompaniesController do
  
  before do
    @company = Factory(:company)
  end

  describe '#index' do
    it 'Gets all the companies' do
      get :index
      assigns(:companies).should eql(Company.all)
    end
  end

  describe '#show' do
    context 'With valid params' do
      it 'Gets the company'
    end

    context 'With invalid params' do
      it 'Raise an error'
      it 'Does not get the company'
    end
  end
  describe '#edit'
  
  describe '#update' do
    context 'Valid attribute params' do
      it 'redirects to company profile'
    end
    
    context 'Invalid attribute params' do
      it 'returns to editing the company data'
    end
  end
  describe '#destroy'
end
