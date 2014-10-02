class PostPolicy < ApplicationPolicy
   def index?
     true
   end

   def destroy?
     user.present? && (record.user == user || user.role?(:moderator) || user.role?(:admin))
   end
end
