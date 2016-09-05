# Copyright (c) 2016 Joshua Brookover

set( BGFX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bgfx" )

file( GLOB BGFX_SOURCES ${BGFX_DIR}/src/*.cpp ${BGFX_DIR}/src/*.mm ${BGFX_DIR}/src/*.h )

add_library( bgfx STATIC ${BGFX_SOURCES} )
if( MSVC )
	target_compile_definitions( bgfx PRIVATE "-D_CRT_SECURE_NO_WARNINGS" )
endif()
target_include_directories( bgfx PRIVATE ${BGFX_DIR}/3rdparty ${BGFX_DIR}/3rdparty/dxsdk/include ${BGFX_DIR}/3rdparty/khronos )
target_include_directories( bgfx PUBLIC ${BGFX_DIR}/include )
target_link_libraries( bgfx PUBLIC bx )
if( MSVC )
	target_link_libraries( bgfx PUBLIC psapi )
endif()
set_source_files_properties( ${BGFX_DIR}/src/amalgamated.cpp PROPERTIES HEADER_FILE_ONLY ON )
set_source_files_properties( ${BGFX_DIR}/src/amalgamated.mm PROPERTIES HEADER_FILE_ONLY ON )
set_source_files_properties( ${BGFX_DIR}/src/hmd_ovr.cpp PROPERTIES HEADER_FILE_ONLY ON )
set_source_files_properties( ${BGFX_DIR}/src/glcontext_ppapi.cpp PROPERTIES HEADER_FILE_ONLY ON )
set_source_files_properties( ${BGFX_DIR}/src/glcontext_glx.cpp PROPERTIES HEADER_FILE_ONLY ON )
set_source_files_properties( ${BGFX_DIR}/src/glcontext_egl.cpp PROPERTIES HEADER_FILE_ONLY ON )
if( NOT APPLE )
	set_source_files_properties( ${BGFX_DIR}/src/glcontext_eagl.mm PROPERTIES HEADER_FILE_ONLY ON )
	set_source_files_properties( ${BGFX_DIR}/src/glcontext_nsgl.mm PROPERTIES HEADER_FILE_ONLY ON )
	set_source_files_properties( ${BGFX_DIR}/src/renderer_mtl.mm PROPERTIES HEADER_FILE_ONLY ON )
endif()