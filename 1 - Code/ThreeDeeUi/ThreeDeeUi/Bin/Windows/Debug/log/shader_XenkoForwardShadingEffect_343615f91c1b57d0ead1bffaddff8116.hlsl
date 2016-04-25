/**************************
***** Compiler Parameters *****
***************************
@P EffectName: XenkoForwardShadingEffect
@P   - Material.PixelStageSurfaceShaders: mixin MaterialSurfaceArray [{layers = [mixin MaterialSurfaceDiffuse [{diffuseMap = ComputeColorConstantColorLink<Material.DiffuseValue>}], mixin MaterialSurfaceGlossinessMap<false> [{glossinessMap = ComputeColorConstantFloatLink<Material.GlossinessValue>}], mixin MaterialSurfaceMetalness [{metalnessMap = ComputeColorConstantFloatLink<Material.MetalnessValue>}], mixin MaterialSurfaceLightingAndShading [{surfaces = [MaterialSurfaceShadingDiffuseLambert<false>, mixin MaterialSurfaceShadingSpecularMicrofacet [{fresnelFunction = MaterialSpecularMicrofacetFresnelSchlick}, {geometricShadowingFunction = MaterialSpecularMicrofacetVisibilitySmithSchlickGGX}, {normalDistributionFunction = MaterialSpecularMicrofacetNormalDistributionGGX}]]}]]}]
@P Material.PixelStageStreamInitializer: mixin MaterialStream, MaterialPixelShadingStream
@P LightSkyboxShader.LightDiffuseColor.environmentLights[0]: SphericalHarmonicsEnvironmentColor<3>
@P LightSkyboxShader.LightSpecularColor.environmentLights[0]: RoughnessCubeMapEnvironmentColor
@P Lighting.DirectLightGroups: mixin LightDirectionalGroup<8>, ShadowMapReceiverDirectional<4,8,false,true,false>, ShadowMapFilterPcf<5>
@P Lighting.EnvironmentLights: xkfx LightSkyboxEffect
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
cbuffer PerLighting [Size: 3328]
@C    LightCount_id77 => DirectLightGroup.LightCount.directLightGroups[0]
@C    Lights_id79 => LightDirectionalGroup.Lights.directLightGroups[0]
@C    ShadowMapTextureSize_id81 => ShadowMap.TextureSize.directLightGroups[0]
@C    ShadowMapTextureTexelSize_id82 => ShadowMap.TextureTexelSize.directLightGroups[0]
@C    WorldToShadowCascadeUV_id143 => ShadowMapReceiverBase.WorldToShadowCascadeUV.directLightGroups[0]
@C    DepthBiases_id144 => ShadowMapReceiverBase.DepthBiases.directLightGroups[0]
@C    OffsetScales_id145 => ShadowMapReceiverBase.OffsetScales.directLightGroups[0]
@C    CascadeDepthSplits_id151 => ShadowMapReceiverDirectional.CascadeDepthSplits.directLightGroups[0]
@C    SphericalColors_id155 => SphericalHarmonicsEnvironmentColor.SphericalColors.lightDiffuseColor.environmentLights[0]
@C    MipCount_id156 => RoughnessCubeMapEnvironmentColor.MipCount.lightSpecularColor.environmentLights[0]
@C    SkyMatrix_id158 => LightSkyboxShader.SkyMatrix.environmentLights[0]
@C    Intensity_id159 => LightSkyboxShader.Intensity.environmentLights[0]
cbuffer PerMaterial [Size: 32]
@C    constantColor_id162 => Material.DiffuseValue
@C    constantFloat_id164 => Material.GlossinessValue
@C    constantFloat_id167 => Material.MetalnessValue
***************************
******  Resources    ******
***************************
@R    ShadowMapTexture_id80 => ShadowMap.Texture.directLightGroups[0] [Stage: None, Slot: (-1--1)]
@R    CubeMap_id157 => RoughnessCubeMapEnvironmentColor.CubeMap.lightSpecularColor.environmentLights[0] [Stage: None, Slot: (-1--1)]
@R    PerLighting => PerLighting [Stage: None, Slot: (-1--1)]
@R    PerMaterial => PerMaterial [Stage: None, Slot: (-1--1)]
@R    PerView => PerView [Stage: Vertex, Slot: (0-0)]
@R    PerDraw => PerDraw [Stage: Vertex, Slot: (1-1)]
@R    LinearSampler_id113 => Texturing.LinearSampler [Stage: Pixel, Slot: (0-0)]
@R    LinearClampCompareLessEqualSampler_id115 => Texturing.LinearClampCompareLessEqualSampler [Stage: Pixel, Slot: (1-1)]
@R    ShadowMapTexture_id80 => ShadowMap.Texture.directLightGroups[0] [Stage: Pixel, Slot: (0-0)]
@R    CubeMap_id157 => RoughnessCubeMapEnvironmentColor.CubeMap.lightSpecularColor.environmentLights[0] [Stage: Pixel, Slot: (1-1)]
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
@S    LightSkyboxShader => 391f62673b683b69a82208c78b705385
@S    IComputeEnvironmentColor => 01d82bdacff2fbc72e3609d9f706cd68
@S    SphericalHarmonicsEnvironmentColor => db5c3b6adf208dee862521f0f748c7b8
@S    RoughnessCubeMapEnvironmentColor => 2c4bb1766c03ea96240306a47701eb9c
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
#line 584 "C:\Users\jason\Documents\Work\Uni\three-dee\1 - Code\ThreeDeeUi\ThreeDeeUi\Bin\Windows\Debug\log\shader_XenkoForwardShadingEffect_343615f91c1b57d0ead1bffaddff8116.hlsl"
dp4 r0.x, v0.xyzw, cb1[0].xyzw  // r0.x <- streams.PositionWS_id19.x
dp4 r0.y, v0.xyzw, cb1[1].xyzw  // r0.y <- streams.PositionWS_id19.y
dp4 r0.z, v0.xyzw, cb1[2].xyzw  // r0.z <- streams.PositionWS_id19.z
dp4 r0.w, v0.xyzw, cb1[3].xyzw  // r0.w <- streams.PositionWS_id19.w

#line 648
mov o0.xyzw, r0.xyzw

#line 574
dp4 r1.x, r0.xyzw, cb0[19].xyzw  // r1.x <- streams.ShadingPosition_id0.w

#line 648
mov o1.w, r1.x
mov o2.x, r1.x

#line 574
dp4 o1.x, r0.xyzw, cb0[16].xyzw
dp4 o1.y, r0.xyzw, cb0[17].xyzw
dp4 o1.z, r0.xyzw, cb0[18].xyzw

#line 617
dp3 o2.y, v1.xyzx, cb1[8].xyzx
dp3 o2.z, v1.xyzx, cb1[9].xyzx
dp3 o2.w, v1.xyzx, cb1[10].xyzx

#line 648
ret 
// Approximately 15 instruction slots used
@G    Pixel => 7b4ecc887b50c2bad316e2fb24e96b1a
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
//   float3 SphericalColors_id155[9];   // Offset: 3104 Size:   140
//   float MipCount_id156;              // Offset: 3244 Size:     4
//   float4x4 SkyMatrix_id158;          // Offset: 3248 Size:    64
//   float Intensity_id159;             // Offset: 3312 Size:     4
//
// }
//
// cbuffer PerMaterial
// {
//
//   float4 constantColor_id162;        // Offset:    0 Size:    16
//   float constantFloat_id164;         // Offset:   16 Size:     4
//   float constantFloat_id167;         // Offset:   20 Size:     4
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// LinearSampler_id113               sampler      NA          NA    0        1
// LinearClampCompareLessEqualSampler_id115  sampler_c      NA          NA    1        1
// ShadowMapTexture_id80             texture  float4          2d    0        1
// CubeMap_id157                     texture  float4        cube    1        1
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
dcl_constantbuffer cb1[208], dynamicIndexed
dcl_constantbuffer cb2[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_comparison
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texturecube (float,float,float,float) t1
dcl_input_ps linear v0.xyz
dcl_input_ps linear v2.x
dcl_input_ps linear v2.yzw
dcl_output o0.xyzw
dcl_temps 18
//
// Initial variable locations:
//   v0.x <- __input__.PositionWS_id19.x; v0.y <- __input__.PositionWS_id19.y; v0.z <- __input__.PositionWS_id19.z; v0.w <- __input__.PositionWS_id19.w; 
//   v1.x <- __input__.ShadingPosition_id0.x; v1.y <- __input__.ShadingPosition_id0.y; v1.z <- __input__.ShadingPosition_id0.z; v1.w <- __input__.ShadingPosition_id0.w; 
//   v2.x <- __input__.DepthVS_id20; v2.y <- __input__.normalWS_id16.x; v2.z <- __input__.normalWS_id16.y; v2.w <- __input__.normalWS_id16.z; 
//   o0.x <- <PSMain return value>.ColorTarget_id1.x; o0.y <- <PSMain return value>.ColorTarget_id1.y; o0.z <- <PSMain return value>.ColorTarget_id1.z; o0.w <- <PSMain return value>.ColorTarget_id1.w
//
#line 613 "C:\Users\jason\Documents\Work\Uni\three-dee\1 - Code\ThreeDeeUi\ThreeDeeUi\Bin\Windows\Debug\log\shader_XenkoForwardShadingEffect_343615f91c1b57d0ead1bffaddff8116.hlsl"
dp3 r0.x, v2.yzwy, v2.yzwy
rsq r0.x, r0.x
mul r0.xyz, r0.xxxx, v2.yzwy  // r0.x <- streams.normalWS_id16.x; r0.y <- streams.normalWS_id16.y; r0.z <- streams.normalWS_id16.z

#line 588
add r1.xyz, -v0.xyzx, cb0[21].xyzx
dp3 r0.w, r1.xyzx, r1.xyzx
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, r1.xyzx  // r1.x <- streams.viewWS_id61.x; r1.y <- streams.viewWS_id61.y; r1.z <- streams.viewWS_id61.z

#line 504
add r2.xyz, cb2[0].xyzx, l(-0.020000, -0.020000, -0.020000, 0.000000)
mad r2.xyz, cb2[1].yyyy, r2.xyzx, l(0.020000, 0.020000, 0.020000, 0.000000)  // r2.x <- streams.matSpecular_id49.x; r2.y <- streams.matSpecular_id49.y; r2.z <- streams.matSpecular_id49.z
mad r3.xyz, cb2[1].yyyy, -cb2[0].xyzx, cb2[0].xyzx  // r3.x <- streams.matDiffuse_id47.x; r3.y <- streams.matDiffuse_id47.y; r3.z <- streams.matDiffuse_id47.z

#line 421
dp3 r0.w, r0.xyzx, r1.xyzx
max r0.w, r0.w, l(0.000100)  // r0.w <- streams.NdotV_id65
add r1.w, -cb2[1].x, l(1.000000)  // r1.w <- roughness
mul r1.w, r1.w, r1.w
max r1.w, r1.w, l(0.001000)  // r1.w <- streams.alphaRoughness_id63

#line 232
add r2.w, cb1[17].z, cb1[17].z

#line 223
mov r4.w, l(1.000000)

#line 467
mov r5.xyz, v0.xyzx  // r5.x <- streams.PositionWS_id19.x; r5.y <- streams.PositionWS_id19.y; r5.z <- streams.PositionWS_id19.z
mov r5.w, v2.x  // r5.w <- streams.DepthVS_id20
mov r6.xyz, r0.xyzx  // r6.x <- streams.normalWS_id16.x; r6.y <- streams.normalWS_id16.y; r6.z <- streams.normalWS_id16.z
mov r7.xyz, r1.xyzx  // r7.x <- streams.viewWS_id61.x; r7.y <- streams.viewWS_id61.y; r7.z <- streams.viewWS_id61.z
mov r8.xyz, r3.xyzx  // r8.x <- streams.matDiffuseVisible_id62.x; r8.y <- streams.matDiffuseVisible_id62.y; r8.z <- streams.matDiffuseVisible_id62.z
mov r9.xyz, r2.xyzx  // r9.x <- streams.matSpecularVisible_id64.x; r9.y <- streams.matSpecularVisible_id64.y; r9.z <- streams.matSpecularVisible_id64.z
mov r10.x, r1.w  // r10.x <- streams.alphaRoughness_id63
mov r10.z, r0.w  // r10.z <- streams.NdotV_id65
mov r11.xyz, l(0,0,0,0)  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z
mov r3.w, l(0)  // r3.w <- i
loop 
  ige r6.w, r3.w, l(8)
  breakc_nz r6.w
  ige r6.w, r3.w, cb1[0].x
  if_nz r6.w
    break 
  endif 

#line 307
  ishl r6.w, r3.w, l(1)
  ishl r7.w, r3.w, l(2)  // r7.w <- cascadeIndexBase

#line 404
  dp3 r8.w, r6.xyzx, -cb1[r6.w + 1].xyzx
  max r8.w, r8.w, l(0.000100)  // r8.w <- streams.NdotL_id43

#line 314
  lt r9.w, cb1[r7.w + 162].x, r5.w

#line 317
  and r9.w, r9.w, l(1)  // r9.w <- cascadeIndex

#line 314
  iadd r10.yw, r7.wwww, l(0, 1, 0, 2)
  lt r10.y, cb1[r10.y + 162].x, r5.w

#line 317
  movc r9.w, r10.y, l(2), r9.w

#line 314
  lt r10.y, cb1[r10.w + 162].x, r5.w

#line 317
  movc r9.w, r10.y, l(3), r9.w

#line 231
  add r10.y, -r8.w, l(1.000000)
  max r10.y, r10.y, l(0.000000)  // r10.y <- normalOffsetScale
  mul r10.w, r2.w, cb1[r3.w + 154].x
  mul r10.y, r10.y, r10.w

#line 321
  mad r4.xyz, r10.yyyy, r6.xyzx, r5.xyzx  // r4.x <- shadowPosition.x; r4.y <- shadowPosition.y; r4.z <- shadowPosition.z

#line 223
  iadd r7.w, r7.w, r9.w
  ishl r7.w, r7.w, l(2)
  dp4 r12.x, r4.xyzw, cb1[r7.w + 18].xyzw  // r12.x <- shadowPosition.x
  dp4 r12.y, r4.xyzw, cb1[r7.w + 19].xyzw  // r12.y <- shadowPosition.y
  dp4 r12.z, r4.xyzw, cb1[r7.w + 20].xyzw  // r12.z <- shadowPosition.z
  dp4 r4.x, r4.xyzw, cb1[r7.w + 21].xyzw  // r4.x <- shadowPosition.w
  div r4.xyz, r12.xyzx, r4.xxxx  // r4.x <- shadowPosition.x; r4.y <- shadowPosition.y; r4.z <- shadowPosition.z
  add r4.z, r4.z, -cb1[r3.w + 146].x  // r4.z <- depthVS

#line 176
  mad r4.xy, r4.xyxx, cb1[17].xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  round_ni r10.yw, r4.xxxy  // r10.y <- base_uv.x; r10.w <- base_uv.y
  add r4.xy, r4.xyxx, -r10.ywyy  // r4.x <- s; r4.y <- t
  add r10.yw, r10.yyyw, l(0.000000, -0.500000, 0.000000, -0.500000)
  mul r10.yw, r10.yyyw, cb1[17].zzzw

#line 189
  mad r12.xy, -r4.yxyy, l(3.000000, 3.000000, 0.000000, 0.000000), l(4.000000, 4.000000, 0.000000, 0.000000)  // r12.y <- uw0; r12.x <- vw0
  mad r12.zw, r4.xxxy, l(0.000000, 0.000000, 3.000000, 3.000000), l(0.000000, 0.000000, 1.000000, 1.000000)  // r12.z <- uw2; r12.w <- vw2
  mad r13.xy, -r4.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(3.000000, 3.000000, 0.000000, 0.000000)
  div r13.xy, r13.xyxx, r12.yxyy
  add r13.zw, r4.xxxy, l(0.000000, 0.000000, 3.000000, 3.000000)
  div r4.xy, r4.xyxx, r12.zwzz
  add r14.xw, r13.xxxy, l(-2.000000, 0.000000, 0.000000, -2.000000)  // r14.x <- u0; r14.w <- v0
  mul r14.yz, r13.wwzw, l(0.000000, 0.142857, 0.142857, 0.000000)  // r14.z <- u1; r14.y <- v1
  add r13.xy, r4.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000)  // r13.x <- u2; r13.y <- v2
  mul r4.x, r12.x, r12.y
  mad r15.xyzw, r14.xwzw, cb1[17].zwzw, r10.ywyw

#line 159
  sample_c r4.y, r15.xyxx, t0.xxxx, s1, r4.z  // r4.y <- <SampleTextureAndCompare_id79 return value>

#line 198
  mul r15.xy, r12.xyxx, l(7.000000, 7.000000, 0.000000, 0.000000)

#line 159
  sample_c r7.w, r15.zwzz, t0.xxxx, s1, r4.z  // r7.w <- <SampleTextureAndCompare_id79 return value>

#line 196
  mul r7.w, r7.w, r15.x
  mad r4.x, r4.x, r4.y, r7.w  // r4.x <- shadow

#line 201
  mul r12.xy, r12.xyxx, r12.zwzz
  mov r13.zw, r14.wwwy
  mad r16.xyzw, r13.xzxw, cb1[17].zwzw, r10.ywyw

#line 159
  sample_c r4.y, r16.xyxx, t0.xxxx, s1, r4.z  // r4.y <- <SampleTextureAndCompare_id79 return value>

#line 197
  mad r4.x, r12.x, r4.y, r4.x
  mad r17.xyzw, r14.xyzy, cb1[17].zwzw, r10.ywyw

#line 159
  sample_c r4.y, r17.xyxx, t0.xxxx, s1, r4.z

#line 198
  mad r4.x, r15.y, r4.y, r4.x

#line 159
  sample_c r4.y, r17.zwzz, t0.xxxx, s1, r4.z

#line 199
  mad r4.x, r4.y, l(49.000000), r4.x

#line 202
  mul r13.zw, r12.zzzw, l(0.000000, 0.000000, 7.000000, 7.000000)

#line 159
  sample_c r4.y, r16.zwzz, t0.xxxx, s1, r4.z

#line 200
  mad r4.x, r13.z, r4.y, r4.x
  mov r14.y, r13.y
  mad r14.xyzw, r14.xyzy, cb1[17].zwzw, r10.ywyw

#line 159
  sample_c r4.y, r14.xyxx, t0.xxxx, s1, r4.z

#line 201
  mad r4.x, r12.y, r4.y, r4.x

#line 159
  sample_c r4.y, r14.zwzz, t0.xxxx, s1, r4.z

#line 202
  mad r4.x, r13.w, r4.y, r4.x
  mul r4.y, r12.w, r12.z
  mad r10.yw, r13.xxxy, cb1[17].zzzw, r10.yyyw

#line 159
  sample_c r4.z, r10.ywyy, t0.xxxx, s1, r4.z  // r4.z <- <SampleTextureAndCompare_id79 return value>

#line 203
  mad r4.x, r4.y, r4.z, r4.x
  mul r4.x, r4.x, l(0.006944)

#line 406
  mul r4.xyz, r4.xxxx, cb1[r6.w + 2].xyzx
  mul r4.xyz, r8.wwww, r4.xyzx  // r4.x <- streams.lightColorNdotL_id40.x; r4.y <- streams.lightColorNdotL_id40.y; r4.z <- streams.lightColorNdotL_id40.z

#line 396
  add r12.xyz, r7.xyzx, -cb1[r6.w + 1].xyzx
  dp3 r7.w, r12.xyzx, r12.xyzx
  rsq r7.w, r7.w
  mul r12.xyz, r7.wwww, r12.xyzx  // r12.x <- streams.H_id68.x; r12.y <- streams.H_id68.y; r12.z <- streams.H_id68.z
  dp3 r7.w, r6.xyzx, r12.xyzx
  max r7.w, r7.w, l(0.000100)  // r7.w <- streams.NdotH_id69
  dp3 r6.w, -cb1[r6.w + 1].xyzx, r12.xyzx
  max r6.w, r6.w, l(0.000100)  // r6.w <- streams.LdotH_id70

#line 392
  mul r12.xyz, r4.xyzx, r8.xyzx

#line 477
  mad r12.xyz, r12.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r11.xyzx  // r12.x <- directLightingContribution.x; r12.y <- directLightingContribution.y; r12.z <- directLightingContribution.z

#line 168
  add r13.xyz, -r9.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r6.w, -r6.w, l(1.000000)
  mul r9.w, r6.w, r6.w
  mul r9.w, r9.w, r9.w
  mul r6.w, r6.w, r9.w
  mad r13.xyz, r13.xyzx, r6.wwww, r9.xyzx  // r13.x <- <FresnelSchlick_id140 return value>.x; r13.y <- <FresnelSchlick_id140 return value>.y; r13.z <- <FresnelSchlick_id140 return value>.z

#line 163
  mul r6.w, r10.x, l(0.500000)  // r6.w <- k
  mad r9.w, -r10.x, l(0.500000), l(1.000000)
  mad r10.y, r8.w, r9.w, r6.w
  div r10.y, r8.w, r10.y  // r10.y <- <VisibilityhSchlickGGX_id158 return value>
  mad r6.w, r10.z, r9.w, r6.w
  div r6.w, r10.z, r6.w  // r6.w <- <VisibilityhSchlickGGX_id158 return value>

#line 215
  mul r6.w, r6.w, r10.y
  mul r8.w, r10.z, r8.w
  div r6.w, r6.w, r8.w  // r6.w <- <VisibilitySmithSchlickGGX_id160 return value>

#line 210
  mul r8.w, r10.x, r10.x  // r8.w <- alphaR2
  mul r7.w, r7.w, r7.w
  mad r9.w, r10.x, r10.x, l(-1.000000)
  mad r7.w, r7.w, r9.w, l(1.000000)
  max r7.w, r7.w, l(0.000100)
  mul r7.w, r7.w, r7.w
  mul r7.w, r7.w, l(3.141593)
  div r7.w, r8.w, r7.w  // r7.w <- <NormalDistributionGGX_id174 return value>

#line 386
  mul r13.xyz, r6.wwww, r13.xyzx
  mul r13.xyz, r7.wwww, r13.xyzx
  mul r4.xyz, r4.xyzx, r13.xyzx

#line 481
  mad r11.xyz, r4.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r12.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 467
  iadd r3.w, r3.w, l(1)

#line 483
endloop 

#line 372
dp3 r2.w, r0.xyzx, cb1[203].xyzx  // r2.w <- sampleDirection.x
dp3 r3.w, r0.xyzx, cb1[204].xyzx  // r3.w <- sampleDirection.y
dp3 r4.x, r0.xyzx, cb1[205].xyzx  // r4.x <- sampleDirection.z

#line 273
mul r4.y, r3.w, r3.w  // r4.y <- y2
mul r4.z, r4.x, r4.x  // r4.z <- z2

#line 278
mad r5.xyz, cb1[195].xyzx, r3.wwww, cb1[194].xyzx  // r5.x <- color.x; r5.y <- color.y; r5.z <- color.z
mad r5.xyz, cb1[196].xyzx, -r4.xxxx, r5.xyzx
mad r5.xyz, cb1[197].xyzx, r2.wwww, r5.xyzx

#line 283
mul r6.xyz, r3.wwww, cb1[198].xyzx
mad r5.xyz, r6.xyzx, r2.wwww, r5.xyzx
mul r6.xyz, r3.wwww, cb1[199].xyzx
mad r5.xyz, r6.xyzx, -r4.xxxx, r5.xyzx
mad r3.w, r4.z, l(3.000000), l(-1.000000)
mad r5.xyz, cb1[200].xyzx, r3.wwww, r5.xyzx
mul r6.xyz, r2.wwww, cb1[201].xyzx
mad r4.xzw, r6.xxyz, -r4.xxxx, r5.xxyz  // r4.x <- color.x; r4.z <- color.y; r4.w <- color.z
mad r2.w, r2.w, r2.w, -r4.y
mad r4.xyz, cb1[202].xyzx, r2.wwww, r4.xzwx  // r4.y <- color.y; r4.z <- color.z

#line 374
mul r4.xyz, r4.xyzx, cb1[207].xxxx  // r4.x <- streams.envLightDiffuseColor_id41.x; r4.y <- streams.envLightDiffuseColor_id41.y; r4.z <- streams.envLightDiffuseColor_id41.z
dp3 r2.w, -r1.xyzx, r0.xyzx
add r2.w, r2.w, r2.w
mad r0.xyz, r0.xyzx, -r2.wwww, -r1.xyzx  // r0.x <- sampleDirection.x; r0.y <- sampleDirection.y; r0.z <- sampleDirection.z
dp3 r1.x, r0.xyzx, cb1[203].xyzx  // r1.x <- sampleDirection.x
dp3 r1.y, r0.xyzx, cb1[204].xyzx  // r1.y <- sampleDirection.y
dp3 r0.x, r0.xyzx, cb1[205].xyzx  // r0.x <- sampleDirection.z
mov r1.z, -r0.x  // r1.z <- sampleDirection.z

#line 264
sqrt r0.x, r1.w
mul r0.x, r0.x, cb1[202].w  // r0.x <- mipLevel
sample_l r5.xyzw, r1.xyzx, t1.xyzw, s0, r0.x  // r5.x <- <Compute_id198 return value>.x; r5.y <- <Compute_id198 return value>.y; r5.z <- <Compute_id198 return value>.z

#line 378
mul r0.xyz, r5.xyzx, cb1[207].xxxx  // r0.x <- streams.envLightSpecularColor_id42.x; r0.y <- streams.envLightSpecularColor_id42.y; r0.z <- streams.envLightSpecularColor_id42.z

#line 240
add r1.x, -r1.w, l(1.000000)  // r1.x <- x

#line 248
mul r1.y, r1.x, r1.x

#line 256
mul r1.z, r1.y, l(1.895000)

#line 248
mad r1.z, r1.x, l(-0.168800), r1.z
mad r1.w, r0.w, l(-4.853000), l(0.990300)
mul r2.w, r0.w, r0.w
mad r1.w, r2.w, l(8.404000), r1.w
mul r3.w, r0.w, r2.w
mad r1.w, r3.w, l(-5.069000), r1.w
min_sat r1.z, r1.w, r1.z  // r1.z <- bias

#line 256
mad r1.w, r1.x, l(1.699000), l(0.604500)
mad r1.w, r0.w, l(-0.522800), r1.w
mad r1.w, r1.y, l(-3.603000), r1.w
mul r0.w, r0.w, r1.x
mad r0.w, r0.w, l(1.404000), r1.w
mad r0.w, r2.w, l(0.193900), r0.w
mul r1.x, r1.x, r1.y
mad_sat r0.w, r1.x, l(2.661000), r0.w  // r0.w <- delta
add r0.w, -r1.z, r0.w  // r0.w <- scale
mul_sat r1.x, r2.y, l(50.000000)
mul r1.x, r1.x, r1.z  // r1.x <- bias
mad r1.xyz, r2.xyzx, r0.wwww, r1.xxxx  // r1.x <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id175 return value>.x; r1.y <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id175 return value>.y; r1.z <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id175 return value>.z

#line 362
mul r0.xyz, r0.xyzx, r1.xyzx  // r0.x <- <ComputeEnvironmentLightContribution_id348 return value>.x; r0.y <- <ComputeEnvironmentLightContribution_id348 return value>.y; r0.z <- <ComputeEnvironmentLightContribution_id348 return value>.z

#line 495
mad r0.xyz, r3.xyzx, r4.xyzx, r0.xyzx  // r0.x <- environmentLightingContribution.x; r0.y <- environmentLightingContribution.y; r0.z <- environmentLightingContribution.z

#line 498
mad o0.xyz, r11.xyzx, l(3.141593, 3.141593, 3.141593, 0.000000), r0.xyzx

#line 634
mov o0.w, cb2[0].w
ret 
// Approximately 201 instruction slots used
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
const static int TOrder_id154 = 3;
const static bool TInvert_id165 = false;
const static bool TIsEnergyConservative_id171 = false;
static const float PI_id173 = 3.14159265358979323846;
Texture2D ShadowMapTexture_id80;
SamplerState LinearSampler_id113 
{
    Filter = MIN_MAG_MIP_LINEAR;
};
SamplerComparisonState LinearClampCompareLessEqualSampler_id115 
{
    Filter = COMPARISON_MIN_MAG_LINEAR_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
    ComparisonFunc = LessEqual;
};
TextureCube CubeMap_id157;
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
    float3 SphericalColors_id155[TOrder_id154 * TOrder_id154];
    float MipCount_id156;
    float4x4 SkyMatrix_id158;
    float Intensity_id159;
};
cbuffer PerMaterial 
{
    float4 constantColor_id162;
    float constantFloat_id164;
    float constantFloat_id167;
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
float SampleTextureAndCompare_id79(float2 position, float positionDepth)
{
    return ShadowMapTexture_id80.SampleCmp(LinearClampCompareLessEqualSampler_id115, position, positionDepth);
}
float VisibilityhSchlickGGX_id158(float alphaR, float nDotX)
{
    float k = alphaR * 0.5f;
    return nDotX / (nDotX * (1.0f - k) + k);
}
float3 FresnelSchlick_id140(float3 f0, float3 f90, float lOrVDotH)
{
    return f0 + (f90 - f0) * pow((1 - lOrVDotH), 5);
}
float FilterShadow_id75(float2 position, float positionDepth)
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
        shadow += uw0 * vw0 * SampleTextureAndCompare_id79(base_uv + float2(u0, v0) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw1 * vw0 * SampleTextureAndCompare_id79(base_uv + float2(u1, v0) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw2 * vw0 * SampleTextureAndCompare_id79(base_uv + float2(u2, v0) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw0 * vw1 * SampleTextureAndCompare_id79(base_uv + float2(u0, v1) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw1 * vw1 * SampleTextureAndCompare_id79(base_uv + float2(u1, v1) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw2 * vw1 * SampleTextureAndCompare_id79(base_uv + float2(u2, v1) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw0 * vw2 * SampleTextureAndCompare_id79(base_uv + float2(u0, v2) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw1 * vw2 * SampleTextureAndCompare_id79(base_uv + float2(u1, v2) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow += uw2 * vw2 * SampleTextureAndCompare_id79(base_uv + float2(u2, v2) * ShadowMapTextureTexelSize_id82, positionDepth);
        shadow /= 144.0f;
    }
    return shadow;
}
float NormalDistributionGGX_id174(float alphaR, float nDotH)
{
    float alphaR2 = alphaR * alphaR;
    return alphaR2 / (PI_id173 * pow(max(nDotH * nDotH * (alphaR2 - 1) + 1, 0.0001), 2.0f));
}
float VisibilitySmithSchlickGGX_id160(float alphaR, float nDotL, float nDotV)
{
    return VisibilityhSchlickGGX_id158(alphaR, nDotL) * VisibilityhSchlickGGX_id158(alphaR, nDotV) / (nDotL * nDotV);
}
float3 FresnelSchlick_id146(float3 f0, float lOrVDotH)
{
    return FresnelSchlick_id140(f0, 1.0f, lOrVDotH);
}
float ComputeShadowFromCascade_id78(float3 shadowPositionWS, int cascadeIndex, int lightIndex)
{
    float4 shadowPosition = mul(float4(shadowPositionWS, 1), WorldToShadowCascadeUV_id143[cascadeIndex + lightIndex * TCascadeCountBase_id141]);
    shadowPosition.xyz /= shadowPosition.w;
    float depthVS = shadowPosition.z;
    depthVS -= DepthBiases_id144[lightIndex];
    return FilterShadow_id75(shadowPosition.xy, depthVS);
}
float3 GetShadowPositionOffset_id77(float offsetScale, float nDotL, float3 normal)
{
    float normalOffsetScale = saturate(1.0f - nDotL);
    return 2.0f * ShadowMapTextureTexelSize_id82.x * offsetScale * normalOffsetScale * normal;
}
void ComputeShadow_id76(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
float3 EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id175(float3 specularColor, float alphaR, float nDotV)
{
    float x = 1 - alphaR;
    float y = nDotV;
    float b1 = -0.1688;
    float b2 = 1.895;
    float b3 = 0.9903;
    float b4 = -4.853;
    float b5 = 8.404;
    float b6 = -5.069;
    float bias = saturate(min(b1 * x + b2 * x * x, b3 + b4 * y + b5 * y * y + b6 * y * y * y));
    float d0 = 0.6045;
    float d1 = 1.699;
    float d2 = -0.5228;
    float d3 = -3.603;
    float d4 = 1.404;
    float d5 = 0.1939;
    float d6 = 2.661;
    float delta = saturate(d0 + d1 * x + d2 * y + d3 * x * x + d4 * x * y + d5 * y * y + d6 * x * x * x);
    float scale = delta - bias;
    bias *= saturate(50.0 * specularColor.y);
    return specularColor * scale + bias;
}
float4 Compute_id198(inout PS_STREAMS streams, float3 direction)
{
    float alpha = streams.alphaRoughness_id63;
    float mipLevel = sqrt(alpha) * MipCount_id156;
    return CubeMap_id157.SampleLevel(LinearSampler_id113, direction, mipLevel);
}
float4 Compute_id193(float3 direction)
{
    float x = direction.x;
    float y = direction.y;
    float z = direction.z;
    float x2 = x * x;
    float y2 = y * y;
    float z2 = z * z;
    float3 color = SphericalColors_id155[0];

    {
        color += SphericalColors_id155[1] * y;
        color += SphericalColors_id155[2] * z;
        color += SphericalColors_id155[3] * x;

        {
            color += SphericalColors_id155[4] * y * x;
            color += SphericalColors_id155[5] * y * z;
            color += SphericalColors_id155[6] * (3.0 * z2 - 1.0);
            color += SphericalColors_id155[7] * x * z;
            color += SphericalColors_id155[8] * (x2 - y2);
        }
    }
    return float4(color, 1);
}
float Compute_id269(inout PS_STREAMS streams)
{
    return NormalDistributionGGX_id174(streams.alphaRoughness_id63, streams.NdotH_id69);
}
float Compute_id240(inout PS_STREAMS streams)
{
    return VisibilitySmithSchlickGGX_id160(streams.alphaRoughness_id63, streams.NdotL_id43, streams.NdotV_id65);
}
float3 Compute_id211(inout PS_STREAMS streams, float3 f0)
{
    return FresnelSchlick_id146(f0, streams.LdotH_id70);
}
void ComputeShadow_id70(inout PS_STREAMS streams, int lightIndex)
{
    ComputeShadow_id76(streams, lightIndex);
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
    shadowPosition += GetShadowPositionOffset_id77(OffsetScales_id145[lightIndex], streams.NdotL_id43, streams.normalWS_id16);
    if (cascadeIndex < TCascadeCount_id146)
    {
        shadow = ComputeShadowFromCascade_id78(shadowPosition, cascadeIndex, lightIndex);
        float nextSplit = CascadeDepthSplits_id151[cascadeIndexBase + cascadeIndex];
        float splitSize = cascadeIndex == 0 ? nextSplit : nextSplit - CascadeDepthSplits_id151[cascadeIndexBase + cascadeIndex - 1];
        float splitDist = (nextSplit - streams.DepthVS_id20) / splitSize;
        float lerpAmt = smoothstep(0.0f, 1.0f, splitDist);
        if (cascadeIndex == TCascadeCount_id146 - 1)
        {
        }
        else if (TBlendCascades_id148)
        {
            float nextShadow = ComputeShadowFromCascade_id78(shadowPosition, cascadeIndex + 1, lightIndex);
            shadow = lerp(nextShadow, shadow, lerpAmt);
        }
    }

    {
        streams.shadowColor_id76 = shadow;
    }
}
void PrepareDirectLightCore_id69(inout PS_STREAMS streams, int lightIndex)
{
    streams.lightColor_id39 = Lights_id79[lightIndex].Color;
    streams.lightDirectionWS_id38 = -Lights_id79[lightIndex].DirectionWS;
}
float GetFilterSquareRoughnessAdjustment_id112(inout PS_STREAMS streams, float3 averageNormal)
{
    float r = length(streams.matNormal_id45);
    float roughnessAdjust = 0.0f;
    if (r < 1.0f)
        roughnessAdjust = 0.5 * (1 - r * r) / (3 * r - r * r * r);
    return roughnessAdjust;
}
void ResetStream_id178()
{
}
float3 ComputeEnvironmentLightContribution_id348(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    return EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id175(specularColor, streams.alphaRoughness_id63, streams.NdotV_id65) * streams.envLightSpecularColor_id42;
}
float3 ComputeEnvironmentLightContribution_id299(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor * streams.envLightDiffuseColor_id41;
}
void PrepareEnvironmentLight_id204(inout PS_STREAMS streams)
{
    float ambientAccessibility = streams.matAmbientOcclusion_id51;
    float3 sampleDirection = mul(streams.normalWS_id16, (float3x3)SkyMatrix_id158);
    sampleDirection = float3(sampleDirection.xy, -sampleDirection.z);
    streams.envLightDiffuseColor_id41 = Compute_id193(sampleDirection).rgb * Intensity_id159 * ambientAccessibility * streams.matDiffuseSpecularAlphaBlend_id58.x;
    sampleDirection = reflect(-streams.viewWS_id61, streams.normalWS_id16);
    sampleDirection = mul(sampleDirection, (float3x3)SkyMatrix_id158);
    sampleDirection = float3(sampleDirection.xy, -sampleDirection.z);
    streams.envLightSpecularColor_id42 = Compute_id198(streams, sampleDirection).rgb * Intensity_id159 * ambientAccessibility * streams.matDiffuseSpecularAlphaBlend_id58.y;
}
float3 ComputeDirectLightContribution_id347(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    float3 fresnel = Compute_id211(streams, specularColor);
    float geometricShadowing = Compute_id240(streams);
    float normalDistribution = Compute_id269(streams);
    float3 reflected = fresnel * geometricShadowing * normalDistribution / 4;
    return reflected * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.y;
}
float3 ComputeDirectLightContribution_id298(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor / PI_id173 * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.x;
}
void PrepareMaterialPerDirectLight_id27(inout PS_STREAMS streams)
{
    streams.H_id68 = normalize(streams.viewWS_id61 + streams.lightDirectionWS_id38);
    streams.NdotH_id69 = max(dot(streams.normalWS_id16, streams.H_id68), 0.0001f);
    streams.LdotH_id70 = max(dot(streams.lightDirectionWS_id38, streams.H_id68), 0.0001f);
    streams.VdotH_id71 = streams.LdotH_id70;
}
void PrepareDirectLight_id188(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id69(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id70(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id186()
{
    return LightCount_id77;
}
int GetMaxLightCount_id189()
{
    return TMaxLightCount_id78;
}
void PrepareMaterialForLightingAndShading_id177(inout PS_STREAMS streams)
{
    streams.lightDirectAmbientOcclusion_id44 = lerp(1.0, streams.matAmbientOcclusion_id51, streams.matAmbientOcclusionDirectLightingFactor_id52);
    streams.matDiffuseVisible_id62 = streams.matDiffuse_id47.rgb * lerp(1.0f, streams.matCavity_id53, streams.matCavityDiffuse_id54) * streams.matDiffuseSpecularAlphaBlend_id58.r * streams.matAlphaBlendColor_id59;
    streams.matSpecularVisible_id64 = streams.matSpecular_id49.rgb * streams.matSpecularIntensity_id50 * lerp(1.0f, streams.matCavity_id53, streams.matCavitySpecular_id55) * streams.matDiffuseSpecularAlphaBlend_id58.g * streams.matAlphaBlendColor_id59;
    streams.NdotV_id65 = max(dot(streams.normalWS_id16, streams.viewWS_id61), 0.0001f);
    float roughness = 1.0f - streams.matGlossiness_id48;
    float roughnessAdjust = GetFilterSquareRoughnessAdjustment_id112(streams, streams.matNormal_id45);
    streams.alphaRoughness_id63 = max(roughness * roughness + roughnessAdjust, 0.001);
}
void ResetLightStream_id176(inout PS_STREAMS streams)
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
float4 Compute_id209()
{
    return float4(constantFloat_id167, constantFloat_id167, constantFloat_id167, constantFloat_id167);
}
float4 Compute_id207()
{
    return float4(constantFloat_id164, constantFloat_id164, constantFloat_id164, constantFloat_id164);
}
float4 Compute_id205()
{
    return constantColor_id162;
}
void ResetStream_id181(inout PS_STREAMS streams)
{
    ResetStream_id178();
    streams.matBlend_id37 = 0.0f;
}
void Compute_id378(inout PS_STREAMS streams)
{
    UpdateNormalFromTangentSpace_id19(streams.matNormal_id45);
    ResetLightStream_id176(streams);
    PrepareMaterialForLightingAndShading_id177(streams);
    float3 directLightingContribution = 0;

    {
        const int maxLightCount = GetMaxLightCount_id189();
        int count = GetLightCount_id186();

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id188(streams, i);
            PrepareMaterialPerDirectLight_id27(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id298(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id347(streams);
            }
        }
    }
    float3 environmentLightingContribution = 0;

    {
        PrepareEnvironmentLight_id204(streams);

        {
            environmentLightingContribution += ComputeEnvironmentLightContribution_id299(streams);
        }

        {
            environmentLightingContribution += ComputeEnvironmentLightContribution_id348(streams);
        }
    }
    streams.shadingColor_id66 += directLightingContribution * PI_id173 + environmentLightingContribution;
    streams.shadingColorAlpha_id67 = streams.matDiffuse_id47.a;
}
void Compute_id363(inout PS_STREAMS streams)
{
    float metalness = Compute_id209().r;
    streams.matSpecular_id49 = lerp(0.02, streams.matDiffuse_id47.rgb, metalness);
    streams.matDiffuse_id47.rgb = lerp(streams.matDiffuse_id47.rgb, 0, metalness);
}
void Compute_id358(inout PS_STREAMS streams)
{
    float glossiness = Compute_id207().r;
    streams.matGlossiness_id48 = glossiness;
}
void Compute_id353(inout PS_STREAMS streams)
{
    float4 colorBase = Compute_id205();
    streams.matDiffuse_id47 = colorBase;
    streams.matColorBase_id46 = colorBase;
}
void ResetStream_id183(inout PS_STREAMS streams)
{
    ResetStream_id181(streams);
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
void Compute_id66(inout PS_STREAMS streams)
{

    {
        Compute_id353(streams);
    }

    {
        Compute_id358(streams);
    }

    {
        Compute_id363(streams);
    }

    {
        Compute_id378(streams);
    }
}
void ResetStream_id65(inout PS_STREAMS streams)
{
    ResetStream_id183(streams);
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
    ResetStream_id65(streams);
    Compute_id66(streams);
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
