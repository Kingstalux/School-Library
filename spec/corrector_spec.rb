require_relative './spec_helper'

describe Corrector do
  context 'Capitalize only the first letter of the name and trim the length' do
    it 'trim and capitalize using the correct_name method' do
      correct = Corrector.new
      expect(correct.correct_name('jane')).to eq 'Jane'
    end

    it 'trim and capitalize using the correct_name method' do
      correct = Corrector.new
      expect(correct.correct_name('MatheMatically')).to eq 'Mathematic'
    end
  end
end
