# This file was generated, do not modify it. # hide
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