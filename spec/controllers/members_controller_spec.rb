require 'spec_helper'

describe MembersController do

  let(:valid_attributes) {{
    "doj" => "30/01/1970",
  }}

  describe "POST create" do
    it "ignores blank family member fields" do
      post :create, { :member => valid_attributes.merge({
        "family_members_attributes" => {
          "0"=>{"name"=>"Mustafa"},
          "1"=>{"name"=>""},
          "2"=>{"name"=>""},
        }
      })}

      family_members = assigns(:member).family_members
      family_members.count.should  == 1
      family_members.first.name.should == "Mustafa"
    end
  end
end
