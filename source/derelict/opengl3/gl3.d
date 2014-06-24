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
module derelict.opengl3.gl3;

public {
    import derelict.opengl3.types;
    import derelict.opengl3.constants;
    import derelict.opengl3.functions;
    import derelict.opengl3.arb;
    import derelict.opengl3.ext;
}

private {
    import std.algorithm;
    import std.conv;

    import derelict.util.loader;
    import derelict.util.exception;
    import derelict.util.system;
    import derelict.opengl3.internal;

    static if( Derelict_OS_Android || Derelict_OS_iOS) {
        // Android and iOS do not support OpenGL3; use DerelictOpenGLES.
        static assert( false, "OpenGL is not supported on Android or iOS; use OpenGLES (DerelictGLES) instead" );
    } else static if( Derelict_OS_Windows ) {
        import derelict.opengl3.wgl;
        import derelict.opengl3.wglext;
        enum libNames = "opengl32.dll";
    } else static if( Derelict_OS_Mac ) {
        import derelict.opengl3.cgl;
        enum libNames = "../Frameworks/OpenGL.framework/OpenGL, /Library/Frameworks/OpenGL.framework/OpenGL, /System/Library/Frameworks/OpenGL.framework/OpenGL";
        void loadPlatformEXT( GLVersion ) {}
    } else static if( Derelict_OS_Posix ) {
        import derelict.opengl3.glx;
        import derelict.opengl3.glxext;
        enum libNames = "libGL.so.1,libGL.so";
    } else
        static assert( 0, "Need to implement OpenGL libNames for this operating system." );
}

class DerelictGL3Loader : SharedLibLoader
{
    private GLVersion _loadedVersion;

