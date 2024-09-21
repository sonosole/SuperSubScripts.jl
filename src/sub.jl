"""
    sub(n::Union{Real,String}) :: String
Convert number or string to subscript

!!! warning
    not all the alphabet are supported.
    
# Example
```julia
julia> "X" * sub(321)
"X₃₂₁"

julia> "X" * sub(5, base=2)
"X₁₀₁"

julia> "Y" * sub("321")
"Y₃₂₁"

julia> sub("abcdefghijklmnopqrstuvwxyz")
"ₐbcdₑfgₕᵢⱼₖₗₘₙₒₚqᵣₛₜᵤᵥwₓyz"

julia> sub("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"

julia> sub("0123456789")
"₀₁₂₃₄₅₆₇₈₉"
```
"""
function sub(x::AbstractFloat)
    s = ""
    for k ∈ string(x)
        s *= if haskey(SUB, k)
            SUB[k]
        else
            k
        end
    end
    return s
end


function sub(x::Integer; base::Int=10)
    @assert base < 12 "base ≥ 12 not supported"
    s = ""
    for k ∈ string(x;base)
        s *= SUB[k]
    end
    return s
end


function sub(x::AbstractString)
    s = ""
    for k ∈ x
        s *= if haskey(SUB, k)
            SUB[k]
        else
            k
        end
    end
    return s
end

