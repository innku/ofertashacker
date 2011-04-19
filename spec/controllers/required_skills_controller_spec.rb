require 'spec_helper'

describe RequiredSkillsController do
  
  before do
    @rs = Factory(:required_skill)
    @company = Factory(:company, :role => 'admin')
    controller.stub(:current_company).and_return(@company)
  end

  describe '#index' do
    it 'Get the first 10 required skills'
    it 'Create a new required skill variable'
  end

  describe '#new' do
    it 'Creates a new required skill variable'
  end

  describe '#create' do
    
    it 'Create a required skill variable' do
      post :create
      assigns(:required_skill).should_not be_blank
    end
    context 'With valid params' do
      let(:valid_params){{:required_skill => {:skill_name => 'AJAX'}}}
      it 'Saves the required skill' do
        lambda { post :create, valid_params }.should change(RequiredSkill, :count).by(1)
      end
      it 'Redirects to the required skills path' do
        post :create, valid_params
        response.should redirect_to(required_skills_path)
      end
      it 'Renders a flash notice for success' do
        post :create, valid_params
        flash[:notice].should_not be_blank
      end
    end

    context 'With invalid params' do
      let(:invalid_params){{:required_skill => {:skill_name => @rs.skill_name}}}
      it 'Does not save the required skill' do
        lambda { post :create, invalid_params }.should_not change(RequiredSkill, :count)
      end
      it 'Renders the new template' do
        post :create, invalid_params
        response.should render_template('new')
      end
    end
  end

  describe '#update' do

      it 'Gets the required skill' do
        put :update, {:id => @rs.id}
        assigns(:required_skill).should eql(@rs)
      end
    context 'With valid params' do
      let(:valid_params){{:id => @rs.id, :required_skill =>{:skill_name => 'New Skill Name'}}}
      
      it 'Updates required skill attributes' do
        put :update, valid_params
        assigns(:required_skill).skill_name.should eql('New Skill Name')
      end
      
      it 'Redirects to the required skill path' do
        put :update, valid_params
        response.should redirect_to(required_skill_path(@rs))
      end
      
      it 'Renders a flash notice for success' do
        put :update, valid_params
        flash[:notice].should_not be_blank
      end
    end

    context 'With invalid params' do
      let(:invalid_params){{:id => @rs.id, :required_skill => {:skill_name => nil}}}
      it 'Does not update the required skill' do
        put :update, invalid_params
        RequiredSkill.last.skill_name.should eql(@rs.skill_name)
      end
      it 'Renders the new template' do
        put :update, invalid_params
        response.should render_template('new')
      end
    end
  end

  describe '#destroy' do
    it 'Gets the required skill'
    it 'Destroys the required skill'
    context 'With an HTML request' do
      it 'Redirects to the required skills path'
      it 'Renders a flash notice for success in deleting the skill'
    end
    context 'With an XML request' do
      it 'pending'
    end
  end

  describe '#edit' do
    context 'With valid params' do
      it 'Gets the required skill'
    end
    context 'With invalid params' do
      it 'Does no get the required skill'
    end
  end

end
