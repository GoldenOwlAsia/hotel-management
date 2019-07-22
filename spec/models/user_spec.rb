require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates user email' do
    context 'valid' do
      let(:user) { build(:user, email: 'thanhtruong1216@gmail.com') }
      it 'email is not nil' do
        expect(user).to be_valid
      end
      it 'email is following the format' do
        expect(user).to be_valid
      end
    end
    context 'invalid' do
      let(:user_email_invalid) { build(:user, email: 'thanhtruong*gmail.com') }
      let(:user_email_nil) { build(:user, email: nil) }
      it 'email is not following the format' do
        expect(user_email_invalid).not_to be_valid
      end
      it 'email is nil' do
        expect(user_email_nil).not_to be_valid
      end
    end
  end

  describe 'validates user name' do
    context 'valid' do
      let(:user) { build(:user, user_name: 'Pikachu') }
      it 'user name is not nil' do
        expect(user).to be_valid
      end
      it 'length of user name is less than or equal to 30' do
        expect(user).to be_valid
      end
    end

    context 'invalid' do
      let(:user_name_nil) { build(:user, user_name: nil) }
      let(:user_name_too_long) { build(:user, user_name: SecureRandom.alphanumeric(31)) }
      it 'user name is nil' do
        expect(user_name_nil).not_to be_valid
      end
      it 'user name is greater than 30' do
        expect(user_name_too_long).not_to be_valid
      end
    end
  end

  describe 'validates first name' do
    context 'valid' do
      let(:user) { build(:user, first_name: SecureRandom.alphanumeric(29)) }
      it 'first name is not nil' do
        expect(user).to be_valid
      end
      it 'expect length of first name is less than or equal 30' do
        expect(user).to be_valid
      end
    end
    context 'invalid' do
      let(:user_first_name_nil) { build(:user, first_name: nil) }
      let(:user_first_name_too_long) { build(:user, first_name: SecureRandom.alphanumeric(31)) }
      it 'first name is nil' do
        expect(user_first_name_nil).not_to be_valid
      end
      it 'first name is too long' do
        expect(user_first_name_too_long).not_to be_valid
      end
    end
  end

  describe 'validates last name' do
    context 'valid' do
      let(:user) { build(:user, last_name: 'Truong') }
      it 'last name is not nil' do
        expect(user).to be_valid
      end
      it 'last name is less than or equal to 30' do
        expect(user).to be_valid
      end
    end
    context 'invalid' do
      let(:user_last_name_nil) { build(:user, last_name: nil) }
      let(:user_last_name_too_long) { build(:user, last_name: SecureRandom.alphanumeric(31)) }
      it 'last name is nil' do
        expect(user_last_name_nil).not_to be_valid
      end
      it 'last name is greater than 30' do
        expect(user_last_name_too_long).not_to be_valid
      end
    end
  end

end
