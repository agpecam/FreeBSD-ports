# Created by: Hye-Shik Chang
# $FreeBSD$

PORTNAME=	unalz
PORTVERSION=	0.65
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	http://www.kipple.pe.kr/win/unalz/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Extracts AlZip archives

BROKEN=		unfetchable

LICENSE_FILE=	${WRKSRC}/readme.txt

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		dos2unix iconv tar:tgz
MAKE_ARGS+=	CPP="${CXX}" CC="${CC}" OBJ="${UNALZ_OBJS}" \
		LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"
ALL_TARGET=	posix-utf8

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lz -lbz2

PLIST_FILES=	bin/${PORTNAME}

UNALZ_OBJS=	main.o UnAlz.o UnAlzUtils.o UnAlzBz2decompress.o \
		UnAlzBzip2.o UnAlzbzlib.o

post-patch:
	${REINPLACE_CMD} -e \
		's/-liconv/${ICONV_LIB}/g' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e \
		'/<sys\/timeb.h>/d' ${WRKSRC}/main.cpp

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
