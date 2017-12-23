class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    return "Transaction rejected. Please
check your account balance." if !valid?
    return if @status == "complete"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @amount = 0
  end
end