    public
    {
        this() {
            super( libNames );
        }

        GLVersion loadedVersion() @property {
            return _loadedVersion;
        }

        GLVersion reload() {
            // Make sure a context is active, otherwise this could be meaningless.
            if( !hasValidContext() )
                throw new DerelictException( "DerelictGL3.reload failure: An OpenGL context is not currently active." );

            GLVersion glVer = GLVersion.GL11;
            scope( exit ) _loadedVersion = glVer;

            GLVersion maxVer = findMaxAvailable();

            if( maxVer >= GLVersion.GL12 ) {
                bindGLFunc( cast( void** )&glBlendColor, "glBlendColor" );
                bindGLFunc( cast( void** )&glBlendEquation, "glBlendEquation" );
                bindGLFunc( cast( void** )&glDrawRangeElements, "glDrawRangeElements" );
                bindGLFunc( cast( void** )&glTexImage3D, "glTexImage3D" );
                bindGLFunc( cast( void** )&glTexSubImage3D, "glTexSubImage3D" );
                bindGLFunc( cast( void** )&glCopyTexSubImage3D, "glCopyTexSubImage3D" );
                glVer = GLVersion.GL12;
            }

            if( maxVer >= GLVersion.GL13 ) {
                bindGLFunc( cast( void** )&glActiveTexture, "glActiveTexture" );
                bindGLFunc( cast( void** )&glSampleCoverage, "glSampleCoverage" );
                bindGLFunc( cast( void** )&glCompressedTexImage3D, "glCompressedTexImage3D" );
                bindGLFunc( cast( void** )&glCompressedTexImage2D, "glCompressedTexImage2D" );
                bindGLFunc( cast( void** )&glCompressedTexImage1D, "glCompressedTexImage1D" );
                bindGLFunc( cast( void** )&glCompressedTexSubImage3D, "glCompressedTexSubImage3D" );
                bindGLFunc( cast( void** )&glCompressedTexSubImage2D, "glCompressedTexSubImage2D" );
                bindGLFunc( cast( void** )&glCompressedTexSubImage1D, "glCompressedTexSubImage1D" );
                bindGLFunc( cast( void** )&glGetCompressedTexImage, "glGetCompressedTexImage" );
                glVer = GLVersion.GL13;
            }

            if( maxVer >= GLVersion.GL14 ) {
                bindGLFunc( cast( void** )&glBlendFuncSeparate, "glBlendFuncSeparate" );
                bindGLFunc( cast( void** )&glMultiDrawArrays, "glMultiDrawArrays" );
                bindGLFunc( cast( void** )&glMultiDrawElements, "glMultiDrawElements" );
                bindGLFunc( cast( void** )&glPointParameterf, "glPointParameterf" );
                bindGLFunc( cast( void** )&glPointParameterfv, "glPointParameterfv" );
                bindGLFunc( cast( void** )&glPointParameteri, "glPointParameteri" );
                bindGLFunc( cast( void** )&glPointParameteriv, "glPointParameteriv" );
                glVer = GLVersion.GL14;
            }

            if( maxVer >= GLVersion.GL15 ) {
                bindGLFunc( cast( void** )&glGenQueries, "glGenQueries" );
                bindGLFunc( cast( void** )&glDeleteQueries, "glDeleteQueries" );
                bindGLFunc( cast( void** )&glIsQuery, "glIsQuery" );
                bindGLFunc( cast( void** )&glBeginQuery, "glBeginQuery" );
                bindGLFunc( cast( void** )&glEndQuery, "glEndQuery" );
                bindGLFunc( cast( void** )&glGetQueryiv, "glGetQueryiv" );
                bindGLFunc( cast( void** )&glGetQueryObjectiv, "glGetQueryObjectiv" );
                bindGLFunc( cast( void** )&glGetQueryObjectuiv, "glGetQueryObjectuiv" );
                bindGLFunc( cast( void** )&glBindBuffer, "glBindBuffer" );
                bindGLFunc( cast( void** )&glDeleteBuffers, "glDeleteBuffers" );
                bindGLFunc( cast( void** )&glGenBuffers, "glGenBuffers" );
                bindGLFunc( cast( void** )&glIsBuffer, "glIsBuffer" );
                bindGLFunc( cast( void** )&glBufferData, "glBufferData" );
                bindGLFunc( cast( void** )&glBufferSubData, "glBufferSubData" );
                bindGLFunc( cast( void** )&glGetBufferSubData, "glGetBufferSubData" );
                bindGLFunc( cast( void** )&glMapBuffer, "glMapBuffer" );
                bindGLFunc( cast( void** )&glUnmapBuffer, "glUnmapBuffer" );
                bindGLFunc( cast( void** )&glGetBufferParameteriv, "glGetBufferParameteriv" );
                bindGLFunc( cast( void** )&glGetBufferPointerv, "glGetBufferPointerv" );
                glVer = GLVersion.GL15;
            }

            if( maxVer >= GLVersion.GL20 ) {
                bindGLFunc( cast( void** )&glBlendEquationSeparate, "glBlendEquationSeparate" );
                bindGLFunc( cast( void** )&glDrawBuffers, "glDrawBuffers" );
                bindGLFunc( cast( void** )&glStencilOpSeparate, "glStencilOpSeparate" );
                bindGLFunc( cast( void** )&glStencilFuncSeparate, "glStencilFuncSeparate" );
                bindGLFunc( cast( void** )&glStencilMaskSeparate, "glStencilMaskSeparate" );
                bindGLFunc( cast( void** )&glAttachShader, "glAttachShader" );
                bindGLFunc( cast( void** )&glBindAttribLocation, "glBindAttribLocation" );
                bindGLFunc( cast( void** )&glCompileShader, "glCompileShader" );
                bindGLFunc( cast( void** )&glCreateProgram, "glCreateProgram" );
                bindGLFunc( cast( void** )&glCreateShader, "glCreateShader" );
                bindGLFunc( cast( void** )&glDeleteProgram, "glDeleteProgram" );
                bindGLFunc( cast( void** )&glDeleteShader, "glDeleteShader" );
                bindGLFunc( cast( void** )&glDetachShader, "glDetachShader" );
                bindGLFunc( cast( void** )&glDisableVertexAttribArray, "glDisableVertexAttribArray" );
                bindGLFunc( cast( void** )&glEnableVertexAttribArray, "glEnableVertexAttribArray" );
                bindGLFunc( cast( void** )&glGetActiveAttrib, "glGetActiveAttrib" );
                bindGLFunc( cast( void** )&glGetActiveUniform, "glGetActiveUniform" );
                bindGLFunc( cast( void** )&glGetAttachedShaders, "glGetAttachedShaders" );
                bindGLFunc( cast( void** )&glGetAttribLocation, "glGetAttribLocation" );
                bindGLFunc( cast( void** )&glGetProgramiv, "glGetProgramiv" );
                bindGLFunc( cast( void** )&glGetProgramInfoLog, "glGetProgramInfoLog" );
                bindGLFunc( cast( void** )&glGetShaderiv, "glGetShaderiv" );
                bindGLFunc( cast( void** )&glGetShaderInfoLog, "glGetShaderInfoLog" );
                bindGLFunc( cast( void** )&glGetShaderSource, "glGetShaderSource" );
                bindGLFunc( cast( void** )&glGetUniformLocation, "glGetUniformLocation" );
                bindGLFunc( cast( void** )&glGetUniformfv, "glGetUniformfv" );
                bindGLFunc( cast( void** )&glGetUniformiv, "glGetUniformiv" );
                bindGLFunc( cast( void** )&glGetVertexAttribdv, "glGetVertexAttribdv" );
                bindGLFunc( cast( void** )&glGetVertexAttribfv, "glGetVertexAttribfv" );
                bindGLFunc( cast( void** )&glGetVertexAttribiv, "glGetVertexAttribiv" );
                bindGLFunc( cast( void** )&glGetVertexAttribPointerv, "glGetVertexAttribPointerv" );
                bindGLFunc( cast( void** )&glIsProgram, "glIsProgram" );
                bindGLFunc( cast( void** )&glIsShader, "glIsShader" );
                bindGLFunc( cast( void** )&glLinkProgram, "glLinkProgram" );
                bindGLFunc( cast( void** )&glShaderSource, "glShaderSource" );
                bindGLFunc( cast( void** )&glUseProgram, "glUseProgram" );
                bindGLFunc( cast( void** )&glUniform1f, "glUniform1f" );
                bindGLFunc( cast( void** )&glUniform2f, "glUniform2f" );
                bindGLFunc( cast( void** )&glUniform3f, "glUniform3f" );
                bindGLFunc( cast( void** )&glUniform4f, "glUniform4f" );
                bindGLFunc( cast( void** )&glUniform1i, "glUniform1i" );
                bindGLFunc( cast( void** )&glUniform2i, "glUniform2i" );
                bindGLFunc( cast( void** )&glUniform4i, "glUniform4i" );
                bindGLFunc( cast( void** )&glUniform1fv, "glUniform1fv" );
                bindGLFunc( cast( void** )&glUniform2fv, "glUniform2fv" );
                bindGLFunc( cast( void** )&glUniform3fv, "glUniform3fv" );
                bindGLFunc( cast( void** )&glUniform4fv, "glUniform4fv" );
                bindGLFunc( cast( void** )&glUniform1iv, "glUniform1iv" );
                bindGLFunc( cast( void** )&glUniform2iv, "glUniform2iv" );
                bindGLFunc( cast( void** )&glUniform3iv, "glUniform3iv" );
                bindGLFunc( cast( void** )&glUniform4iv, "glUniform4iv" );
                bindGLFunc( cast( void** )&glUniformMatrix2fv, "glUniformMatrix2fv" );
                bindGLFunc( cast( void** )&glUniformMatrix3fv, "glUniformMatrix3fv" );
                bindGLFunc( cast( void** )&glUniformMatrix4fv, "glUniformMatrix4fv" );
                bindGLFunc( cast( void** )&glValidateProgram, "glValidateProgram" );
                bindGLFunc( cast( void** )&glVertexAttrib1d, "glVertexAttrib1d" );
                bindGLFunc( cast( void** )&glVertexAttrib1dv, "glVertexAttrib1dv" );
                bindGLFunc( cast( void** )&glVertexAttrib1f, "glVertexAttrib1f" );
                bindGLFunc( cast( void** )&glVertexAttrib1fv, "glVertexAttrib1fv" );
                bindGLFunc( cast( void** )&glVertexAttrib1s, "glVertexAttrib1s" );
                bindGLFunc( cast( void** )&glVertexAttrib1sv, "glVertexAttrib1sv" );
                bindGLFunc( cast( void** )&glVertexAttrib2d, "glVertexAttrib2d" );
                bindGLFunc( cast( void** )&glVertexAttrib2dv, "glVertexAttrib2dv" );
                bindGLFunc( cast( void** )&glVertexAttrib2f, "glVertexAttrib2f" );
                bindGLFunc( cast( void** )&glVertexAttrib2fv, "glVertexAttrib2fv" );
                bindGLFunc( cast( void** )&glVertexAttrib2s, "glVertexAttrib2s" );
                bindGLFunc( cast( void** )&glVertexAttrib2sv, "glVertexAttrib2sv" );
                bindGLFunc( cast( void** )&glVertexAttrib3d, "glVertexAttrib3d" );
                bindGLFunc( cast( void** )&glVertexAttrib3dv, "glVertexAttrib3dv" );
                bindGLFunc( cast( void** )&glVertexAttrib3f, "glVertexAttrib3f" );
                bindGLFunc( cast( void** )&glVertexAttrib3fv, "glVertexAttrib3fv" );
                bindGLFunc( cast( void** )&glVertexAttrib3s, "glVertexAttrib3s" );
                bindGLFunc( cast( void** )&glVertexAttrib3sv, "glVertexAttrib3sv" );
                bindGLFunc( cast( void** )&glVertexAttrib4Nbv, "glVertexAttrib4Nbv" );
                bindGLFunc( cast( void** )&glVertexAttrib4Niv, "glVertexAttrib4Niv" );
                bindGLFunc( cast( void** )&glVertexAttrib4Nsv, "glVertexAttrib4Nsv" );
                bindGLFunc( cast( void** )&glVertexAttrib4Nub, "glVertexAttrib4Nub" );
                bindGLFunc( cast( void** )&glVertexAttrib4Nubv, "glVertexAttrib4Nubv" );
                bindGLFunc( cast( void** )&glVertexAttrib4Nuiv, "glVertexAttrib4Nuiv" );
                bindGLFunc( cast( void** )&glVertexAttrib4Nusv, "glVertexAttrib4Nusv" );
                bindGLFunc( cast( void** )&glVertexAttrib4bv, "glVertexAttrib4bv" );
                bindGLFunc( cast( void** )&glVertexAttrib4d, "glVertexAttrib4d" );
                bindGLFunc( cast( void** )&glVertexAttrib4dv, "glVertexAttrib4dv" );
                bindGLFunc( cast( void** )&glVertexAttrib4f, "glVertexAttrib4f" );
                bindGLFunc( cast( void** )&glVertexAttrib4fv, "glVertexAttrib4fv" );
                bindGLFunc( cast( void** )&glVertexAttrib4iv, "glVertexAttrib4iv" );
                bindGLFunc( cast( void** )&glVertexAttrib4s, "glVertexAttrib4s" );
                bindGLFunc( cast( void** )&glVertexAttrib4sv, "glVertexAttrib4sv" );
                bindGLFunc( cast( void** )&glVertexAttrib4ubv, "glVertexAttrib4ubv" );
                bindGLFunc( cast( void** )&glVertexAttrib4uiv, "glVertexAttrib4uiv" );
                bindGLFunc( cast( void** )&glVertexAttrib4usv, "glVertexAttrib4usv" );
                bindGLFunc( cast( void** )&glVertexAttribPointer, "glVertexAttribPointer" );
                glVer = GLVersion.GL20;
            }

            if( maxVer >= GLVersion.GL21 ) {
                bindGLFunc( cast( void** )&glUniformMatrix2x3fv, "glUniformMatrix2x3fv" );
                bindGLFunc( cast( void** )&glUniformMatrix3x2fv, "glUniformMatrix3x2fv" );
                bindGLFunc( cast( void** )&glUniformMatrix2x4fv, "glUniformMatrix2x4fv" );
                bindGLFunc( cast( void** )&glUniformMatrix4x2fv, "glUniformMatrix4x2fv" );
                bindGLFunc( cast( void** )&glUniformMatrix3x4fv, "glUniformMatrix3x4fv" );
                bindGLFunc( cast( void** )&glUniformMatrix4x3fv, "glUniformMatrix4x3fv" );
                glVer = GLVersion.GL21;
            }

            if( maxVer >= GLVersion.GL30 ) {
                load_ARB_framebuffer_object( true );
                load_ARB_map_buffer_range( true );
                load_ARB_vertex_array_object( true );

                bindGLFunc( cast( void** )&glColorMaski, "glColorMaski" );
                bindGLFunc( cast( void** )&glGetBooleani_v, "glGetBooleani_v" );
                bindGLFunc( cast( void** )&glGetIntegeri_v, "glGetIntegeri_v" );
                bindGLFunc( cast( void** )&glEnablei, "glEnablei" );
                bindGLFunc( cast( void** )&glDisablei, "glDisablei" );
                bindGLFunc( cast( void** )&glIsEnabledi, "glIsEnabledi" );
                bindGLFunc( cast( void** )&glBeginTransformFeedback, "glBeginTransformFeedback" );
                bindGLFunc( cast( void** )&glEndTransformFeedback, "glEndTransformFeedback" );
                bindGLFunc( cast( void** )&glBindBufferRange, "glBindBufferRange" );
                bindGLFunc( cast( void** )&glBindBufferBase, "glBindBufferBase" );
                bindGLFunc( cast( void** )&glTransformFeedbackVaryings, "glTransformFeedbackVaryings" );
                bindGLFunc( cast( void** )&glGetTransformFeedbackVarying, "glGetTransformFeedbackVarying" );
                bindGLFunc( cast( void** )&glClampColor, "glClampColor" );
                bindGLFunc( cast( void** )&glBeginConditionalRender, "glBeginConditionalRender" );
                bindGLFunc( cast( void** )&glEndConditionalRender, "glEndConditionalRender" );
                bindGLFunc( cast( void** )&glVertexAttribIPointer, "glVertexAttribIPointer" );
                bindGLFunc( cast( void** )&glGetVertexAttribIiv, "glGetVertexAttribIiv" );
                bindGLFunc( cast( void** )&glGetVertexAttribIuiv, "glGetVertexAttribIuiv" );
                bindGLFunc( cast( void** )&glVertexAttribI1i, "glVertexAttribI1i" );
                bindGLFunc( cast( void** )&glVertexAttribI2i, "glVertexAttribI2i" );
                bindGLFunc( cast( void** )&glVertexAttribI3i, "glVertexAttribI3i" );
                bindGLFunc( cast( void** )&glVertexAttribI4i, "glVertexAttribI4i" );
                bindGLFunc( cast( void** )&glVertexAttribI1ui, "glVertexAttribI1ui" );
                bindGLFunc( cast( void** )&glVertexAttribI2ui, "glVertexAttribI2ui" );
                bindGLFunc( cast( void** )&glVertexAttribI3ui, "glVertexAttribI3ui" );
                bindGLFunc( cast( void** )&glVertexAttribI4ui, "glVertexAttribI4ui" );
                bindGLFunc( cast( void** )&glVertexAttribI1iv, "glVertexAttribI1iv" );
                bindGLFunc( cast( void** )&glVertexAttribI2iv, "glVertexAttribI2iv" );
                bindGLFunc( cast( void** )&glVertexAttribI3iv, "glVertexAttribI3iv" );
                bindGLFunc( cast( void** )&glVertexAttribI4iv, "glVertexAttribI4iv" );
                bindGLFunc( cast( void** )&glVertexAttribI1uiv, "glVertexAttribI1uiv" );
                bindGLFunc( cast( void** )&glVertexAttribI2uiv, "glVertexAttribI2uiv" );
                bindGLFunc( cast( void** )&glVertexAttribI3uiv, "glVertexAttribI3uiv" );
                bindGLFunc( cast( void** )&glVertexAttribI4uiv, "glVertexAttribI4uiv" );
                bindGLFunc( cast( void** )&glVertexAttribI4bv, "glVertexAttribI4bv" );
                bindGLFunc( cast( void** )&glVertexAttribI4sv, "glVertexAttribI4sv" );
                bindGLFunc( cast( void** )&glVertexAttribI4ubv, "glVertexAttribI4ubv" );
                bindGLFunc( cast( void** )&glVertexAttribI4usv, "glVertexAttribI4usv" );
                bindGLFunc( cast( void** )&glGetUniformuiv, "glGetUniformuiv" );
                bindGLFunc( cast( void** )&glBindFragDataLocation, "glBindFragDataLocation" );
                bindGLFunc( cast( void** )&glGetFragDataLocation, "glGetFragDataLocation" );
                bindGLFunc( cast( void** )&glUniform1ui, "glUniform1ui" );
                bindGLFunc( cast( void** )&glUniform2ui, "glUniform2ui" );
                bindGLFunc( cast( void** )&glUniform3ui, "glUniform3ui" );
                bindGLFunc( cast( void** )&glUniform4ui, "glUniform4ui" );
                bindGLFunc( cast( void** )&glUniform1uiv, "glUniform1uiv" );
                bindGLFunc( cast( void** )&glUniform2uiv, "glUniform2uiv" );
                bindGLFunc( cast( void** )&glUniform3uiv, "glUniform3uiv" );
                bindGLFunc( cast( void** )&glUniform4uiv, "glUniform4uiv" );
                bindGLFunc( cast( void** )&glTexParameterIiv, "glTexParameterIiv" );
                bindGLFunc( cast( void** )&glTexParameterIuiv, "glTexParameterIuiv" );
                bindGLFunc( cast( void** )&glGetTexParameterIiv, "glGetTexParameterIiv" );
                bindGLFunc( cast( void** )&glGetTexParameterIuiv, "glGetTexParameterIuiv" );
                bindGLFunc( cast( void** )&glClearBufferiv, "glClearBufferiv" );
                bindGLFunc( cast( void** )&glClearBufferuiv, "glClearBufferuiv" );
                bindGLFunc( cast( void** )&glClearBufferfv, "glClearBufferfv" );
                bindGLFunc( cast( void** )&glClearBufferfi, "glClearBufferfi" );
                bindGLFunc( cast( void** )&glGetStringi, "glGetStringi" );
                glVer = GLVersion.GL30;
            }

            if( maxVer >= GLVersion.GL31 ) {
                load_ARB_copy_buffer( true );
                load_ARB_uniform_buffer_object( true );

                bindGLFunc( cast( void** )&glDrawArraysInstanced, "glDrawArraysInstanced" );
                bindGLFunc( cast( void** )&glDrawElementsInstanced, "glDrawElementsInstanced" );
                bindGLFunc( cast( void** )&glTexBuffer, "glTexBuffer" );
                bindGLFunc( cast( void** )&glPrimitiveRestartIndex, "glPrimitiveRestartIndex" );
                glVer = GLVersion.GL31;
            }

            if( maxVer >= GLVersion.GL32 ) {
                load_ARB_draw_elements_base_vertex( true );
                load_ARB_provoking_vertex( true );
                load_ARB_sync( true );
                load_ARB_texture_multisample( true );

                bindGLFunc( cast( void** )&glGetInteger64i_v, "glGetInteger64i_v" );
                bindGLFunc( cast( void** )&glGetBufferParameteri64v, "glGetBufferParameteri64v" );
                bindGLFunc( cast( void** )&glFramebufferTexture, "glFramebufferTexture" );
                glVer = GLVersion.GL32;
            }

            if( maxVer >= GLVersion.GL33 ) {
                load_ARB_blend_func_extended( true );
                load_ARB_sampler_objects( true );
                load_ARB_timer_query( true );
                load_ARB_vertex_type_2_10_10_10_rev( true );

                bindGLFunc( cast( void** )&glVertexAttribDivisor, "glVertexAttribDivisor" );
                glVer = GLVersion.GL33;
            }

            if( maxVer >= GLVersion.GL40 ) {
                load_ARB_draw_indirect( true );
                load_ARB_gpu_shader_fp64( true );
                load_ARB_shader_subroutine( true );
                load_ARB_tessellation_shader( true );
                load_ARB_transform_feedback2( true );
                load_ARB_transform_feedback3( true );

                bindGLFunc( cast( void** )&glMinSampleShading, "glMinSampleShading" );
                bindGLFunc( cast( void** )&glBlendEquationi, "glBlendEquationi" );
                bindGLFunc( cast( void** )&glBlendEquationSeparatei, "glBlendEquationSeparatei" );
                bindGLFunc( cast( void** )&glBlendFunci, "glBlendFunci" );
                bindGLFunc( cast( void** )&glBlendFuncSeparatei, "glBlendFuncSeparatei" );
                glVer = GLVersion.GL40;
            }

            if( maxVer >= GLVersion.GL41 ) {
                load_ARB_ES2_compatibility( true );
                load_ARB_get_program_binary( true );
                load_ARB_separate_shader_objects( true );
                load_ARB_vertex_attrib_64bit( true );
                load_ARB_viewport_array( true );

                glVer = GLVersion.GL41;
            }

            if( maxVer >= GLVersion.GL42 ) {
                load_ARB_base_instance( true );
                load_ARB_transform_feedback_instanced( true );
                load_ARB_internalformat_query( true );
                load_ARB_shader_atomic_counters( true );
                load_ARB_shader_image_load_store( true );
                load_ARB_texture_storage( GLVersion.GL42, true );

                glVer = GLVersion.GL42;
            }

            if( maxVer >= GLVersion.GL43 ) {
                load_ARB_clear_buffer_object( true );
                load_ARB_compute_shader( true );
                load_KHR_debug( true );
                load_ARB_framebuffer_no_attachments( true );
                load_ARB_internalformat_query2( true );
                load_ARB_invalidate_subdata( true );
                load_ARB_multi_draw_indirect( true );
                load_ARB_program_interface_query( true );
                load_ARB_shader_storage_buffer_object( true );
                load_ARB_texture_buffer_range( true );
                load_ARB_texture_storage_multisample( true );
                load_ARB_texture_view( true );
                load_ARB_vertex_attrib_binding( true );

                glVer = GLVersion.GL43;
            }

            loadARB( glVer );
            loadEXT( glVer );
            loadPlatformEXT(  glVer  );

            return glVer;
        }
    }

