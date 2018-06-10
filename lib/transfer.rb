class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(person_1, person_2, amount)
    @sender = person_1
    @receiver = person_2
    @status = "pending"
    @amount = amount
  end

  def valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if(valid? && @status == "pending" && @sender.balance >= @amount)
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if(@status == "complete")
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
