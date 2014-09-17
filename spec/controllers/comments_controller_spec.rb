require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do



  describe "#destroy" do



    it "destroy the appropriate comment" do
      #Setup
      Comment.create
      #Execution Phase
      delete :destroy

      #
      #Validaiton Phase
      Comment.count.should == 0
      #
      #
      #Cleanup Phase

    end
  end
end




