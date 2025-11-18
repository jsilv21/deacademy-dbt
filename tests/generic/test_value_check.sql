{% test value_check(model, column_name)%}

-- check for values <10k will fail
SELECT * FROM {{model}}
WHERE {{ column_name }} < 10000

{% endtest %}

