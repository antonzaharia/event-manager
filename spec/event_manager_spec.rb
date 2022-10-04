require './lib/event_manager.rb'
require 'pry'

describe EventManager do
  let(:manager) { EventManager.new }
  let(:array) { [] }
  let(:event) { proc { |test| array << test } }

  describe '.subscribe' do
    it 'should add a new handler' do
      manager.subscribe event

      expect(manager.handlers.size).to eq(1)
    end
  end

  describe '.unsubscribe' do
    it 'should remove the handler' do
      manager.subscribe event
      manager.unsubscribe event

      expect(manager.handlers.size).to eq(0)
    end
  end

  describe '.broadcast' do
    it 'should broadcast an event with no arguments' do
      expect(true).to eq(false)
    end
    it 'should broadcast an event with one argument' do
      expect(true).to eq(false)
    end
    it 'should broadcast an event with two arguments' do
      expect(true).to eq(false)
    end
  end

end