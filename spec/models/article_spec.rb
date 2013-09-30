require 'spec_helper'
describe Article do
  it { should belong_to :channel }
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }

  context "#set_keywords" do 
    let(:article) { FactoryGirl.create :article }

    it "sets keywords" do 
      expect{
        article.set_keywords
      }.to change { article.keywords } 
    end
  end
end
