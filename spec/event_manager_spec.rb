require './lib/event_manager.rb'
require 'pry'

describe EventManager do
  let(:manager) { EventManager.new }
  let(:array) { [] }
  let(:event) { proc { |test| array << test } }

  # A block that adds each argument in to an array
  let(:add_to_array) { proc { |*args| args.each { |arg| array << arg } } }

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

      expect(manager.handlers).to match_array([])
    end
  end

  describe '.broadcast' do
    it 'should broadcast an event with no arguments' do
      manager.subscribe add_to_array
      manager.broadcast()

      expect(array).to match_array([])
    end
    it 'should broadcast an event with one argument' do
      manager.subscribe add_to_array
      manager.broadcast('element1')

      expect(array[0]).to eq('element1')
    end
    it 'should broadcast an event with two arguments' do
      manager.subscribe add_to_array
      manager.broadcast('element1', 'element2')

      expect(array[0]).to eq('element1')
      expect(array[1]).to eq('element2')
    end
  end

end