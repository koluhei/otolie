class AddCreatorimageToCreators < ActiveRecord::Migration[6.0]
  def change
    add_column :creators, :image, :string
  end
end
