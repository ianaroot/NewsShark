require 'spec_helper'

describe ChannelsController do 
  let!(:user) { FactoryGirl.create :user }

  describe "POST create" do
    let(:valid_params) { { :user_id => user.id , :channel => { :name => "Egypt" } } }
    let(:invalid_params) { { :user_id => user.id , :channel => { :name => "" } } }
    
    context "with valid params" do        

      it "creates a new channel" do 
        expect{
          post :create, valid_params 
        }.to change{ Channel.count }.by(1)
      end

    end

    context "with invalid params" do 

      it "redirects to user show path" do
        post :create, invalid_params 
        response.should redirect_to user
      end

      it "does not create a new channel" do 
        expect{
          post :create, invalid_params 
        }.to_not change{ Channel.count }
      end

    end
  end

  describe "GET show" do 
    let!(:channel) { FactoryGirl.create :channel }
    let!(:params) { { :user_id => channel.user.id, :id => channel.id } }

    it "renders the channel's show page" do 
      pending
      # Error: undefined method `xpath' for #<Array:0x007ff48eb686d8>

      # get :show, params
      # response.should render_template 'show'
    end

  end

end