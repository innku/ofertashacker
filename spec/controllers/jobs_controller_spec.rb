require 'spec_helper'

describe JobsController do
  
  before do
    @company = Factory(:company)
    controller.stub(:current_company).and_return(@company)
    @job = Factory(:job, :company => @company)
  end
  
  describe '#new' do
    it 'Creates a new job variable' do
      get :new
      assigns(:job).should_not be_blank
    end
  end
  
  describe '#create' do
    it 'Gets the job' do 
      post :create
      assigns(:job).should_not be_blank
    end
    context 'With valid params' do
      let(:valid_params){{:job => Factory.attributes_for(:job)}}
      it 'Saves the job' do
        lambda { post :create, valid_params }.should change(Job, :count).by(1)
      end
      it 'Redirects to jobs path' do
        post :create, valid_params
        response.should redirect_to(jobs_path)
      end
      it 'Renders a flash notice for success' do
        post :create, valid_params
        flash[:notice].should_not be_blank
      end
    end
    context 'With invalid params' do
      let(:invalid_params){{ :job => Factory.attributes_for(:job).merge({:title => nil}) }}
      it 'Does not save the job' do
        lambda { post :create, invalid_params }.should_not change(Job, :count)        
      end
      it 'Renders new job template' do
        post :create, invalid_params
        response.should render_template('new')
      end
    end
  end
 
  describe '#index' do
    before do
      Job.delete_all
      9.times { Factory(:job, :company=> @company)}
      @jobs = Job.ordered[0..7]
      @older_job = Job.first
    end
    it 'Get the latests 8 jobs ordered and filtered' do
      get :index
      assigns(:jobs).should eql(@jobs)
    end
    
    it 'Does not get older jobs than the latests 8 jobs' do
      get :index
      assigns(:jobs).should_not include(@older_job)
    end
    context 'With an HTML response' do
      it 'Renders the index action' do
        get :index
        response.should render_template('index')
      end
    end
  end
  
  describe '#show' do
    context 'With valid params' do
      let(:valid_params){{ :id => @job.id}}
      it 'Gets the job' do
        get :show, valid_params
        assigns(:job).should eql(@job)
      end
    end
    
    context 'With invalid params' do
      let(:invalid_params) {{ :id => -1 }}
      it 'Does not get the job' do
        lambda { get :show, invalid_params }.should raise_error
      end
    end
  end
  
  describe '#update' do
    it 'Gets the job' do
      put :update, {:id => @job.id, :job => {}}
      assigns(:job).should eql(@job)
    end
    context 'With valid parametes' do
      let(:valid_params){{:id => @job.id, :job => {:title =>  'New Title', :city => 'New City'}}}

      context 'Without a required skills ids parameter' do
        it 'Job should not have any required skills' do
            put :update, valid_params
            assigns(:job).required_skills.should be_blank
        end
      end
      it 'Updates the job' do
        put :update, valid_params
        assigns(:job).title.should eql("New Title")
        assigns(:job).city.should eql("New City")
      end
      it 'Redirects to the job path' do
        put :update, valid_params
        response.should redirect_to(jobs_path)
      end
      it 'Renders a flash notice' do
        put :update, valid_params
        flash[:notice].should_not be_blank
      end
    end
    context 'With invalid parameters' do
      let(:invalid_params){{:id => @job.id, :job => Factory.attributes_for(:job, :title =>  nil, :city => 'New City')}}
      before do
        @job.update_attributes({:title => "Expected Title"})
      end

      it 'Does not updates the job' do
        put :update, invalid_params
        Job.last.title.should eql("Expected Title")
      end
      it 'Renders the new job template' do
        put :update, invalid_params
        response.should render_template('new')
      end
    end
  end
  
  describe '#edit' do
    context 'With valid params' do
      let(:valid_params){{ :id => @job.id}}
      it 'Gets the job' do
        get :edit, valid_params
        assigns(:job).should eql(@job)
      end
    end
    
    context 'With invalid params' do
      let(:invalid_params) {{ :id => -1 }}
      it 'Does not get the job' do
        lambda { get :edit, invalid_params }.should raise_error
      end
    end
  end 
  
  describe '#destroy' do
    let(:params){{:id => @job.id}}
    it 'Gets the job' do
      delete :destroy, params 
      assigns(:job).should eql(@job)
    end
    
    it 'Destroys the job' do
      lambda { delete :destroy, params }.should change(Job, :count).by(-1)
    end
    
    it 'Redirects to jobs path' do
      delete :destroy, params
      response.should redirect_to(jobs_path)
    end
    
    it 'Renders a flash notice for success' do
      delete :destroy, params
      flash[:notice].should_not be_blank
    end
  end

end