    protected override void loadSymbols() {
        // OpenGL 1.0
        bindFunc( cast( void** )&glCullFace, "glCullFace" );
        bindFunc( cast( void** )&glFrontFace, "glFrontFace" );
        bindFunc( cast( void** )&glHint, "glHint" );
        bindFunc( cast( void** )&glLineWidth, "glLineWidth" );
        bindFunc( cast( void** )&glPointSize, "glPointSize" );
        bindFunc( cast( void** )&glPolygonMode, "glPolygonMode" );
        bindFunc( cast( void** )&glScissor, "glScissor" );
        bindFunc( cast( void** )&glTexParameterf, "glTexParameterf" );
        bindFunc( cast( void** )&glTexParameterfv, "glTexParameterfv" );
        bindFunc( cast( void** )&glTexParameteri, "glTexParameteri" );
        bindFunc( cast( void** )&glTexParameteriv, "glTexParameteriv" );
        bindFunc( cast( void** )&glTexImage1D, "glTexImage1D" );
        bindFunc( cast( void** )&glTexImage2D, "glTexImage2D" );
        bindFunc( cast( void** )&glDrawBuffer, "glDrawBuffer" );
        bindFunc( cast( void** )&glClear, "glClear" );
        bindFunc( cast( void** )&glClearColor, "glClearColor" );
        bindFunc( cast( void** )&glClearStencil, "glClearStencil" );
        bindFunc( cast( void** )&glClearDepth, "glClearDepth" );
        bindFunc( cast( void** )&glStencilMask, "glStencilMask" );
        bindFunc( cast( void** )&glColorMask, "glColorMask" );
        bindFunc( cast( void** )&glDepthMask, "glDepthMask" );
        bindFunc( cast( void** )&glDisable, "glDisable" );
        bindFunc( cast( void** )&glEnable, "glEnable" );
        bindFunc( cast( void** )&glFinish, "glFinish" );
        bindFunc( cast( void** )&glFlush, "glFlush" );
        bindFunc( cast( void** )&glBlendFunc, "glBlendFunc" );
        bindFunc( cast( void** )&glLogicOp, "glLogicOp" );
        bindFunc( cast( void** )&glStencilFunc, "glStencilFunc" );
        bindFunc( cast( void** )&glStencilOp, "glStencilOp" );
        bindFunc( cast( void** )&glDepthFunc, "glDepthFunc" );
        bindFunc( cast( void** )&glPixelStoref, "glPixelStoref" );
        bindFunc( cast( void** )&glPixelStorei, "glPixelStorei" );
        bindFunc( cast( void** )&glReadBuffer, "glReadBuffer" );
        bindFunc( cast( void** )&glReadPixels, "glReadPixels" );
        bindFunc( cast( void** )&glGetBooleanv, "glGetBooleanv" );
        bindFunc( cast( void** )&glGetDoublev, "glGetDoublev" );
        bindFunc( cast( void** )&glGetError, "glGetError" );
        bindFunc( cast( void** )&glGetFloatv, "glGetFloatv" );
        bindFunc( cast( void** )&glGetIntegerv, "glGetIntegerv" );
        bindFunc( cast( void** )&glGetString, "glGetString" );
        bindFunc( cast( void** )&glGetTexImage, "glGetTexImage" );
        bindFunc( cast( void** )&glGetTexParameterfv, "glGetTexParameterfv" );
        bindFunc( cast( void** )&glGetTexParameteriv, "glGetTexParameteriv" );
        bindFunc( cast( void** )&glGetTexLevelParameterfv, "glGetTexLevelParameterfv" );
        bindFunc( cast( void** )&glGetTexLevelParameteriv, "glGetTexLevelParameteriv" );
        bindFunc( cast( void** )&glIsEnabled, "glIsEnabled" );
        bindFunc( cast( void** )&glDepthRange, "glDepthRange" );
        bindFunc( cast( void** )&glViewport, "glViewport" );

        // OpenGL 1.1
        bindFunc( cast( void** )&glDrawArrays, "glDrawArrays" );
        bindFunc( cast( void** )&glDrawElements, "glDrawElements" );
        bindFunc( cast( void** )&glPolygonOffset, "glPolygonOffset" );
        bindFunc( cast( void** )&glCopyTexImage1D, "glCopyTexImage1D" );
        bindFunc( cast( void** )&glCopyTexImage2D, "glCopyTexImage2D" );
        bindFunc( cast( void** )&glCopyTexSubImage1D, "glCopyTexSubImage1D" );
        bindFunc( cast( void** )&glCopyTexSubImage2D, "glCopyTexSubImage2D" );
        bindFunc( cast( void** )&glTexSubImage1D, "glTexSubImage1D" );
        bindFunc( cast( void** )&glTexSubImage2D, "glTexSubImage2D" );
        bindFunc( cast( void** )&glBindTexture, "glBindTexture" );
        bindFunc( cast( void** )&glDeleteTextures, "glDeleteTextures" );
        bindFunc( cast( void** )&glGenTextures, "glGenTextures" );
        bindFunc( cast( void** )&glIsTexture, "glIsTexture" );

        _loadedVersion = GLVersion.GL11;

        loadPlatformGL( &bindFunc );
    }

