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
module derelict.opengl.extensions.arb_f;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_fragment_layer_viewport <-- Core in GL 4.3
enum ARB_fragment_layer_viewport = "GL_ARB_fragment_layer_viewport";
enum arbFragmentLayerViewportLoader = makeLoader(ARB_fragment_layer_viewport, "", "gl43");
static if(!usingContexts) enum arbFragmentLayerViewport = arbFragmentLayerViewportLoader;

// ARB_framebuffer_sRGB
enum ARB_framebuffer_sRGB = "GL_ARB_framebuffer_sRGB";
enum arbFramebufferSRGBDecls = `enum uint GL_FRAMEBUFFER_SRGB = 0x8DB9;`;
enum arbFramebufferSRGBLoader = makeExtLoader(ARB_framebuffer_sRGB);
static if(!usingContexts) enum arbFramebufferSRGB = arbFramebufferSRGBDecls ~ arbFramebufferSRGBLoader;

// ARB_framebuffer_no_attachments <-- Core in GL 4.3
enum ARB_framebuffer_no_attachments = "GL_ARB_framebuffer_no_attachments";
enum arbFramebufferNoAttachmentsDecls =
q{
enum : uint
{
    GL_FRAMEBUFFER_DEFAULT_WIDTH      = 0x9310,
    GL_FRAMEBUFFER_DEFAULT_HEIGHT     = 0x9311,
    GL_FRAMEBUFFER_DEFAULT_LAYERS     = 0x9312,
    GL_FRAMEBUFFER_DEFAULT_SAMPLES    = 0x9313,
    GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 0x9314,
    GL_MAX_FRAMEBUFFER_WIDTH          = 0x9315,
    GL_MAX_FRAMEBUFFER_HEIGHT         = 0x9316,
    GL_MAX_FRAMEBUFFER_LAYERS         = 0x9317,
    GL_MAX_FRAMEBUFFER_SAMPLES        = 0x9318,
}
extern(System) @nogc nothrow
{
    alias da_glFramebufferParameteri = void function(GLenum,GLenum,GLint);
    alias da_glGetFramebufferParameteriv = void function(GLenum,GLenum,GLint*);
    alias da_glNamedFramebufferParameteriEXT = void function(GLuint,GLenum,GLint);
    alias da_glGetNamedFramebufferParameterivEXT = void function(GLuint,GLenum,GLint*);
}};

enum arbFramebufferNoAttachmentsFuncs =
q{
    da_glFramebufferParameteri glFramebufferParameteri;
    da_glGetFramebufferParameteriv glGetFramebufferParameteriv;
    da_glNamedFramebufferParameteriEXT glNamedFramebufferParameteriEXT;
    da_glGetNamedFramebufferParameterivEXT glGetNamedFramebufferParameterivEXT;
};

enum arbFramebufferNoAttachmentsLoaderImpl =
q{
    bindGLFunc(cast(void**)&glFramebufferParameteri, "glFramebufferParameteri");
    bindGLFunc(cast(void**)&glGetFramebufferParameteriv, "glGetFramebufferParameteriv");
    try {
        bindGLFunc(cast(void**)&glNamedFramebufferParameteriEXT, "glNamedFramebufferParameteriEXT");
        bindGLFunc(cast(void**)&glGetNamedFramebufferParameterivEXT, "glGetNamedFramebufferParameterivEXT");
    }
    catch(Exception e) {}
};

enum arbFramebufferNoAttachmentsLoader = makeLoader(ARB_framebuffer_no_attachments, arbFramebufferNoAttachmentsLoaderImpl, "gl43");
static if(!usingContexts) enum arbFramebufferNoAttachments = arbFramebufferNoAttachmentsDecls ~ arbFramebufferNoAttachmentsFuncs.makeGShared() ~ arbFramebufferNoAttachmentsLoader;