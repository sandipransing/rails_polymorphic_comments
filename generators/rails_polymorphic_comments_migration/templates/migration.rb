class CreatePolymorphicComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      
      # POLYMORPHIC COMMENTS
      
      # resource type can post, site, review, idea, etc
      t.references :resource, :polymorphic => true
      t.string :body
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end

  end

  def self.down
    drop_table :comments
  end
end