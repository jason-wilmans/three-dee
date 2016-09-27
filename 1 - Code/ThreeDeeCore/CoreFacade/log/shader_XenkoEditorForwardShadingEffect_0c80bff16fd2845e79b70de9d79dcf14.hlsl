/**************************
***** Compiler Parameters *****
***************************
@P EffectName: XenkoEditorForwardShadingEffect
@P   - Material.PixelStageSurfaceShaders: mixin MaterialSurfaceArray [{layers = [mixin MaterialSurfaceDiffuse [{diffuseMap = ComputeColorConstantColorLink<Material.DiffuseValue>}], mixin MaterialSurfaceNormalMap<false,true> [{normalMap = ComputeColorConstantColorLink<Material.NormalValue>}], mixin MaterialSurfaceGlossinessMap<false> [{glossinessMap = ComputeColorConstantFloatLink<Material.GlossinessValue>}], mixin MaterialSurfaceSetStreamFromComputeColor<matSpecular,rgb> [{computeColorSource = ComputeColorConstantColorLink<Material.SpecularValue>}], mixin MaterialSurfaceSetStreamFromComputeColor<matSpecularIntensity,r> [{computeColorSource = ComputeColorConstantFloatLink<Material.SpecularIntensityValue>}], mixin MaterialSurfaceLightingAndShading [{surfaces = [MaterialSurfaceShadingDiffuseLambert<false>, mixin MaterialSurfaceShadingSpecularMicrofacet [{fresnelFunction = MaterialSpecularMicrofacetFresnelSchlick}, {geometricShadowingFunction = MaterialSpecularMicrofacetVisibilitySmithSchlickGGX}, {normalDistributionFunction = MaterialSpecularMicrofacetNormalDistributionGGX}]]}]]}]
@P Material.PixelStageStreamInitializer: mixin MaterialStream, MaterialPixelShadingStream
@P Material.HasNormalMap: True
@P Lighting.DirectLightGroups: LightClusteredPointGroup<64>, LightClusteredSpotGroup<64>, mixin LightDirectionalGroup<8>
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
@C    constantColor_id98 => Material.DiffuseValue
@C    constantColor_id100 => Material.NormalValue
@C    constantFloat_id104 => Material.GlossinessValue
@C    constantColor_id168 => Material.SpecularValue
@C    constantFloat_id170 => Material.SpecularIntensityValue
cbuffer PerView [Size: 672]
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
@C    AmbientLight_id97 => LightSimpleAmbient.AmbientLight.environmentLights[0]
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
@R    PerMaterial => PerMaterial [Stage: None, Slot: (-1--1)]
@R    PerDraw => PerDraw [Stage: Vertex, Slot: (0-0)]
@R    PerView => PerView [Stage: Vertex, Slot: (1-1)]
@R    LightClusters_id85 => LightClustered.LightClusters [Stage: Pixel, Slot: (0-0)]
@R    LightIndices_id86 => LightClustered.LightIndices [Stage: Pixel, Slot: (1-1)]
@R    PointLights_id90 => LightClusteredPointGroup.PointLights [Stage: Pixel, Slot: (2-2)]
@R    SpotLights_id93 => LightClusteredSpotGroup.SpotLights [Stage: Pixel, Slot: (3-3)]
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
@S    Texturing => a9d9ee1fb9a68af7ce6b12291686faea
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
@G    Vertex => 6a50c93e729fbf80d47d14b0ea6249e6
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
//   float3 AmbientLight_id97;          // Offset:  656 Size:    12 [unused]
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
// NORMAL                   0   xyz         2     NONE   float   xyz 
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
dcl_output o2.xyz
dcl_output o3.xyzw
dcl_temps 1
//
// Initial variable locations:
//   v0.x <- __input__.Position_id18.x; v0.y <- __input__.Position_id18.y; v0.z <- __input__.Position_id18.z; v0.w <- __input__.Position_id18.w; 
//   v1.x <- __input__.meshNormal_id14.x; v1.y <- __input__.meshNormal_id14.y; v1.z <- __input__.meshNormal_id14.z; 
//   v2.x <- __input__.meshTangent_id15.x; v2.y <- __input__.meshTangent_id15.y; v2.z <- __input__.meshTangent_id15.z; v2.w <- __input__.meshTangent_id15.w; 
//   o3.x <- <VSMain return value>.meshTangent_id15.x; o3.y <- <VSMain return value>.meshTangent_id15.y; o3.z <- <VSMain return value>.meshTangent_id15.z; o3.w <- <VSMain return value>.meshTangent_id15.w; 
//   o2.x <- <VSMain return value>.meshNormal_id14.x; o2.y <- <VSMain return value>.meshNormal_id14.y; o2.z <- <VSMain return value>.meshNormal_id14.z; 
//   o1.x <- <VSMain return value>.ShadingPosition_id0.x; o1.y <- <VSMain return value>.ShadingPosition_id0.y; o1.z <- <VSMain return value>.ShadingPosition_id0.z; o1.w <- <VSMain return value>.ShadingPosition_id0.w; 
//   o0.x <- <VSMain return value>.PositionWS_id19.x; o0.y <- <VSMain return value>.PositionWS_id19.y; o0.z <- <VSMain return value>.PositionWS_id19.z; o0.w <- <VSMain return value>.PositionWS_id19.w
//
#line 711 "C:\Development\three-dee\1 - Code\ThreeDeeCore\CoreFacade\log\shader_XenkoEditorForwardShadingEffect_0c80bff16fd2845e79b70de9d79dcf14.hlsl"
dp4 r0.x, v0.xyzw, cb0[0].xyzw  // r0.x <- streams.PositionWS_id19.x
dp4 r0.y, v0.xyzw, cb0[1].xyzw  // r0.y <- streams.PositionWS_id19.y
dp4 r0.z, v0.xyzw, cb0[2].xyzw  // r0.z <- streams.PositionWS_id19.z
dp4 r0.w, v0.xyzw, cb0[3].xyzw  // r0.w <- streams.PositionWS_id19.w

#line 787
mov o0.xyzw, r0.xyzw

#line 701
dp4 o1.x, r0.xyzw, cb1[16].xyzw
dp4 o1.y, r0.xyzw, cb1[17].xyzw
dp4 o1.z, r0.xyzw, cb1[18].xyzw
dp4 o1.w, r0.xyzw, cb1[19].xyzw

#line 787
mov o2.xyz, v1.xyzx
mov o3.xyzw, v2.xyzw
ret 
// Approximately 12 instruction slots used
@G    Pixel => 93dc4a18595fe54fb1764cc4b81e20b6
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
//   float4 constantColor_id98;         // Offset:    0 Size:    16
//   float4 constantColor_id100;        // Offset:   16 Size:    16
//   float constantFloat_id104;         // Offset:   32 Size:     4
//   float4 constantColor_id168;        // Offset:   48 Size:    16
//   float constantFloat_id170;         // Offset:   64 Size:     4
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
//   float3 AmbientLight_id97;          // Offset:  656 Size:    12
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// LightClusters_id85                texture   uint2          3d    0        1
// LightIndices_id86                 texture    uint         buf    1        1
// PointLights_id90                  texture  float4         buf    2        1
// SpotLights_id93                   texture  float4         buf    3        1
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
// NORMAL                   0   xyz         2     NONE   float   xyz 
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
dcl_constantbuffer cb2[42], dynamicIndexed
dcl_resource_texture3d (uint,uint,uint,uint) t0
dcl_resource_buffer (uint,uint,uint,uint) t1
dcl_resource_buffer (float,float,float,float) t2
dcl_resource_buffer (float,float,float,float) t3
dcl_input_ps linear v0.xyz
dcl_input_ps_siv linear noperspective v1.xyz, position
dcl_input_ps linear v2.xyz
dcl_input_ps linear v3.xyzw
dcl_output o0.xyzw
dcl_temps 15
//
// Initial variable locations:
//   v0.x <- __input__.PositionWS_id19.x; v0.y <- __input__.PositionWS_id19.y; v0.z <- __input__.PositionWS_id19.z; v0.w <- __input__.PositionWS_id19.w; 
//   v1.x <- __input__.ShadingPosition_id0.x; v1.y <- __input__.ShadingPosition_id0.y; v1.z <- __input__.ShadingPosition_id0.z; v1.w <- __input__.ShadingPosition_id0.w; 
//   v2.x <- __input__.meshNormal_id14.x; v2.y <- __input__.meshNormal_id14.y; v2.z <- __input__.meshNormal_id14.z; 
//   v3.x <- __input__.meshTangent_id15.x; v3.y <- __input__.meshTangent_id15.y; v3.z <- __input__.meshTangent_id15.z; v3.w <- __input__.meshTangent_id15.w; 
//   o0.x <- <PSMain return value>.ColorTarget_id1.x; o0.y <- <PSMain return value>.ColorTarget_id1.y; o0.z <- <PSMain return value>.ColorTarget_id1.z; o0.w <- <PSMain return value>.ColorTarget_id1.w
//
#line 692 "C:\Development\three-dee\1 - Code\ThreeDeeCore\CoreFacade\log\shader_XenkoEditorForwardShadingEffect_0c80bff16fd2845e79b70de9d79dcf14.hlsl"
dp3 r0.x, v2.xyzx, v2.xyzx
rsq r0.x, r0.x
mul r0.xyz, r0.xxxx, v2.xyzx  // r0.x <- streams.meshNormal_id14.x; r0.y <- streams.meshNormal_id14.y; r0.z <- streams.meshNormal_id14.z
dp3 r0.w, v3.xyzx, v3.xyzx
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, v3.xyzx  // r1.x <- tangent.x; r1.y <- tangent.y; r1.z <- tangent.z
mul r2.xyz, r0.zxyz, r1.yzxy
mad r2.xyz, r0.yzxy, r1.zxyz, -r2.xyzx
mul r2.xyz, r2.xyzx, v3.wwww  // r2.x <- bitangent.x; r2.y <- bitangent.y; r2.z <- bitangent.z

#line 728
dp3 r3.x, r1.xyzx, cb0[0].xyzx  // r3.x <- streams.tangentToWorld_id17._m00
dp3 r4.x, r1.xyzx, cb0[1].xyzx  // r4.x <- streams.tangentToWorld_id17._m01
dp3 r1.x, r1.xyzx, cb0[2].xyzx  // r1.x <- streams.tangentToWorld_id17._m02
dp3 r3.y, r2.xyzx, cb0[0].xyzx  // r3.y <- streams.tangentToWorld_id17._m10
dp3 r4.y, r2.xyzx, cb0[1].xyzx  // r4.y <- streams.tangentToWorld_id17._m11
dp3 r1.y, r2.xyzx, cb0[2].xyzx  // r1.y <- streams.tangentToWorld_id17._m12
dp3 r3.z, r0.xyzx, cb0[0].xyzx  // r3.z <- streams.tangentToWorld_id17._m20
dp3 r4.z, r0.xyzx, cb0[1].xyzx  // r4.z <- streams.tangentToWorld_id17._m21
dp3 r1.z, r0.xyzx, cb0[2].xyzx  // r1.z <- streams.tangentToWorld_id17._m22

#line 715
add r0.xyz, -v0.xyzx, cb2[21].xyzx
dp3 r0.w, r0.xyzx, r0.xyzx
rsq r0.w, r0.w
mul r0.xyz, r0.wwww, r0.xyzx  // r0.x <- streams.viewWS_id61.x; r0.y <- streams.viewWS_id61.y; r0.z <- streams.viewWS_id61.z

#line 602
eq r0.w, cb1[1].z, l(0.000000)

#line 610
mad r2.xyz, cb1[1].xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), l(-1.000000, -1.000000, -1.000000, 0.000000)  // r2.x <- normal.x; r2.y <- normal.y; r2.z <- normal.z

#line 616
mov r5.xy, cb1[1].xyxx
mov r5.z, l(1.000000)
movc r2.xyz, r0.wwww, r5.xyzx, r2.xyzx  // r2.x <- streams.matNormal_id45.x; r2.y <- streams.matNormal_id45.y; r2.z <- streams.matNormal_id45.z

#line 465
dp3 r3.y, r2.xyzx, r3.xyzx
dp3 r3.z, r2.xyzx, r4.xyzx
dp3 r3.w, r2.xyzx, r1.xyzx
dp3 r0.w, r3.yzwy, r3.yzwy
rsq r0.w, r0.w
mul r1.xyz, r0.wwww, r3.yzwy  // r1.x <- streams.normalWS_id16.x; r1.y <- streams.normalWS_id16.y; r1.z <- streams.normalWS_id16.z

#line 447
mul r3.xyz, cb1[3].xyzx, cb1[4].xxxx  // r3.x <- streams.matSpecularVisible_id64.x; r3.y <- streams.matSpecularVisible_id64.y; r3.z <- streams.matSpecularVisible_id64.z
dp3 r0.w, r1.xyzx, r0.xyzx
max r0.w, r0.w, l(0.000100)  // r0.w <- streams.NdotV_id65
add r1.w, -cb1[2].x, l(1.000000)  // r1.w <- roughness

#line 342
dp3 r2.x, r2.xyzx, r2.xyzx
sqrt r2.y, r2.x  // r2.y <- r
lt r2.z, r2.y, l(1.000000)
add r2.w, -r2.x, l(1.000000)
mul r2.w, r2.w, l(0.500000)
mul r2.x, r2.y, r2.x
mad r2.x, r2.y, l(3.000000), -r2.x
div r2.x, r2.w, r2.x  // r2.x <- roughnessAdjust
and r2.x, r2.x, r2.z

#line 451
mad r1.w, r1.w, r1.w, r2.x
max r1.w, r1.w, l(0.001000)  // r1.w <- streams.alphaRoughness_id63

#line 334
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

#line 437
and r2.z, r2.y, l(0x0000ffff)  // r2.z <- <GetMaxLightCount_id210 return value>

#line 504
mov r4.xyz, v0.xyzx  // r4.x <- streams.PositionWS_id19.x; r4.y <- streams.PositionWS_id19.y; r4.z <- streams.PositionWS_id19.z
mov r4.w, r0.x  // r4.w <- streams.viewWS_id61.x
mov r5.yz, r0.yyzy  // r5.y <- streams.viewWS_id61.y; r5.z <- streams.viewWS_id61.z
mov r6.xy, cb1[0].xyxx  // r6.x <- streams.matDiffuseVisible_id62.x; r6.y <- streams.matDiffuseVisible_id62.y
mov r7.x, cb1[0].z  // r7.x <- streams.matDiffuseVisible_id62.z
mov r7.yzw, r3.xxyz  // r7.y <- streams.matSpecularVisible_id64.x; r7.z <- streams.matSpecularVisible_id64.y; r7.w <- streams.matSpecularVisible_id64.z
mov r2.w, r1.w  // r2.w <- streams.alphaRoughness_id63
mov r8.xyz, r1.xyzx  // r8.x <- streams.normalWS_id16.x; r8.y <- streams.normalWS_id16.y; r8.z <- streams.normalWS_id16.z
mov r9.y, r0.w  // r9.y <- streams.NdotV_id65
mov r9.x, r2.x  // r9.x <- streams.lightIndex_id84
mov r10.xyz, l(0,0,0,0)  // r10.x <- directLightingContribution.x; r10.y <- directLightingContribution.y; r10.z <- directLightingContribution.z
mov r3.w, l(0)  // r3.w <- i
loop 
  ige r5.w, r3.w, r2.z
  breakc_nz r5.w
  if_nz r5.w
    break 
  endif 

#line 321
  ld_indexable(buffer)(uint,uint,uint,uint) r5.w, r9.xxxx, t1.yzwx  // r5.w <- realLightIndex
  iadd r9.x, r9.x, l(1)  // r9.x <- streams.lightIndex_id84
  ishl r6.w, r5.w, l(1)
  ld_indexable(buffer)(float,float,float,float) r11.xyzw, r6.wwww, t2.xyzw  // r11.x <- pointLight1.x; r11.y <- pointLight1.y; r11.z <- pointLight1.z; r11.w <- pointLight1.w
  bfi r5.w, l(31), l(1), r5.w, l(1)
  ld_indexable(buffer)(float,float,float,float) r12.xyz, r5.wwww, t2.xyzw  // r12.x <- pointLight2.x; r12.y <- pointLight2.y; r12.z <- pointLight2.z

#line 243
  add r11.xyz, -r4.xyzx, r11.xyzx  // r11.x <- lightVector.x; r11.y <- lightVector.y; r11.z <- lightVector.z
  dp3 r5.w, r11.xyzx, r11.xyzx
  sqrt r6.w, r5.w  // r6.w <- lightVectorLength
  div r11.xyz, r11.xyzx, r6.wwww  // r11.x <- lightVectorNorm.x; r11.y <- lightVectorNorm.y; r11.z <- lightVectorNorm.z

#line 209
  max r6.w, r5.w, l(0.000100)
  div r6.w, l(1.000000, 1.000000, 1.000000, 1.000000), r6.w  // r6.w <- attenuation

#line 179
  mul r5.w, r11.w, r5.w  // r5.w <- factor
  mad r5.w, -r5.w, r5.w, l(1.000000)
  max r5.w, r5.w, l(0.000000)  // r5.w <- smoothFactor
  mul r5.w, r5.w, r5.w  // r5.w <- <SmoothDistanceAttenuation_id74 return value>

#line 210
  mul r5.w, r5.w, r6.w  // r5.w <- attenuation

#line 249
  mul r12.xyz, r5.wwww, r12.xyzx  // r12.x <- streams.lightColor_id39.x; r12.y <- streams.lightColor_id39.y; r12.z <- streams.lightColor_id39.z

#line 427
  dp3 r5.w, r8.xyzx, r11.xyzx
  max r5.w, r5.w, l(0.000100)  // r5.w <- streams.NdotL_id43
  mul r12.xyz, r5.wwww, r12.xyzx  // r12.x <- streams.lightColorNdotL_id40.x; r12.y <- streams.lightColorNdotL_id40.y; r12.z <- streams.lightColorNdotL_id40.z

#line 419
  mov r5.x, r4.w
  add r13.xyz, r11.xyzx, r5.xyzx
  dp3 r5.x, r13.xyzx, r13.xyzx
  rsq r5.x, r5.x
  mul r13.xyz, r5.xxxx, r13.xyzx  // r13.x <- streams.H_id68.x; r13.y <- streams.H_id68.y; r13.z <- streams.H_id68.z
  dp3 r5.x, r8.xyzx, r13.xyzx
  max r5.x, r5.x, l(0.000100)  // r5.x <- streams.NdotH_id69
  dp3 r6.w, r11.xyzx, r13.xyzx
  max r6.w, r6.w, l(0.000100)  // r6.w <- streams.LdotH_id70

#line 415
  mov r6.z, r7.x
  mul r11.xyz, r12.xyzx, r6.xyzx

#line 514
  mad r11.xyz, r11.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r10.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 204
  add r13.xyz, -r7.yzwy, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r6.z, -r6.w, l(1.000000)
  mul r6.w, r6.z, r6.z
  mul r6.w, r6.w, r6.w
  mul r6.z, r6.w, r6.z
  mad r13.xyz, r13.xyzx, r6.zzzz, r7.yzwy  // r13.x <- <FresnelSchlick_id158 return value>.x; r13.y <- <FresnelSchlick_id158 return value>.y; r13.z <- <FresnelSchlick_id158 return value>.z

#line 199
  mul r6.z, r2.w, l(0.500000)  // r6.z <- k
  mad r6.w, -r2.w, l(0.500000), l(1.000000)
  mad r8.w, r5.w, r6.w, r6.z
  div r8.w, r5.w, r8.w  // r8.w <- <VisibilityhSchlickGGX_id176 return value>
  mad r6.z, r9.y, r6.w, r6.z
  div r6.z, r9.y, r6.z  // r6.z <- <VisibilityhSchlickGGX_id176 return value>

#line 235
  mul r6.z, r6.z, r8.w
  mul r5.w, r9.y, r5.w
  div r5.w, r6.z, r5.w  // r5.w <- <VisibilitySmithSchlickGGX_id178 return value>

#line 230
  mul r6.z, r2.w, r2.w  // r6.z <- alphaR2
  mul r5.x, r5.x, r5.x
  mad r6.w, r2.w, r2.w, l(-1.000000)
  mad r5.x, r5.x, r6.w, l(1.000000)
  max r5.x, r5.x, l(0.000100)
  mul r5.x, r5.x, r5.x
  mul r5.x, r5.x, l(3.141593)
  div r5.x, r6.z, r5.x  // r5.x <- <NormalDistributionGGX_id192 return value>

#line 409
  mul r13.xyz, r5.wwww, r13.xyzx
  mul r13.xyz, r5.xxxx, r13.xyzx
  mul r12.xyz, r12.xyzx, r13.xyzx

#line 518
  mad r10.xyz, r12.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r11.xyzx  // r10.x <- directLightingContribution.x; r10.y <- directLightingContribution.y; r10.z <- directLightingContribution.z

#line 504
  iadd r3.w, r3.w, l(1)

#line 520
endloop   // r9.x <- streams.lightIndex_id84

#line 398
ushr r2.x, r2.y, l(16)  // r2.x <- <GetMaxLightCount_id219 return value>

#line 528
mov r4.xyz, v0.xyzx
mov r4.w, r9.x  // r4.w <- streams.lightIndex_id84
mov r2.yzw, r0.xxyz  // r2.y <- streams.viewWS_id61.x; r2.z <- streams.viewWS_id61.y; r2.w <- streams.viewWS_id61.z
mov r5.xyz, r1.xyzx  // r5.x <- streams.normalWS_id16.x; r5.y <- streams.normalWS_id16.y; r5.z <- streams.normalWS_id16.z
mov r6.xyz, cb1[0].xyzx  // r6.z <- streams.matDiffuseVisible_id62.z
mov r7.xyz, r3.xyzx  // r7.x <- streams.matSpecularVisible_id64.x; r7.y <- streams.matSpecularVisible_id64.y; r7.z <- streams.matSpecularVisible_id64.z
mov r8.x, r1.w  // r8.x <- streams.alphaRoughness_id63
mov r8.z, r0.w  // r8.z <- streams.NdotV_id65
mov r9.yzw, r10.xxyz  // r9.y <- directLightingContribution.x; r9.z <- directLightingContribution.y; r9.w <- directLightingContribution.z
mov r3.w, l(0)  // r3.w <- i
loop 
  ige r5.w, r3.w, r2.x
  breakc_nz r5.w
  if_nz r5.w
    break 
  endif 

#line 290
  ld_indexable(buffer)(uint,uint,uint,uint) r5.w, r4.wwww, t1.yzwx  // r5.w <- realLightIndex
  iadd r4.w, r4.w, l(1)  // r4.w <- streams.lightIndex_id84
  ishl r6.w, r5.w, l(2)
  ld_indexable(buffer)(float,float,float,float) r11.xyz, r6.wwww, t3.xyzw  // r11.x <- spotLight1.x; r11.y <- spotLight1.y; r11.z <- spotLight1.z

#line 296
  bfi r12.xyz, l(30, 30, 30, 0), l(2, 2, 2, 0), r5.wwww, l(1, 2, 3, 0)
  ld_indexable(buffer)(float,float,float,float) r13.xyz, r12.xxxx, t3.xyzw  // r13.x <- spotLight2.x; r13.y <- spotLight2.y; r13.z <- spotLight2.z
  ld_indexable(buffer)(float,float,float,float) r12.xyw, r12.yyyy, t3.xywz  // r12.x <- spotLight3.x; r12.y <- spotLight3.y; r12.w <- spotLight3.z
  ld_indexable(buffer)(float,float,float,float) r14.xyz, r12.zzzz, t3.xyzw  // r14.x <- spotLight4.x; r14.y <- spotLight4.y; r14.z <- spotLight4.z

#line 215
  add r11.xyz, -r4.xyzx, r11.xyzx  // r11.x <- lightVector.x; r11.y <- lightVector.y; r11.z <- lightVector.z
  dp3 r5.w, r11.xyzx, r11.xyzx
  sqrt r6.w, r5.w  // r6.w <- lightVectorLength
  div r11.xyz, r11.xyzx, r6.wwww  // r11.x <- lightVectorNorm.x; r11.y <- lightVectorNorm.y; r11.z <- lightVectorNorm.z

#line 193
  max r6.w, r5.w, l(0.000100)
  div r6.w, l(1.000000, 1.000000, 1.000000, 1.000000), r6.w  // r6.w <- attenuation

#line 173
  mul r5.w, r12.w, r5.w  // r5.w <- factor
  mad r5.w, -r5.w, r5.w, l(1.000000)
  max r5.w, r5.w, l(0.000000)  // r5.w <- smoothFactor
  mul r5.w, r5.w, r5.w  // r5.w <- <SmoothDistanceAttenuation_id82 return value>

#line 194
  mul r5.w, r5.w, r6.w  // r5.w <- attenuation

#line 185
  dp3 r6.w, -r13.xyzx, r11.xyzx  // r6.w <- cd
  mad_sat r6.w, r6.w, r12.x, r12.y  // r6.w <- attenuation
  mul r6.w, r6.w, r6.w

#line 224
  mul r5.w, r5.w, r6.w  // r5.w <- attenuation
  mul r11.xyz, r5.wwww, r14.xyzx  // r11.x <- streams.lightColor_id39.x; r11.y <- streams.lightColor_id39.y; r11.z <- streams.lightColor_id39.z

#line 388
  dp3 r5.w, r5.xyzx, -r13.xyzx
  max r5.w, r5.w, l(0.000100)  // r5.w <- streams.NdotL_id43
  mul r11.xyz, r5.wwww, r11.xyzx  // r11.x <- streams.lightColorNdotL_id40.x; r11.y <- streams.lightColorNdotL_id40.y; r11.z <- streams.lightColorNdotL_id40.z

#line 419
  add r12.xyz, r2.yzwy, -r13.xyzx
  dp3 r6.w, r12.xyzx, r12.xyzx
  rsq r6.w, r6.w
  mul r12.xyz, r6.wwww, r12.xyzx  // r12.x <- streams.H_id68.x; r12.y <- streams.H_id68.y; r12.z <- streams.H_id68.z
  dp3 r6.w, r5.xyzx, r12.xyzx
  max r6.w, r6.w, l(0.000100)  // r6.w <- streams.NdotH_id69
  dp3 r7.w, -r13.xyzx, r12.xyzx
  max r7.w, r7.w, l(0.000100)  // r7.w <- streams.LdotH_id70

#line 415
  mul r12.xyz, r6.xyzx, r11.xyzx

#line 538
  mad r12.xyz, r12.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r9.yzwy  // r12.x <- directLightingContribution.x; r12.y <- directLightingContribution.y; r12.z <- directLightingContribution.z

#line 204
  add r13.xyz, -r7.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r7.w, -r7.w, l(1.000000)
  mul r8.y, r7.w, r7.w
  mul r8.y, r8.y, r8.y
  mul r7.w, r7.w, r8.y
  mad r13.xyz, r13.xyzx, r7.wwww, r7.xyzx  // r13.x <- <FresnelSchlick_id158 return value>.x; r13.y <- <FresnelSchlick_id158 return value>.y; r13.z <- <FresnelSchlick_id158 return value>.z

#line 199
  mul r7.w, r8.x, l(0.500000)  // r7.w <- k
  mad r8.y, -r8.x, l(0.500000), l(1.000000)
  mad r8.w, r5.w, r8.y, r7.w
  div r8.w, r5.w, r8.w  // r8.w <- <VisibilityhSchlickGGX_id176 return value>
  mad r7.w, r8.z, r8.y, r7.w
  div r7.w, r8.z, r7.w  // r7.w <- <VisibilityhSchlickGGX_id176 return value>

#line 235
  mul r7.w, r7.w, r8.w
  mul r5.w, r8.z, r5.w
  div r5.w, r7.w, r5.w  // r5.w <- <VisibilitySmithSchlickGGX_id178 return value>

#line 230
  mul r7.w, r8.x, r8.x  // r7.w <- alphaR2
  mul r6.w, r6.w, r6.w
  mad r8.y, r8.x, r8.x, l(-1.000000)
  mad r6.w, r6.w, r8.y, l(1.000000)
  max r6.w, r6.w, l(0.000100)
  mul r6.w, r6.w, r6.w
  mul r6.w, r6.w, l(3.141593)
  div r6.w, r7.w, r6.w  // r6.w <- <NormalDistributionGGX_id192 return value>

#line 409
  mul r13.xyz, r5.wwww, r13.xyzx
  mul r13.xyz, r6.wwww, r13.xyzx
  mul r11.xyz, r11.xyzx, r13.xyzx

#line 542
  mad r9.yzw, r11.xxyz, l(0.000000, 0.250000, 0.250000, 0.250000), r12.xxyz  // r9.y <- directLightingContribution.x; r9.z <- directLightingContribution.y; r9.w <- directLightingContribution.z

#line 528
  iadd r3.w, r3.w, l(1)

#line 544
endloop   // r4.w <- streams.lightIndex_id84

#line 552
mov r2.xyz, r0.xyzx  // r2.x <- streams.viewWS_id61.x; r2.y <- streams.viewWS_id61.y; r2.z <- streams.viewWS_id61.z
mov r4.xyz, r1.xyzx  // r4.x <- streams.normalWS_id16.x; r4.y <- streams.normalWS_id16.y; r4.z <- streams.normalWS_id16.z
mov r5.xyz, cb1[0].xyzx  // r5.x <- streams.matDiffuseVisible_id62.x; r5.y <- streams.matDiffuseVisible_id62.y; r5.z <- streams.matDiffuseVisible_id62.z
mov r6.xyz, r3.xyzx  // r6.x <- streams.matSpecularVisible_id64.x; r6.y <- streams.matSpecularVisible_id64.y; r6.z <- streams.matSpecularVisible_id64.z
mov r7.x, r1.w  // r7.x <- streams.alphaRoughness_id63
mov r7.z, r0.w  // r7.z <- streams.NdotV_id65
mov r8.xyz, r9.yzwy  // r8.x <- directLightingContribution.x; r8.y <- directLightingContribution.y; r8.z <- directLightingContribution.z
mov r2.w, l(0)  // r2.w <- i
loop 
  ige r3.w, r2.w, l(8)
  breakc_nz r3.w
  ige r3.w, r2.w, cb2[24].y
  if_nz r3.w
    break 
  endif 

#line 281
  ishl r3.w, r2.w, l(1)

#line 370
  dp3 r4.w, r4.xyzx, -cb2[r3.w + 25].xyzx
  max r4.w, r4.w, l(0.000100)  // r4.w <- streams.NdotL_id43
  mul r10.xyz, r4.wwww, cb2[r3.w + 26].xyzx  // r10.x <- streams.lightColorNdotL_id40.x; r10.y <- streams.lightColorNdotL_id40.y; r10.z <- streams.lightColorNdotL_id40.z

#line 419
  add r11.xyz, r2.xyzx, -cb2[r3.w + 25].xyzx
  dp3 r5.w, r11.xyzx, r11.xyzx
  rsq r5.w, r5.w
  mul r11.xyz, r5.wwww, r11.xyzx  // r11.x <- streams.H_id68.x; r11.y <- streams.H_id68.y; r11.z <- streams.H_id68.z
  dp3 r5.w, r4.xyzx, r11.xyzx
  max r5.w, r5.w, l(0.000100)  // r5.w <- streams.NdotH_id69
  dp3 r3.w, -cb2[r3.w + 25].xyzx, r11.xyzx
  max r3.w, r3.w, l(0.000100)  // r3.w <- streams.LdotH_id70

#line 415
  mul r11.xyz, r5.xyzx, r10.xyzx

#line 562
  mad r11.xyz, r11.xyzx, l(0.318310, 0.318310, 0.318310, 0.000000), r8.xyzx  // r11.x <- directLightingContribution.x; r11.y <- directLightingContribution.y; r11.z <- directLightingContribution.z

#line 204
  add r12.xyz, -r6.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
  add r3.w, -r3.w, l(1.000000)
  mul r6.w, r3.w, r3.w
  mul r6.w, r6.w, r6.w
  mul r3.w, r3.w, r6.w
  mad r12.xyz, r12.xyzx, r3.wwww, r6.xyzx  // r12.x <- <FresnelSchlick_id158 return value>.x; r12.y <- <FresnelSchlick_id158 return value>.y; r12.z <- <FresnelSchlick_id158 return value>.z

#line 199
  mul r3.w, r7.x, l(0.500000)  // r3.w <- k
  mad r6.w, -r7.x, l(0.500000), l(1.000000)
  mad r7.y, r4.w, r6.w, r3.w
  div r7.y, r4.w, r7.y  // r7.y <- <VisibilityhSchlickGGX_id176 return value>
  mad r3.w, r7.z, r6.w, r3.w
  div r3.w, r7.z, r3.w  // r3.w <- <VisibilityhSchlickGGX_id176 return value>

#line 235
  mul r3.w, r3.w, r7.y
  mul r4.w, r7.z, r4.w
  div r3.w, r3.w, r4.w  // r3.w <- <VisibilitySmithSchlickGGX_id178 return value>

#line 230
  mul r4.w, r7.x, r7.x  // r4.w <- alphaR2
  mul r5.w, r5.w, r5.w
  mad r6.w, r7.x, r7.x, l(-1.000000)
  mad r5.w, r5.w, r6.w, l(1.000000)
  max r5.w, r5.w, l(0.000100)
  mul r5.w, r5.w, r5.w
  mul r5.w, r5.w, l(3.141593)
  div r4.w, r4.w, r5.w  // r4.w <- <NormalDistributionGGX_id192 return value>

#line 409
  mul r12.xyz, r3.wwww, r12.xyzx
  mul r12.xyz, r4.wwww, r12.xyzx
  mul r10.xyz, r10.xyzx, r12.xyzx

#line 566
  mad r8.xyz, r10.xyzx, l(0.250000, 0.250000, 0.250000, 0.000000), r11.xyzx  // r8.x <- directLightingContribution.x; r8.y <- directLightingContribution.y; r8.z <- directLightingContribution.z

#line 552
  iadd r2.w, r2.w, l(1)

#line 568
endloop 

#line 254
add r0.x, -r1.w, l(1.000000)  // r0.x <- x

#line 262
mul r0.y, r0.x, r0.x

#line 270
mul r0.z, r0.y, l(1.895000)

#line 262
mad r0.z, r0.x, l(-0.168800), r0.z
mad r1.x, r0.w, l(-4.853000), l(0.990300)
mul r1.y, r0.w, r0.w
mad r1.x, r1.y, l(8.404000), r1.x
mul r1.z, r0.w, r1.y
mad r1.x, r1.z, l(-5.069000), r1.x
min_sat r0.z, r0.z, r1.x  // r0.z <- bias

#line 270
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
mad r0.xyz, r3.xyzx, r0.xxxx, r0.yyyy  // r0.x <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id193 return value>.x; r0.y <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id193 return value>.y; r0.z <- <EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id193 return value>.z

#line 354
mul r0.xyz, r0.xyzx, cb2[41].xyzx  // r0.x <- <ComputeEnvironmentLightContribution_id382 return value>.x; r0.y <- <ComputeEnvironmentLightContribution_id382 return value>.y; r0.z <- <ComputeEnvironmentLightContribution_id382 return value>.z

#line 580
mad r0.xyz, cb1[0].xyzx, cb2[41].xyzx, r0.xyzx  // r0.x <- environmentLightingContribution.x; r0.y <- environmentLightingContribution.y; r0.z <- environmentLightingContribution.z

#line 583
mad o0.xyz, r8.xyzx, l(3.141593, 3.141593, 3.141593, 0.000000), r0.xyzx

#line 772
mov o0.w, cb1[0].w
ret 
// Approximately 312 instruction slots used
***************************
*************************/
const static int ClusterSize2_id82 = 64;
const static int TMaxLightCount_id95 = 8;
const static bool TIsNormalXY1_id101 = false;
const static bool TScaleAndBias_id102 = true;
const static bool TInvert_id105 = false;
const static bool TIsEnergyConservative_id174 = false;
static const float PI_id176 = 3.14159265358979323846;
Texture3D<uint2> LightClusters_id85;
Buffer<uint> LightIndices_id86;
Buffer<float4> PointLights_id90;
Buffer<float4> SpotLights_id93;
struct PS_STREAMS 
{
    float3 meshNormal_id14;
    float4 meshTangent_id15;
    float4 PositionWS_id19;
    float4 ShadingPosition_id0;
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
    float DepthVS_id20;
    float3 normalWS_id16;
    float4 PositionWS_id19;
    float4 ShadingPosition_id0;
};
struct VS_OUTPUT 
{
    float4 PositionWS_id19 : POSITION_WS;
    float4 ShadingPosition_id0 : SV_Position;
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
    float4 constantColor_id98;
    float4 constantColor_id100;
    float constantFloat_id104;
    float4 constantColor_id168;
    float constantFloat_id170;
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
    float3 AmbientLight_id97;
};
cbuffer Globals 
{
    float2 Texture0TexelSize_id111;
    float2 Texture1TexelSize_id113;
    float2 Texture2TexelSize_id115;
    float2 Texture3TexelSize_id117;
    float2 Texture4TexelSize_id119;
    float2 Texture5TexelSize_id121;
    float2 Texture6TexelSize_id123;
    float2 Texture7TexelSize_id125;
    float2 Texture8TexelSize_id127;
    float2 Texture9TexelSize_id129;
};
float SmoothDistanceAttenuation_id82(float squaredDistance, float lightInvSquareRadius)
{
    float factor = squaredDistance * lightInvSquareRadius;
    float smoothFactor = saturate(1.0f - factor * factor);
    return smoothFactor * smoothFactor;
}
float SmoothDistanceAttenuation_id74(float squaredDistance, float lightInvSquareRadius)
{
    float factor = squaredDistance * lightInvSquareRadius;
    float smoothFactor = saturate(1.0f - factor * factor);
    return smoothFactor * smoothFactor;
}
float GetAngleAttenuation_id84(float3 lightVector, float3 lightDirection, float lightAngleScale, float lightAngleOffset)
{
    float cd = dot(lightDirection, lightVector);
    float attenuation = saturate(cd * lightAngleScale + lightAngleOffset);
    attenuation *= attenuation;
    return attenuation;
}
float GetDistanceAttenuation_id83(float3 lightVector, float lightInvSquareRadius)
{
    float d2 = dot(lightVector, lightVector);
    float attenuation = 1.0 / (max(d2, 0.01 * 0.01));
    attenuation *= SmoothDistanceAttenuation_id82(d2, lightInvSquareRadius);
    return attenuation;
}
float VisibilityhSchlickGGX_id176(float alphaR, float nDotX)
{
    float k = alphaR * 0.5f;
    return nDotX / (nDotX * (1.0f - k) + k);
}
float3 FresnelSchlick_id158(float3 f0, float3 f90, float lOrVDotH)
{
    return f0 + (f90 - f0) * pow((1 - lOrVDotH), 5);
}
float GetDistanceAttenuation_id75(float3 lightVector, float lightInvSquareRadius)
{
    float d2 = dot(lightVector, lightVector);
    float attenuation = 1.0 / (max(d2, 0.01 * 0.01));
    attenuation *= SmoothDistanceAttenuation_id74(d2, lightInvSquareRadius);
    return attenuation;
}
void ProcessLight_id85(inout PS_STREAMS streams, SpotLightDataInternal light)
{
    float3 lightVector = light.PositionWS - streams.PositionWS_id19;
    float lightVectorLength = length(lightVector);
    float3 lightVectorNorm = lightVector / lightVectorLength;
    float3 lightAngleOffsetAndInvSquareRadius = light.AngleOffsetAndInvSquareRadius;
    float2 lightAngleAndOffset = lightAngleOffsetAndInvSquareRadius.xy;
    float lightInvSquareRadius = lightAngleOffsetAndInvSquareRadius.z;
    float3 lightDirection = -light.DirectionWS;
    float attenuation = 1;
    attenuation *= GetDistanceAttenuation_id83(lightVector, lightInvSquareRadius);
    attenuation *= GetAngleAttenuation_id84(lightVectorNorm, lightDirection, lightAngleAndOffset.x, lightAngleAndOffset.y);
    streams.lightColor_id39 = light.Color * attenuation;
    streams.lightDirectionWS_id38 = lightDirection;
}
float NormalDistributionGGX_id192(float alphaR, float nDotH)
{
    float alphaR2 = alphaR * alphaR;
    return alphaR2 / (PI_id176 * pow(max(nDotH * nDotH * (alphaR2 - 1) + 1, 0.0001), 2.0f));
}
float VisibilitySmithSchlickGGX_id178(float alphaR, float nDotL, float nDotV)
{
    return VisibilityhSchlickGGX_id176(alphaR, nDotL) * VisibilityhSchlickGGX_id176(alphaR, nDotV) / (nDotL * nDotV);
}
float3 FresnelSchlick_id164(float3 f0, float lOrVDotH)
{
    return FresnelSchlick_id158(f0, 1.0f, lOrVDotH);
}
void ProcessLight_id77(inout PS_STREAMS streams, PointLightDataInternal light)
{
    float3 lightVector = light.PositionWS - streams.PositionWS_id19;
    float lightVectorLength = length(lightVector);
    float3 lightVectorNorm = lightVector / lightVectorLength;
    float lightInvSquareRadius = light.InvSquareRadius;
    float attenuation = 1;
    attenuation *= GetDistanceAttenuation_id75(lightVector, lightInvSquareRadius);
    streams.lightColor_id39 = light.Color * attenuation;
    streams.lightDirectionWS_id38 = lightVectorNorm;
}
float3 EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id193(float3 specularColor, float alphaR, float nDotV)
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
void ComputeShadow_id89(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void PrepareDirectLightCore_id88(inout PS_STREAMS streams, int lightIndex)
{
    streams.lightColor_id39 = Lights_id96[lightIndex].Color;
    streams.lightDirectionWS_id38 = -Lights_id96[lightIndex].DirectionWS;
}
void ComputeShadow_id81(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void PrepareDirectLightCore_id80(inout PS_STREAMS streams, int lightIndexIgnored)
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
    ProcessLight_id85(streams, spotLight);
}
float Compute_id303(inout PS_STREAMS streams)
{
    return NormalDistributionGGX_id192(streams.alphaRoughness_id63, streams.NdotH_id69);
}
float Compute_id274(inout PS_STREAMS streams)
{
    return VisibilitySmithSchlickGGX_id178(streams.alphaRoughness_id63, streams.NdotL_id43, streams.NdotV_id65);
}
float3 Compute_id245(inout PS_STREAMS streams, float3 f0)
{
    return FresnelSchlick_id164(f0, streams.LdotH_id70);
}
void ComputeShadow_id73(inout PS_STREAMS streams, int lightIndex)
{
    streams.shadowColor_id76 = 1.0f;
}
void PrepareDirectLightCore_id72(inout PS_STREAMS streams, int lightIndexIgnored)
{
    int realLightIndex = LightIndices_id86.Load(streams.lightIndex_id84);
    streams.lightIndex_id84++;
    PointLightDataInternal pointLight;
    float4 pointLight1 = PointLights_id90.Load(realLightIndex * 2);
    float4 pointLight2 = PointLights_id90.Load(realLightIndex * 2 + 1);
    pointLight.PositionWS = pointLight1.xyz;
    pointLight.InvSquareRadius = pointLight1.w;
    pointLight.Color = pointLight2.xyz;
    ProcessLight_id77(streams, pointLight);
}
void PrepareLightData_id76(inout PS_STREAMS streams)
{
    float projectedDepth = streams.ShadingPosition_id0.z;
    float depth = ZProjection_id79.y / (projectedDepth - ZProjection_id79.x);
    int2 shadingPosition = int2(streams.ShadingPosition_id0.xy);
    int slice = int(max(log2(depth * ClusterDepthScale_id87 + ClusterDepthBias_id88), 0));
    streams.lightData_id83 = LightClusters_id85.Load(int4(shadingPosition / ClusterSize2_id82, slice, 0));
    streams.lightIndex_id84 = streams.lightData_id83.x;
}
float GetFilterSquareRoughnessAdjustment_id130(inout PS_STREAMS streams, float3 averageNormal)
{
    float r = length(streams.matNormal_id45);
    float roughnessAdjust = 0.0f;
    if (r < 1.0f)
        roughnessAdjust = 0.5 * (1 - r * r) / (3 * r - r * r * r);
    return roughnessAdjust;
}
void ResetStream_id196()
{
}
float3 ComputeEnvironmentLightContribution_id382(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    return EnvironmentLightingDFG_GGX_Fresnel_SmithSchlickGGX_id193(specularColor, streams.alphaRoughness_id63, streams.NdotV_id65) * streams.envLightSpecularColor_id42;
}
float3 ComputeEnvironmentLightContribution_id333(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor * streams.envLightDiffuseColor_id41;
}
void PrepareEnvironmentLight_id234(inout PS_STREAMS streams)
{
    float3 lightColor = AmbientLight_id97 * streams.matAmbientOcclusion_id51;
    streams.envLightDiffuseColor_id41 = lightColor;
    streams.envLightSpecularColor_id42 = lightColor;
}
void PrepareDirectLight_id226(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id88(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id89(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id227()
{
    return LightCount_id94;
}
int GetMaxLightCount_id228()
{
    return TMaxLightCount_id95;
}
void PrepareDirectLights_id224()
{
}
void PrepareDirectLight_id217(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id80(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id81(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id220(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y >> 16;
}
int GetMaxLightCount_id219(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y >> 16;
}
void PrepareDirectLights_id215()
{
}
float3 ComputeDirectLightContribution_id381(inout PS_STREAMS streams)
{
    float3 specularColor = streams.matSpecularVisible_id64;
    float3 fresnel = Compute_id245(streams, specularColor);
    float geometricShadowing = Compute_id274(streams);
    float normalDistribution = Compute_id303(streams);
    float3 reflected = fresnel * geometricShadowing * normalDistribution / 4;
    return reflected * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.y;
}
float3 ComputeDirectLightContribution_id332(inout PS_STREAMS streams)
{
    float3 diffuseColor = streams.matDiffuseVisible_id62;
    return diffuseColor / PI_id176 * streams.lightColorNdotL_id40 * streams.matDiffuseSpecularAlphaBlend_id58.x;
}
void PrepareMaterialPerDirectLight_id26(inout PS_STREAMS streams)
{
    streams.H_id68 = normalize(streams.viewWS_id61 + streams.lightDirectionWS_id38);
    streams.NdotH_id69 = max(dot(streams.normalWS_id16, streams.H_id68), 0.0001f);
    streams.LdotH_id70 = max(dot(streams.lightDirectionWS_id38, streams.H_id68), 0.0001f);
    streams.VdotH_id71 = streams.LdotH_id70;
}
void PrepareDirectLight_id207(inout PS_STREAMS streams, int lightIndex)
{
    PrepareDirectLightCore_id72(streams, lightIndex);
    streams.NdotL_id43 = max(dot(streams.normalWS_id16, streams.lightDirectionWS_id38), 0.0001f);
    ComputeShadow_id73(streams, lightIndex);
    streams.lightColorNdotL_id40 = streams.lightColor_id39 * streams.shadowColor_id76 * streams.NdotL_id43 * streams.lightDirectAmbientOcclusion_id44;
}
int GetLightCount_id211(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y & 0xFFFF;
}
int GetMaxLightCount_id210(inout PS_STREAMS streams)
{
    return streams.lightData_id83.y & 0xFFFF;
}
void PrepareDirectLights_id209(inout PS_STREAMS streams)
{
    PrepareLightData_id76(streams);
}
void PrepareMaterialForLightingAndShading_id195(inout PS_STREAMS streams)
{
    streams.lightDirectAmbientOcclusion_id44 = lerp(1.0, streams.matAmbientOcclusion_id51, streams.matAmbientOcclusionDirectLightingFactor_id52);
    streams.matDiffuseVisible_id62 = streams.matDiffuse_id47.rgb * lerp(1.0f, streams.matCavity_id53, streams.matCavityDiffuse_id54) * streams.matDiffuseSpecularAlphaBlend_id58.r * streams.matAlphaBlendColor_id59;
    streams.matSpecularVisible_id64 = streams.matSpecular_id49.rgb * streams.matSpecularIntensity_id50 * lerp(1.0f, streams.matCavity_id53, streams.matCavitySpecular_id55) * streams.matDiffuseSpecularAlphaBlend_id58.g * streams.matAlphaBlendColor_id59;
    streams.NdotV_id65 = max(dot(streams.normalWS_id16, streams.viewWS_id61), 0.0001f);
    float roughness = 1.0f - streams.matGlossiness_id48;
    float roughnessAdjust = GetFilterSquareRoughnessAdjustment_id130(streams, streams.matNormal_id45);
    streams.alphaRoughness_id63 = max(roughness * roughness + roughnessAdjust, 0.001);
}
void ResetLightStream_id194(inout PS_STREAMS streams)
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
float4 Compute_id243()
{
    return float4(constantFloat_id170, constantFloat_id170, constantFloat_id170, constantFloat_id170);
}
float4 Compute_id241()
{
    return constantColor_id168;
}
float4 Compute_id239()
{
    return float4(constantFloat_id104, constantFloat_id104, constantFloat_id104, constantFloat_id104);
}
float4 Compute_id237()
{
    return constantColor_id100;
}
float4 Compute_id235()
{
    return constantColor_id98;
}
void ResetStream_id199(inout PS_STREAMS streams)
{
    ResetStream_id196();
    streams.matBlend_id37 = 0.0f;
}
void Compute_id422(inout PS_STREAMS streams)
{
    UpdateNormalFromTangentSpace_id12(streams, streams.matNormal_id45);
    ResetLightStream_id194(streams);
    PrepareMaterialForLightingAndShading_id195(streams);
    float3 directLightingContribution = 0;

    {
        PrepareDirectLights_id209(streams);
        const int maxLightCount = GetMaxLightCount_id210(streams);
        int count = GetLightCount_id211(streams);

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id207(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id332(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id381(streams);
            }
        }
    }

    {
        PrepareDirectLights_id215();
        const int maxLightCount = GetMaxLightCount_id219(streams);
        int count = GetLightCount_id220(streams);

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id217(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id332(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id381(streams);
            }
        }
    }

    {
        PrepareDirectLights_id224();
        const int maxLightCount = GetMaxLightCount_id228();
        int count = GetLightCount_id227();

        for (int i = 0; i < maxLightCount; i++)
        {
            if (i >= count)
            {
                break;
            }
            PrepareDirectLight_id226(streams, i);
            PrepareMaterialPerDirectLight_id26(streams);

            {
                directLightingContribution += ComputeDirectLightContribution_id332(streams);
            }

            {
                directLightingContribution += ComputeDirectLightContribution_id381(streams);
            }
        }
    }
    float3 environmentLightingContribution = 0;

    {
        PrepareEnvironmentLight_id234(streams);

        {
            environmentLightingContribution += ComputeEnvironmentLightContribution_id333(streams);
        }

        {
            environmentLightingContribution += ComputeEnvironmentLightContribution_id382(streams);
        }
    }
    streams.shadingColor_id66 += directLightingContribution * PI_id176 + environmentLightingContribution;
    streams.shadingColorAlpha_id67 = streams.matDiffuse_id47.a;
}
void Compute_id407(inout PS_STREAMS streams)
{
    streams.matSpecularIntensity_id50 = Compute_id243().r;
}
void Compute_id402(inout PS_STREAMS streams)
{
    streams.matSpecular_id49 = Compute_id241().rgb;
}
void Compute_id397(inout PS_STREAMS streams)
{
    float glossiness = Compute_id239().r;
    streams.matGlossiness_id48 = glossiness;
}
void Compute_id392(inout PS_STREAMS streams)
{
    float4 normal = Compute_id237();
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
void Compute_id387(inout PS_STREAMS streams)
{
    float4 colorBase = Compute_id235();
    streams.matDiffuse_id47 = colorBase;
    streams.matColorBase_id46 = colorBase;
}
void ResetStream_id201(inout PS_STREAMS streams)
{
    ResetStream_id199(streams);
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
void Compute_id69(inout PS_STREAMS streams)
{

    {
        Compute_id387(streams);
    }

    {
        Compute_id392(streams);
    }

    {
        Compute_id397(streams);
    }

    {
        Compute_id402(streams);
    }

    {
        Compute_id407(streams);
    }

    {
        Compute_id422(streams);
    }
}
void ResetStream_id68(inout PS_STREAMS streams)
{
    ResetStream_id201(streams);
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
    ResetStream_id68(streams);
    Compute_id69(streams);
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
    __output__.meshNormal_id14 = streams.meshNormal_id14;
    __output__.meshTangent_id15 = streams.meshTangent_id15;
    return __output__;
}
