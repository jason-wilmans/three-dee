/**************************
***** Compiler Parameters *****
***************************
@P EffectName: XenkoEditorForwardShadingEffect
@P   - Material.PixelStageSurfaceShaders: mixin MaterialSurfaceArray [{layers = [mixin MaterialSurfaceDiffuse [{diffuseMap = ComputeColorConstantColorLink<Material.DiffuseValue>}], mixin MaterialSurfaceNormalMap<false,true> [{normalMap = ComputeColorConstantColorLink<Material.NormalValue>}], mixin MaterialSurfaceGlossinessMap<false> [{glossinessMap = ComputeColorConstantFloatLink<Material.GlossinessValue>}], mixin MaterialSurfaceSetStreamFromComputeColor<matSpecular,rgb> [{computeColorSource = ComputeColorConstantColorLink<Material.SpecularValue>}], mixin MaterialSurfaceSetStreamFromComputeColor<matSpecularIntensity,r> [{computeColorSource = ComputeColorConstantFloatLink<Material.SpecularIntensityValue>}], mixin MaterialSurfaceLightingAndShading [{surfaces = [MaterialSurfaceShadingDiffuseLambert<false>, mixin MaterialSurfaceShadingSpecularMicrofacet [{fresnelFunction = MaterialSpecularMicrofacetFresnelSchlick}, {geometricShadowingFunction = MaterialSpecularMicrofacetVisibilitySmithSchlickGGX}, {normalDistributionFunction = MaterialSpecularMicrofacetNormalDistributionGGX}]]}]]}]
@P Material.PixelStageStreamInitializer: mixin MaterialStream, MaterialPixelShadingStream
@P Material.HasNormalMap: True
@P Lighting.DirectLightGroups: LightClusteredPointGroup<64>, LightClusteredSpotGroup<64>, mixin LightDirectionalGroup<8>, mixin LightDirectionalGroup<1>, ShadowMapReceiverDirectional<4,1,false,true,false>, ShadowMapFilterPcf<PerView.Lighting,5>
@P Lighting.EnvironmentLights: LightSimpleAmbient
***************************
****  ConstantBuffers  ****
***************************
cbuffer PerDraw [Size: 416]
@C    World_id29 => Transformation.World
@C    WorldInverse_id30 => Transformation.WorldInverse
@C    WorldInverseTranspose_id31 => Transformation.WorldInverseTranspose
@C    WorldView_id32 => Transformation.WorldView
@C    WorldViewInverse_id33 => Transformation.WorldViewInverse
@C    WorldViewProjection_id34 => Transformation.WorldViewProjection
@C    WorldScale_id35 => Transformation.WorldScale
@C    EyeMS_id36 => Transformation.EyeMS
cbuffer PerMaterial [Size: 80]
@C    constantColor_id175 => Material.DiffuseValue
@C    constantColor_id177 => Material.NormalValue
@C    constantFloat_id181 => Material.GlossinessValue
@C    constantColor_id187 => Material.SpecularValue
@C    constantFloat_id189 => Material.SpecularIntensityValue
cbuffer PerView [Size: 1072]
@C    View_id22 => Transformation.View
@C    ViewInverse_id23 => Transformation.ViewInverse
@C    Projection_id24 => Transformation.Projection
@C    ProjectionInverse_id25 => Transformation.ProjectionInverse
@C    ViewProjection_id26 => Transformation.ViewProjection
@C    ProjScreenRay_id27 => Transformation.ProjScreenRay
@C    Eye_id28 => Transformation.Eye
@C    NearClipPlane_id77 => Camera.NearClipPlane
@C    FarClipPlane_id78 => Camera.FarClipPlane
@C    ZProjection_id79 => Camera.ZProjection
@C    ViewSize_id80 => Camera.ViewSize
@C    AspectRatio_id81 => Camera.AspectRatio
@C    ClusterDepthScale_id87 => LightClustered.ClusterDepthScale
@C    ClusterDepthBias_id88 => LightClustered.ClusterDepthBias
@C    LightCount_id94 => DirectLightGroupPerView.LightCount.directLightGroups[2]
@C    Lights_id96 => LightDirectionalGroup.Lights.directLightGroups[2]
@C    LightCount_id97 => DirectLightGroupPerView.LightCount.directLightGroups[3]
@C    Lights_id99 => LightDirectionalGroup.Lights.directLightGroups[3]
@C    ShadowMapTextureSize_id101 => ShadowMap.TextureSize.directLightGroups[3]
@C    ShadowMapTextureTexelSize_id102 => ShadowMap.TextureTexelSize.directLightGroups[3]
@C    WorldToShadowCascadeUV_id163 => ShadowMapReceiverBase.WorldToShadowCascadeUV.directLightGroups[3]
@C    DepthBiases_id164 => ShadowMapReceiverBase.DepthBiases.directLightGroups[3]
@C    OffsetScales_id165 => ShadowMapReceiverBase.OffsetScales.directLightGroups[3]
@C    CascadeDepthSplits_id171 => ShadowMapReceiverDirectional.CascadeDepthSplits.directLightGroups[3]
@C    Bias_id173 => ShadowMapFilterPcf.Bias.directLightGroups[3]
@C    AmbientLight_id174 => LightSimpleAmbient.AmbientLight.environmentLights[0]
***************************
******  Resources    ******
***************************
@R    LightClusters_id85 => LightClustered.LightClusters [Stage: None, Slot: (-1--1)]
@R    LightClusters_id85 => LightClustered.LightClusters [Stage: None, Slot: (-1--1)]
@R    LightIndices_id86 => LightClustered.LightIndices [Stage: None, Slot: (-1--1)]
@R    LightIndices_id86 => LightClustered.LightIndices [Stage: None, Slot: (-1--1)]
@R    PointLights_id90 => LightClusteredPointGroup.PointLights [Stage: None, Slot: (-1--1)]
@R    PointLights_id90 => LightClusteredPointGroup.PointLights [Stage: None, Slot: (-1--1)]
@R    SpotLights_id93 => LightClusteredSpotGroup.SpotLights [Stage: None, Slot: (-1--1)]
@R    SpotLights_id93 => LightClusteredSpotGroup.SpotLights [Stage: None, Slot: (-1--1)]
@R    ShadowMapTexture_id100 => ShadowMap.Texture.directLightGroups[3] [Stage: None, Slot: (-1--1)]
@R    ShadowMapTexture_id100 => ShadowMap.Texture.directLightGroups[3] [Stage: None, Slot: (-1--1)]
@R    PerMaterial => PerMaterial [Stage: None, Slot: (-1--1)]
@R    PerDraw => PerDraw [Stage: Vertex, Slot: (0-0)]
@R    PerView => PerView [Stage: Vertex, Slot: (1-1)]
@R    LinearClampCompareLessEqualSampler_id135 => Texturing.LinearClampCompareLessEqualSampler [Stage: Pixel, Slot: (0-0)]
@R    LightClusters_id85 => LightClustered.LightClusters [Stage: Pixel, Slot: (0-0)]
@R    LightIndices_id86 => LightClustered.LightIndices [Stage: Pixel, Slot: (1-1)]
@R    PointLights_id90 => LightClusteredPointGroup.PointLights [Stage: Pixel, Slot: (2-2)]
@R    SpotLights_id93 => LightClusteredSpotGroup.SpotLights [Stage: Pixel, Slot: (3-3)]
@R    ShadowMapTexture_id100 => ShadowMap.Texture.directLightGroups[3] [Stage: Pixel, Slot: (4-4)]
@R    PerDraw => PerDraw [Stage: Pixel, Slot: (0-0)]
@R    PerMaterial => PerMaterial [Stage: Pixel, Slot: (1-1)]
@R    PerView => PerView [Stage: Pixel, Slot: (2-2)]
***************************
*****     Sources     *****
***************************
@S    ShaderBase => 5c3160ccbf936c5e102bd9315f0f946a
@S    ShaderBaseStream => f699080594ac63c1f38140de57ce1a7b
@S    ShadingBase => a4b46f7608ab80e77c938f475834f962
@S    ComputeColor => 6e3e8655257003c26480195de33cbbc1
@S    TransformationBase => f1386ed2f0e8db4eb9e79a63ee23e05c
@S    NormalStream => 5d295e278c920e30e310e1979bc14a19
@S    TransformationWAndVP => 1ad0d61ab4ab5bf92b87169f094b8b17
@S    PositionStream4 => 87a2d7a46c028c1479a982866d88d067
@S    PositionHStream4 => f5c4e6d128281ef2d40fba86959205d5
@S    Transformation => 8b044dd67dc836d93d27ce6bee5b1db8
@S    NormalFromNormalMapping => facb7d217f791465ba2cb80b1ad8bc3b
@S    NormalBase => b70fd93cea3e78cb7e35bf33c5bc761d
@S    MaterialSurfacePixelStageCompositor => 1d6419ba7ac2d0f180564d21a0d3f8c0
@S    PositionStream => 664ed5997626578c1dfdc74402cd23f6
@S    MaterialPixelShadingStream => 28de6f1960d9c29f165f916c0adfe5a5
@S    MaterialPixelStream => 17c22a7a37d239e0ee9e8d2779c03c80
@S    MaterialStream => 83fd257dadb68d92b2e57a11122265d4
@S    IStreamInitializer => 8be0404675b438bff2babfd297fb96df
@S    LightStream => 81d82a322111295057787d950e438228
@S    DirectLightGroupArray => 9addcff5b7cb7364a8a5d87d4de45742
@S    DirectLightGroup => 92eb9d726b1937533c27d57ff97f8da5
@S    ShadowGroup => 545ec47456ee7f4472536d8a7316d02f
@S    ShadowStream => 4abbfb30b4b85e71b0f683b420977101
@S    EnvironmentLightArray => 92f59b0813153de143701e01f1da89e0
@S    EnvironmentLight => 461117f7455b162e23645a86e89f749d
@S    IMaterialSurface => 14b3d59b9c516893bd7730aaa3dc225a
@S    LightClusteredPointGroup => 60ed7b620bc6eabb3ad2330302bc367e
@S    LightPoint => d493565dd96b3b70744355d84af30357
@S    LightUtil => d77cfcfacea55ef4e06d9f585be27420
@S    LightClustered => 1e65bd91e97c5eccc197f556f5f41eab
@S    Camera => ec417735d81c9ad1d80ca0e6d87138b0
@S    LightClusteredSpotGroup => 7beef740595052a48885ae9f619304ca
@S    LightSpot => 0519676695da553305f1ac90b4521c07
@S    LightDirectionalGroup => 7bb2cc43889ab80004ab02a83bbd02d2
@S    DirectLightGroupPerView => f728a5a7f613dcd26bc20d54908ca1b8
@S    LightDirectional => 8f8fc60cae27222c84186af6eec74080
@S    ShadowMapReceiverDirectional => 353fac7126befa42041a57c4a1334821
@S    ShadowMapReceiverBase => d12f773a3fd600310e83647a94d44701
@S    ShadowMapGroup => 9fa1018d7f62b9d4719202422d304c06
@S    ShadowMapCommon => f7f2751f116d20510441e8bbc4c1bea6
@S    ShadowMapFilterBase => 4f39c8431637ddf01ca0702bbf3fa5d8
@S    Texturing => a9d9ee1fb9a68af7ce6b12291686faea
@S    ShadowMapFilterPcf => cac13ffd50e214b4ab513eead5113b25
@S    LightSimpleAmbient => 6d68fc78fb5b5ad232c5ec44f6d90e31
@S    MaterialSurfaceArray => ccbac4b49ee1e91b6f7d11a29c26a658
@S    MaterialSurfaceDiffuse => 4572009ce562fa4c388af46aacc800f7
@S    IMaterialSurfacePixel => c2baefbc3fb7ad1466cc087909a23051
@S    ComputeColorConstantColorLink => a4f7de8d03608ceba6b4f128ada2b3ed
@S    MaterialSurfaceNormalMap => 3fd4391ef045768e3921ed491acef2e3
@S    MaterialSurfaceGlossinessMap => fb8774941dd1a7b0ced77715861382a4
@S    ComputeColorConstantFloatLink => a459500fd7f6c5988997e81bf766f988
@S    MaterialSurfaceSetStreamFromComputeColor => 1d00f7d823647b307a55871a0b3eba09
@S    IMaterialSurfaceVertex => 8e13e0524d4025cb811c673aeb77f45b
@S    MaterialVertexStream => fe2d4e2abe57231a93785fe59684b199
@S    MaterialDisplacementStream => 5112948b0773a844410cc7c3df78184a
@S    IMaterialSurfaceDomain => a787b7e989be07714532cd1ffc35ef2a
@S    MaterialDomainStream => 8be905888c6f3153139bc1fa900fdf5f
@S    MaterialTessellationStream => 87652904dbe93d91999520c7e41f52a1
@S    MaterialSurfaceLightingAndShading => 4faacd53863c0b5c65d23ad20797d27c
@S    Math => 5bdf39e412cac464ebbce340da34bca1
@S    IMaterialSurfaceShading => 7aecb9db43b53094f40d49ae22406a18
@S    MaterialSurfaceShadingDiffuseLambert => 66ea94572ee9f10a2e305608a7d69dad
@S    MaterialSurfaceShadingSpecularMicrofacet => b7d013f1414d67d7f1a4afd4ac068c8e
@S    BRDFMicrofacet => 98c58221f1b61f0766453f0ce60edcb0
@S    IMaterialSpecularMicrofacetFresnelFunction => be6c16bab5a59713001b43d92cde1a5a
@S    IMaterialSpecularMicrofacetVisibilityFunction => 5872403d82d7dcdfdaaf64a9f924b8dd
@S    IMaterialSpecularMicrofacetNormalDistributionFunction => a8ee1e483f2e3d59a955262211e6f903
@S    MaterialSpecularMicrofacetFresnelSchlick => 31c4aa7c7fbef53ee309a102999a200c
@S    MaterialSpecularMicrofacetVisibilitySmithSchlickGGX => f3ca0542110ccc88e4ea25b477d2e6a0
@S    MaterialSpecularMicrofacetNormalDistributionGGX => c1f51806b6ccb80ce3f85c0d2c550f6b
***************************
*****     Stages      *****
***************************
@G    Vertex => 8c74a4b8ce6937ae33e39d6349da957d
//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
//
// Buffer Definitions: 
//
// cbuffer PerDraw
// {
//
//   float4x4 World_id29;               // Offset:    0 Size:    64
//   float4x4 WorldInverse_id30;        // Offset:   64 Size:    64 [unused]
//   float4x4 WorldInverseTranspose_id31;// Offset:  128 Size:    64 [unused]
//   float4x4 WorldView_id32;           // Offset:  192 Size:    64 [unused]
//   float4x4 WorldViewInverse_id33;    // Offset:  256 Size:    64 [unused]
//   float4x4 WorldViewProjection_id34; // Offset:  320 Size:    64 [unused]
//   float3 WorldScale_id35;            // Offset:  384 Size:    12 [unused]
//   float4 EyeMS_id36;                 // Offset:  400 Size:    16 [unused]
//
// }
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
//   float NearClipPlane_id77;          // Offset:  352 Size:     4 [unused]
//      = 0x3f800000 
//   float FarClipPlane_id78;           // Offset:  356 Size:     4 [unused]
//      = 0x42c80000 
//   float2 ZProjection_id79;           // Offset:  360 Size:     8 [unused]
//   float2 ViewSize_id80;              // Offset:  368 Size:     8 [unused]
//   float AspectRatio_id81;            // Offset:  376 Size:     4 [unused]
//   float ClusterDepthScale_id87;      // Offset:  380 Size:     4 [unused]
//   float ClusterDepthBias_id88;       // Offset:  384 Size:     4 [unused]
//   int LightCount_id94;               // Offset:  388 Size:     4 [unused]
//   
//   struct DirectionalLightData
//   {
//       
//       float3 DirectionWS;            // Offset:  400
//       float3 Color;                  // Offset:  416
//
//   } Lights_id96[8];                  // Offset:  400 Size:   252 [unused]
//   int LightCount_id97;               // Offset:  652 Size:     4 [unused]
//   
//   struct DirectionalLightData
//   {
//       
//       float3 DirectionWS;            // Offset:  656
//       float3 Color;                  // Offset:  672
//
//   } Lights_id99;                     // Offset:  656 Size:    28 [unused]
//   float2 ShadowMapTextureSize_id101; // Offset:  688 Size:     8 [unused]
//   float2 ShadowMapTextureTexelSize_id102;// Offset:  696 Size:     8 [unused]
//   float4x4 WorldToShadowCascadeUV_id163[4];// Offset:  704 Size:   256 [unused]
//   float DepthBiases_id164;           // Offset:  960 Size:     4 [unused]
//   float OffsetScales_id165;          // Offset:  976 Size:     4 [unused]
//   float CascadeDepthSplits_id171[4]; // Offset:  992 Size:    52 [unused]
//   float Bias_id173;                  // Offset: 1044 Size:     4 [unused]
//   float3 AmbientLight_id174;         // Offset: 1056 Size:    12 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// PerDraw                           cbuffer      NA          NA    0        1
// PerView                           cbuffer      NA          NA    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// NORMAL                   0   xyz         1     NONE   float   xyz 
// TANGENT                  0   xyzw        2     NONE   float   xyzw
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION_WS              0   xyzw        0     NONE   float   xyzw
// SV_Position              0   xyzw        1      POS   float   xyzw
// DEPTH_VS                 0   x           2     NONE   float   x   
// NORMAL                   0    yzw        2     NONE   float    yzw
// TANGENT                  0   xyzw        3     NONE   float   xyzw
//
vs_5_0
dcl_globalFlags refactoringAllowed
dcl_constantbuffer cb0[4], immediateIndexed
dcl_constantbuffer cb1[20], immediateIndexed
dcl_input v0.xyzw
dcl_input v1.xyz
dcl_input v2.xyzw
dcl_output o0.xyzw
dcl_output_siv o1.xyzw, position
dcl_output o2.x
dcl_output o2.yzw
dcl_output o3.xyzw
dcl_temps 2
//
// Initial variable locations:
//   v0.x <- __input__.Position_id18.x; v0.y <- __input__.Position_id18.y; v0.z <- __input__.Position_id18.z; v0.w <- __input__.Position_id18.w; 
//   v1.x <- __input__.meshNormal_id14.x; v1.y <- __input__.meshNormal_id14.y; v1.z <- __input__.meshNormal_id14.z; 
//   v2.x <- __input__.meshTangent_id15.x; v2.y <- __input__.meshTangent_id15.y; v2.z <- __input__.meshTangent_id15.z; v2.w <- __input__.meshTangent_id15.w; 
//   o3.x <- <VSMain return value>.meshTangent_id15.x; o3.y <- <VSMain return value>.meshTangent_id15.y; o3.z <- <VSMain return value>.meshTangent_id15.z; o3.w <- <VSMain return value>.meshTangent_id15.w; 
//   o2.x <- <VSMain return value>.DepthVS_id20; o2.y <- <VSMain return value>.meshNormal_id14.x; o2.z <- <VSMain return value>.meshNormal_id14.y; o2.w <- <VSMain return value>.meshNormal_id14.z; 
//   o1.x <- <VSMain return value>.ShadingPosition_id0.x; o1.y <- <VSMain return value>.ShadingPosition_id0.y; o1.z <- <VSMain return value>.ShadingPosition_id0.z; o1.w <- <VSMain return value>.ShadingPosition_id0.w; 
//   o0.x <- <VSMain return value>.PositionWS_id19.x; o0.y <- <VSMain return value>.PositionWS_id19.y; o0.z <- <VSMain return value>.PositionWS_id19.z; o0.w <- <VSMain return value>.PositionWS_id19.w
//
#line 884 "C:\Development\three-dee\1 - Code\ThreeDeeCore\CoreFacade\log\shader_XenkoEditorForwardShadingEffect_aa97b14c46d88c7245f8a131d52a0bb9.hlsl"
dp4 r0.x, v0.xyzw, cb0[0].xyzw  // r0.x <- streams.PositionWS_id19.x
dp4 r0.y, v0.xyzw, cb0[1].xyzw  // r0.y <- streams.PositionWS_id19.y
dp4 r0.z, v0.xyzw, cb0[2].xyzw  // r0.z <- streams.PositionWS_id19.z
dp4 r0.w, v0.xyzw, cb0[3].xyzw  // r0.w <- streams.PositionWS_id19.w

#line 962
mov o0.xyzw, r0.xyzw

#line 874
dp4 r1.x, r0.xyzw, cb1[19].xyzw  // r1.x <- streams.ShadingPosition_id0.w

#line 962
mov o1.w, r1.x
mov o2.x, r1.x

#line 874
dp4 o1.x, r0.xyzw, cb1[16].xyzw
dp4 o1.y, r0.xyzw, cb1[17].xyzw
dp4 o1.z, r0.xyzw, cb1[18].xyzw

#line 962
mov o2.yzw, v1.xxyz
mov o3.xyzw, v2.xyzw
ret 
// Approximately 14 instruction slots used
@G    Pixel => 21ee0eac2371c314aa649de36b0234fc
//
// Generated by Microsoft (R) HLSL Shader Compiler 6.3.9600.16384
//
//
// Buffer Definitions: 
//
// cbuffer PerDraw
// {
//
//   float4x4 World_id29;               // Offset:    0 Size:    64
//   float4x4 WorldInverse_id30;        // Offset:   64 Size:    64 [unused]
//   float4x4 WorldInverseTranspose_id31;// Offset:  128 Size:    64 [unused]
//   float4x4 WorldView_id32;           // Offset:  192 Size:    64 [unused]
//   float4x4 WorldViewInverse_id33;    // Offset:  256 Size:    64 [unused]
//   float4x4 WorldViewProjection_id34; // Offset:  320 Size:    64 [unused]
//   float3 WorldScale_id35;            // Offset:  384 Size:    12 [unused]
//   float4 EyeMS_id36;                 // Offset:  400 Size:    16 [unused]
//
// }
//
// cbuffer PerMaterial
// {
//
//   float4 constantColor_id175;        // Offset:    0 Size:    16
//   float4 constantColor_id177;        // Offset:   16 Size:    16
//   float constantFloat_id181;         // Offset:   32 Size:     4
//   float4 constantColor_id187;        // Offset:   48 Size:    16
//   float constantFloat_id189;         // Offset:   64 Size:     4
//
// }
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
//   float NearClipPlane_id77;          // Offset:  352 Size:     4 [unused]
//      = 0x3f800000 
//   float FarClipPlane_id78;           // Offset:  356 Size:     4 [unused]
//      = 0x42c80000 
//   float2 ZProjection_id79;           // Offset:  360 Size:     8
//   float2 ViewSize_id80;              // Offset:  368 Size:     8 [unused]
//   float AspectRatio_id81;            // Offset:  376 Size:     4 [unused]
//   float ClusterDepthScale_id87;      // Offset:  380 Size:     4
//   float ClusterDepthBias_id88;       // Offset:  384 Size:     4
//   int LightCount_id94;               // Offset:  388 Size:     4
//   
//   struct DirectionalLightData
//   {
//       
//       float3 DirectionWS;            // Offset:  400
//       float3 Color;                  // Offset:  416
//
//   } Lights_id96[8];                  // Offset:  400 Size:   252
//   int LightCount_id97;               // Offset:  652 Size:     4
//   
//   struct DirectionalLightData
//   {
//       
//       float3 DirectionWS;            // Offset:  656
//       float3 Color;                  // Offset:  672
//
//   } Lights_id99;                     // Offset:  656 Size:    28
//   float2 ShadowMapTextureSize_id101; // Offset:  688 Size:     8
//   float2 ShadowMapTextureTexelSize_id102;// Offset:  696 Size:     8
//   float4x4 WorldToShadowCascadeUV_id163[4];// Offset:  704 Size:   256
//   float DepthBiases_id164;           // Offset:  960 Size:     4
//   float OffsetScales_id165;          // Offset:  976 Size:     4
//   float CascadeDepthSplits_id171[4]; // Offset:  992 Size:    52
//   float Bias_id173;                  // Offset: 1044 Size:     4 [unused]
//   float3 AmbientLight_id174;         // Offset: 1056 Size:    12
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// LinearClampCompareLessEqualSampler_id135  sampler_c      NA          NA    0        1
// LightClusters_id85                texture   uint2          3d    0        1
// LightIndices_id86                 texture    uint         buf    1        1
// PointLights_id90                  texture  float4         buf    2        1
// SpotLights_id93                   texture  float4         buf    3        1
// ShadowMapTexture_id100            texture  float4          2d    4        1
// PerDraw                           cbuffer      NA          NA    0        1
// PerMaterial                       cbuffer      NA          NA    1        1
// PerView                           cbuffer      NA          NA    2        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION_WS              0   xyzw        0     NONE   float   xyz 
// SV_Position              0   xyzw        1      POS   float   xyz 
// DEPTH_VS                 0   x           2     NONE   float   x   
// NORMAL                   0    yzw        2     NONE   float    yzw
// TANGENT                  0   xyzw        3     NONE   float   xyzw
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
dcl_constantbuffer cb0[3], immediateIndexed
dcl_constantbuffer cb1[5], immediateIndexed
dcl_constantbuffer cb2[67], dynamicIndexed
dcl_sampler s0, mode_comparison
dcl_resource_texture3d (uint,uint,uint,uint) t0
dcl_resource_buffer (uint,uint,uint,uint) t1
dcl_resource_buffer (float,float,float,float) t2
dcl_resource_buffer (float,float,float,float) t3
dcl_resource_texture2d (float,float,float,float) t4
dcl_input_ps linear v0.xyz
dcl_input_ps_siv linear noperspective v1.xyz, position
dcl_input_ps linear v2.x
dcl_input_ps linear v2.yzw
dcl_input_ps linear v3.xyzw
dcl_output o0.xyzw
dcl_temps 18
//
// Initial variable locations:
//   v0.x <- __input__.PositionWS_id19.x; v0.y <- __input__.PositionWS_id19.y; v0.z <- __input__.PositionWS_id19.z; v0.w <- __input__.PositionWS_id19.w; 
//   v1.x <- __input__.ShadingPosition_id0.x; v1.y <- __input__.ShadingPosition_id0.y; v1.z <- __input__.ShadingPosition_id0.z; v1.w <- __input__.ShadingPosition_id0.w; 
//   v2.x <- __input__.DepthVS_id20; v2.y <- __input__.meshNormal_id14.x; v2.z <- __input__.meshNormal_id14.y; v2.w <- __input__.meshNormal_id14.z; 
//   v3.x <- __input__.meshTangent_id15.x; v3.y <- __input__.meshTangent_id15.y; v3.z <- __input__.meshTangent_id15.z; v3.w <- __input__.meshTangent_id15.w; 
//   o0.x <- <PSMain return value>.ColorTarget_id1.x; o0.y <- <PSMain return value>.ColorTarget_id1.y; o0.z <- <PSMain return value>.ColorTarget_id1.z; o0.w <- <PSMain return value>.ColorTarget_id1.w
//
#line 865 "C:\Development\three-dee\1 - Code\ThreeDeeCore\CoreFacade\log\shader_XenkoEditorForwardShadingEffect_aa97b14c46d88c7245f8a131d52a0bb9.hlsl"
dp3 r0.x, v2.yzwy, v2.yzwy
rsq r0.x, r0.x
mul r0.xyz, r0.xxxx, v2.yzwy  // r0.x <- streams.meshNormal_id14.x; r0.y <- streams.meshNormal_id14.y; r0.z <- streams.meshNormal_id14.z
dp3 r0.w, v3.xyzx, v3.xyzx
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, v3.xyzx  // r1.x <- tangent.x; r1.y <- tangent.y; r1.z <- tangent.z
mul r2.xyz, r0.zxyz, r1.yzxy
mad r2.xyz, r0.yzxy, r1.zxyz, -r2.xyzx
mul r2.xyz, r2.xyzx, v3.wwww  // r2.x <- bitangent.x; r2.y <- bitangent.y; r2.z <- bitangent.z

#line 901
dp3 r3.x, r1.xyzx, cb0[0].xyzx  // r3.x <- streams.tangentToWorld_id17._m00
dp3 r4.x, r1.xyzx, cb0[1].xyzx  // r4.x <- streams.tangentToWorld_id17._m01
dp3 r1.x, r1.xyzx, cb0[2].xyzx  // r1.x <- streams.tangentToWorld_id17._m02
dp3 r3.y, r2.xyzx, cb0[0].xyzx  // r3.y <- streams.tangentToWorld_id17._m10
dp3 r4.y, r2.xyzx, cb0[1].xyzx  // r4.y <- streams.tangentToWorld_id17._m11
dp3 r1.y, r2.xyzx, cb0[2].xyzx  // r1.y <- streams.tangentToWorld_id17._m12
dp3 r3.z, r0.xyzx, cb0[0].xyzx  // r3.z <- streams.tangentToWorld_id17._m20
dp3 r4.z, r0.xyzx, cb0[1].xyzx  // r4.z <- streams.tangentToWorld_id17._m21
dp3 r1.z, r0.xyzx, cb0[2].xyzx  // r1.z <- streams.tangentToWorld_id17._m22

#line 888
add r0.xyz, -v0.xyzx, cb2[21].xyzx
dp3 r0.w, r0.xyzx, r0.xyzx
rsq r0.w, r0.w
mul r0.xyz, r0.wwww, r0.xyzx  // r0.x <- streams.viewWS_id61.x; r0.y <- streams.viewWS_id61.y; r0.z <- streams.viewWS_id61.z

#line 775
eq r0.w, cb1[1].z, l(0.000000)

#line 783
mad r2.xyz, cb1[1].xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)  // r2.x <- normal.x; r2.y <- normal.y; r2.z <- normal.z

#line 789
mov r5.xy, cb1[1].xyxx
mov r5.z, l(1.000000)
movc r2.xyz, r0.wwww, r5.xyzx, r2.xyzx  // r2.x <- streams.matNormal_id45.x; r2.y <- streams.matNormal_id45.y; r2.z <- streams.matNormal_id45.z

#line 614
dp3 r3.y, r2.xyzx, r3.xyzx
dp3 r3.z, r2.xyzx, r4.xyzx
dp3 r3.w, r2.xyzx, r1.xyzx
dp3 r0.w, r3.yzwy, r3.yzwy
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, r3.yzwy  // r1.x <- streams.normalWS_id16.x; r1.y <- streams.normalWS_id16.y; r1.z <- streams.normalWS_id16.z

#line 596
mul r3.xyz, cb1[3].xyzx, cb1[4].xxxx  // r3.x <- streams.matSpecularVisible_id64.x; r3.y <- streams.matSpecularVisible_id64.y; r3.z <- streams.matSpecularVisible_id64.z
dp3 r0.w, r1.xyzx, r0.xyzx
max r0.w, r0.w, l(0.000100)  // r0.w <- streams.NdotV_id65
add r1.w, -cb1[2].x, l(1.000000)  // r1.w <- roughness

#line 473
dp3 r2.x, r2.xyzx, r2.xyzx
sqrt r2.y, r2.x  // r2.y <- r
lt r2.z, r2.y, l(1.000000)
add r2.w, -r2.x, l(1.000000)
mul r2.w, r2.w, l(0.500000)
mul r2.x, r2.y, r2.x
mad r2.x, r2.y, l(3.000000), -r2.x
div r2.x, r2.w, r2.x  // r2.x <- roughnessAdjust
and r2.x, r2.x, r2.z

#line 600
mad r1.w, r1.w, r1.w, r2.x
max r1.w, r1.w, l(0.001000)  // r1.w <- streams.alphaRoughness_id63

#line 465
add r2.x, v1.z, -cb2[22].z
div r2.x, cb2[22].w, r2.x  // r2.x <- depth
ftoi r2.yz, v1.xxyx  // r2.y <- shadingPosition.x; r2.z <- shadingPosition.y
mad r2.x, r2.x, cb2[23].w, cb2[24].x
log r2.x, r2.x
max r2.x, r2.x, l(0.000000)
ftoi r4.z, r2.x  // r4.z <- slice
xor r2.xw, r2.yyyz, l(64, 0, 0, 64)
imax r2.yz, r2.yyzy, -r2.yyzy
ushr r2.yz, r2.yyzy, l(0, 6, 6, 0)
ineg r5.xy, r2.yzyy
and r2.xw, r2.xxxw, l(0x80000000, 0, 0, 0x80000000)
movc r4.xy, r2.xwxx, r5.xyxx, r2.yzyy
mov r4.w, l(0)
ld_indexable(texture3d)(uint,uint,uint,uint) r2.xy, r4.xyzw, t0.xyzw  // r2.x <- streams.lightData_id83.x; r2.y <- streams.lightData_id83.y

#line 586
and r2.z, r2.y, l(0x0000ffff)  // r2.z <- <GetMaxLightCount_id226 return value>

#line 653
mov r4.xyz, v0.xyzx  // r4.x <- streams.PositionWS_id19.x; r4.y <- streams.PositionWS_id19.y; r4.z <- streams.PositionWS_id19.z
mov r5.xyz, r0.xyzx  // r5.x <- streams.viewWS_id61.x; r5.y <- streams.viewWS_id61.y; r5.z <- streams.viewWS_id61.z
mov r6.x, cb1[0].x  // r6.x <- streams.matDiffuseVisible_id62.x
mov r7.xy, cb1[0].yzyy  // r7.x <- streams.matDiffuseVisible_id62.y; r7.y <- streams.matDiffuseVisible_id62.z
mov r7.zw, r3.xxxy  // r7.z <- streams.matSpecularVisible_id64.x; r7.w <- streams.matSpecularVisible_id64.y
mov r8.x, r3.z  // r8.x <- streams.matSpecularVisible_id64.z
mov r8.y, r1.w  // r8.y <- streams.alphaRoughness_id63
mov r9.xyz, r1.xyzx  // r9.x <- streams.normalWS_id16.x; r9.y <- streams.normalWS_id16.y; r9.z <- streams.normalWS_id16.z
mov r10.z, r0.w  // r10.z <- streams.NdotV_id65
mov r10.x, r2.x  // r10.x <- streams.lightIndex_id84
mov r11.xyz, l(0,0,0,0)  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z
mov r2.w, l(0)  // r2.w <- i
loop 
  ige r3.w, r2.w, r2.z
  breakc_nz r3.w
  if_nz r3.w
    break 
  endif 

#line 452
  ld_indexable(buffer)(uint,uint,uint,uint) r3.w, r10.xxxx, t1.yzwx  // r3.w <- realLightIndex
  iadd r10.x, r10.x, l(1)  // r10.x <- streams.lightIndex_id84
  ishl r4.w, r3.w, l(1)
  ld_indexable(buffer)(float,float,float,float) r12.xyzw, r4.wwww, t2.xyzw  // r12.x <- pointLight1.x; r12.y <- pointLight1.y; r12.z <- pointLight1.z; r12.w <- pointLight1.w
  bfi r3.w, l(31), l(1), r3.w, l(1)
  ld_indexable(buffer)(float,float,float,float) r13.xyz, r3.wwww, t2.xyzw  // r13.x <- pointLight2.x; r13.y <- pointLight2.y; r13.z <- pointLight2.z

#line 330
  add r12.xyz, -r4.xyzx, r12.xyzx  // r12.x <- lightVector.x; r12.y <- lightVector.y; r12.z <- lightVector.z
  dp3 r3.w, r12.xyzx, r12.xyzx
  sqrt r4.w, r3.w  // r4.w <- lightVectorLength
  div r12.xyz, r12.xyzx, r4.wwww  // r12.x <- lightVectorNorm.x; r12.y <- lightVectorNorm.y; r12.z <- lightVectorNorm.z

#line 279
  max r4.w, r3.w, l(0.000100)
  div r4.w, l(1.000000, 1.000000, 1.000000, 1.000000), r4.w  // r4.w <- attenuation

#line 211
  mul r3.w, r12.w, r3.w  // r3.w <- factor
  mad r3.w, -r3.w, r3.w, l(1.000000)
  max r3.w, r3.w, l(0.000000)  // r3.w <- smoothFactor
  mul r3.w, r3.w, r3.w  // r3.w <- <SmoothDistanceAttenuation_id77 return value>

#line 280
  mul r3.w, r3.w, r4.w  // r3.w <- attenuation

#line 336
  mul r13.xyz, r3.wwww, r13.xyzx  // r13.x <- streams.lightColor_id39.x; r13.y <- streams.lightColor_id39.y; r13.z <- streams.lightColor_id39.z

#line 576
  dp3 r3.w, r9.xyzx, r12.xyzx
  max r3.w, r3.w, l(0.000100)  // r3.w <- streams.NdotL_id43
  mul r13.xyz, r3.wwww, r13.xyzx  // r13.x <- streams.lightColorNdotL_id40.x; r13.y <- streams.lightColorNdotL_id40.y; r13.z <- streams.lightColorNdotL_id40.z

#line 568
  add r14.xyz, r5.xyzx, r12.xyzx
  dp3 r4.w, r14.xyzx, r14.xyzx
  rsq r4.w, r4.w
  mul r14.xyz, r4.wwww, r14.xyzx  // r14.x <- streams.H_id68.x; r14.y <- streams.H_id68.y; r14.z <- streams.H_id68.z
  dp3 r4.w, r9.xyzx, r14.xyzx
  max r4.w, r4.w, l(0.000100)  // r4.w <- streams.NdotH_id69
  dp3 r5.w, r12.xyzx, r14.xyzx
  max r5.w, r5.w, l(0.000100)  // r5.w <- streams.LdotH_id70

#line 564
  mov r6.yz, r7.xxyx
  mul r6.yzw, r13.xxyz, r6.xxyz

#line 663
  mad r6.yzw, r6.yyzw, l(0.000000, 0.318310, 0.318310, 0.318310), r11.xxyz  // r6.y <- directLightingContribution.x; r6.z <- directLightingContribution.y; r6.w <- directLightingContribution.z

#line 274
  mov r12.xy, r7.zwzz
  mov r12.z, r8.x
  add r14.xyz, -r12.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r5.w, -r5.w, l(1.000000)
  mul r8.z, r5.w, r5.w
  mul r8.z, r8.z, r8.z
  mul r5.w, r5.w, r8.z
  mad r12.xyz, r14.xyzx, r5.wwww, r12.xyzx  // r12.x <- <FresnelSchlick_id174 return value>.x; r12.y <- <FresnelSchlick_id174 return value>.y; r12.z <- <FresnelSchlick_id174 return value>.z

#line 269
  mul r5.w, r8.y, l(0.500000)  // r5.w <- k
  mad r8.z, -r8.y, l(0.500000), l(1.000000)
  mad r8.w, r3.w, r8.z, r5.w
  div r8.w, r3.w, r8.w  // r8.w <- <VisibilityhSchlickGGX_id192 return value>
  mad r5.w, r10.z, r8.z, r5.w
  div r5.w, r10.z, r5.w  // r5.w <- <VisibilityhSchlickGGX_id192 return value>

#line 322
  mul r5.w, r5.w, r8.w
  mul r3.w, r10.z, r3.w
  div r3.w, r5.w, r3.w  // r3.w <- <VisibilitySmithSchlickGGX_id194 return value>

#line 317
  mul r5.w, r8.y, r8.y  // r5.w <- alphaR2
  mul r4.w, r4.w, r4.w
  mad r8.z, r8.y, r8.y, l(-1.000000)
  mad r4.w, r4.w, r8.z, l(1.000000)
  max r4.w, r4.w, l(0.000100)
  mul r4.w, r4.w, r4.w
  mul r4.w, r4.w, l(3.141593)
  div r4.w, r5.w, r4.w  // r4.w <- <NormalDistributionGGX_id208 return value>

#line 558
  mul r12.xyz, r3.wwww, r12.xyzx
  mul r12.xyz, r4.wwww, r12.xyzx
  mul r12.xyz, r13.xyzx, r12.xyzx

#line 667
  mad r11.xyz, r12.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r6.yzwy  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 653
  iadd r2.w, r2.w, l(1)

#line 669
endloop   // r10.x <- streams.lightIndex_id84

#line 547
ushr r2.x, r2.y, l(16)  // r2.x <- <GetMaxLightCount_id235 return value>

#line 677
mov r2.yzw, v0.xxyz  // r2.y <- streams.PositionWS_id19.x; r2.z <- streams.PositionWS_id19.y; r2.w <- streams.PositionWS_id19.z
mov r4.xyz, r0.xyzx  // r4.x <- streams.viewWS_id61.x; r4.y <- streams.viewWS_id61.y; r4.z <- streams.viewWS_id61.z
mov r5.xyz, r1.xyzx  // r5.x <- streams.normalWS_id16.x; r5.y <- streams.normalWS_id16.y; r5.z <- streams.normalWS_id16.z
mov r6.xyz, cb1[0].xyzx  // r6.y <- streams.matDiffuseVisible_id62.y; r6.z <- streams.matDiffuseVisible_id62.z
mov r7.xyz, r3.xyzx  // r7.x <- streams.matSpecularVisible_id64.x; r7.y <- streams.matSpecularVisible_id64.y; r7.z <- streams.matSpecularVisible_id64.z
mov r8.x, r1.w  // r8.x <- streams.alphaRoughness_id63
mov r8.z, r0.w  // r8.z <- streams.NdotV_id65
mov r9.xyz, r11.xyzx  // r9.x <- directLightingContribution.x; r9.y <- directLightingContribution.y; r9.z <- directLightingContribution.z
mov r3.w, r10.x  // r3.w <- streams.lightIndex_id84
mov r4.w, l(0)  // r4.w <- i
loop 
  ige r5.w, r4.w, r2.x
  breakc_nz r5.w
  if_nz r5.w
    break 
  endif 

#line 421
  ld_indexable(buffer)(uint,uint,uint,uint) r5.w, r3.wwww, t1.yzwx  // r5.w <- realLightIndex
  iadd r3.w, r3.w, l(1)  // r3.w <- streams.lightIndex_id84
  ishl r6.w, r5.w, l(2)
  ld_indexable(buffer)(float,float,float,float) r10.yzw, r6.wwww, t3.wxyz  // r10.y <- spotLight1.x; r10.z <- spotLight1.y; r10.w <- spotLight1.z

#line 427
  bfi r12.xyz, l(30, 30, 30, 0), l(2, 2, 2, 0), r5.wwww, l(1, 2, 3, 0)
  ld_indexable(buffer)(float,float,float,float) r13.xyz, r12.xxxx, t3.xyzw  // r13.x <- spotLight2.x; r13.y <- spotLight2.y; r13.z <- spotLight2.z
  ld_indexable(buffer)(float,float,float,float) r12.xyw, r12.yyyy, t3.xywz  // r12.x <- spotLight3.x; r12.y <- spotLight3.y; r12.w <- spotLight3.z
  ld_indexable(buffer)(float,float,float,float) r14.xyz, r12.zzzz, t3.xyzw  // r14.x <- spotLight4.x; r14.y <- spotLight4.y; r14.z <- spotLight4.z

#line 302
  add r10.yzw, -r2.yyzw, r10.yyzw  // r10.y <- lightVector.x; r10.z <- lightVector.y; r10.w <- lightVector.z
  dp3 r5.w, r10.yzwy, r10.yzwy
  sqrt r6.w, r5.w  // r6.w <- lightVectorLength
  div r10.yzw, r10.yyzw, r6.wwww  // r10.y <- lightVectorNorm.x; r10.z <- lightVectorNorm.y; r10.w <- lightVectorNorm.z

#line 263
  max r6.w, r5.w, l(0.000100)
  div r6.w, l(1.000000, 1.000000, 1.000000, 1.000000), r6.w  // r6.w <- attenuation

#line 205
  mul r5.w, r12.w, r5.w  // r5.w <- factor
  mad r5.w, -r5.w, r5.w, l(1.000000)
  max r5.w, r5.w, l(0.000000)  // r5.w <- smoothFactor
  mul r5.w, r5.w, r5.w  // r5.w <- <SmoothDistanceAttenuation_id85 return value>

#line 264
  mul r5.w, r5.w, r6.w  // r5.w <- attenuation

#line 255
  dp3 r6.w, -r13.xyzx, r10.yzwy  // r6.w <- cd
  mad_sat r6.w, r6.w, r12.x, r12.y  // r6.w <- attenuation
  mul r6.w, r6.w, r6.w

#line 311
  mul r5.w, r5.w, r6.w  // r5.w <- attenuation
  mul r10.yzw, r5.wwww, r14.xxyz  // r10.y <- streams.lightColor_id39.x; r10.z <- streams.lightColor_id39.y; r10.w <- streams.lightColor_id39.z

#line 537
  dp3 r5.w, r5.xyzx, -r13.xyzx
  max r5.w, r5.w, l(0.000100)  // r5.w <- streams.NdotL_id43
  mul r10.yzw, r5.wwww, r10.yyzw  // r10.y <- streams.lightColorNdotL_id40.x; r10.z <- streams.lightColorNdotL_id40.y; r10.w <- streams.lightColorNdotL_id40.z

#line 568
  add r12.xyz, r4.xyzx, -r13.xyzx
  dp3 r6.w, r12.xyzx, r12.xyzx
  rsq r6.w, r6.w
  mul r12.xyz, r6.wwww, r12.xyzx  // r12.x <- streams.H_id68.x; r12.y <- streams.H_id68.y; r12.z <- streams.H_id68.z
  dp3 r6.w, r5.xyzx, r12.xyzx
  max r6.w, r6.w, l(0.000100)  // r6.w <- streams.NdotH_id69
  dp3 r7.w, -r13.xyzx, r12.xyzx
  max r7.w, r7.w, l(0.000100)  // r7.w <- streams.LdotH_id70

#line 564
  mul r12.xyz, r6.xyzx, r10.yzwy

#line 687
  mad r12.xyz, r12.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r9.xyzx  // r12.x <- directLightingContribution.x; r12.y <- directLightingContribution.y; r12.z <- directLightingContribution.z

#line 274
  add r13.xyz, -r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r7.w, -r7.w, l(1.000000)
  mul r8.y, r7.w, r7.w
  mul r8.y, r8.y, r8.y
  mul r7.w, r7.w, r8.y
  mad r13.xyz, r13.xyzx, r7.wwww, r7.xyzx  // r13.x <- <FresnelSchlick_id174 return value>.x; r13.y <- <FresnelSchlick_id174 return value>.y; r13.z <- <FresnelSchlick_id174 return value>.z

#line 269
  mul r7.w, r8.x, l(0.500000)  // r7.w <- k
  mad r8.y, -r8.x, l(0.500000), l(1.000000)
  mad r8.w, r5.w, r8.y, r7.w
  div r8.w, r5.w, r8.w  // r8.w <- <VisibilityhSchlickGGX_id192 return value>
  mad r7.w, r8.z, r8.y, r7.w
  div r7.w, r8.z, r7.w  // r7.w <- <VisibilityhSchlickGGX_id192 return value>

#line 322
  mul r7.w, r7.w, r8.w
  mul r5.w, r8.z, r5.w
  div r5.w, r7.w, r5.w  // r5.w <- <VisibilitySmithSchlickGGX_id194 return value>

#line 317
  mul r7.w, r8.x, r8.x  // r7.w <- alphaR2
  mul r6.w, r6.w, r6.w
  mad r8.y, r8.x, r8.x, l(-1.000000)
  mad r6.w, r6.w, r8.y, l(1.000000)
  max r6.w, r6.w, l(0.000100)
  mul r6.w, r6.w, r6.w
  mul r6.w, r6.w, l(3.141593)
  div r6.w, r7.w, r6.w  // r6.w <- <NormalDistributionGGX_id208 return value>

#line 558
  mul r13.xyz, r5.wwww, r13.xyzx
  mul r13.xyz, r6.wwww, r13.xyzx
  mul r10.yzw, r10.yyzw, r13.xxyz

#line 691
  mad r9.xyz, r10.yzwy, l(0.250000, 0.250000, 0.250000, 0.000000), r12.xyzx  // r9.x <- directLightingContribution.x; r9.y <- directLightingContribution.y; r9.z <- directLightingContribution.z

#line 677
  iadd r4.w, r4.w, l(1)

#line 693
endloop   // r3.w <- streams.lightIndex_id84

#line 701
mov r2.xyz, r0.xyzx  // r2.x <- streams.viewWS_id61.x; r2.y <- streams.viewWS_id61.y; r2.z <- streams.viewWS_id61.z
mov r4.xyz, r1.xyzx  // r4.x <- streams.normalWS_id16.x; r4.y <- streams.normalWS_id16.y; r4.z <- streams.normalWS_id16.z
mov r5.xyz, cb1[0].xyzx  // r5.x <- streams.matDiffuseVisible_id62.x; r5.y <- streams.matDiffuseVisible_id62.y; r5.z <- streams.matDiffuseVisible_id62.z
mov r6.xyz, r3.xyzx  // r6.x <- streams.matSpecularVisible_id64.x; r6.y <- streams.matSpecularVisible_id64.y; r6.z <- streams.matSpecularVisible_id64.z
mov r7.x, r1.w  // r7.x <- streams.alphaRoughness_id63
mov r7.z, r0.w  // r7.z <- streams.NdotV_id65
mov r8.xyz, r9.xyzx  // r8.x <- directLightingContribution.x; r8.y <- directLightingContribution.y; r8.z <- directLightingContribution.z
mov r2.w, l(0)  // r2.w <- i
loop 
  ige r3.w, r2.w, l(8)
  breakc_nz r3.w
  ige r3.w, r2.w, cb2[24].y
  if_nz r3.w
    break 
  endif 

#line 412
  ishl r3.w, r2.w, l(1)

#line 519
  dp3 r4.w, r4.xyzx, -cb2[r3.w + 25].xyzx
  max r4.w, r4.w, l(0.000100)  // r4.w <- streams.NdotL_id43
  mul r10.xyz, r4.wwww, cb2[r3.w + 26].xyzx  // r10.x <- streams.lightColorNdotL_id40.x; r10.y <- streams.lightColorNdotL_id40.y; r10.z <- streams.lightColorNdotL_id40.z

#line 568
  add r11.xyz, r2.xyzx, -cb2[r3.w + 25].xyzx
  dp3 r5.w, r11.xyzx, r11.xyzx
  rsq r5.w, r5.w
  mul r11.xyz, r5.wwww, r11.xyzx  // r11.x <- streams.H_id68.x; r11.y <- streams.H_id68.y; r11.z <- streams.H_id68.z
  dp3 r5.w, r4.xyzx, r11.xyzx
  max r5.w, r5.w, l(0.000100)  // r5.w <- streams.NdotH_id69
  dp3 r3.w, -cb2[r3.w + 25].xyzx, r11.xyzx
  max r3.w, r3.w, l(0.000100)  // r3.w <- streams.LdotH_id70

#line 564
  mul r11.xyz, r5.xyzx, r10.xyzx

#line 711
  mad r11.xyz, r11.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r8.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 274
  add r12.xyz, -r6.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r3.w, -r3.w, l(1.000000)
  mul r6.w, r3.w, r3.w
  mul r6.w, r6.w, r6.w
  mul r3.w, r3.w, r6.w
  mad r12.xyz, r12.xyzx, r3.wwww, r6.xyzx  // r12.x <- <FresnelSchlick_id174 return value>.x; r12.y <- <FresnelSchlick_id174 return value>.y; r12.z <- <FresnelSchlick_id174 return value>.z

#line 269
  mul r3.w, r7.x, l(0.500000)  // r3.w <- k
  mad r6.w, -r7.x, l(0.500000), l(1.000000)
  mad r7.y, r4.w, r6.w, r3.w
  div r7.y, r4.w, r7.y  // r7.y <- <VisibilityhSchlickGGX_id192 return value>
  mad r3.w, r7.z, r6.w, r3.w
  div r3.w, r7.z, r3.w  // r3.w <- <VisibilityhSchlickGGX_id192 return value>

#line 322
  mul r3.w, r3.w, r7.y
  mul r4.w, r7.z, r4.w
  div r3.w, r3.w, r4.w  // r3.w <- <VisibilitySmithSchlickGGX_id194 return value>

#line 317
  mul r4.w, r7.x, r7.x  // r4.w <- alphaR2
  mul r5.w, r5.w, r5.w
  mad r6.w, r7.x, r7.x, l(-1.000000)
  mad r5.w, r5.w, r6.w, l(1.000000)
  max r5.w, r5.w, l(0.000100)
  mul r5.w, r5.w, r5.w
  mul r5.w, r5.w, l(3.141593)
  div r4.w, r4.w, r5.w  // r4.w <- <NormalDistributionGGX_id208 return value>

#line 558
  mul r12.xyz, r3.wwww, r12.xyzx
  mul r12.xyz, r4.wwww, r12.xyzx
  mul r10.xyz, r10.xyzx, r12.xyzx

#line 715
  mad r8.xyz, r10.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r11.xyzx  // r8.x <- directLightingContribution.x; r8.y <- directLightingContribution.y; r8.z <- directLightingContribution.z

#line 701
  iadd r2.w, r2.w, l(1)

#line 717
endloop 

#line 294
dp2 r2.x, cb2[61].xxxx, cb2[43].zzzz

#line 285
mov r4.w, l(1.000000)

#line 725
mov r5.xyz, v0.xyzx  // r5.x <- streams.PositionWS_id19.x; r5.y <- streams.PositionWS_id19.y; r5.z <- streams.PositionWS_id19.z
mov r5.w, v2.x  // r5.w <- streams.DepthVS_id20
mov r2.yzw, r0.xxyz  // r2.y <- streams.viewWS_id61.x; r2.z <- streams.viewWS_id61.y; r2.w <- streams.viewWS_id61.z
mov r6.xyz, r1.xyzx  // r6.x <- streams.normalWS_id16.x; r6.y <- streams.normalWS_id16.y; r6.z <- streams.normalWS_id16.z
mov r7.xyz, cb1[0].xyzx  // r7.x <- streams.matDiffuseVisible_id62.x; r7.y <- streams.matDiffuseVisible_id62.y; r7.z <- streams.matDiffuseVisible_id62.z
mov r9.xyz, r3.xyzx  // r9.x <- streams.matSpecularVisible_id64.x; r9.y <- streams.matSpecularVisible_id64.y; r9.z <- streams.matSpecularVisible_id64.z
mov r10.x, r1.w  // r10.x <- streams.alphaRoughness_id63
mov r10.z, r0.w  // r10.z <- streams.NdotV_id65
mov r11.xyz, r8.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z
mov r3.w, l(0)  // r3.w <- i
loop 
  ige r6.w, r3.w, l(1)
  breakc_nz r6.w
  ige r6.w, r3.w, cb2[40].w
  if_nz r6.w
    break 
  endif 

#line 501
  dp3 r6.w, r6.xyzx, -cb2[41].xyzx
  max r6.w, r6.w, l(0.000100)  // r6.w <- streams.NdotL_id43

#line 365
  ishl r7.w, r3.w, l(2)  // r7.w <- cascadeIndexBase

#line 372
  lt r8.w, cb2[r7.w + 62].x, r5.w

#line 375
  and r8.w, r8.w, l(1)  // r8.w <- cascadeIndex

#line 372
  bfi r10.yw, l(0, 30, 0, 30), l(0, 2, 0, 2), r3.wwww, l(0, 1, 0, 2)
  lt r9.w, cb2[r10.y + 62].x, r5.w

#line 375
  movc r8.w, r9.w, l(2), r8.w

#line 372
  lt r9.w, cb2[r10.w + 62].x, r5.w

#line 375
  movc r8.w, r9.w, l(3), r8.w

#line 293
  add r9.w, -r6.w, l(1.000000)
  max r9.w, r9.w, l(0.000000)  // r9.w <- normalOffsetScale
  mul r9.w, r2.x, r9.w

#line 379
  mad r4.xyz, r9.wwww, r6.xyzx, r5.xyzx  // r4.x <- shadowPosition.x; r4.y <- shadowPosition.y; r4.z <- shadowPosition.z

#line 285
  ishl r7.w, r7.w, l(2)
  imad r7.w, r8.w, l(4), r7.w
  dp4 r12.x, r4.xyzw, cb2[r7.w + 44].xyzw  // r12.x <- shadowPosition.x
  dp4 r12.y, r4.xyzw, cb2[r7.w + 45].xyzw  // r12.y <- shadowPosition.y
  dp4 r12.z, r4.xyzw, cb2[r7.w + 46].xyzw  // r12.z <- shadowPosition.z
  dp4 r4.x, r4.xyzw, cb2[r7.w + 47].xyzw  // r4.x <- shadowPosition.w
  div r4.xyz, r12.xyzx, r4.xxxx  // r4.x <- shadowPosition.x; r4.y <- shadowPosition.y; r4.z <- shadowPosition.z
  add r4.z, r4.z, -cb2[60].x  // r4.z <- depthVS

#line 221
  mad r4.xy, r4.xyxx, cb2[43].xyxx, l(0.500000, 0.500000, 0.000000, 0.000000)
  round_ni r10.yw, r4.xxxy  // r10.y <- base_uv.x; r10.w <- base_uv.y
  add r4.xy, r4.xyxx, -r10.ywyy  // r4.x <- s; r4.y <- t
  add r10.yw, r10.yyyw, l(0.000000, -0.500000, 0.000000, -0.500000)
  mul r10.yw, r10.yyyw, cb2[43].zzzw

#line 234
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
  mad r15.xyzw, r14.xwzw, cb2[43].zwzw, r10.ywyw

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r15.xyxx, t4.xxxx, s0, r4.z  // r4.y <- <SampleTextureAndCompare_id105 return value>

#line 243
  mul r15.xy, r12.xyxx, l(7.000000, 7.000000, 0.000000, 0.000000)

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r7.w, r15.zwzz, t4.xxxx, s0, r4.z  // r7.w <- <SampleTextureAndCompare_id105 return value>

#line 241
  mul r7.w, r7.w, r15.x
  mad r4.x, r4.x, r4.y, r7.w  // r4.x <- shadow

#line 246
  mul r12.xy, r12.xyxx, r12.zwzz
  mov r13.zw, r14.wwwy
  mad r16.xyzw, r13.xzxw, cb2[43].zwzw, r10.ywyw

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r16.xyxx, t4.xxxx, s0, r4.z  // r4.y <- <SampleTextureAndCompare_id105 return value>

#line 242
  mad r4.x, r12.x, r4.y, r4.x
  mad r17.xyzw, r14.xyzy, cb2[43].zwzw, r10.ywyw

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r17.xyxx, t4.xxxx, s0, r4.z

#line 243
  mad r4.x, r15.y, r4.y, r4.x

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r17.zwzz, t4.xxxx, s0, r4.z

#line 244
  mad r4.x, r4.y, l(49.000000), r4.x

#line 247
  mul r13.zw, r12.zzzw, l(0.000000, 0.000000, 7.000000, 7.000000)

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r16.zwzz, t4.xxxx, s0, r4.z

#line 245
  mad r4.x, r13.z, r4.y, r4.x
  mov r14.y, r13.y
  mad r14.xyzw, r14.xyzy, cb2[43].zwzw, r10.ywyw

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r14.xyxx, t4.xxxx, s0, r4.z

#line 246
  mad r4.x, r12.y, r4.y, r4.x

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.y, r14.zwzz, t4.xxxx, s0, r4.z

#line 247
  mad r4.x, r13.w, r4.y, r4.x
  mul r4.y, r12.w, r12.z
  mad r10.yw, r13.xxxy, cb2[43].zzzw, r10.yyyw

#line 201
  sample_c_indexable(texture2d)(float,float,float,float) r4.z, r10.ywyy, t4.xxxx, s0, r4.z  // r4.z <- <SampleTextureAndCompare_id105 return value>

#line 248
  mad r4.x, r4.y, r4.z, r4.x
  mul r4.x, r4.x, l(0.006944)

#line 503
  mul r4.xyz, r4.xxxx, cb2[42].xyzx
  mul r4.xyz, r6.wwww, r4.xyzx  // r4.x <- streams.lightColorNdotL_id40.x; r4.y <- streams.lightColorNdotL_id40.y; r4.z <- streams.lightColorNdotL_id40.z

#line 568
  add r12.xyz, r2.yzwy, -cb2[41].xyzx
  dp3 r7.w, r12.xyzx, r12.xyzx
  rsq r7.w, r7.w
  mul r12.xyz, r7.wwww, r12.xyzx  // r12.x <- streams.H_id68.x; r12.y <- streams.H_id68.y; r12.z <- streams.H_id68.z
  dp3 r7.w, r6.xyzx, r12.xyzx
  max r7.w, r7.w, l(0.000100)  // r7.w <- streams.NdotH_id69
  dp3 r8.w, -cb2[41].xyzx, r12.xyzx
  max r8.w, r8.w, l(0.000100)  // r8.w <- streams.LdotH_id70

#line 564
  mul r12.xyz, r4.xyzx, r7.xyzx

#line 735
  mad r12.xyz, r12.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r11.xyzx  // r12.x <- directLightingContribution.x; r12.y <- directLightingContribution.y; r12.z <- directLightingContribution.z

#line 274
  add r13.xyz, -r9.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r8.w, -r8.w, l(1.000000)
  mul r9.w, r8.w, r8.w
  mul r9.w, r9.w, r9.w
  mul r8.w, r8.w, r9.w
  mad r13.xyz, r13.xyzx, r8.wwww, r9.xyzx  // r13.x <- <FresnelSchlick_id174 return value>.x; r13.y <- <FresnelSchlick_id174 return value>.y; r13.z <- <FresnelSchlick_id174 return value>.z

#line 269
  mul r8.w, r10.x, l(0.500000)  // r8.w <- k
  mad r9.w, -r10.x, l(0.500000), l(1.000000)
  mad r10.y, r6.w, r9.w, r8.w
  div r10.y, r6.w, r10.y  // r10.y <- <VisibilityhSchlickGGX_id192 return value>
  mad r8.w, r10.z, r9.w, r8.w
  div r8.w, r10.z, r8.w  // r8.w <- <VisibilityhSchlickGGX_id192 return value>

#line 322
  mul r8.w, r8.w, r10.y
  mul r6.w, r10.z, r6.w
  div r6.w, r8.w, r6.w  // r6.w <- <VisibilitySmithSchlickGGX_id194 return value>

#line 317
  mul r8.w, r10.x, r10.x  // r8.w <- alphaR2
  mul r7.w, r7.w, r7.w
  mad r9.w, r10.x, r10.x, l(-1.000000)
  mad r7.w, r7.w, r9.w, l(1.000000)
  max r7.w, r7.w, l(0.000100)
  mul r7.w, r7.w, r7.w
  mul r7.w, r7.w, l(3.141593)
  div r7.w, r8.w, r7.w  // r7.w <- <NormalDistributionGGX_id208 return value>

#line 558
  mul r13.xyz, r6.wwww, r13.xyzx
  mul r13.xyz, r7.wwww, r13.xyzx
  mul r4.xyz, r4.xyzx, r13.xyzx

#line 739
  mad r11.xyz, r4.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r12.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 725
  iadd r3.w, r3.w, l(1)

#line 741
endloop 

#line 341
add r0.x, -r1.w, l(1.000000)  // r0.x <- x

#line 349
mul r0.y, r0.x, r0.x

#line 357
mul r0.z, r0.y, l(1.895000)

#line 349
mad r0.z, r0.x, l(-0.168800), r0.z
mad r1.x, r0.w, l(-4.853000), l(0.990300)
mul r1.y, r0.w, r0.w
mad r1.x, r1.y, l(8.404000), r1.x
mul r1.z, r0.w, r1.y
mad r1.x, r1.z, l(-5.069000), r1.x
min_sat r0.z, r0.z, r1.x  // r0.z <- bias

#line 357
mad r1.x, r0.x, l(1.699000), l(0.604500)
mad r1.x, r0.w, l(-0.522800), r1.x
mad r1.x, r0.y, l(-3.603000), r1.x
mul r0.w, r0.x, r0.w
mad r0.w, r0.w, l(1.404000), r1.x
mad r0.w, r1.y, l(0.193900), r0.w
mul r0.x, r0.x, r0.y
mad_sat r0.x, r0.x, l(2.661000), r0.w  // r0.x <- delta
add r0.x, -r0.z, r0.x  // r0.x <- scale
mul_sat r0.y, r3.y, l(50.000000)
mul r0.y, r0.y, r0.z  // r0.y <- bias
mad r0.xyz, r3.xyzx, r0.xxxx, r0.yyyy  // r0.x <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id209 return value>.x; r0.y <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id209 return value>.y; r0.z <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id209 return value>.z

#line 485
mul r0.xyz, r0.xyzx, cb2[66].xyzx  // r0.x <- <ComputeEnvironmentLightContribution_id408 return value>.x; r0.y <- <ComputeEnvironmentLightContribution_id408 return value>.y; r0.z <- <ComputeEnvironmentLightContribution_id408 return value>.z

#line 753
mad r0.xyz, cb1[0].xyzx, cb2[66].xyzx, r0.xyzx  // r0.x <- environmentLightingContribution.x; r0.y <- environmentLightingContribution.y; r0.z <- environmentLightingContribution.z

#line 756
mad o0.xyz, r11.xyzx, l(3.141593, 3.141593, 3.141593, 0.000000), r0.xyzx

#line 946
mov o0.w, cb1[0].w
ret 
// Approximately 440 instruction slots used
***************************
*************************/
const static int ClusterSize2_id82 = 64;
const static int TMaxLightCount_id95 = 8;
const static int TMaxLightCount_id98 = 1;
const static int TCascadeCountBase_id161 = 4;
const static int TLightCountBase_id162 = 1;
const static int TCascadeCount_id166 = 4;
const static int TLightCount_id167 = 1;
const static bool TBlendCascades_id168 = false;
const static bool TDepthRangeAuto_id169 = true;
const static bool TCascadeDebug_id170 = false;
const static int TFilterSize_id172 = 5;
const static bool TIsNormalXY1_id178 = false;
const static bool TScaleAndBias_id179 = true;
const static bool TInvert_id182 = false;
const static bool TIsEnergyConservative_id193 = false;
static const float PI_id195 = 3.14159265358979323846;
SamplerComparisonState LinearClampCompareLessEqualSampler_id135 
{
    Filter = COMPARISON_MIN_MAG_LINEAR_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
    ComparisonFunc = LessEqual;
};
Texture3D<uint2> LightClusters_id85;
Buffer<uint> LightIndices_id86;
Buffer<float4> PointLights_id90;
Buffer<float4> SpotLights_id93;
Texture2D ShadowMapTexture_id100;
struct PS_STREAMS 
{
    float3 meshNormal_id14;
    float4 meshTangent_id15;
    float4 PositionWS_id19;
    float4 ShadingPosition_id0;
    float DepthVS_id20;
    float3x3 tangentToWorld_id17;
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
    float3 normalWS_id16;
    float3 lightDirectionWS_id38;
    float3 lightColor_id39;
    float3 lightColorNdotL_id40;
    float3 envLightDiffuseColor_id41;
    float3 envLightSpecularColor_id42;
    float lightDirectAmbientOcclusion_id44;
    float NdotL_id43;
    float NdotV_id65;
    uint2 lightData_id83;
    int lightIndex_id84;
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
    float4 meshTangent_id15;
    float4 PositionH_id21;
    float3 normalWS_id16;
    float4 PositionWS_id19;
    float4 ShadingPosition_id0;
    float DepthVS_id20;
};
struct VS_OUTPUT 
{
    float4 PositionWS_id19 : POSITION_WS;
    float4 ShadingPosition_id0 : SV_Position;
    float DepthVS_id20 : DEPTH_VS;
    float3 meshNormal_id14 : NORMAL;
    float4 meshTangent_id15 : TANGENT;
};
struct VS_INPUT 
{
    float4 Position_id18 : POSITION;
    float3 meshNormal_id14 : NORMAL;
    float4 meshTangent_id15 : TANGENT;
};
struct PointLightData 
{
    float3 PositionWS;
    float InvSquareRadius;
    float3 Color;
};
struct PointLightDataInternal 
{
    float3 PositionWS;
    float InvSquareRadius;
    float3 Color;
};
struct SpotLightData 
{
    float3 PositionWS;
    float3 DirectionWS;
    float3 AngleOffsetAndInvSquareRadius;
    float3 Color;
};
struct SpotLightDataInternal 
{
    float3 PositionWS;
    float3 DirectionWS;
    float3 AngleOffsetAndInvSquareRadius;
    float3 Color;
};
struct DirectionalLightData 
{
    float3 DirectionWS;
    float3 Color;
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
cbuffer PerMaterial 
{
    float4 constantColor_id175;
    float4 constantColor_id177;
    float constantFloat_id181;
    float4 constantColor_id187;
    float constantFloat_id189;
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
    float NearClipPlane_id77 = 1.0f;
    float FarClipPlane_id78 = 100.0f;
    float2 ZProjection_id79;
    float2 ViewSize_id80;
    float AspectRatio_id81;
    float ClusterDepthScale_id87;
    float ClusterDepthBias_id88;
    int LightCount_id94;
    DirectionalLightData Lights_id96[TMaxLightCount_id95];
    int LightCount_id97;
    DirectionalLightData Lights_id99[TMaxLightCount_id98];
    float2 ShadowMapTextureSize_id101;
    float2 ShadowMapTextureTexelSize_id102;
    float4x4 WorldToShadowCascadeUV_id163[TCascadeCountBase_id161 * TLightCountBase_id162];
    float DepthBiases_id164[TLightCountBase_id162];
    float OffsetScales_id165[TLightCountBase_id162];
    float CascadeDepthSplits_id171[TCascadeCount_id166 * TLightCount_id167];
    float Bias_id173;
    float3 AmbientLight_id174;
};
cbuffer Globals 
{
    float2 Texture0TexelSize_id104;
    float2 Texture1TexelSize_id106;
    float2 Texture2TexelSize_id108;
    float2 Texture3TexelSize_id110;
    float2 Texture4TexelSize_id112;
    float2 Texture5TexelSize_id114;
    float2 Texture6TexelSize_id116;
    float2 Texture7TexelSize_id118;
    float2 Texture8TexelSize_id120;
    float2 Texture9TexelSize_id122;
};
float SampleTextureAndCompare_id105(float2 position, float positionDepth)
{
    return ShadowMapTexture_id100.SampleCmp(LinearClampCompareLessEqualSampler_id135, position, positionDepth);
}
float SmoothDistanceAttenuation_id85(float squaredDistance, float lightInvSquareRadius)
{
    float factor = squaredDistance * lightInvSquareRadius;
    float smoothFactor = saturate(1.0f - factor * factor);
    return smoothFactor * smoothFactor;
}
float SmoothDistanceAttenuation_id77(float squaredDistance, float lightInvSquareRadius)
{
    float factor = squaredDistance * lightInvSquareRadius;
    float smoothFactor = saturate(1.0f - factor * factor);
    return smoothFactor * smoothFactor;
}
float FilterShadow_id101(float2 position, float positionDepth)
{
    float shadow = 0.0f;
    float2 uv = position * ShadowMapTextureSize_id101;
    float2 base_uv;
    base_uv.x = floor(uv.x + 0.5);
    base_uv.y = floor(uv.y + 0.5);
    float s = (uv.x + 0.5 - base_uv.x);
    float t = (uv.y + 0.5 - base_uv.y);
    base_uv -= float2(0.5, 0.5);
    base_uv *= ShadowMapTextureTexelSize_id102;

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
        shadow += uw0 * vw0 * SampleTextureAndCompare_id105(base_uv + float2(u0, v0) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw1 * vw0 * SampleTextureAndCompare_id105(base_uv + float2(u1, v0) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw2 * vw0 * SampleTextureAndCompare_id105(base_uv + float2(u2, v0) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw0 * vw1 * SampleTextureAndCompare_id105(base_uv + float2(u0, v1) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw1 * vw1 * SampleTextureAndCompare_id105(base_uv + float2(u1, v1) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw2 * vw1 * SampleTextureAndCompare_id105(base_uv + float2(u2, v1) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw0 * vw2 * SampleTextureAndCompare_id105(base_uv + float2(u0, v2) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw1 * vw2 * SampleTextureAndCompare_id105(base_uv + float2(u1, v2) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow += uw2 * vw2 * SampleTextureAndCompare_id105(base_uv + float2(u2, v2) * ShadowMapTextureTexelSize_id102, positionDepth);
        shadow /= 144.0f;
    }
    return shadow;
}
float GetAngleAttenuation_id87(float3 lightVector, float3 lightDirection, float lightAngleScale, float lightAngleOffset)
{
    float cd = dot(lightDirection, lightVector);
    float attenuation = saturate(cd * lightAngleScale + lightAngleOffset);
    attenuation *= attenuation;
    return attenuation;
}
float GetDistanceAttenuation_id86(float3 lightVector, float lightInvSquareRadius)
{
    float d2 = dot(lightVector, lightVector);
    float attenuation = 1.0 / (max(d2, 0.01 * 0.01));
    attenuation *= SmoothDistanceAttenuation_id85(d2, lightInvSquareRadius);
    return attenuation;
}
float VisibilityhSchlickGGX_id192(float alphaR, float nDotX)
{
    float k = alphaR * 0.5f;
    return nDotX / (nDotX * (1.0f - k) + k);
}
float3 FresnelSchlick_id174(float3 f0, float3 f90, float lOrVDotH)
{
    return f0 + (f90 - f0) * pow((1 - lOrVDotH), 5);
}
float GetDistanceAttenuation_id78(float3 lightVector, float lightInvSquareRadius)
{
    float d2 = dot(lightVector, lightVector);
    float attenuation = 1.0 / (max(d2, 0.01 * 0.01));
    attenuation *= SmoothDistanceAttenuation_id77(d2, lightInvSquareRadius);
    return attenuation;
}
float ComputeShadowFromCascade_id104(float3 shadowPositionWS, int cascadeIndex, int lightIndex)
{
    float4 shadowPosition = mul(float4(shadowPositionWS, 1), WorldToShadowCascadeUV_id163[cascadeIndex + lightIndex * TCascadeCountBase_id161]);
    shadowPosition.xyz /= shadowPosition.w;
    float depthVS = shadowPosition.z;
    depthVS -= DepthBiases_id164[lightIndex];
    return FilterShadow_id101(shadowPosition.xy, depthVS);
}
float3 GetShadowPositionOffset_id103(float offsetScale, float nDotL, float3 normal)
{
    float normalOffsetScale = saturate(1.0f - nDotL);
    return 2.0f * ShadowMapTextureTexelSize_id102.x * offsetScale * normalOffsetScale * normal;
}
void ComputeShadow_id102(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void ProcessLight_id88(inout PS_STREAMS streams, SpotLightDataInternal light)
{
    float3 lightVector = light.PositionWS - streams.PositionWS_id19;
    float lightVectorLength = length(lightVector);
    float3 lightVectorNorm = lightVector / lightVectorLength;
    float3 lightAngleOffsetAndInvSquareRadius = light.AngleOffsetAndInvSquareRadius;
    float2 lightAngleAndOffset = lightAngleOffsetAndInvSquareRadius.xy;
    float lightInvSquareRadius = lightAngleOffsetAndInvSquareRadius.z;
    float3 lightDirection = -light.DirectionWS;
    float attenuation = 1;
    attenuation *= GetDistanceAttenuation_id86(lightVector, lightInvSquareRadius);
    attenuation *= GetAngleAttenuation_id87(lightVectorNorm, lightDirection, lightAngleAndOffset.x, lightAngleAndOffset.y);
    streams.lightColor_id39 = light.Color * attenuation;
    streams.lightDirectionWS_id38 = lightDirection;
}
float NormalDistributionGGX_id208(float alphaR, float nDotH)
{
    float alphaR2 = alphaR * alphaR;
    return alphaR2 / (PI_id195 * pow(max(nDotH * nDotH * (alphaR2 - 1) + 1, 0.0001), 2.0f));
}
float VisibilitySmithSchlickGGX_id194(float alphaR, float nDotL, float nDotV)
{
    return VisibilityhSchlickGGX_id192(alphaR, nDotL) * VisibilityhSchlickGGX_id192(alphaR, nDotV) / (nDotL * nDotV);
}
float3 FresnelSchlick_id180(float3 f0, float lOrVDotH)
{
    return FresnelSchlick_id174(f0, 1.0f, lOrVDotH);
}
void ProcessLight_id80(inout PS_STREAMS streams, PointLightDataInternal light)
{
    float3 lightVector = light.PositionWS - streams.PositionWS_id19;
    float lightVectorLength = length(lightVector);
    float3 lightVectorNorm = lightVector / lightVectorLength;
    float lightInvSquareRadius = light.InvSquareRadius;
    float attenuation = 1;
    attenuation *= GetDistanceAttenuation_id78(lightVector, lightInvSquareRadius);
    streams.lightColor_id39 = light.Color * attenuation;
    streams.lightDirectionWS_id38 = lightVectorNorm;
}
float3 EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id209(float3 specularColor, float alphaR, float nDotV)
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
void ComputeShadow_id96(inout PS_STREAMS streams, int lightIndex)
{
    ComputeShadow_id102(streams, lightIndex);
    int cascadeIndexBase = lightIndex * TCascadeCount_id166;
    int cascadeIndex = 0;

    [unroll]
    for (int i = 0; i < TCascadeCount_id166 - 1; i++)
    {
        [flatten]
        if (streams.DepthVS_id20 > CascadeDepthSplits_id171[cascadeIndexBase + i])
        {
            cascadeIndex = i + 1;
        }
    }
    float shadow = 1.0;
    float3 shadowPosition = streams.PositionWS_id19.xyz;
    shadowPosition += GetShadowPositionOffset_id103(OffsetScales_id165[lightIndex], streams.NdotL_id43, streams.normalWS_id16);
    if (cascadeIndex < TCascadeCount_id166)
    {
        shadow = ComputeShadowFromCascade_id104(shadowPosition, cascadeIndex, lightIndex);
        float nextSplit = CascadeDepthSplits_id171[cascadeIndexBase + cascadeIndex];
        float splitSize = cascadeIndex == 0 ? nextSplit : nextSplit - CascadeDepthSplits_id171[cascadeIndexBase + cascadeIndex - 1];
        float splitDist = (nextSplit - streams.DepthVS_id20) / splitSize;
        float lerpAmt = smoothstep(0.0f, 1.0f, splitDist);
        if (cascadeIndex == TCascadeCount_id166 - 1)
        {
        }
        else if (TBlendCascades_id168)
        {
            float nextShadow = ComputeShadowFromCascade_id104(shadowPosition, cascadeIndex + 1, lightIndex);
            shadow = lerp(nextShadow, shadow, lerpAmt);
        }
    }

    {
        streams.shadowColor_id76 = shadow;
    }
}
void PrepareDirectLightCore_id95(inout PS_STREAMS streams, int lightIndex)
{
    streams.lightColor_id39 = Lights_id99[lightIndex].Color;
    streams.lightDirectionWS_id38 = -Lights_id99[lightIndex].DirectionWS;
}
void ComputeShadow_id92(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void PrepareDirectLightCore_id91(inout PS_STREAMS streams, int lightIndex)
{
    streams.lightColor_id39 = Lights_id96[lightIndex].Color;
    streams.lightDirectionWS_id38 = -Lights_id96[lightIndex].DirectionWS;
}
void ComputeShadow_id84(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void PrepareDirectLightCore_id83(inout PS_STREAMS streams, int lightIndexIgnored)
{
    int realLightIndex = LightIndices_id86.Load(streams.lightIndex_id84);
    streams.lightIndex_id84++;
    SpotLightDataInternal spotLight;
    float4 spotLight1 = SpotLights_id93.Load(realLightIndex * 4);
    float4 spotLight2 = SpotLights_id93.Load(realLightIndex * 4 + 1);
    float4 spotLight3 = SpotLights_id93.Load(realLightIndex * 4 + 2);
    float4 spotLight4 = SpotLights_id93.Load(realLightIndex * 4 + 3);
    spotLight.PositionWS = spotLight1.xyz;
    spotLight.DirectionWS = spotLight2.xyz;
    spotLight.AngleOffsetAndInvSquareRadius = spotLight3.xyz;
    spotLight.Color = spotLight4.xyz;
    ProcessLight_id88(streams, spotLight);
}
float Compute_id329(inout PS_STREAMS streams)
{
    return NormalDistributionGGX_id208(streams.alphaRoughness_id63, streams.NdotH_id69);
}
float Compute_id300(inout PS_STREAMS streams)
{
    return VisibilitySmithSchlickGGX_id194(streams.alphaRoughness_id63, streams.NdotL_id43, streams.NdotV_id65);
}
float3 Compute_id271(inout PS_STREAMS streams, float3 f0)
{
    return FresnelSchlick_id180(f0, streams.LdotH_id70);
}
void ComputeShadow_id76(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void PrepareDirectLightCore_id75(inout PS_STREAMS streams, int lightIndexIgnored)
{
    int realLightIndex = LightIndices_id86.Load(streams.lightIndex_id84);
    streams.lightIndex_id84++;
    PointLightDataInternal pointLight;
    float4 pointLight1 = PointLights_id90.Load(realLightIndex * 2);
    float4 pointLight2 = PointLights_id90.Load(realLightIndex * 2 + 1);
    pointLight.PositionWS = pointLight1.xyz;
    pointLight.InvSquareRadius = pointLight1.w;
    pointLight.Color = pointLight2.xyz;
    ProcessLight_id80(streams, pointLight);
}
void PrepareLightData_id79(inout PS_STREAMS streams)
{
    float projectedDepth = streams.ShadingPosition_id0.z;
    float depth = ZProjection_id79.y / (projectedDepth - ZProjection_id79.x);
    int2 shadingPosition = int2(streams.ShadingPosition_id0.xy);
    int slice = int(max(log2(depth * ClusterDepthScale_id87 + ClusterDepthBias_id88), 0));
    streams.lightData_id83 = LightClusters_id85.Load(int4(shadingPosition / ClusterSize2_id82, slice, 0));
    streams.lightIndex_id84 = streams.lightData_id83.x;
}
float GetFilterSquareRoughnessAdjustment_id146(inout PS_STREAMS streams, float3 averageNormal)
{
    float r = length(streams.matNormal_id45);
    float roughnessAdjust = 0.0f;
    if (r < 1.0f)
        roughnessAdjust = 0.5 * (1 - r * r) / (3 * r - r * r * r);
    return roughnessAdjust;
}
void ResetStream_id212()
{
}
float3 ComputeEnvironmentLightContribution_id408(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    return EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id209(specularColor, streams.alphaRoughness_id63, streams.NdotV_id65) * streams.envLightSpecularColor_id42;
}
float3 ComputeEnvironmentLightContribution_id359(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor * streams.envLightDiffuseColor_id41;
}
void PrepareEnvironmentLight_id260(inout PS_STREAMS streams)
{
    float3 lightColor = AmbientLight_id174 * streams.matAmbientOcclusion_id51;
    streams.envLightDiffuseColor_id41 = lightColor;
    streams.envLightSpecularColor_id42 = lightColor;
}
void PrepareDirectLight_id250(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id95(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id96(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id251()
{
    return LightCount_id97;
}
int GetMaxLightCount_id252()
{
    return TMaxLightCount_id98;
}
void PrepareDirectLights_id248()
{
}
void PrepareDirectLight_id242(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id91(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id92(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id243()
{
    return LightCount_id94;
}
int GetMaxLightCount_id244()
{
    return TMaxLightCount_id95;
}
void PrepareDirectLights_id240()
{
}
void PrepareDirectLight_id233(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id83(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id84(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id236(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y >> 16;
}
int GetMaxLightCount_id235(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y >> 16;
}
void PrepareDirectLights_id231()
{
}
float3 ComputeDirectLightContribution_id407(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    float3 fresnel = Compute_id271(streams, specularColor);
    float geometricShadowing = Compute_id300(streams);
    float normalDistribution = Compute_id329(streams);
    float3 reflected = fresnel * geometricShadowing * normalDistribution / 4;
    return reflected * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.y;
}
float3 ComputeDirectLightContribution_id358(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor / PI_id195 * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.x;
}
void PrepareMaterialPerDirectLight_id26(inout PS_STREAMS streams)
{
    streams.H_id68 = normalize(streams.viewWS_id61 + streams.lightDirectionWS_id38);
    streams.NdotH_id69 = max(dot(streams.normalWS_id16, streams.H_id68), 0.0001f);
    streams.LdotH_id70 = max(dot(streams.lightDirectionWS_id38, streams.H_id68), 0.0001f);
    streams.VdotH_id71 = streams.LdotH_id70;
}
void PrepareDirectLight_id223(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id75(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id76(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id227(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y & 0xFFFF;
}
int GetMaxLightCount_id226(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y & 0xFFFF;
}
void PrepareDirectLights_id225(inout PS_STREAMS streams)
{
    PrepareLightData_id79(streams);
}
void PrepareMaterialForLightingAndShading_id211(inout PS_STREAMS streams)
{
    streams.lightDirectAmbientOcclusion_id44 = lerp(1.0, streams.matAmbientOcclusion_id51, streams.matAmbientOcclusionDirectLightingFactor_id52);
    streams.matDiffuseVisible_id62 = streams.matDiffuse_id47.rgb * lerp(1.0f, streams.matCavity_id53, streams.matCavityDiffuse_id54) * streams.matDiffuseSpecularAlphaBlend_id58.r * streams.matAlphaBlendColor_id59;
    streams.matSpecularVisible_id64 = streams.matSpecular_id49.rgb * streams.matSpecularIntensity_id50 * lerp(1.0f, streams.matCavity_id53, streams.matCavitySpecular_id55) * streams.matDiffuseSpecularAlphaBlend_id58.g * streams.matAlphaBlendColor_id59;
    streams.NdotV_id65 = max(dot(streams.normalWS_id16, streams.viewWS_id61), 0.0001f);
    float roughness = 1.0f - streams.matGlossiness_id48;
    float roughnessAdjust = GetFilterSquareRoughnessAdjustment_id146(streams, streams.matNormal_id45);
    streams.alphaRoughness_id63 = max(roughness * roughness + roughnessAdjust, 0.001);
}
void ResetLightStream_id210(inout PS_STREAMS streams)
{
    streams.lightDirectionWS_id38 = 0;
    streams.lightColor_id39 = 0;
    streams.lightColorNdotL_id40 = 0;
    streams.envLightDiffuseColor_id41 = 0;
    streams.envLightSpecularColor_id42 = 0;
    streams.lightDirectAmbientOcclusion_id44 = 1.0f;
    streams.NdotL_id43 = 0;
}
void UpdateNormalFromTangentSpace_id12(inout PS_STREAMS streams, float3 normalInTangentSpace)
{
    streams.normalWS_id16 = normalize(mul(normalInTangentSpace, streams.tangentToWorld_id17));
}
float4 Compute_id269()
{
    return float4(constantFloat_id189, constantFloat_id189, constantFloat_id189, constantFloat_id189);
}
float4 Compute_id267()
{
    return constantColor_id187;
}
float4 Compute_id265()
{
    return float4(constantFloat_id181, constantFloat_id181, constantFloat_id181, constantFloat_id181);
}
float4 Compute_id263()
{
    return constantColor_id177;
}
float4 Compute_id261()
{
    return constantColor_id175;
}
void ResetStream_id215(inout PS_STREAMS streams)
{
    ResetStream_id212();
    streams.matBlend_id37 = 0.0f;
}
void Compute_id448(inout PS_STREAMS streams)
{
    UpdateNormalFromTangentSpace_id12(streams, streams.matNormal_id45);
    ResetLightStream_id210(streams);
    PrepareMaterialForLightingAndShading_id211(streams);
    float3 directLightingContribution = 0;

    {
        PrepareDirectLights_id225(streams);
        const int maxLightCount = GetMaxLightCount_id226(streams);
        int count = GetLightCount_id227(streams);

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id223(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id358(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id407(streams);
            }
        }
    }

    {
        PrepareDirectLights_id231();
        const int maxLightCount = GetMaxLightCount_id235(streams);
        int count = GetLightCount_id236(streams);

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id233(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id358(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id407(streams);
            }
        }
    }

    {
        PrepareDirectLights_id240();
        const int maxLightCount = GetMaxLightCount_id244();
        int count = GetLightCount_id243();

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id242(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id358(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id407(streams);
            }
        }
    }

    {
        PrepareDirectLights_id248();
        const int maxLightCount = GetMaxLightCount_id252();
        int count = GetLightCount_id251();

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id250(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id358(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id407(streams);
            }
        }
    }
    float3 environmentLightingContribution = 0;

    {
        PrepareEnvironmentLight_id260(streams);

        {
            environmentLightingContribution += ComputeEnvironmentLightContribution_id359(streams);
        }

        {
            environmentLightingContribution += ComputeEnvironmentLightContribution_id408(streams);
        }
    }
    streams.shadingColor_id66 += directLightingContribution * PI_id195 + environmentLightingContribution;
    streams.shadingColorAlpha_id67 = streams.matDiffuse_id47.a;
}
void Compute_id433(inout PS_STREAMS streams)
{
    streams.matSpecularIntensity_id50 = Compute_id269().r;
}
void Compute_id428(inout PS_STREAMS streams)
{
    streams.matSpecular_id49 = Compute_id267().rgb;
}
void Compute_id423(inout PS_STREAMS streams)
{
    float glossiness = Compute_id265().r;
    streams.matGlossiness_id48 = glossiness;
}
void Compute_id418(inout PS_STREAMS streams)
{
    float4 normal = Compute_id263();
    if (normal.z == 0)
    {
        streams.matNormal_id45 = float3(normal.xy, 1);
    }
    else
    {

        {
            normal = (2.0f * normal) - 1.0f;
        }

        {
            streams.matNormal_id45 = normal.xyz;
        }
    }
}
void Compute_id413(inout PS_STREAMS streams)
{
    float4 colorBase = Compute_id261();
    streams.matDiffuse_id47 = colorBase;
    streams.matColorBase_id46 = colorBase;
}
void ResetStream_id217(inout PS_STREAMS streams)
{
    ResetStream_id215(streams);
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
void Compute_id72(inout PS_STREAMS streams)
{

    {
        Compute_id413(streams);
    }

    {
        Compute_id418(streams);
    }

    {
        Compute_id423(streams);
    }

    {
        Compute_id428(streams);
    }

    {
        Compute_id433(streams);
    }

    {
        Compute_id448(streams);
    }
}
void ResetStream_id71(inout PS_STREAMS streams)
{
    ResetStream_id217(streams);
    streams.shadingColorAlpha_id67 = 1.0f;
}
float3x3 GetTangentWorldTransform_id18()
{
    return (float3x3)World_id29;
}
float3x3 GetTangentMatrix_id9(inout PS_STREAMS streams)
{
    float3x3 tangentMatrix;
    streams.meshNormal_id14 = normalize(streams.meshNormal_id14);
    float3 tangent = normalize(streams.meshTangent_id15.xyz);
    float3 bitangent = streams.meshTangent_id15.w * cross(streams.meshNormal_id14, tangent);
    tangentMatrix = float3x3(tangent, bitangent, streams.meshNormal_id14);
    return tangentMatrix;
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
float4 Shading_id27(inout PS_STREAMS streams)
{
    streams.viewWS_id61 = normalize(Eye_id28.xyz - streams.PositionWS_id19.xyz);
    streams.shadingColor_id66 = 0;
    ResetStream_id71(streams);
    Compute_id72(streams);
    return float4(streams.shadingColor_id66, streams.shadingColorAlpha_id67);
}
void PSMain_id1()
{
}
void UpdateTangentToWorld_id11(inout PS_STREAMS streams)
{
    float3x3 tangentMatrix = GetTangentMatrix_id9(streams);
    float3x3 tangentWorldTransform = GetTangentWorldTransform_id18();
    streams.tangentToWorld_id17 = mul(tangentMatrix, tangentWorldTransform);
}
void GenerateNormal_PS_id16()
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
    streams.ColorTarget_id1 = Shading_id27(streams);
}
void GenerateNormal_PS_id17(inout PS_STREAMS streams)
{
    GenerateNormal_PS_id16();
    UpdateTangentToWorld_id11(streams);
}
void GenerateNormal_VS_id15(inout VS_STREAMS streams)
{
    streams.normalWS_id16 = 0.0f;
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
    streams.ShadingPosition_id0 = __input__.ShadingPosition_id0;
    streams.DepthVS_id20 = __input__.DepthVS_id20;
    streams.meshNormal_id14 = __input__.meshNormal_id14;
    streams.meshTangent_id15 = __input__.meshTangent_id15;
    GenerateNormal_PS_id17(streams);
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
    streams.meshTangent_id15 = __input__.meshTangent_id15;
    VSMain_id8(streams);
    GenerateNormal_VS_id15(streams);
    VS_OUTPUT __output__ = (VS_OUTPUT)0;
    __output__.PositionWS_id19 = streams.PositionWS_id19;
    __output__.ShadingPosition_id0 = streams.ShadingPosition_id0;
    __output__.DepthVS_id20 = streams.DepthVS_id20;
    __output__.meshNormal_id14 = streams.meshNormal_id14;
    __output__.meshTangent_id15 = streams.meshTangent_id15;
    return __output__;
}
