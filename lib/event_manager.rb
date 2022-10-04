class EventManager

  def handlers() = @handlers ||= []

  def subscribe(handler)
    handlers << handler
  end

  def unsubscribe(handler)
    handlers.delete handler
  end

  def broadcast(*args)
    handlers.each { |handler| handler.call(*args) }
  end
end
