# Knapsack Example

| Items   |  1   |   2   |  3   |   4    |   5   |   6   |
| :--:    | :--: | :--:  | :--: | :---:  | :---: | :---: |
| Utility | 8    |   7   | 9    |   12   |   10  |  7    |
| Weights | 10   |  15   |  12  |   11   |   10  |  5    |

The capacity of the knapsack is 22 kgs.

$$
\begin{aligned}
\max z = & 8x_1 + 7x_2 + 9x_3 + 12x_4 + 10x_5 + 7x_6\\
\text{Subject to:} & \\
& 10x_1 + 15x_2 + 12x_3 + 11x_4 + 10x_5 + 5x_6 \le 22 \\
& x_i \in \{0, 1\} \\
& i = 1, 2, \ldots, 6 \\
\end{aligned}
$$



```julia:./code/knapsack1
using JuMP, HiGHS

model = Model(HiGHS.Optimizer)

set_silent(model)

utilities = [8, 7, 9, 12, 10, 7]
weights = [10, 15, 12, 11, 10, 5]

@variable(model, x[1:6], Bin)

@objective(model, Max, sum(utilities .* x))

@constraint(model, sum(weights .* x) <= 22)

optimize!(model)

println("Decision variables: ", value.(x))
println("Maximum utility: ", objective_value(model))

```


\output{./code/knapsack1}


