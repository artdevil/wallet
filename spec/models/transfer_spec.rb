# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  let(:source) { create(:user) }
  let(:target) { create(:team) }
  subject { build(:transfer, source: source, target: target) }

  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_numericality_of(:amount) }

  describe 'validates' do
    it 'will error if source balance not sufficient' do
      subject.valid?

      expect(subject.errors[:base].first).to eq('source balance not sufficient')
    end
  end

  describe 'create' do
    it 'will generate debit balance for source and credit balance for target' do
      # fill source credit
      create(:balance_credit, amount: subject.amount, owner: source)

      expect(subject.save).to be_truthy
      expect(source.balances.debit.size).to eq(1)
      expect(target.balances.credit.size).to eq(1)
    end
  end
end
