# frozen_string_literal: true

RSpec.describe GetEnv do
  before(:all) do
    ENV['SOME_STRING'] = 'foo'
    ENV['SOME_INT'] = '1'
    ENV['SOME_FLOAT'] = '1.23'
    ENV['SOME_TRUE'] = 'true'
    ENV['SOME_FALSE'] = 'false'
  end

  it "has a version number" do
    expect(GetEnv::VERSION).not_to be nil
  end

  describe '#[]' do
    it 'handles nil' do
      expect(GetEnv[nil]).to eq(nil)
    end

    it 'handles missing value' do
      expect(GetEnv['klfadjslfkadjsflkadjs']).to eq(nil)
    end

    it 'returns strings' do
      expect(GetEnv['SOME_STRING']).to eq('foo')
    end

    it 'casts ints' do
      expect(GetEnv['SOME_INT']).to eq(1)
    end

    it 'casts floats' do
      expect(GetEnv['SOME_FLOAT']).to eq(1.23)
    end

    it 'casts bools' do
      expect(GetEnv['SOME_TRUE']).to be(true)
      expect(GetEnv['SOME_FALSE']).to be(false)
    end
  end

  describe '#fetch' do
    it 'casts types' do
      expect(GetEnv.fetch('SOME_FLOAT')).to eq(1.23)
    end

    it 'returns the value when found' do
      expect(GetEnv.fetch('SOME_FLOAT', 3.21)).to eq(1.23)
    end

    it 'returns the defaults when not found' do
      expect(GetEnv.fetch('SOME_NON_EXISTANT_FLOAT', 3.21)).to eq(3.21)
    end

    it 'raises an exception if not found and no default is specified' do
      expect do
        GetEnv.fetch('SOME_NON_EXISTANT_FLOAT')
      end.to raise_error KeyError, /key not found: "SOME_NON_EXISTANT_FLOAT"/
    end

    it 'accepts a block for the default value' do
      v = GetEnv.fetch('SOME_NON_EXISTANT_FLOAT') { 3.21 }
      expect(v).to eq(3.21)
    end
  end
end
