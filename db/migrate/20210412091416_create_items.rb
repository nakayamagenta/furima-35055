class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product        , null: false
      t.integer    :category_id    , null: false
      t.integer    :price          , null: false
      t.integer    :condiction_id  , null: false
      t.integer    :shipping_chager_id     , null: false
      t.integer    :shipping_area_id       , null: false
      t.integer    :shipping_day_id        , null: false
      t.text       :explanation            , null: false
      t.references    :user    , null: false, foreign_key: true
      t.timestamps
    end
  end
end
