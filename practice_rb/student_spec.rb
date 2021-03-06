$LOAD_PATH << "."
require 'student'
RSpec.describe Student do

    it 'creates a student class' do
        student = Student.new
        expect(student).to be_kind_of(Student)
    end

    it 'studies' do
        student = Student.new
        expect(student).to respond_to(:study)
    end

    it 'notes' do
        student = Student.new
        expect(student).to respond_to(:note)
    end

    it 'responds positively to the study message' do
        student = Student.new
        expect(student.study).to eq "Yes, I am studying"
    end
end