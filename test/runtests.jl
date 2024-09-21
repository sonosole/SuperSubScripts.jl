using Test
using SuperSubScripts

@testset begin    
    # normal case
    @test super(1234567890) == "¹²³⁴⁵⁶⁷⁸⁹⁰"
    @test sub(1234567890) == "₁₂₃₄₅₆₇₈₉₀"

    # case string
    @test super("1234567.890") == "¹²³⁴⁵⁶⁷.⁸⁹⁰"
    @test sub("1234567.890") == "₁₂₃₄₅₆₇.₈₉₀"
    
    # case with base kwarg
    @test super(5, base=2) == "¹⁰¹"
    @test sub(5, base=2) == "₁₀₁"
    @test super(UInt32(1500), base=16) == "⁵ᵈᶜ"
    @test sub(UInt32(153), base=11) == "₁₂ₐ"

    # case with float
    @test super(3.1415) == "³.¹⁴¹⁵"
    @test sub(3.1415) == "₃.₁₄₁₅"
end

