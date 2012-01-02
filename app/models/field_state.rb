class FieldState

  attr_reader :id

  def initialize(id)
    @id = id
  end

  A = FieldState.new "A"
  B = FieldState.new "B"
  C = FieldState.new "C"
  D = FieldState.new "D"
  X = FieldState.new "X"

  @@all_states = [A, B, C, D, X]

  def self.all_states
    @@all_states
  end

  def self.find name
     @@all_states.each do |state|
       if state.id == name
         return state
       end
     end
    X
  end

end