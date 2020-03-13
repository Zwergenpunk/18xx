# frozen_string_literal: true

require 'engine/corporation/base'
require 'engine/spender'

module Engine
  class SharePool
    attr_reader :corporations, :shares

    def initialize(corporations, bank)
      @corporations = corporations
      @bank = bank
      @shares = []
    end

    def buy_share(entity, share)
      share.corporation.ipoed = true
      transfer_share(entity, share, entity, @bank)
    end

    def sell_share(share)
      transfer_share(self, share, @bank, share.owner)
    end

    private

    def transfer_share(to_entity, share, spender, receiver)
      owner = share.owner
      owner.shares.delete(share)

      spender.spend(share.price, receiver)

      to_entity.shares << share
      share.owner = to_entity
      share.corporation.owner = to_entity if share.president
    end
  end
end
