"""
    super(n::Union{Real,String}) :: String
Convert number or string to superscript

!!! warning
    not all the alphabet are supported.
    
# Example
```julia
julia> "X" * super(321)
"X³²¹"

julia> super(5, base=2)
"¹⁰¹"

julia> "Y" * super("321")
"Y³²¹"

julia> super("abcdefghijklmnopqrstuvwxyz")
"ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖqʳˢᵗᵘᵛʷˣʸᶻ"

julia> super("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
"ᴬᴮCᴰᴱFᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾQᴿSᵀᵁⱽᵂXYZ"

julia> super("0123456789")
"⁰¹²³⁴⁵⁶⁷⁸⁹"
```
"""
function super(x::AbstractFloat)
    s = ""
    for k ∈ string(x)
        s *= if haskey(SUP, k)
            SUP[k]
        else
            k
        end
    end
    return s
end


function super(x::Integer; base::Int=10)
    s = ""
    for k ∈ string(x;base)
        s *= SUP[k]
    end
    return s
end


function super(x::AbstractString)
    s = ""
    for k ∈ x
        s *= if haskey(SUP, k)
            SUP[k]
        else
            k
        end
    end
    return s
end

