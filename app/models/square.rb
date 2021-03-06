# Models the squares that compose a board
class Square
  RESULT_TABLE = {
    robot:   { state: :success, appearance: '◻ ' },
    empty:   { state: :success, appearance: '◻ ' },
    hole:    { state: :failed, appearance: '◼ ', error: { felt: 'Oops, Curioso se cayó dentro del hoyo.' } },
    oob:     { state: :failed, appearance: '○ ', error: { oob: 'Oops, Curioso se chocó contra la pared.' } },
    wall:    { state: :failed, appearance: '○ ', error: { crashed: 'Oops, Curioso se chocó contra la pared.' } },
    finish:  { state: :goal, appearance: '○ ' }
  }

  attr_reader :state
  def initialize(state = :empty)
    @state = state
  end

  def result
    RESULT_TABLE[@state]
  end

  def error
    RESULT_TABLE[@state]&.fetch(:error, nil)
  end

  def goal?
    RESULT_TABLE[@state]&.fetch(:state, nil) == :goal
  end

  def failure?
    RESULT_TABLE[@state]&.fetch(:state, nil) == :failed
  end

  def to_s
    RESULT_TABLE[@state]&.fetch(:appearance, nil)
  end

  RESULT_TABLE.each do |state, _|
    define_singleton_method(state) do
      Square.new(state)
    end
  end
end
