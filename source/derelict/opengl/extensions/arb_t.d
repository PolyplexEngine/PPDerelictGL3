/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.arb_t;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_texture_barrier <-- Core in GL 4.5
enum ARB_texture_barrier = "GL_ARB_texture_barrier";
enum arbTextureBarrierDecls = `extern(System) @nogc nothrow alias da_glTextureBarrier = void function();`;
enum arbTextureBarrierFuncs = `da_glTextureBarrier glTextureBarrier;`;
enum arbTextureBarrierLoaderImpl = `bindGLFunc(cast(void**)&glTextureBarrier, "glTextureBarrier");`;
enum arbTextureBarrierLoader = makeLoader(ARB_texture_barrier, arbTextureBarrierLoaderImpl, "gl45");
static if(!usingContexts) enum arbTextureBarrier = arbTextureBarrierDecls ~ arbTextureBarrierFuncs.makeGShared() ~ arbTextureBarrierLoader;

// ARB_texture_buffer_range <-- Core in GL 4.3
enum ARB_texture_buffer_range = "GL_ARB_texture_buffer_range";
enum arbTextureBufferRangeDecls =
q{
enum : uint
{
    GL_TEXTURE_BUFFER_OFFSET = 0x919D,
    GL_TEXTURE_BUFFER_SIZE = 0x919E,
    GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F,
}
extern(System) @nogc nothrow
{
    alias da_glTexBufferRange = void function(GLenum,GLenum,GLuint,GLintptr,GLsizeiptr);
    alias da_glTextureBufferRangeEXT = void function(GLuint,GLenum,GLenum,GLuint,GLintptr,GLsizeiptr);
}};

enum arbTextureBufferRangeFuncs =
q{
    da_glTexBufferRange glTexBufferRange;
    da_glTextureBufferRangeEXT glTextureBufferRangeEXT;
};

enum arbTextureBufferRangeLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexBufferRange, "glTexBufferRange");
    bindGLFunc(cast(void**)&glTextureBufferRangeEXT, "glTextureBufferRangeEXT");
};

