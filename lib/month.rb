class Month
  attr_reader :name, :id, :abbrev
  def initialize name, id, abbrev
    @name, @id, @abbrev = name, id, abbrev
  end

  MONTH = [
      Month.new("Januar", 1, "jan"),
      Month.new("Februar", 2, "feb"),
      Month.new("März", 3, "mar"),
      Month.new("April", 4, "apr"),
      Month.new("Mai", 5, "mei"),
      Month.new("Juni", 6, "jun"),
      Month.new("Juli", 7, "jul"),
      Month.new("August", 8, "aug"),
      Month.new("September", 9, "sep"),
      Month.new("Oktober", 10, "okt"),
      Month.new("November", 11, "nov"),
      Month.new("Dezember", 12, "dez"),
  ]

  def self.find name
    MONTH.each do |m|
      return m if m.name == name
    end
  end

end