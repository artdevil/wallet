# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  let(:user) { create(:user) }
  subject { build(:withdraw, owner: user) }

  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount) }

  describe 'validates' do
    it 'will error if owner balance not sufficient' do
      subject.valid?

      expect(subject.errors[:base].first).to eq('owner balance not sufficient')
    end
  end

  describe 'create' do
    it 'will generate debit balance for owner' do
      # fill owner credit
      create(:balance_credit, amount: subject.amount, owner: user)
      
      expect(subject.save).to be_truthy
      expect(user.balances.debit.size).to eq(1)
    end
  end
end
