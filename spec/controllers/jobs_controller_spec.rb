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
    context 'With a JSON response' do
      pending 
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
  
  describe '#update'
  
  describe '#edit'
  
  describe '#destroy'

end
