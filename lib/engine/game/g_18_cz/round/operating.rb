# frozen_string_literal: true

require_relative '../../../round/operating'

module Engine
  module Game
    module G18CZ
      module Round
        class Operating < Engine::Round::Operating
          def after_process(action)
            return super if @game.multiplayer?

            entity = @entities[@entity_index]
            puts @game.vraclavs_corporations.include?(entity)
            if @game.vraclavs_corporations.include?(entity)
                puts action
              case action
              when G18CZ::Step::Track
                puts "hi"
                token_player = @game.players.reject { |item| item == @game.vraclav }[0]
                entity.owner = token_player
                # process_action(Engine::Action::Dividend.new(entity, kind: 'withhold')) if action.routes.any?
              end
            end
            super
          end
        end
      end
    end
  end
end
