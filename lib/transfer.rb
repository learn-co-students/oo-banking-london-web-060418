class Transfer
  attr_accessor :sender, :receiver, :amount

    def initialize(sender,receiver, status='pending',amount)
      @sender = sender
      @receiver=receiver
      @status='pending'
      @amount=amount
    end

    def status
      @status
    end

    def status=(status)
      @status=status
    end

    def valid?()
      sender.valid? && receiver.valid?
    end

    def execute_transaction

      if self.status == 'pending' && self.valid? && sender.balance > amount
        sender.balance = sender.balance- amount
        receiver.balance = receiver.balance + amount
        self.status= 'complete'
      else
        self.status= 'rejected'
        return "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
  if valid? && receiver.balance > amount && self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    self.status = "reversed"
  else
    reject_transfer
  end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
