Please fork the project, add your solution for the task and make a pull request.
You may either leave the original code intact and add your solution in a separate
directory or completely rewrite everything.

Comments explaining your code, decisions and any relevant thoughts or concerns
are welcome.

Thank you!

# Github API Navigator

1. The class in question has an obvious duplication problem. What are possible
ways to remove duplication? What are the pros and cons of each solution?

2. Instances of the User class have the `followers` method that works inefficiently.
How would you refactor the method?

3. Create similar methods that would return the user's subscriptions, orgs, repos,
etc. Those methods must return instances of corresponding classes.

```ruby
user = User.from_username 'ststnk'
user.repos
# returns an array of Repo instances
user.followers[0].organizations
# returns an array of Organization instances
user.repos[0].assignees
# returns an array of User instances
# etc.
```

A couple of things to keep in mind:

- it should be possible to read all attributes that Github API returns
- what if Github updates their API to return more attributes or omit some existing ones?
