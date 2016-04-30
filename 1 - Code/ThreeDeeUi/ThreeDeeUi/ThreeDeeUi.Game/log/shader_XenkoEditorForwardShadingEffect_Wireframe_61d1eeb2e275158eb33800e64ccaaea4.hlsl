/**************************
***** Compiler Parameters *****
***************************
@P EffectName: XenkoEditorForwardShadingEffect.Wireframe
@P   - Material.PixelStageSurfaceShaders: mixin MaterialSurfaceArray [{layers = [mixin MaterialSurfaceDiffuse [{diffuseMap = ComputeColorConstantColorLink<Material.DiffuseValue>}], mixin MaterialSurfaceGlossinessMap<false> [{glossinessMap = ComputeColorConstantFloatLink<Material.GlossinessValue>}], mixin MaterialSurfaceMetalness [{metalnessMap = ComputeColorConstantFloatLink<Material.MetalnessValue>}], mixin MaterialSurfaceLightingAndShading [{surfaces = [MaterialSurfaceShadingDiffuseLambert<false>, mixin MaterialSurfaceShadingSpecularMicrofacet [{fresnelFunction = MaterialSpecularMicrofacetFresnelSchlick}, {geometricShadowingFunction = MaterialSpecularMicrofacetVisibilitySmithSchlickGGX}, {normalDistributionFunction = MaterialSpecularMicrofacetNormalDistributionGGX}]]}]]}]
@P Material.PixelStageStreamInitializer: mixin MaterialStream, MaterialPixelShadingStream
@P Lighting.DirectLightGroups: mixin LightDirectionalGroup<8>, ShadowMapReceiverDirectional<4,8,false,true,false>, ShadowMapFilterPcf<5>
@P Lighting.EnvironmentLights: 
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerView [Size: 352]
@C    View_id22 => Transformation.View
@C    ViewInverse_id23 => Transformation.ViewInverse
@C    Projection_id24 => Transformation.Projection
@C    ProjectionInverse_id25 => Transformation.ProjectionInverse
@C    ViewProjection_id26 => Transformation.ViewProjection
@C    ProjScreenRay_id27 => Transformation.ProjScreenRay
@C    Eye_id28 => Transformation.Eye
cbuffer PerDraw [Size: 448]
@C    World_id29 => Transformation.World
@C    WorldInverse_id30 => Transformation.WorldInverse
@C    WorldInverseTranspose_id31 => Transformation.WorldInverseTranspose
@C    WorldView_id32 => Transformation.WorldView
@C    WorldViewInverse_id33 => Transformation.WorldViewInverse
@C    WorldViewProjection_id34 => Transformation.WorldViewProjection
@C    WorldScale_id35 => Transformation.WorldScale
@C    EyeMS_id36 => Transformation.EyeMS
@C    ColorFront_id77 => MaterialFrontBackBlendShader.ColorFront
@C    ColorBlend_id78 => MaterialFrontBackBlendShader.ColorBlend
@C    ColorBack_id79 => MaterialFrontBackBlendShader.ColorBack
@C    AlphaBlend_id80 => MaterialFrontBackBlendShader.AlphaBlend
***************************
******  Resources    ******
***************************
@R    PerView => PerView [Stage: Vertex, Slot: (0-0)]
@R    PerDraw => PerDraw [Stage: Vertex, Slot: (1-1)]
@R    PerView => PerView [Stage: Pixel, Slot: (0-0)]
@R    PerDraw => PerDraw [Stage: Pixel, Slot: (1-1)]
***************************
*****     Sources     *****
***************************
@S    ShaderBase => 4c1f19d7c11da8b6779f7d5bd2230c54
@S    ShaderBaseStream => fc958f25c75bed221fe8c243536b9d86
@S    ShadingBase => e3d916eb38080d4811f8df2f534d29de
@S    ComputeColor => 3901ffe05d430cc3915caeb21db3602a
@S    TransformationBase => 03e527676224573bf843cf60b80cd44f
@S    NormalStream => 4540af543f57cb8c109068cc2bc84301
@S    TransformationWAndVP => 42cb38f5cd10f8e2398c532ff9245b30
@S    PositionStream4 => ced12be41d1f4f9f04922bedbd23198e
@S    PositionHStream4 => 38dbb36513aba5922571172c8d448a2f
@S    Transformation => 43d14ebe5f8e8f489333f29f06b3cc4e
@S    NormalFromMesh => 5b46e05fa4cc57da5eab3133454b40a2
@S    NormalBase => 2365a24f8e31759310d28841e25ab59e
@S    MaterialSurfacePixelStageCompositor => 46792075cde5ce53206736be31524023
@S    PositionStream => de40f77d9beb7d24178d0673b1c68081
@S    MaterialPixelShadingStream => ca772e00c6b149c63933b57f8cfe9305
@S    MaterialPixelStream => 2774a44a8a99bf6ec454b53775078d37
@S    MaterialStream => be1f982f993628c15d0f247df2f3082a
@S    IStreamInitializer => 8fcda8085d31682ec0eda3a0af4b5098
@S    LightStream => 393c8d08e1347ee4a71f8b8b5a71b256
@S    DirectLightGroupArray => 9812bdb90653b41f164737a79b1e88b8
@S    DirectLightGroup => 88dcc4dd936fa213977104f6145722b5
@S    ShadowGroup => 78948cc2697ebfe57ac997fa9d2443b2
@S    ShadowStream => 8a3eff7736ac12b27bd33af94d11d0df
@S    EnvironmentLightArray => fcc9bf108eb5b995965ef7b82ddcfa3c
@S    EnvironmentLight => 49d6a9a452777ae34d8097b1c79deafe
@S    IMaterialSurface => db8f5e2ab9f97800c9bd6eb3a85e9573
@S    MaterialFrontBackBlendShader => 10ee10edd9272db7648c390a15048f82
@S    LightDirectionalGroup => b54634d02b4672111bb1cf0fd34723ff
@S    ShadowMapReceiverDirectional => 18275930c5e35282727a6bfd2a81bd38
@S    ShadowMapReceiverBase => 8d0716dd82aae0135d2823a64b614558
@S    ShadowMapGroup => 63c7ecd487449d6027d8e70d4c59a4e1
@S    ShadowMapCommon => 7ad3001a080b15e5eca2a31185cad06b
@S    ShadowMapFilterBase => 911c6cfac97f919e0f25fea6e22c8314
@S    Texturing => 5a079038962447a86765b54a9ab35acb
@S    ShadowMapFilterPcf => 136dc178580e0ba0c4b70e8e3363d49b
@S    MaterialSurfaceArray => 9fde1becb7287130cc9822edad459470
@S    MaterialSurfaceDiffuse => 09790c18be9daae6c345c59c7b36b4df
@S    IMaterialSurfacePixel => 1a34a496706cf0c919c5af2f25f422a4
@S    ComputeColorConstantColorLink => e2a6c07ff850313470e78f844de739e1
@S    MaterialSurfaceGlossinessMap => 759aa8e5129b65d37c5728f5203936ab
@S    ComputeColorConstantFloatLink => 7935ebb47819e34c683cd7e4be495529
@S    MaterialSurfaceMetalness => 550a69aa480eb58374958fded94a1153
@S    MaterialSurfaceLightingAndShading => 22886d1201a99005b2764d5fe7bf4dbb
@S    Math => 26780ee7a692a8af892644c36f751ca6
@S    IMaterialSurfaceShading => 5e28115e85bed21ad27c23fda223baed
@S    MaterialSurfaceShadingDiffuseLambert => e3482018bd58477997230c1f923f0796
@S    MaterialSurfaceShadingSpecularMicrofacet => cb9ac911b8d7d5140c4481e502e11f5a
@S    BRDFMicrofacet => 738b5320dd03a5a8ee72148e8decb326
@S    IMaterialSpecularMicrofacetFresnelFunction => eaa7f2bc34eb4b687c0f1fa0e87af349
@S    IMaterialSpecularMicrofacetVisibilityFunction => fec615992ca4968d973cae8d6018959a
@S    IMaterialSpecularMicrofacetNormalDistributionFunction => 0cf8d0540dcb0e8f253cc3e879a8c8d5
@S    MaterialSpecularMicrofacetFresnelSchlick => 1ddd190bd6590821ef8a758f7ec71f87
@S    MaterialSpecularMicrofacetVisibilitySmithSchlickGGX => 067802573a4afed8304b276d7fd07728
@S    MaterialSpecularMicrofacetNormalDistributionGGX => e825bb1fced9b19432d65c3d28e32e59
***************************
*****     Stages      *****
***************************
@G    Vertex => dca5c174ad79ec0ec050742569c757f3
//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
//
// Buffer Definitions: 
//
// cbuffer PerView
// {
//
//   float4x4 View_id22;                // Offset:    0 Size:    64 [unused]
//   float4x4 ViewInverse_id23;         // Offset:   64 Size:    64 [unused]
//   float4x4 Projection_id24;          // Offset:  128 Size:    64 [unused]
//   float4x4 ProjectionInverse_id25;   // Offset:  192 Size:    64 [unused]
//   float4x4 ViewProjection_id26;      // Offset:  256 Size:    64
//   float2 ProjScreenRay_id27;         // Offset:  320 Size:     8 [unused]
//   float4 Eye_id28;                   // Offset:  336 Size:    16 [unused]
//
// }
//
// cbuffer PerDraw
// {
//
//   float4x4 World_id29;               // Offset:    0 Size:    64
//   float4x4 WorldInverse_id30;        // Offset:   64 Size:    64 [unused]
//   float4x4 WorldInverseTranspose_id31;// Offset:  128 Size:    64
//   float4x4 WorldView_id32;           // Offset:  192 Size:    64 [unused]
//   float4x4 WorldViewInverse_id33;    // Offset:  256 Size:    64 [unused]
//   float4x4 WorldViewProjection_id34; // Offset:  320 Size:    64 [unused]
//   float3 WorldScale_id35;            // Offset:  384 Size:    12 [unused]
//   float4 EyeMS_id36;                 // Offset:  400 Size:    16 [unused]
//   float3 ColorFront_id77;            // Offset:  416 Size:    12 [unused]
//   float ColorBlend_id78;             // Offset:  428 Size:     4 [unused]
//   float3 ColorBack_id79;             // Offset:  432 Size:    12 [unused]
//   float AlphaBlend_id80;             // Offset:  444 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// PerView                           cbuffer      NA          NA    0        1
// PerDraw                           cbuffer      NA          NA    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION_WS              0   xyzw        0     NONE   float   xyzw
// SV_Position              0   xyzw        1      POS   float   xyzw
// NORMALWS                 0   xyz         2     NONE   float   xyz 
//
vs_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer cb0[20], immediateIndexed
dcl_constantbuffer cb1[11], immediateIndexed
dcl_input v0.xyzw
dcl_input v1.xyz
dcl_output o0.xyzw
dcl_output_siv o1.xyzw, position
dcl_output o2.xyz
dcl_temps 1
//
// Initial variable locations:
//   v0.x <- __input__.Position_id18.x; v0.y <- __input__.Position_id18.y; v0.z <- __input__.Position_id18.z; v0.w <- __input__.Position_id18.w; 
//   v1.x <- __input__.meshNormal_id14.x; v1.y <- __input__.meshNormal_id14.y; v1.z <- __input__.meshNormal_id14.z; 
//   o2.x <- <VSMain return value>.normalWS_id16.x; o2.y <- <VSMain return value>.normalWS_id16.y; o2.z <- <VSMain return value>.normalWS_id16.z; 
//   o1.x <- <VSMain return value>.ShadingPosition_id0.x; o1.y <- <VSMain return value>.ShadingPosition_id0.y; o1.z <- <VSMain return value>.ShadingPosition_id0.z; o1.w <- <VSMain return value>.ShadingPosition_id0.w; 
//   o0.x <- <VSMain return value>.PositionWS_id19.x; o0.y <- <VSMain return value>.PositionWS_id19.y; o0.z <- <VSMain return value>.PositionWS_id19.z; o0.w <- <VSMain return value>.PositionWS_id19.w
//
#line 118 "C:\Users\jason\Documents\Work\Uni\three-dee\1 - Code\ThreeDeeUi\ThreeDeeUi\ThreeDeeUi.Game\log\shader_XenkoEditorForwardShadingEffect_Wireframe_61d1eeb2e275158eb33800e64ccaaea4.hlsl"
dp4 r0.x, v0.xyzw, cb1[0].xyzw  // r0.x <- streams.PositionWS_id19.x
dp4 r0.y, v0.xyzw, cb1[1].xyzw  // r0.y <- streams.PositionWS_id19.y
dp4 r0.z, v0.xyzw, cb1[2].xyzw  // r0.z <- streams.PositionWS_id19.z
dp4 r0.w, v0.xyzw, cb1[3].xyzw  // r0.w <- streams.PositionWS_id19.w

#line 183
mov o0.xyzw, r0.xyzw

#line 108
dp4 o1.x, r0.xyzw, cb0[16].xyzw
dp4 o1.y, r0.xyzw, cb0[17].xyzw
dp4 o1.z, r0.xyzw, cb0[18].xyzw
dp4 o1.w, r0.xyzw, cb0[19].xyzw

#line 154
dp3 o2.x, v1.xyzx, cb1[8].xyzx
dp3 o2.y, v1.xyzx, cb1[9].xyzx
dp3 o2.z, v1.xyzx, cb1[10].xyzx

#line 183
ret 
// Approximately 13 instruction slots used
@G    Pixel => 97a58d0ba5d2c0ea5e4f3d0bc97c306b
//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
//
// Buffer Definitions: 
//
// cbuffer PerView
// {
//
//   float4x4 View_id22;                // Offset:    0 Size:    64 [unused]
//   float4x4 ViewInverse_id23;         // Offset:   64 Size:    64 [unused]
//   float4x4 Projection_id24;          // Offset:  128 Size:    64 [unused]
//   float4x4 ProjectionInverse_id25;   // Offset:  192 Size:    64 [unused]
//   float4x4 ViewProjection_id26;      // Offset:  256 Size:    64 [unused]
//   float2 ProjScreenRay_id27;         // Offset:  320 Size:     8 [unused]
//   float4 Eye_id28;                   // Offset:  336 Size:    16
//
// }
//
// cbuffer PerDraw
// {
//
//   float4x4 World_id29;               // Offset:    0 Size:    64 [unused]
//   float4x4 WorldInverse_id30;        // Offset:   64 Size:    64 [unused]
//   float4x4 WorldInverseTranspose_id31;// Offset:  128 Size:    64 [unused]
//   float4x4 WorldView_id32;           // Offset:  192 Size:    64 [unused]
//   float4x4 WorldViewInverse_id33;    // Offset:  256 Size:    64 [unused]
//   float4x4 WorldViewProjection_id34; // Offset:  320 Size:    64 [unused]
//   float3 WorldScale_id35;            // Offset:  384 Size:    12 [unused]
//   float4 EyeMS_id36;                 // Offset:  400 Size:    16 [unused]
//   float3 ColorFront_id77;            // Offset:  416 Size:    12
//   float ColorBlend_id78;             // Offset:  428 Size:     4
//   float3 ColorBack_id79;             // Offset:  432 Size:    12
//   float AlphaBlend_id80;             // Offset:  444 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// PerView                           cbuffer      NA          NA    0        1
// PerDraw                           cbuffer      NA          NA    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION_WS              0   xyzw        0     NONE   float   xyz 
// SV_Position              0   xyzw        1      POS   float       
// NORMALWS                 0   xyz         2     NONE   float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer cb0[22], immediateIndexed
dcl_constantbuffer cb1[28], immediateIndexed
dcl_input_ps linear v0.xyz
dcl_input_ps linear v2.xyz
dcl_output o0.xyzw
dcl_temps 2
//
// Initial variable locations:
//   v0.x <- __input__.PositionWS_id19.x; v0.y <- __input__.PositionWS_id19.y; v0.z <- __input__.PositionWS_id19.z; v0.w <- __input__.PositionWS_id19.w; 
//   v1.x <- __input__.ShadingPosition_id0.x; v1.y <- __input__.ShadingPosition_id0.y; v1.z <- __input__.ShadingPosition_id0.z; v1.w <- __input__.ShadingPosition_id0.w; 
//   v2.x <- __input__.normalWS_id16.x; v2.y <- __input__.normalWS_id16.y; v2.z <- __input__.normalWS_id16.z; 
//   o0.x <- <PSMain return value>.ColorTarget_id1.x; o0.y <- <PSMain return value>.ColorTarget_id1.y; o0.z <- <PSMain return value>.ColorTarget_id1.z; o0.w <- <PSMain return value>.ColorTarget_id1.w
//
#line 125 "C:\Users\jason\Documents\Work\Uni\three-dee\1 - Code\ThreeDeeUi\ThreeDeeUi\ThreeDeeUi.Game\log\shader_XenkoEditorForwardShadingEffect_Wireframe_61d1eeb2e275158eb33800e64ccaaea4.hlsl"
add r0.xyz, -v0.xyzx, cb0[21].xyzx
dp3 r0.w, r0.xyzx, r0.xyzx
rsq r0.w, r0.w
mul r0.xyz, r0.wwww, r0.xyzx  // r0.x <- viewWS.x; r0.y <- viewWS.y; r0.z <- viewWS.z

#line 150
dp3 r0.w, v2.xyzx, v2.xyzx
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, v2.xyzx  // r1.x <- streams.normalWS_id16.x; r1.y <- streams.normalWS_id16.y; r1.z <- streams.normalWS_id16.z

#line 126
dp3 r0.x, r1.xyzx, r0.xyzx
add r0.x, r0.x, l(0.250000)
mul_sat r0.x, r0.x, l(4.000000)  // r0.x <- ndotV
add r0.yzw, cb1[26].xxyz, -cb1[27].xxyz
mad r0.xyz, r0.xxxx, r0.yzwy, cb1[27].xyzx  // r0.x <- color.x; r0.y <- color.y; r0.z <- color.z
mul o0.xyz, r0.xyzx, cb1[26].wwww

#line 170
mov o0.w, cb1[27].w
ret 
// Approximately 15 instruction slots used
***************************
*************************/
const static int TMaxLightCount_id83 = 8;
const static int TCascadeCountBase_id146 = 4;
const static int TLightCountBase_id147 = 8;
const static int TCascadeCount_id151 = 4;
const static int TLightCount_id152 = 8;
const static bool TUseNormalBackface_id76 = true;
struct PS_STREAMS 
{
    float3 normalWS_id16;
    float4 PositionWS_id19;
    float4 ColorTarget_id1;
};
struct PS_OUTPUT 
{
    float4 ColorTarget_id1 : SV_Target0;
};
struct VS_STREAMS 
{
    float4 Position_id18;
    float3 meshNormal_id14;
    float4 PositionH_id21;
    float DepthVS_id20;
    float4 PositionWS_id19;
    float4 ShadingPosition_id0;
    float3 normalWS_id16;
};
struct VS_OUTPUT 
{
    float4 PositionWS_id19 : POSITION_WS;
    float4 ShadingPosition_id0 : SV_Position;
    float3 normalWS_id16 : NORMALWS;
};
struct VS_INPUT 
{
    float4 Position_id18 : POSITION;
    float3 meshNormal_id14 : NORMAL;
};
struct DirectionalLightData 
{
    float3 DirectionWS;
    float3 Color;
};
cbuffer PerView 
{
    float4x4 View_id22;
    float4x4 ViewInverse_id23;
    float4x4 Projection_id24;
    float4x4 ProjectionInverse_id25;
    float4x4 ViewProjection_id26;
    float2 ProjScreenRay_id27;
    float4 Eye_id28;
};
cbuffer PerDraw 
{
    float4x4 World_id29;
    float4x4 WorldInverse_id30;
    float4x4 WorldInverseTranspose_id31;
    float4x4 WorldView_id32;
    float4x4 WorldViewInverse_id33;
    float4x4 WorldViewProjection_id34;
    float3 WorldScale_id35;
    float4 EyeMS_id36;
    float3 ColorFront_id77;
    float ColorBlend_id78;
    float3 ColorBack_id79;
    float AlphaBlend_id80;
};
cbuffer PerLighting 
{
    int LightCount_id82;
    DirectionalLightData Lights_id84[TMaxLightCount_id83];
    float2 ShadowMapTextureSize_id86;
    float2 ShadowMapTextureTexelSize_id87;
    float4x4 WorldToShadowCascadeUV_id148[TCascadeCountBase_id146 * TLightCountBase_id147];
    float DepthBiases_id149[TLightCountBase_id147];
    float OffsetScales_id150[TLightCountBase_id147];
    float CascadeDepthSplits_id156[TCascadeCount_id151 * TLightCount_id152];
};
cbuffer PerMaterial 
{
    float4 constantColor_id159;
    float constantFloat_id161;
    float constantFloat_id164;
};
cbuffer Globals 
{
    float2 Texture0TexelSize_id89;
    float2 Texture1TexelSize_id91;
    float2 Texture2TexelSize_id93;
    float2 Texture3TexelSize_id95;
    float2 Texture4TexelSize_id97;
    float2 Texture5TexelSize_id99;
    float2 Texture6TexelSize_id101;
    float2 Texture7TexelSize_id103;
    float2 Texture8TexelSize_id105;
    float2 Texture9TexelSize_id107;
    float Bias_id158;
};
void PostTransformPosition_id6()
{
}
void PreTransformPosition_id4()
{
}
void PostTransformPosition_id14(inout VS_STREAMS streams)
{
    PostTransformPosition_id6();
    streams.ShadingPosition_id0 = mul(streams.PositionWS_id19, ViewProjection_id26);
    streams.PositionH_id21 = streams.ShadingPosition_id0;
    streams.DepthVS_id20 = streams.ShadingPosition_id0.w;
}
void TransformPosition_id5()
{
}
void PreTransformPosition_id13(inout VS_STREAMS streams)
{
    PreTransformPosition_id4();
    streams.PositionWS_id19 = mul(streams.Position_id18, World_id29);
}
float4 Shading_id29(inout PS_STREAMS streams)
{
    float3 color = ColorFront_id77;

    {
        float3 viewWS = normalize(Eye_id28.xyz - streams.PositionWS_id19.xyz);
        float ndotV = saturate((dot(streams.normalWS_id16, viewWS) + 0.25) / 0.25);
        color = lerp(ColorBack_id79, ColorFront_id77, ndotV);
    }
    return float4(color * ColorBlend_id78, AlphaBlend_id80);
}
void PSMain_id1()
{
}
void BaseTransformVS_id7(inout VS_STREAMS streams)
{
    PreTransformPosition_id13(streams);
    TransformPosition_id5();
    PostTransformPosition_id14(streams);
}
void VSMain_id0()
{
}
void PSMain_id3(inout PS_STREAMS streams)
{
    PSMain_id1();
    streams.ColorTarget_id1 = Shading_id29(streams);
}
void GenerateNormal_PS_id18(inout PS_STREAMS streams)
{
    streams.normalWS_id16 = normalize(streams.normalWS_id16);
}
void GenerateNormal_VS_id17(inout VS_STREAMS streams)
{
    streams.normalWS_id16 = mul(streams.meshNormal_id14, (float3x3)WorldInverseTranspose_id31);
}
void VSMain_id8(inout VS_STREAMS streams)
{
    VSMain_id0();
    BaseTransformVS_id7(streams);
}
PS_OUTPUT PSMain(VS_OUTPUT __input__)
{
    PS_STREAMS streams = (PS_STREAMS)0;
    streams.PositionWS_id19 = __input__.PositionWS_id19;
    streams.normalWS_id16 = __input__.normalWS_id16;
    GenerateNormal_PS_id18(streams);
    PSMain_id3(streams);
    PS_OUTPUT __output__ = (PS_OUTPUT)0;
    __output__.ColorTarget_id1 = streams.ColorTarget_id1;
    return __output__;
}
VS_OUTPUT VSMain(VS_INPUT __input__)
{
    VS_STREAMS streams = (VS_STREAMS)0;
    streams.Position_id18 = __input__.Position_id18;
    streams.meshNormal_id14 = __input__.meshNormal_id14;
    VSMain_id8(streams);
    GenerateNormal_VS_id17(streams);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.PositionWS_id19 = streams.PositionWS_id19;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.normalWS_id16 = streams.normalWS_id16;
    return __output__;
}
