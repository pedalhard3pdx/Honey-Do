require 'spec_helper'

describe "Lists" do
  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      it "should not make a new list" do
        lambda do
          visit root_path
          fill_in :list_list_name, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector('div.flash.error')
        end.should_not change(List, :count)
      end
    end

    describe "success" do

      it "should make a new list" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :list_list_name, :with => content
          click_button
          response.should have_selector('div.flash.success')
        end.should change(List, :count).by(1)
      end
    end
  end
end
