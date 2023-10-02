# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deposit, type: :model do
  subject { FactoryBot.create :deposit }

  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount) }

  describe 'create' do
    it 'will generate debit balance for owner' do
      owner = subject.owner
      
      expect(owner.balances.debit.size).to eq(1)
    end
  end
end
