require 'spec_helper'

describe RequiredSkillsController do
  
  describe '#new' do
    
    context 'Valid params' do
      it 'Gets all the skill categories'
    end
    
    context 'Invalid params' do
      it 'Does not get all the skill categories'
    end
  end
    
  describe '#create' do
  
    context 'Valid params' do
      it 'finds the skill category to create the required skill in'
      it 'redirects to the skill category path'
      it 'renders a flash notice for success'
    end
    
    context 'Invalid params' do
      it 'does not find an existing skill category'
      it 'redirects to new skill category'
    end
  end
  
  describe '#index'
  
  describe '#update' do
    context 'Valid params' do
      it 'finds the skill category of the required skill'
      it 'redirects to the skill category path'  
      it 'renders a flash notice for success'    
    end
    
    context 'Invalid params' do
      it 'does not find an existing skill category'
      it 'redirects to new skill category'
    end
  end
  
  describe '#edit' do
    context 'Valid params' do
      it 'Gets all the skill categories'
      it 'finds a skill category by an id'
    end
  end
  
  describe '#destroy' do
    context 'Valid params' do
      it 'finds a skill category by an id'
      it 'destroys the required skill'
      it 'redirects to the skill category of the destroyed required skill'
      it 'rends a flash notice for success in deleting the skill'
    end
    
  end

end
