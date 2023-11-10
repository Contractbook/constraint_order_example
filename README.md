To reproduce the issue run:

```shell
createdb constraint_order_example_dev

# passes
env MIX_ENV=test mix do ecto.drop + ecto.create + ecto.migrate + test

# fails
env MIX_ENV=test mix do ecto.migrate + ecto.dump + ecto.drop + ecto.create + ecto.load + test
```
