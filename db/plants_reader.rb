
require 'set'

class PlantsReader

  attr_reader :plants, :families

  def initialize
    @families = Set.new
    @plants = Set.new

  end

  def read_from_file
    file_path = "#{File.dirname(__FILE__)}/plants_families.csv"

    rows = IO.readlines(file_path)
    rows.shift
    rows.each do |row|
      row.chomp! #remove carriage return
      columns = row.split(/\t/)

      field_state = clean_from_quotation columns[0]
      energy = clean_from_quotation columns[1]
      family = clean_from_quotation columns[2]
      name = clean_from_quotation columns[3]
      family_entry = {name: family, energy: energy, field_state: field_state}
      @families << family_entry

      seed_from = evaluate_seed columns[4]
      seed_from_month = seed_from[0]
      seed_from_day = seed_from[1]
      seed_to = evaluate_seed columns[5]
      seed_to_month = seed_to[0]
      seed_to_day = seed_to[1]

      @plants << {name: name, family: family, seed_from_month: seed_from_month, seed_from_day: seed_from_day, seed_to_month: seed_to_month, seed_to_day: seed_to_day}
    end
  end

  private
  def clean_from_quotation str
    str ? str.tr('"', '') : nil
  end

  def evaluate_seed seed
    seeds = [nil, nil]
    if seed
      seed = clean_from_quotation seed
      if seed.nil?
      elsif seed.size == 1
        seeds = [seed, 1]
      elsif seed.size >= 3
        seeds = seed.split("_")
      end
    end

    seeds
  end

end
