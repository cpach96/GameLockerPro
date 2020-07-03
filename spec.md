Requirements for project

1. Have atleast one has_many and belongs_to and atleast two has_many :through relationships.

2. Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

3. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

4. You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

5. Your application must provide standard user authentication, including signup, login, logout, and passwords.

6. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

7. You must include and make use of a nested resource with the appropriate RESTful URLs.

8. You must include a nested new route with form that relates to the parent resource

9. You must include a nested index or show route

10. Your forms should correctly display validation errors.

11. Your fields should be enclosed within a fields_with_errors class

12. Error messages describing the validation failures must be present within the view.

13. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

Logic present in your controllers should be encapsulated as methods in your models.

Your views should use helper methods and partials when appropriate.




