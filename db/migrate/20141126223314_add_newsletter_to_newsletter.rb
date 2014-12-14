class AddNewsletterToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :newsletter, :string
  end
end
