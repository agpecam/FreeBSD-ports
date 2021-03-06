# Created by: Carlos Eduardo G. Carvalho <cartola@openit.com.br>
# $FreeBSD$

PORTNAME=	hugin
PORTVERSION=	2015.0.0
PORTREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION:R}

MAINTAINER=	grog@FreeBSD.org
COMMENT=	GUI for Panorama Tools, to stitch panoramic images

LIB_DEPENDS=	libIlmImf.so:${PORTSDIR}/graphics/OpenEXR \
		libImath.so:${PORTSDIR}/graphics/ilmbase \
		libboost_thread.so:${PORTSDIR}/devel/boost-libs \
		libexiv2.so:${PORTSDIR}/graphics/exiv2 \
		liblensfun.so:${PORTSDIR}/graphics/lensfun \
		libpano13.so:${PORTSDIR}/graphics/libpano13 \
		libsqlite3.so:${PORTSDIR}/databases/sqlite3 \
		libvigraimpex.so:${PORTSDIR}/graphics/vigra \
		libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff
BUILD_DEPENDS=	swig2.0:${PORTSDIR}/devel/swig20 \
		tclap>=1.2.1:${PORTSDIR}/devel/tclap
# gmake is really needed at _runtime_.   Do not remove it from this list.
RUN_DEPENDS=	enblend>=3.1.r20080615:${PORTSDIR}/graphics/enblend \
		exiftool:${PORTSDIR}/graphics/p5-Image-ExifTool \
		gmake:${PORTSDIR}/devel/gmake

OPTIONS_DEFINE=	PANOMATIC AUTOPANOSIFTC
OPTIONS_DEFAULT=	PANOMATIC AUTOPANOSIFTC
PANOMATIC_DESC=	Install graphics/panomatic
AUTOPANOSIFTC_DESC=	Install graphics/autopano-sift-c

USES=		cmake gettext jpeg pkgconfig tar:bzip2 desktop-file-utils python \
		shared-mime-info compiler:features

CMAKE_ARGS=	-DwxWidgets_CONFIG_EXECUTABLE=${WX_CONFIG}

USE_WX=		2.8+
WX_UNICODE=	yes

USE_GL=		glew glut

INSTALLS_ICONS=	yes

.include <bsd.port.pre.mk>

# If default compiler is GCC, upgrade it because
# g++ 4.2 is too old. Basically, use the same compiler as graphics/OpenEXR
# see https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=197898
.if ${COMPILER_TYPE} == gcc
USE_GCC=	yes
.endif

# work around a bug in cmake (?). Without this we get an error like:
# cd /usr/ports/graphics/hugin/work/hugin-0.7.r3135/src/hugin1/base_wx && /usr/bin/c++   -D_FILE_OFFSET_BITS=64 -D_LARGE_FILES -D__WXGTK__ -D_THREAD_SAFE -O2 -fno-strict-aliasing -pipe -pthread;-D_THREAD_SAFE -O3 -DNDEBUG -I/usr/ports/graphics/hugin/work/hugin-0.7.r3135/src -I/usr/ports/graphics/hugin/work/hugin-0.7.r3135/src/hugin_base -I/usr/ports/graphics/hugin/work/hugin-0.7.r3135/src/foreign -I/usr/ports/graphics/hugin/work/hugin-0.7.r3135/src/foreign/vigra -I/usr/local/include -I/usr/local/include/OpenEXR -isystem /usr/local/lib/wx/include/gtk2-ansi-release-2.8 -isystem /usr/local/include/wx-2.8 -I/usr/ports/graphics/hugin/work/hugin-0.7.r3135/src/hugin1 -o CMakeFiles/huginbasewx.dir/ImageCache.o -c /usr/ports/graphics/hugin/work/hugin-0.7.r3135/src/hugin1/base_wx/ImageCache.cpp
# c++: No input files specified
# with cmake 2.6.0. It works with cmake 2.4.8.
post-configure:
	${REINPLACE_CMD} \
		's/-pthread;-D_THREAD_SAFE/-pthread -D_THREAD_SAFE/g' \
		${WRKSRC}/src/hugin1/base_wx/CMakeFiles/huginbasewx.dir/flags.make \
		${WRKSRC}/src/hugin1/hugin/CMakeFiles/hugin.dir/flags.make \
		${WRKSRC}/src/hugin1/hugin/CMakeFiles/hugin.dir/link.txt \
		${WRKSRC}/src/hugin1/ptbatcher/CMakeFiles/PTBatcherGUI.dir/flags.make \
		${WRKSRC}/src/hugin1/ptbatcher/CMakeFiles/PTBatcherGUI.dir/link.txt \
		${WRKSRC}/src/hugin1/stitch_project/CMakeFiles/hugin_stitch_project.dir/flags.make \
		${WRKSRC}/src/hugin1/stitch_project/CMakeFiles/hugin_stitch_project.dir/link.txt

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPANOMATIC}
RUN_DEPENDS+=	panomatic:${PORTSDIR}/graphics/panomatic
.endif

.if ${PORT_OPTIONS:MAUTOPANOSIFTC}
RUN_DEPENDS+=	autopano:${PORTSDIR}/graphics/autopano-sift-c
.endif

.include <bsd.port.post.mk>
