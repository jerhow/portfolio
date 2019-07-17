class AddPostStatusToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :status, :integer, default: 0
    # ^^ NOTE: We manually added the 'default: 0' parameter
  end
end
