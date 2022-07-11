class CreateMedicalHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_histories do |t|
      t.references :user, null: false
      t.boolean :in_treatment, null: false
      t.date :when_onset, null: false
      t.string :disease_name, null: false
      t.timestamps
    end
  end
end
