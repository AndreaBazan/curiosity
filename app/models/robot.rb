# Models the Robor behavior for the game
class Robot
  FACINGS = %i[north east south west]
  attr_reader :position, :facing, :errors, :movements
  def initialize(attr = {})
    @position  = attr[:position]  || [1, 1]
    @board     = attr[:board]     || Board.new
    @facing    = attr[:facing]    || :south
    @errors    = attr[:errors]    || {}
    @movements = attr[:movements] || []
    @success   = false
  end

  def move(executions = 1)
    succesful_moves_count = 0
    executions.times do
      break if errors.any?

      execute_move
      succesful_moves_count += 1
    end
    save_action(succesful_moves_count, __method__)
    self
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s =~ /turn_(.*)/
      valid_directions = %w[left right]
      direction = Regexp.last_match(1)
      return turn(direction) if valid_directions.include?(direction)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private)
    valid_directions = %w[left right]
    method_name.to_s =~ /turn_(.*)/ && valid_directions.include?(Regexp.last_match(1)) || super
  end

  def inspect
    if errors.any?
      errors
    else
      @board.print_with_robot_at(@position, character_facing)
    end
  end

  def execute(actions)
    actions.each do |action|
      send(action.type, action.executions)
    end
    self
  end

  def has_errors?
    errors.any?
  end

  def successful?
    !errors.any? && @success
  end

  private

  def character_facing
    facing_table = Hash.new('R ')
    facing_table.merge!(north: '▲ ', south: '▼ ', east: '▶ ', west: '◀ ')
    facing_table[@facing]
  end

  def execute_move
    move_to(@facing)
    square = @board.square_at(@position)
    errors.merge!(square.error) if square.failure?
  end

  def turn(side)
    return if errors.any?

    operator = { left: -1, right: 1 }
    current_facing_index = FACINGS.index(@facing)
    new_facing_index = (current_facing_index + operator[side.to_sym]) % 4
    @facing = FACINGS[new_facing_index]
    save_action(1, "turn_#{side}".to_sym)
    self
  end

  def move_to(direction)
    facing_index = { north: 1, south: 1, west: 0, east: 0 }
    facing_operator = { north: -1, west: -1, south: 1, east: 1 }
    @position[facing_index[direction]] += facing_operator[direction]
  end

  def save_action(executions, action_type)
    return if action_type != :move
    direction_table = {
      north: 'up',
      south: 'down',
      east: 'right',
      west: 'left'
    }
    action_type = direction_table[@facing] if action_type == :move
    movement = OpenStruct.new(type: action_type, executions: executions)
    @movements << movement
  end
end
