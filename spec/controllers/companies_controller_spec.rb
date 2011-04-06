require 'spec_helper'

describe CompaniesController do

  describe '#index' do

    before do
      Factory(:company)
    end
    it 'Gets all the companies' do
      get :index
      assigns(:companies).should eql(Company.all)
    end
  end

  describe '#show' do
    context 'With valid params' do
      it 'Gets the company'
    end

    context 'With invalid paramas' do
      it 'Raise an error'
      it 'Does not get the company'
    end
  end
  describe '#edit'
  describe '#update'
  describe '#destroy'
end
