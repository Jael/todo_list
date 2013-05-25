require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context "when user has not signed in" do
    subject {Ability.new nil}
    it { should be_able_to(:home, Task)}
  end
end
