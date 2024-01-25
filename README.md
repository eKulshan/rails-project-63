![](https://github.com/eKulshan/rails-project-63/actions/workflows/main.yml/badge.svg)
# HexletCode
**Form generator - DSL, brings you form with breeze.**




## Examples

### Create form from any Struct object.

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
end
```
Produces:
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
</form>
```

### Define form action passing url parameter: 
```ruby
HexletCode.form_for user, url: '/users'
```
Produces:
```html
<form action="/users" method="post"></form>
```
### Pass additional attributes for input
```ruby
HexletCode.form_for @user do |f|
  f.input :name, class: "user-input"
  f.input :job
end
```
Produces:
```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob" class="user-input">
  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet">
</form>
```

### Add submit to form
```ruby
HexletCode.form_for @user do |f|
      f.submit "Send"
    end
```
Produces:
```html
<form action="#" method="post">
  <input type="submit" value="Send">
</form>
```

### Creating input for Struct missing field will raise NoMethodError
```ruby
HexletCode.form_for @user do |f|
      f.input :age
    end
```
Produces:
```# =>  `public_send': undefined method `age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)```
