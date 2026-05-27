{%- set all_passed = (results_table | selectattr("passed") | length) == (results_table | length) %}

{%- if all_passed %}

## ステップ {{ step_number }} - 合格

{%- else %}

## ステップ {{ step_number }} - 未完了

いくつかの確認項目がまだ完了していません。下の結果を確認して、もう一度試してください。

{%- endif %}

| 状態 | 確認項目 |
| ---- | ---- |

{%- for row in results_table %}
| {% if row.passed -%}合格{%- else -%}未完了{%- endif %} | {{ row.description }} |
{%- endfor %}

{%- if tips and tips.length %}

### ヒント

{%- for tip in tips %}

- {{ tip }}
{%- endfor %}

{%- endif %}
