# Models the squares that compose a board
class Square
  RESULT_TABLE = {
    robot:   { state: :success, appearance: '◻ ' },
    empty:   { state: :success, appearance: '◻ ' },
    hole:    { state: :failed, appearance: '◼ ', error: { felt: 'Curiosity felt into a hole.' } },
    oob:     { state: :failed, appearance: '○ ', error: { oob: 'Curiosity crashed into a wall.' } },
    wall:    { state: :failed, appearance: '○ ', error: { crashed: 'Curiosity crashed into a wall.' } },
    target:  { state: :finished, appearance: '○ ' }
  }

  attr_reader :state
  def initialize(state = :empty)
    @state = state
  end

  def result
    RESULT_TABLE[@state]
  end

  def error
    RESULT_TABLE[@state][:error]
  end

  def failure?
    RESULT_TABLE[@state][:state] == :failed
  end

  def to_s
    RESULT_TABLE[@state].fetch(:appearance, nil)
  end

  RESULT_TABLE.each do |state, _|
    define_singleton_method(state) do
      Square.new(state)
    end
  end
end
