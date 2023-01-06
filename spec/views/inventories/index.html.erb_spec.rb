require 'rails_helper'

RSpec.describe 'inventories/index', type: :view do
  before(:each) do
    assign(:inventories, [
             Inventory.create!(
               name: 'Name',
               description: 'MyText',
               User: nil
             ),
             Inventory.create!(
               name: 'Name',
               description: 'MyText',
               User: nil
             )
           ])
  end

  it 'renders a list of inventories' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
