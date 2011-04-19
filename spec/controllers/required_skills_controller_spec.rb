require 'spec_helper'

describe RequiredSkillsController do

  describe '#index' do
    it 'Get the first 10 required skills'
    it 'Create a new required skill variable'
  end

  describe '#new' do
    it 'Creates a new required skill variable'
  end

  describe '#create' do
    context 'With valid params' do
      it 'Saves the required skill'
      it 'Redirects to the required skills path'
      it 'Renders a flash notice for success'
    end

    context 'With invalid params' do
      it 'Does not save the required skill'
      it 'Renders the new template'
    end
  end

  describe '#update' do
      it 'Gets the required skill'
    context 'With valid params' do
      it 'Updates required skill attributes'
      it 'Redirects to the required skill  path'  
      it 'Renders a flash notice for success'    
    end

    context 'With invalid params' do
      it 'Does not update the required skill'
      it 'Renders the new template'
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
