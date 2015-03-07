require 'digest/sha2'

class Member < ActiveRecord::Base
    validates :Email, :presence => true, :uniqueness => true
    
    validates :FirstName, :presence => true
    validates :LastName, :presence => true
    
    validates :Address1, :presence => true
    validates :City, :presence => true
    validates :State, :presence => true
    validates :Zip, :presence => true
    
    

    validates :password, :confirmation => true
    attr_accessor :password_confirmation
    attr_reader :password
    
    validate :password_must_be_present
    
    def password=(password)
        @password = password

        if password.present?
            generate_salt
            self.Hashed_password = self.class.encrypt_password(password, self.Salt)
        end
    end
        
    def Member.authenticate(email, password)
       if member = find_by_Email(email) 
           if member.Hashed_password == encrypt_password(password, member.Salt)
               member
            end
        end
    end
        
    def Member.encrypt_password(password, salt)
        Digest::SHA2.hexdigest(password + "12%$23" + salt)
    end
    
        
    private
    
    def password_must_be_present
       errors.add(:password, "Missing password") unless self.Hashed_password.present? 
    end
    

    def generate_salt
        self.Salt = self.object_id.to_s + rand.to_s
    end
    
end