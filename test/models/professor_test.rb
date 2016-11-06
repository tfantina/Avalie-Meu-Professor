require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  def setup
    @professor = Professor.new(fullname: "Full Name", school: "School", department: "department")
  end

  test "should be valid" do
    assert @professor.valid?
  end

  test "There must be a full name" do
    @professor.fullname = " "
    assert_not @professor.valid?
  end




end
