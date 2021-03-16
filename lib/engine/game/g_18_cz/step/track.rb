# frozen_string_literal: true

require_relative '../../../step/tracker'
require_relative '../../../step/track'

module Engine
  module Game
    module G18CZ
      module Step
        class Track < Engine::Step::Track
          def process_lay_tile(action)
            return super if action.entity.owner != @game.vraclav

            lay_tile_action(action, spender: @game.bank)
            pass! unless can_lay_tile?(action.entity)
          end
        end
      end
    end
  end
end
