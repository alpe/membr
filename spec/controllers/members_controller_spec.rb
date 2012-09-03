require 'spec_helper'

describe MembersController do

  let(:valid_member_params) {{
    :name => "Dania",
    :ic_number => "123",
    :doj => "30/01/1970",
    :phone => "9999",
    :donation => 20,
    :doj => "30/01/1970",
    "family_members_attributes" => {
      "0"=>{"name"=>"Mustafa"},
    }
  }}
  let (:valid_addr_params) {{
    :line1 => "Foo St"
  }}

  describe "POST create" do
    def do_create_with_member_params(params)
      post :create, { 
        :member => params,
        :address => valid_addr_params
      }
    end

    it "ignores blank family member fields" do
      do_create_with_member_params valid_member_params.merge({
        "family_members_attributes" => {
          "0"=>{"name"=>"Mustafa"},
          "1"=>{"name"=>""},
          "2"=>{"name"=>""},
        },
      })

      family_members = assigns(:member).family_members
      family_members.count.should  == 1
      family_members.first.name.should == "Mustafa"
    end
  end
end
