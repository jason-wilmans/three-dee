/**************************
***** Compiler Parameters *****
***************************
@P EffectName: XenkoForwardShadingEffect
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
cbuffer PerDraw [Size: 416]
@C    World_id29 => Transformation.World
@C    WorldInverse_id30 => Transformation.WorldInverse
@C    WorldInverseTranspose_id31 => Transformation.WorldInverseTranspose
@C    WorldView_id32 => Transformation.WorldView
@C    WorldViewInverse_id33 => Transformation.WorldViewInverse
@C    WorldViewProjection_id34 => Transformation.WorldViewProjection
@C    WorldScale_id35 => Transformation.WorldScale
@C    EyeMS_id36 => Transformation.EyeMS
cbuffer PerLighting [Size: 3104]
@C    LightCount_id77 => DirectLightGroup.LightCount.directLightGroups[0]
@C    Lights_id79 => LightDirectionalGroup.Lights.directLightGroups[0]
@C    ShadowMapTextureSize_id81 => ShadowMap.TextureSize.directLightGroups[0]
@C    ShadowMapTextureTexelSize_id82 => ShadowMap.TextureTexelSize.directLightGroups[0]
@C    WorldToShadowCascadeUV_id143 => ShadowMapReceiverBase.WorldToShadowCascadeUV.directLightGroups[0]
@C    DepthBiases_id144 => ShadowMapReceiverBase.DepthBiases.directLightGroups[0]
@C    OffsetScales_id145 => ShadowMapReceiverBase.OffsetScales.directLightGroups[0]
@C    CascadeDepthSplits_id151 => ShadowMapReceiverDirectional.CascadeDepthSplits.directLightGroups[0]
cbuffer PerMaterial [Size: 32]
@C    constantColor_id154 => Material.DiffuseValue
@C    constantFloat_id156 => Material.GlossinessValue
@C    constantFloat_id159 => Material.MetalnessValue
***************************
******  Resources    ******
***************************
@R    ShadowMapTexture_id80 => ShadowMap.Texture.directLightGroups[0] [Stage: None, Slot: (-1--1)]
@R    PerLighting => PerLighting [Stage: None, Slot: (-1--1)]
@R    PerMaterial => PerMaterial [Stage: None, Slot: (-1--1)]
@R    PerView => PerView [Stage: Vertex, Slot: (0-0)]
@R    PerDraw => PerDraw [Stage: Vertex, Slot: (1-1)]
@R    LinearClampCompareLessEqualSampler_id115 => Texturing.LinearClampCompareLessEqualSampler [Stage: Pixel, Slot: (0-0)]
@R    ShadowMapTexture_id80 => ShadowMap.Texture.directLightGroups[0] [Stage: Pixel, Slot: (0-0)]
@R    PerView => PerView [Stage: Pixel, Slot: (0-0)]
@R    PerLighting => PerLighting [Stage: Pixel, Slot: (1-1)]
@R    PerMaterial => PerMaterial [Stage: Pixel, Slot: (2-2)]
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
@G    Vertex => 0c6202129d5057749f28b51836119b29
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
// DEPTH_VS                 0   x           2     NONE   float   x   
// NORMALWS                 0    yzw        2     NONE   float    yzw
//
vs_4_0
dcl_constantbuffer cb0[20], immediateIndexed
dcl_constantbuffer cb1[11], immediateIndexed
dcl_input v0.xyzw
dcl_input v1.xyz
dcl_output o0.xyzw
dcl_output_siv o1.xyzw, position
dcl_output o2.x
dcl_output o2.yzw
dcl_temps 2
//
// Initial variable locations:
//   v0.x <- __input__.Position_id18.x; v0.y <- __input__.Position_id18.y; v0.z <- __input__.Position_id18.z; v0.w <- __input__.Position_id18.w; 
//   v1.x <- __input__.meshNormal_id14.x; v1.y <- __input__.meshNormal_id14.y; v1.z <- __input__.meshNormal_id14.z; 
//   o2.x <- <VSMain return value>.DepthVS_id20; o2.y <- <VSMain return value>.normalWS_id16.x; o2.z <- <VSMain return value>.normalWS_id16.y; o2.w <- <VSMain return value>.normalWS_id16.z; 
//   o1.x <- <VSMain return value>.ShadingPosition_id0.x; o1.y <- <VSMain return value>.ShadingPosition_id0.y; o1.z <- <VSMain return value>.ShadingPosition_id0.z; o1.w <- <VSMain return value>.ShadingPosition_id0.w; 
//   o0.x <- <VSMain return value>.PositionWS_id19.x; o0.y <- <VSMain return value>.PositionWS_id19.y; o0.z <- <VSMain return value>.PositionWS_id19.z; o0.w <- <VSMain return value>.PositionWS_id19.w
//
#line 487 "C:\Users\jason\Documents\Work\Uni\three-dee\1 - Code\ThreeDeeUi\ThreeDeeUi\Bin\Windows\Debug\log\shader_XenkoForwardShadingEffect_27c08bb0408f47feec5acf621191fe4b.hlsl"
dp4 r0.x, v0.xyzw, cb1[0].xyzw  // r0.x <- streams.PositionWS_id19.x
dp4 r0.y, v0.xyzw, cb1[1].xyzw  // r0.y <- streams.PositionWS_id19.y
dp4 r0.z, v0.xyzw, cb1[2].xyzw  // r0.z <- streams.PositionWS_id19.z
dp4 r0.w, v0.xyzw, cb1[3].xyzw  // r0.w <- streams.PositionWS_id19.w

#line 551
mov o0.xyzw, r0.xyzw

#line 477
dp4 r1.x, r0.xyzw, cb0[19].xyzw  // r1.x <- streams.ShadingPosition_id0.w

#line 551
mov o1.w, r1.x
mov o2.x, r1.x

#line 477
dp4 o1.x, r0.xyzw, cb0[16].xyzw
dp4 o1.y, r0.xyzw, cb0[17].xyzw
dp4 o1.z, r0.xyzw, cb0[18].xyzw

#line 520
dp3 o2.y, v1.xyzx, cb1[8].xyzx
dp3 o2.z, v1.xyzx, cb1[9].xyzx
dp3 o2.w, v1.xyzx, cb1[10].xyzx

#line 551
ret 
// Approximately 15 instruction slots used
@G    Pixel => 9b4b6e177f2bcf30b19cc31b60c0c8a7
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
// cbuffer PerLighting
// {
//
//   int LightCount_id77;               // Offset:    0 Size:     4
//   
//   struct
//   {
//       
//       float3 DirectionWS;            // Offset:   16
//       float3 Color;                  // Offset:   32
//
//   } Lights_id79[8];                  // Offset:   16 Size:   252
//   float2 ShadowMapTextureSize_id81;  // Offset:  272 Size:     8
//   float2 ShadowMapTextureTexelSize_id82;// Offset:  280 Size:     8
//   float4x4 WorldToShadowCascadeUV_id143[32];// Offset:  288 Size:  2048
//   float DepthBiases_id144[8];        // Offset: 2336 Size:   116
//   float OffsetScales_id145[8];       // Offset: 2464 Size:   116
//   float CascadeDepthSplits_id151[32];// Offset: 2592 Size:   500
//
// }
//
// cbuffer PerMaterial
// {
//
//   float4 constantColor_id154;        // Offset:    0 Size:    16
//   float constantFloat_id156;         // Offset:   16 Size:     4
//   float constantFloat_id159;         // Offset:   20 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// LinearClampCompareLessEqualSampler_id115  sampler_c      NA          NA    0        1
// ShadowMapTexture_id80             texture  float4          2d    0        1
// PerView                           cbuffer      NA          NA    0        1
// PerLighting                       cbuffer      NA          NA    1        1
// PerMaterial                       cbuffer      NA          NA    2        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION_WS              0   xyzw        0     NONE   float   xyz 
// SV_Position              0   xyzw        1      POS   float       
// DEPTH_VS                 0   x           2     NONE   float   x   
// NORMALWS                 0    yzw        2     NONE   float    yzw
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
ps_4_0
dcl_constantbuffer cb0[22], immediateIndexed
dcl_constantbuffer cb1[194], dynamicIndexed
dcl_constantbuffer cb2[2], immediateIndexed
dcl_sampler s0, mode_comparison
dcl_resource_texture2d (float,float,float,float) t0
dcl_input_ps linear v0.xyz
dcl_input_ps linear v2.x
dcl_input_ps linear v2.yzw
dcl_output o0.xyzw
dcl_temps 17
//
// Initial variable locations:
//   v0.x <- __input__.PositionWS_id19.x; v0.y <- __input__.PositionWS_id19.y; v0.z <- __input__.PositionWS_id19.z; v0.w <- __input__.PositionWS_id19.w; 
//   v1.x <- __input__.ShadingPosition_id0.x; v1.y <- __input__.ShadingPosition_id0.y; v1.z <- __input__.ShadingPosition_id0.z; v1.w <- __input__.ShadingPosition_id0.w; 
//   v2.x <- __input__.DepthVS_id20; v2.y <- __input__.normalWS_id16.x; v2.z <- __input__.normalWS_id16.y; v2.w <- __input__.normalWS_id16.z; 
//   o0.x <- <PSMain return value>.ColorTarget_id1.x; o0.y <- <PSMain return value>.ColorTarget_id1.y; o0.z <- <PSMain return value>.ColorTarget_id1.z; o0.w <- <PSMain return value>.ColorTarget_id1.w
//
#line 516 "C:\Users\jason\Documents\Work\Uni\three-dee\1 - Code\ThreeDeeUi\ThreeDeeUi\Bin\Windows\Debug\log\shader_XenkoForwardShadingEffect_27c08bb0408f47feec5acf621191fe4b.hlsl"
dp3 r0.x, v2.yzwy, v2.yzwy
rsq r0.x, r0.x
mul r0.xyz, r0.xxxx, v2.yzwy  // r0.x <- streams.normalWS_id16.x; r0.y <- streams.normalWS_id16.y; r0.z <- streams.normalWS_id16.z

#line 491
add r1.xyz, -v0.xyzx, cb0[21].xyzx
dp3 r0.w, r1.xyzx, r1.xyzx
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, r1.xyzx  // r1.x <- streams.viewWS_id61.x; r1.y <- streams.viewWS_id61.y; r1.z <- streams.viewWS_id61.z

#line 407
add r2.xyz, cb2[0].xyzx, l(-0.020000, -0.020000, -0.020000, 0.000000)
mad r2.xyz, cb2[1].yyyy, r2.xyzx, l(0.020000, 0.020000, 0.020000, 0.000000)  // r2.x <- streams.matSpecular_id49.x; r2.y <- streams.matSpecular_id49.y; r2.z <- streams.matSpecular_id49.z
mad r3.xyz, cb2[1].yyyy, -cb2[0].xyzx, cb2[0].xyzx  // r3.x <- streams.matDiffuse_id47.x; r3.y <- streams.matDiffuse_id47.y; r3.z <- streams.matDiffuse_id47.z

#line 336
dp3 r0.w, r0.xyzx, r1.xyzx
max r0.w, r0.w, l(0.000100)  // r0.w <- streams.NdotV_id65
add r1.w, -cb2[1].x, l(1.000000)  // r1.w <- roughness
mul r1.w, r1.w, r1.w
max r1.w, r1.w, l(0.001000)  // r1.w <- streams.alphaRoughness_id63

#line 222
add r2.w, cb1[17].z, cb1[17].z

#line 213
mov r4.w, l(1.000000)

#line 382
mov r5.xyz, r0.xyzx  // r5.x <- streams.normalWS_id16.x; r5.y <- streams.normalWS_id16.y; r5.z <- streams.normalWS_id16.z
mov r5.w, v0.x  // r5.w <- streams.PositionWS_id19.x
mov r6.xy, v0.yzyy  // r6.x <- streams.PositionWS_id19.y; r6.y <- streams.PositionWS_id19.z
mov r6.z, v2.x  // r6.z <- streams.DepthVS_id20
mov r6.w, r1.x  // r6.w <- streams.viewWS_id61.x
mov r7.xy, r1.yzyy  // r7.x <- streams.viewWS_id61.y; r7.y <- streams.viewWS_id61.z
mov r7.zw, r3.xxxy  // r7.z <- streams.matDiffuseVisible_id62.x; r7.w <- streams.matDiffuseVisible_id62.y
mov r8.x, r3.z  // r8.x <- streams.matDiffuseVisible_id62.z
mov r8.yzw, r2.xxyz  // r8.y <- streams.matSpecularVisible_id64.x; r8.z <- streams.matSpecularVisible_id64.y; r8.w <- streams.matSpecularVisible_id64.z
mov r3.w, r1.w  // r3.w <- streams.alphaRoughness_id63
mov r9.xyz, l(0,0,0,0)  // r9.x <- directLightingContribution.x; r9.y <- directLightingContribution.y; r9.z <- directLightingContribution.z
mov r9.w, r0.w  // r9.w <- streams.NdotV_id65
mov r10.x, l(0)  // r10.x <- i
loop 
  ige r10.y, r10.x, l(8)
  breakc_nz r10.y
  ige r10.y, r10.x, cb1[0].x
  if_nz r10.y
    break 
  endif 

#line 243
  ishl r10.y, r10.x, l(1)
  ishl r10.z, r10.x, l(2)  // r10.z <- cascadeIndexBase

#line 319
  dp3 r10.w, r5.xyzx, -cb1[r10.y + 1].xyzx
  max r10.w, r10.w, l(0.000100)  // r10.w <- streams.NdotL_id43

#line 250
  lt r11.x, cb1[r10.z + 162].x, r6.z

#line 253
  and r11.x, r11.x, l(1)  // r11.x <- cascadeIndex

#line 250
  iadd r11.yz, r10.zzzz, l(0, 1, 2, 0)
  lt r11.y, cb1[r11.y + 162].x, r6.z

#line 253
  movc r11.x, r11.y, l(2), r11.x

#line 250
  lt r11.y, cb1[r11.z + 162].x, r6.z

#line 253
  movc r11.x, r11.y, l(3), r11.x

#line 221
  add r11.y, -r10.w, l(1.000000)
  max r11.y, r11.y, l(0.000000)  // r11.y <- normalOffsetScale
  mul r11.z, r2.w, cb1[r10.x + 154].x
  mul r11.y, r11.y, r11.z

#line 257
  mov r12.x, r5.w
  mov r12.yz, r6.xxyx
  mad r4.xyz, r11.yyyy, r5.xyzx, r12.xyzx  // r4.x <- shadowPosition.x; r4.y <- shadowPosition.y; r4.z <- shadowPosition.z

#line 213
  iadd r10.z, r10.z, r11.x
  ishl r10.z, r10.z, l(2)
  dp4 r11.x, r4.xyzw, cb1[r10.z + 18].xyzw  // r11.x <- shadowPosition.x
  dp4 r11.y, r4.xyzw, cb1[r10.z + 19].xyzw  // r11.y <- shadowPosition.y
  dp4 r11.z, r4.xyzw, cb1[r10.z + 20].xyzw  // r11.z <- shadowPosition.z
  dp4 r4.x, r4.xyzw, cb1[r10.z + 21].xyzw  // r4.x <- shadowPosition.w
  div r4.xyz, r11.xyzx, r4.xxxx  // r4.x <- shadowPosition.x; r4.y <- shadowPosition.y; r4.z <- shadowPosition.z
  add r4.z, r4.z, -cb1[r10.x + 146].x  // r4.z <- depthVS

#line 166
  mad r4.xy, r4.xyxx, cb1[17].xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  round_ni r11.xy, r4.xyxx  // r11.x <- base_uv.x; r11.y <- base_uv.y
  add r4.xy, r4.xyxx, -r11.xyxx  // r4.x <- s; r4.y <- t
  add r11.xy, r11.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
  mul r11.xy, r11.xyxx, cb1[17].zwzz

#line 179
  mad r11.zw, -r4.yyyx, l(0.000000, 0.000000, 3.000000, 3.000000), l(0.000000, 0.000000, 4.000000, 4.000000)  // r11.w <- uw0; r11.z <- vw0
  mad r12.xy, r4.xyxx, l(3.000000, 3.000000, 0.000000, 0.000000), l(1.000000, 1.000000, 0.000000, 0.000000)  // r12.x <- uw2; r12.y <- vw2
  mad r12.zw, -r4.xxxy, l(0.000000, 0.000000, 2.000000, 2.000000), l(0.000000, 0.000000, 3.000000, 3.000000)
  div r12.zw, r12.zzzw, r11.wwwz
  add r13.xy, r4.xyxx, l(3.000000, 3.000000, 0.000000, 0.000000)
  div r4.xy, r4.xyxx, r12.xyxx
  add r14.xw, r12.zzzw, l(-2.000000, 0.000000, 0.000000, -2.000000)  // r14.x <- u0; r14.w <- v0
  mul r14.yz, r13.yyxy, l(0.000000, 0.142857, 0.142857, 0.000000)  // r14.z <- u1; r14.y <- v1
  add r13.xy, r4.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000)  // r13.x <- u2; r13.y <- v2
  mul r4.x, r11.z, r11.w
  mad r15.xyzw, r14.xwzw, cb1[17].zwzw, r11.xyxy

#line 149
  sample_c r4.y, r15.xyxx, t0.xxxx, s0, r4.z  // r4.y <- <SampleTextureAndCompare_id73 return value>

#line 188
  mul r12.zw, r11.zzzw, l(0.000000, 0.000000, 7.000000, 7.000000)

#line 149
  sample_c r10.z, r15.zwzz, t0.xxxx, s0, r4.z  // r10.z <- <SampleTextureAndCompare_id73 return value>

#line 186
  mul r10.z, r10.z, r12.z
  mad r4.x, r4.x, r4.y, r10.z  // r4.x <- shadow

#line 191
  mul r11.zw, r11.zzzw, r12.xxxy
  mov r13.zw, r14.wwwy
  mad r15.xyzw, r13.xzxw, cb1[17].zwzw, r11.xyxy

#line 149
  sample_c r4.y, r15.xyxx, t0.xxxx, s0, r4.z  // r4.y <- <SampleTextureAndCompare_id73 return value>

#line 187
  mad r4.x, r11.z, r4.y, r4.x
  mad r16.xyzw, r14.xyzy, cb1[17].zwzw, r11.xyxy

#line 149
  sample_c r4.y, r16.xyxx, t0.xxxx, s0, r4.z

#line 188
  mad r4.x, r12.w, r4.y, r4.x

#line 149
  sample_c r4.y, r16.zwzz, t0.xxxx, s0, r4.z

#line 189
  mad r4.x, r4.y, l(49.000000), r4.x

#line 192
  mul r12.zw, r12.xxxy, l(0.000000, 0.000000, 7.000000, 7.000000)

#line 149
  sample_c r4.y, r15.zwzz, t0.xxxx, s0, r4.z

#line 190
  mad r4.x, r12.z, r4.y, r4.x
  mov r14.y, r13.y
  mad r14.xyzw, r14.xyzy, cb1[17].zwzw, r11.xyxy

#line 149
  sample_c r4.y, r14.xyxx, t0.xxxx, s0, r4.z

#line 191
  mad r4.x, r11.w, r4.y, r4.x

#line 149
  sample_c r4.y, r14.zwzz, t0.xxxx, s0, r4.z

#line 192
  mad r4.x, r12.w, r4.y, r4.x
  mul r4.y, r12.y, r12.x
  mad r11.xy, r13.xyxx, cb1[17].zwzz, r11.xyxx

#line 149
  sample_c r4.z, r11.xyxx, t0.xxxx, s0, r4.z  // r4.z <- <SampleTextureAndCompare_id73 return value>

#line 193
  mad r4.x, r4.y, r4.z, r4.x
  mul r4.x, r4.x, l(0.006944)

#line 321
  mul r4.xyz, r4.xxxx, cb1[r10.y + 2].xyzx
  mul r4.xyz, r10.wwww, r4.xyzx  // r4.x <- streams.lightColorNdotL_id40.x; r4.y <- streams.lightColorNdotL_id40.y; r4.z <- streams.lightColorNdotL_id40.z

#line 311
  mov r11.x, r6.w
  mov r11.yz, r7.xxyx
  add r11.xyz, r11.xyzx, -cb1[r10.y + 1].xyzx
  dp3 r10.z, r11.xyzx, r11.xyzx
  rsq r10.z, r10.z
  mul r11.xyz, r10.zzzz, r11.xyzx  // r11.x <- streams.H_id68.x; r11.y <- streams.H_id68.y; r11.z <- streams.H_id68.z
  dp3 r10.z, r5.xyzx, r11.xyzx
  dp3 r10.y, -cb1[r10.y + 1].xyzx, r11.xyzx
  max r10.yz, r10.yyzy, l(0.000000, 0.000100, 0.000100, 0.000000)  // r10.y <- streams.LdotH_id70; r10.z <- streams.NdotH_id69

#line 307
  mov r11.xy, r7.zwzz
  mov r11.z, r8.x
  mul r11.xyz, r4.xyzx, r11.xyzx

#line 392
  mad r11.xyz, r11.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r9.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 158
  add r12.xyz, -r8.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r10.y, -r10.y, l(1.000000)
  mul r11.w, r10.y, r10.y
  mul r11.w, r11.w, r11.w
  mul r10.y, r10.y, r11.w
  mad r12.xyz, r12.xyzx, r10.yyyy, r8.yzwy  // r12.x <- <FresnelSchlick_id122 return value>.x; r12.y <- <FresnelSchlick_id122 return value>.y; r12.z <- <FresnelSchlick_id122 return value>.z

#line 153
  mul r10.y, r3.w, l(0.500000)  // r10.y <- k
  mad r11.w, -r3.w, l(0.500000), l(1.000000)
  mad r12.w, r10.w, r11.w, r10.y
  div r12.w, r10.w, r12.w  // r12.w <- <VisibilityhSchlickGGX_id140 return value>
  mad r10.y, r9.w, r11.w, r10.y
  div r10.y, r9.w, r10.y  // r10.y <- <VisibilityhSchlickGGX_id140 return value>

#line 205
  mul r10.y, r10.y, r12.w
  mul r10.w, r9.w, r10.w
  div r10.y, r10.y, r10.w  // r10.y <- <VisibilitySmithSchlickGGX_id142 return value>

#line 200
  mul r10.w, r3.w, r3.w  // r10.w <- alphaR2
  mul r10.z, r10.z, r10.z
  mad r11.w, r3.w, r3.w, l(-1.000000)
  mad r10.z, r10.z, r11.w, l(1.000000)
  max r10.z, r10.z, l(0.000100)
  mul r10.z, r10.z, r10.z
  mul r10.z, r10.z, l(3.141593)
  div r10.z, r10.w, r10.z  // r10.z <- <NormalDistributionGGX_id156 return value>

#line 301
  mul r12.xyz, r10.yyyy, r12.xyzx
  mul r10.yzw, r10.zzzz, r12.xxyz
  mul r4.xyz, r4.xyzx, r10.yzwy

#line 396
  mad r9.xyz, r4.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r11.xyzx  // r9.x <- directLightingContribution.x; r9.y <- directLightingContribution.y; r9.z <- directLightingContribution.z

#line 382
  iadd r10.x, r10.x, l(1)

#line 398
endloop 

#line 401
mul o0.xyz, r9.xyzx, l(3.141593, 3.141593, 3.141593, 0.000000)

#line 537
mov o0.w, cb2[0].w
ret 
// Approximately 155 instruction slots used
***************************
*************************/
const static int TMaxLightCount_id78 = 8;
const static int TCascadeCountBase_id141 = 4;
const static int TLightCountBase_id142 = 8;
const static int TCascadeCount_id146 = 4;
const static int TLightCount_id147 = 8;
const static bool TBlendCascades_id148 = false;
const static bool TDepthRangeAuto_id149 = true;
const static bool TCascadeDebug_id150 = false;
const static int TFilterSize_id152 = 5;
const static bool TInvert_id157 = false;
const static bool TIsEnergyConservative_id163 = false;
static const float PI_id165 = 3.14159265358979323846;
Texture2D ShadowMapTexture_id80;
SamplerComparisonState LinearClampCompareLessEqualSampler_id115 
{
    Filter = COMPARISON_MIN_MAG_LINEAR_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
    ComparisonFunc = LessEqual;
};
struct PS_STREAMS 
{
    float3 normalWS_id16;
    float4 PositionWS_id19;
    float DepthVS_id20;
    float3 viewWS_id61;
    float3 shadingColor_id66;
    float matBlend_id37;
    float3 matNormal_id45;
    float4 matColorBase_id46;
    float4 matDiffuse_id47;
    float3 matDiffuseVisible_id62;
    float3 matSpecular_id49;
    float3 matSpecularVisible_id64;
    float matSpecularIntensity_id50;
    float matGlossiness_id48;
    float alphaRoughness_id63;
    float matAmbientOcclusion_id51;
    float matAmbientOcclusionDirectLightingFactor_id52;
    float matCavity_id53;
    float matCavityDiffuse_id54;
    float matCavitySpecular_id55;
    float4 matEmissive_id56;
    float matEmissiveIntensity_id57;
    float2 matDiffuseSpecularAlphaBlend_id58;
    float3 matAlphaBlendColor_id59;
    float matAlphaDiscard_id60;
    float shadingColorAlpha_id67;
    float3 lightDirectionWS_id38;
    float3 lightColor_id39;
    float3 lightColorNdotL_id40;
    float3 envLightDiffuseColor_id41;
    float3 envLightSpecularColor_id42;
    float lightDirectAmbientOcclusion_id44;
    float NdotL_id43;
    float NdotV_id65;
    float3 shadowColor_id76;
    float3 H_id68;
    float NdotH_id69;
    float LdotH_id70;
    float VdotH_id71;
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
    float4 PositionWS_id19;
    float4 ShadingPosition_id0;
    float DepthVS_id20;
    float3 normalWS_id16;
};
struct VS_OUTPUT 
{
    float4 PositionWS_id19 : POSITION_WS;
    float4 ShadingPosition_id0 : SV_Position;
    float DepthVS_id20 : DEPTH_VS;
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
};
cbuffer PerLighting 
{
    int LightCount_id77;
    DirectionalLightData Lights_id79[TMaxLightCount_id78];
    float2 ShadowMapTextureSize_id81;
    float2 ShadowMapTextureTexelSize_id82;
    float4x4 WorldToShadowCascadeUV_id143[TCascadeCountBase_id141 * TLightCountBase_id142];
    float DepthBiases_id144[TLightCountBase_id142];
    float OffsetScales_id145[TLightCountBase_id142];
    float CascadeDepthSplits_id151[TCascadeCount_id146 * TLightCount_id147];
};
cbuffer PerMaterial 
{
    float4 constantColor_id154;
    float constantFloat_id156;
    float constantFloat_id159;
};
cbuffer Globals 
{
    float2 Texture0TexelSize_id84;
    float2 Texture1TexelSize_id86;
    float2 Texture2TexelSize_id88;
    float2 Texture3TexelSize_id90;
    float2 Texture4TexelSize_id92;
    float2 Texture5TexelSize_id94;
    float2 Texture6TexelSize_id96;
    float2 Texture7TexelSize_id98;
    float2 Texture8TexelSize_id100;
    float2 Texture9TexelSize_id102;
    float Bias_id153;
};
float SampleTextureAndCompare_id73(float2 position, float positionDepth)
{
    return ShadowMapTexture_id80.SampleCmp(LinearClampCompareLessEqualSampler_id115, position, positionDepth);
}
float VisibilityhSchlickGGX_id140(float alphaR, float nDotX)
{
    float k = alphaR * 0.5f;
    return nDotX / (nDotX * (1.0f - k) + k);
}
float3 FresnelSchlick_id122(float3 f0, float3 f90, float lOrVDotH)
{
    return f0 + (f90 - f0) * pow((1 - lOrVDotH), 5);
}
float FilterShadow_id69(float2 position, float positionDepth)
{
    float shadow = 0.0f;
    float2 uv = position * ShadowMapTextureSize_id81;
    float2 base_uv;
    base_uv.x = floor(uv.x + 0.5);
    base_uv.y = floor(uv.y + 0.5);
    float s = (uv.x + 0.5 - base_uv.x);
    float t = (uv.y + 0.5 - base_uv.y);
    base_uv -= float2(0.5, 0.5);
    base_uv *= ShadowMapTextureTexelSize_id82;

    {
        float uw0 = (4 - 3 * s);
        float uw1 = 7;
        float uw2 = (1 + 3 * s);
        float u0 = (3 - 2 * s) / uw0 - 2;
        float u1 = (3 + s) / uw1;
        float u2 = s / uw2 + 2;
        float vw0 = (4 - 3 * t);
        float vw1 = 7;
        float vw2 = (1 + 3 * t);
        float v0 = (3 - 2 * t) / vw0 - 2;
        float v1 = (3 + t) / vw1;
        float v2 = t / vw2 + 2;
        shadow += uw0 * vw0 * SampleTextureAndCompare_id73(base_uv + float2(u0, v0) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw1 * vw0 * SampleTextureAndCompare_id73(base_uv + float2(u1, v0) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw2 * vw0 * SampleTextureAndCompare_id73(base_uv + float2(u2, v0) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw0 * vw1 * SampleTextureAndCompare_id73(base_uv + float2(u0, v1) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw1 * vw1 * SampleTextureAndCompare_id73(base_uv + float2(u1, v1) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw2 * vw1 * SampleTextureAndCompare_id73(base_uv + float2(u2, v1) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw0 * vw2 * SampleTextureAndCompare_id73(base_uv + float2(u0, v2) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw1 * vw2 * SampleTextureAndCompare_id73(base_uv + float2(u1, v2) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw2 * vw2 * SampleTextureAndCompare_id73(base_uv + float2(u2, v2) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow /= 144.0f;
    }
    return shadow;
}
float NormalDistributionGGX_id156(float alphaR, float nDotH)
{
    float alphaR2 = alphaR * alphaR;
    return alphaR2 / (PI_id165 * pow(max(nDotH * nDotH * (alphaR2 - 1) + 1, 0.0001), 2.0f));
}
float VisibilitySmithSchlickGGX_id142(float alphaR, float nDotL, float nDotV)
{
    return VisibilityhSchlickGGX_id140(alphaR, nDotL) * VisibilityhSchlickGGX_id140(alphaR, nDotV) / (nDotL * nDotV);
}
float3 FresnelSchlick_id128(float3 f0, float lOrVDotH)
{
    return FresnelSchlick_id122(f0, 1.0f, lOrVDotH);
}
float ComputeShadowFromCascade_id72(float3 shadowPositionWS, int cascadeIndex, int lightIndex)
{
    float4 shadowPosition = mul(float4(shadowPositionWS, 1), WorldToShadowCascadeUV_id143[cascadeIndex + lightIndex * TCascadeCountBase_id141]);
    shadowPosition.xyz /= shadowPosition.w;
    float depthVS = shadowPosition.z;
    depthVS -= DepthBiases_id144[lightIndex];
    return FilterShadow_id69(shadowPosition.xy, depthVS);
}
float3 GetShadowPositionOffset_id71(float offsetScale, float nDotL, float3 normal)
{
    float normalOffsetScale = saturate(1.0f - nDotL);
    return 2.0f * ShadowMapTextureTexelSize_id82.x * offsetScale * normalOffsetScale * normal;
}
void ComputeShadow_id70(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
float Compute_id238(inout PS_STREAMS streams)
{
    return NormalDistributionGGX_id156(streams.alphaRoughness_id63, streams.NdotH_id69);
}
float Compute_id209(inout PS_STREAMS streams)
{
    return VisibilitySmithSchlickGGX_id142(streams.alphaRoughness_id63, streams.NdotL_id43, streams.NdotV_id65);
}
float3 Compute_id180(inout PS_STREAMS streams, float3 f0)
{
    return FresnelSchlick_id128(f0, streams.LdotH_id70);
}
void ComputeShadow_id64(inout PS_STREAMS streams, int lightIndex)
{
    ComputeShadow_id70(streams, lightIndex);
    int cascadeIndexBase = lightIndex * TCascadeCount_id146;
    int cascadeIndex = 0;

    [unroll]
    for (int i = 0; i < TCascadeCount_id146 - 1; i++)
    {
        [flatten]
        if (streams.DepthVS_id20 > CascadeDepthSplits_id151[cascadeIndexBase + i])
        {
            cascadeIndex = i + 1;
        }
    }
    float shadow = 1.0;
    float3 shadowPosition = streams.PositionWS_id19.xyz;
    shadowPosition += GetShadowPositionOffset_id71(OffsetScales_id145[lightIndex], streams.NdotL_id43, streams.normalWS_id16);
    if (cascadeIndex < TCascadeCount_id146)
    {
        shadow = ComputeShadowFromCascade_id72(shadowPosition, cascadeIndex, lightIndex);
        float nextSplit = CascadeDepthSplits_id151[cascadeIndexBase + cascadeIndex];
        float splitSize = cascadeIndex == 0 ? nextSplit : nextSplit - CascadeDepthSplits_id151[cascadeIndexBase + cascadeIndex - 1];
        float splitDist = (nextSplit - streams.DepthVS_id20) / splitSize;
        float lerpAmt = smoothstep(0.0f, 1.0f, splitDist);
        if (cascadeIndex == TCascadeCount_id146 - 1)
        {
        }
        else if (TBlendCascades_id148)
        {
            float nextShadow = ComputeShadowFromCascade_id72(shadowPosition, cascadeIndex + 1, lightIndex);
            shadow = lerp(nextShadow, shadow, lerpAmt);
        }
    }

    {
        streams.shadowColor_id76 = shadow;
    }
}
void PrepareDirectLightCore_id63(inout PS_STREAMS streams, int lightIndex)
{
    streams.lightColor_id39 = Lights_id79[lightIndex].Color;
    streams.lightDirectionWS_id38 = -Lights_id79[lightIndex].DirectionWS;
}
float GetFilterSquareRoughnessAdjustment_id94(inout PS_STREAMS streams, float3 averageNormal)
{
    float r = length(streams.matNormal_id45);
    float roughnessAdjust = 0.0f;
    if (r < 1.0f)
        roughnessAdjust = 0.5 * (1 - r * r) / (3 * r - r * r * r);
    return roughnessAdjust;
}
void ResetStream_id160()
{
}
float3 ComputeDirectLightContribution_id316(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    float3 fresnel = Compute_id180(streams, specularColor);
    float geometricShadowing = Compute_id209(streams);
    float normalDistribution = Compute_id238(streams);
    float3 reflected = fresnel * geometricShadowing * normalDistribution / 4;
    return reflected * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.y;
}
float3 ComputeDirectLightContribution_id267(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor / PI_id165 * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.x;
}
void PrepareMaterialPerDirectLight_id27(inout PS_STREAMS streams)
{
    streams.H_id68 = normalize(streams.viewWS_id61 + streams.lightDirectionWS_id38);
    streams.NdotH_id69 = max(dot(streams.normalWS_id16, streams.H_id68), 0.0001f);
    streams.LdotH_id70 = max(dot(streams.lightDirectionWS_id38, streams.H_id68), 0.0001f);
    streams.VdotH_id71 = streams.LdotH_id70;
}
void PrepareDirectLight_id170(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id63(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id64(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id168()
{
    return LightCount_id77;
}
int GetMaxLightCount_id171()
{
    return TMaxLightCount_id78;
}
void PrepareMaterialForLightingAndShading_id159(inout PS_STREAMS streams)
{
    streams.lightDirectAmbientOcclusion_id44 = lerp(1.0, streams.matAmbientOcclusion_id51, streams.matAmbientOcclusionDirectLightingFactor_id52);
    streams.matDiffuseVisible_id62 = streams.matDiffuse_id47.rgb * lerp(1.0f, streams.matCavity_id53, streams.matCavityDiffuse_id54) * streams.matDiffuseSpecularAlphaBlend_id58.r * streams.matAlphaBlendColor_id59;
    streams.matSpecularVisible_id64 = streams.matSpecular_id49.rgb * streams.matSpecularIntensity_id50 * lerp(1.0f, streams.matCavity_id53, streams.matCavitySpecular_id55) * streams.matDiffuseSpecularAlphaBlend_id58.g * streams.matAlphaBlendColor_id59;
    streams.NdotV_id65 = max(dot(streams.normalWS_id16, streams.viewWS_id61), 0.0001f);
    float roughness = 1.0f - streams.matGlossiness_id48;
    float roughnessAdjust = GetFilterSquareRoughnessAdjustment_id94(streams, streams.matNormal_id45);
    streams.alphaRoughness_id63 = max(roughness * roughness + roughnessAdjust, 0.001);
}
void ResetLightStream_id158(inout PS_STREAMS streams)
{
    streams.lightDirectionWS_id38 = 0;
    streams.lightColor_id39 = 0;
    streams.lightColorNdotL_id40 = 0;
    streams.envLightDiffuseColor_id41 = 0;
    streams.envLightSpecularColor_id42 = 0;
    streams.lightDirectAmbientOcclusion_id44 = 1.0f;
    streams.NdotL_id43 = 0;
}
void UpdateNormalFromTangentSpace_id19(float3 normalInTangentSpace)
{
}
float4 Compute_id178()
{
    return float4(constantFloat_id159, constantFloat_id159, constantFloat_id159, constantFloat_id159);
}
float4 Compute_id176()
{
    return float4(constantFloat_id156, constantFloat_id156, constantFloat_id156, constantFloat_id156);
}
float4 Compute_id174()
{
    return constantColor_id154;
}
void ResetStream_id163(inout PS_STREAMS streams)
{
    ResetStream_id160();
    streams.matBlend_id37 = 0.0f;
}
void Compute_id347(inout PS_STREAMS streams)
{
    UpdateNormalFromTangentSpace_id19(streams.matNormal_id45);
    ResetLightStream_id158(streams);
    PrepareMaterialForLightingAndShading_id159(streams);
    float3 directLightingContribution = 0;

    {
        const int maxLightCount = GetMaxLightCount_id171();
        int count = GetLightCount_id168();

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id170(streams, i);
            PrepareMaterialPerDirectLight_id27(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id267(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id316(streams);
            }
        }
    }
    float3 environmentLightingContribution = 0;
    streams.shadingColor_id66 += directLightingContribution * PI_id165 + environmentLightingContribution;
    streams.shadingColorAlpha_id67 = streams.matDiffuse_id47.a;
}
void Compute_id332(inout PS_STREAMS streams)
{
    float metalness = Compute_id178().r;
    streams.matSpecular_id49 = lerp(0.02, streams.matDiffuse_id47.rgb, metalness);
    streams.matDiffuse_id47.rgb = lerp(streams.matDiffuse_id47.rgb, 0, metalness);
}
void Compute_id327(inout PS_STREAMS streams)
{
    float glossiness = Compute_id176().r;
    streams.matGlossiness_id48 = glossiness;
}
void Compute_id322(inout PS_STREAMS streams)
{
    float4 colorBase = Compute_id174();
    streams.matDiffuse_id47 = colorBase;
    streams.matColorBase_id46 = colorBase;
}
void ResetStream_id165(inout PS_STREAMS streams)
{
    ResetStream_id163(streams);
    streams.matNormal_id45 = float3(0, 0, 1);
    streams.matColorBase_id46 = 0.0f;
    streams.matDiffuse_id47 = 0.0f;
    streams.matDiffuseVisible_id62 = 0.0f;
    streams.matSpecular_id49 = 0.0f;
    streams.matSpecularVisible_id64 = 0.0f;
    streams.matSpecularIntensity_id50 = 1.0f;
    streams.matGlossiness_id48 = 0.0f;
    streams.alphaRoughness_id63 = 1.0f;
    streams.matAmbientOcclusion_id51 = 1.0f;
    streams.matAmbientOcclusionDirectLightingFactor_id52 = 0.0f;
    streams.matCavity_id53 = 1.0f;
    streams.matCavityDiffuse_id54 = 0.0f;
    streams.matCavitySpecular_id55 = 0.0f;
    streams.matEmissive_id56 = 0.0f;
    streams.matEmissiveIntensity_id57 = 0.0f;
    streams.matDiffuseSpecularAlphaBlend_id58 = 1.0f;
    streams.matAlphaBlendColor_id59 = 1.0f;
    streams.matAlphaDiscard_id60 = 0.0f;
}
void PostTransformPosition_id6()
{
}
void PreTransformPosition_id4()
{
}
void Compute_id60(inout PS_STREAMS streams)
{

    {
        Compute_id322(streams);
    }

    {
        Compute_id327(streams);
    }

    {
        Compute_id332(streams);
    }

    {
        Compute_id347(streams);
    }
}
void ResetStream_id59(inout PS_STREAMS streams)
{
    ResetStream_id165(streams);
    streams.shadingColorAlpha_id67 = 1.0f;
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
float4 Shading_id28(inout PS_STREAMS streams)
{
    streams.viewWS_id61 = normalize(Eye_id28.xyz - streams.PositionWS_id19.xyz);
    streams.shadingColor_id66 = 0;
    ResetStream_id59(streams);
    Compute_id60(streams);
    return float4(streams.shadingColor_id66, streams.shadingColorAlpha_id67);
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
    streams.ColorTarget_id1 = Shading_id28(streams);
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
    streams.DepthVS_id20 = __input__.DepthVS_id20;
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
    __output__.DepthVS_id20 = streams.DepthVS_id20;
    __output__.normalWS_id16 = streams.normalWS_id16;
    return __output__;
}
