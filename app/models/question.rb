class Question < ApplicationRecord
  require 'csv'
  belongs_to :role
  belongs_to :mapping

  def self.import
    CSV.open('db/sample_data.csv', :encoding => 'ISO-8859-1', headers: true) do |csv|
      csv.each do |row|
        t = Question.new
        t.question = row['Question']
        t.team_stage = row['Teaming Stages']
        t.appear = row['Appears'].to_i
        t.frequency = row['Frequency'].to_i
        t.question_type = row['Type']
        t.role = Role.find_or_initialize_by(name: row['Role'])
        t.is_required = row['Required?'] == 'Yes' ? true : false
        t.conditions = row['Conditions']
        t.mapping = Mapping.find_or_initialize_by(mapping_name: row['Mapping'])
        t.save    
      end 
    end
  end

end
