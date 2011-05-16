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

    it 'Gets the company' do
      put :update, {:id => @company.id }
      assigns(:company).should eql(@company)
    end
    
    context 'Valid attribute params' do
      let(:valid_params){{:id => @company.id, :company => {:title => 'Sample Company', :city => 'Mty'}}}
      it 'Updates company attributes' do
        put :update, valid_params
        assigns(:company).title.should eql('Sample Company')
        assigns(:company).city.should eql('Mty')
      end

      it 'Redirects to company profile' do
        put :update, valid_params
        response.should redirect_to(company_path(@company))
      end
      
      it 'Renders a flash notice for success' do
        put :update, valid_params
        flash[:notice].should_not be_blank        
      end
    end
    
    context 'Invalid attribute params' do
      let(:invalid_params){{:id => @company.id, :company => {:title => nil}}}
      it 'Renders edit template' do
        put :update, invalid_params
        response.should render_template('edit')
      end
    end
  end
  
  describe '#destroy' do
    before do
      @company.update_attribute('role', 'admin')
    end
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
