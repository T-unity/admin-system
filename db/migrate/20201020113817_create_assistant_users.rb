class CreateAssistantUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :assistant_users do |t|

      t.timestamps
    end
  end
end