enum arbTextureBufferRangeLoader = makeLoader(ARB_texture_buffer_range, arbTextureBufferRangeLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureBufferRange = arbTextureBufferRangeDecls ~ arbTextureBufferRangeFuncs.makeGShared() ~ arbTextureBufferRangeLoader;

// ARB_texture_buffer_object_rgb32
enum ARB_texture_buffer_object_rgb32 = "GL_ARB_texture_buffer_object_rgb32";
enum arbTextureBufferObjectRGB32Loader = makeExtLoader(ARB_texture_buffer_object_rgb32);
static if(!usingContexts) enum arbTextureBufferObjectRGB32 = arbTextureBufferObjectRGB32Loader;

// ARB_texture_compression_bptc
enum ARB_texture_compression_bptc = "GL_ARB_texture_compression_bptc";
enum arbTextureCompressionBPTCDecls =
q{
enum : uint
{
    GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C,
    GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D,
    GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E,
    GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F,
}};

enum arbTextureCompressionBPTCLoader = makeExtLoader(ARB_texture_compression_bptc);
static if(!usingContexts) enum arbTextureCompressionBPTC = arbTextureCompressionBPTCDecls ~ arbTextureCompressionBPTCLoader;

// ARB_texture_cube_map_array
enum ARB_texture_cube_map_array = "GL_ARB_texture_cube_map_array";
enum arbTextureCubeMapArrayDecls =
q{
enum : uint
{
    GL_TEXTURE_CUBE_MAP_ARRAY_ARB     = 0x9009,
    GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A,
    GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B,
    GL_SAMPLER_CUBE_MAP_ARRAY_ARB     = 0x900C,
    GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D,
    GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E,
    GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F,
}};

enum arbTextureCubeMapArrayLoader = makeExtLoader(ARB_texture_cube_map_array);
static if(!usingContexts) enum arbTextureCubeMapArray = arbTextureCubeMapArrayDecls ~ arbTextureCubeMapArrayLoader;

// ARB_texture_gather
enum ARB_texture_gather = "GL_ARB_texture_gather";
enum arbTextureGatherDecls =
q{
enum : uint
{
    GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E,
    GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F,
}};

enum arbTextureGatherLoader = makeExtLoader(ARB_texture_gather);
static if(!usingContexts) enum arbTextureGather = arbTextureGatherDecls ~ arbTextureGatherLoader;

// ARB_texture_mirror_clamp_to_edge <-- Core in GL 4.4
enum ARB_texture_mirror_clamp_to_edge = "GL_ARB_texture_mirror_clamp_to_edge";
enum arbTextureMirrorClampToEdgeDecls = `enum uint GL_MIRROR_CLAMP_TO_EDGE = 0x8743;`;
enum arbTextureMirrorClampToEdgeLoader = makeLoader(ARB_texture_mirror_clamp_to_edge, "", "gl44");
static if(!usingContexts) enum arbTextureMirrorClampToEdge = arbTextureMirrorClampToEdgeDecls ~ arbTextureMirrorClampToEdgeLoader;

// ARB_texture_query_levels <-- Core in GL 4.3
enum ARB_texture_query_levels = "GL_ARB_texture_query_levels";
enum arbTextureQueryLevelsLoader = makeLoader(ARB_texture_query_levels, "", "gl43");
static if(!usingContexts) enum arbTextureQueryLevels = arbTextureQueryLevelsLoader;

// ARB_texture_query_lod
enum ARB_texture_query_lod = "GL_ARB_texture_query_lod";
enum arbTextureQueryLODLoader = makeExtLoader(ARB_texture_query_lod);
static if(!usingContexts) enum arbTextureQueryLOD = arbTextureQueryLODLoader;

// ARB_texture_rgb10_a2ui
enum ARB_texture_rgb10_a2ui = "GL_ARB_texture_rgb10_a2ui";
enum arbTextureRGB10A2UIDecls = `enum uint GL_RGB10_A2UI = 0x906F;`;

enum arbTextureRGB10A2UILoader = makeExtLoader(ARB_texture_rgb10_a2ui);
static if(!usingContexts) enum arbTextureRGB10A2UI = arbTextureRGB10A2UIDecls ~ arbTextureRGB10A2UILoader;

// ARB_texture_stencil8 <-- Core in GL 4.4
enum ARB_texture_stencil8 = "GL_ARB_texture_stencil8";
enum arbTextureStencil8Loader = makeLoader(ARB_texture_stencil8, "", "gl44");
static if(!usingContexts) enum arbTextureStencil8 = arbTextureStencil8Loader;

// ARB_texture_storage_multisample <-- Core in GL 4.3
enum ARB_texture_storage_multisample = "GL_ARB_texture_storage_multisample";
enum arbTextureStorageMultisampleDecls =
q{
extern(System) @nogc nothrow {
    alias da_glTexStorage2DMultisample = void function(GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTexStorage3DMultisample = void function(GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage2DMultisampleEXT = void function(GLuint,GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLboolean);
    alias da_glTextureStorage3DMultisampleEXT = void function(GLuint,GLenum,GLsizei,GLenum,GLsizei,GLsizei,GLsizei,GLboolean);
}};

enum arbTextureStorageMultisampleFuncs =
q{
    da_glTexStorage2DMultisample glTexStorage2DMultisample;
    da_glTexStorage3DMultisample glTexStorage3DMultisample;
    da_glTextureStorage2DMultisampleEXT glTextureStorage2DMultisampleEXT;
    da_glTextureStorage3DMultisampleEXT glTextureStorage3DMultisampleEXT;
};

enum arbTextureStorageMultisampleLoaderImpl =
q{
    bindGLFunc(cast(void**)&glTexStorage2DMultisample, "glTexStorage2DMultisample");
    bindGLFunc(cast(void**)&glTexStorage3DMultisample, "glTexStorage3DMultisample");
    try {
        bindGLFunc(cast(void**)&glTextureStorage2DMultisampleEXT, "glTextureStorage2DMultisampleEXT");
        bindGLFunc(cast(void**)&glTextureStorage3DMultisampleEXT, "glTextureStorage3DMultisampleEXT");
    }
    catch(Exception e){}
};

enum arbTextureStorageMultisampleLoader = makeLoader(ARB_texture_storage_multisample, arbTextureStorageMultisampleLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureStorageMultisample = arbTextureStorageMultisampleDecls ~ arbTextureStorageMultisampleFuncs.makeGShared() ~ arbTextureStorageMultisampleLoader;

// ARB_texture_swizzle
enum ARB_texture_swizzle = "GL_ARB_texture_swizzle";
enum arbTextureSwizzleDecls =
q{
enum : uint
{
    GL_TEXTURE_SWIZZLE_R              = 0x8E42,
    GL_TEXTURE_SWIZZLE_G              = 0x8E43,
    GL_TEXTURE_SWIZZLE_B              = 0x8E44,
    GL_TEXTURE_SWIZZLE_A              = 0x8E45,
    GL_TEXTURE_SWIZZLE_RGBA           = 0x8E46,
}};

enum arbTextureSwizzleLoader = makeExtLoader(ARB_texture_swizzle);
static if(!usingContexts) enum arbTextureSwizzle = arbTextureSwizzleDecls ~ arbTextureSwizzleLoader;

// ARB_texture_view <-- Core in GL 4.3
enum ARB_texture_view = "GL_ARB_texture_view";
enum arbTextureViewDecls =
q{
enum : uint
{
    GL_TEXTURE_VIEW_MIN_LEVEL         = 0x82DB,
    GL_TEXTURE_VIEW_NUM_LEVELS        = 0x82DC,
    GL_TEXTURE_VIEW_MIN_LAYER         = 0x82DD,
    GL_TEXTURE_VIEW_NUM_LAYERS        = 0x82DE,
    GL_TEXTURE_IMMUTABLE_LEVELS       = 0x82DF,
}
extern(System) @nogc nothrow alias da_glTextureView = void function(GLuint,GLenum,GLuint,GLenum,GLuint,GLuint,GLuint,GLuint);
};
enum arbTextureViewFuncs = `da_glTextureView glTextureView;`;
enum arbTextureViewLoaderImpl = `bindGLFunc(cast(void**)&glTextureView, "glTextureView");`;

enum arbTextureViewLoader = makeLoader(ARB_texture_view, arbTextureViewLoaderImpl, "gl43");
static if(!usingContexts) enum arbTextureView = arbTextureViewDecls ~ arbTextureViewFuncs.makeGShared() ~ arbTextureViewLoader;