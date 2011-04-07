require 'spec_helper'

describe CompaniesController do

  before do
    @company = Factory(:company)
    controller.stub(:current_company).and_return(@company)
  end

  describe '#index' do
    it 'Gets all the companies' do
      get :index
      assigns(:companies).should eql(Company.all)
    end
  end

  describe '#show' do
    context 'With valid params' do
      let(:valid_params){{:id => @company.id}}
      it 'Gets the company' do
        get :show, valid_params
        assigns(:company).should eql(@company)
      end
    end

    context 'With invalid params' do
      it 'Raise an error' do
        lambda { get :show, {:id => 0} }.should raise_error
      end
    end
  end

  describe '#edit' do

    context 'With valid params' do
      let(:valid_params){{:id => @company.id}}
      it 'Gets the company' do
        get :edit, valid_params
        assigns(:company).should eql(@company)
      end
    end

    context 'With invalid params' do
      it 'Raise an error' do
        lambda { get :edit, {:id => 0} }.should raise_error
      end
    end
  end

  describe '#update' do
    context 'Valid attribute params' do
      it 'redirects to company profile'
    end

    context 'Invalid attribute params' do
      it 'returns to editing the company data'
    end
  end
  describe '#destroy' do
    let(:valid_params){{:id => @company.id}}
    
    it 'Gets the company' do
      delete :destroy, valid_params
      assigns(:company).should eql(@company)
    end
    
    it 'Destroys the company' do
      lambda{ delete :destroy, valid_params }.should change(Company, :count).by(-1)
    end
    
    it 'Redirects to companies index' do
      delete :destroy, valid_params
      response.should redirect_to(companies_path)
    end

    it 'Renders a flash notice' do
      delete :destroy, valid_params
      flash[:notice].should_not be_blank
    end
  end
end