    private {
        GLVersion findMaxAvailable()
        {
            /* glGetString( GL_VERSION ) is guaranteed to return a constant string
             of the format "[major].[minor].[build] xxxx", where xxxx is vendor-specific
             information. Here, I'm pulling two characters out of the string, the major
             and minor version numbers. */
            const( char )* verstr = glGetString( GL_VERSION );
            char major = *verstr;
            char minor = *( verstr + 2 );

            switch( major ) {
                case '4':
                    if( minor == '3' ) return GLVersion.GL43;
                    else if( minor == '2' ) return GLVersion.GL42;
                    else if( minor == '1' ) return GLVersion.GL41;
                    else if( minor == '0' ) return GLVersion.GL40;

                    /* No default condition here, since it's possible for new
                     minor versions of the 4.x series to be released before
                     support is added to Derelict. That case is handled outside
                     of the switch. When no more 4.x versions are released, this
                     should be changed to return GL40 by default. */
                    break;

                case '3':
                    if( minor == '3' ) return GLVersion.GL33;
                    else if( minor == '2' ) return GLVersion.GL32;
                    else if( minor == '1' ) return GLVersion.GL31;
                    else return GLVersion.GL30;

                case '2':
                    if( minor == '1' ) return GLVersion.GL21;
                    else return GLVersion.GL20;

                case '1':
                    if( minor == '5' ) return GLVersion.GL15;
                    else if( minor == '4' ) return GLVersion.GL14;
                    else if( minor == '3' ) return GLVersion.GL13;
                    else if( minor == '2' ) return GLVersion.GL12;
                    else return GLVersion.GL11;

                default:
                    /* glGetString( GL_VERSION ) is guaranteed to return a result
                     of a specific format, so if this point is reached it is
                     going to be because a major version higher than what Derelict
                     supports was encountered. That case is handled outside the
                     switch. */
                    break;

            }

            /* It's highly likely at this point that the version is higher than
             what Derelict supports, so return the highest supported version. */
            return GLVersion.HighestSupported;
        }
    }
}

__gshared DerelictGL3Loader DerelictGL3;

shared static this() {
    DerelictGL3 = new DerelictGL3Loader;
}
