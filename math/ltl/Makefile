# Created by: rossiya
# $FreeBSD$

PORTNAME=	ltl
PORTVERSION=	1.9.1
PORTREVISION=	4
CATEGORIES=	math
MASTER_SITES=	http://www.mpe.mpg.de/~drory/ltl/

MAINTAINER=	rossiya@gmail.com
COMMENT=	C++ class SSE library for scientific computing

LIB_DEPENDS=	liblapack.so:${PORTSDIR}/math/lapack \
		libblas.so:${PORTSDIR}/math/blas

USES=		gmake libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-cxx=gcc --disable-doxygen --prefix=${PREFIX} --includedir=${PREFIX}/include/LTL
MAKE_ENV=	prefix=${PREFIX} exec_prefix=${PREFIX}
MAKE_ARGS+=	ACLOCAL="${TRUE}" AUTOCONF="${TRUE}" AUTOMAKE="${TRUE}" \
		AUTOHEADER="${TRUE}"
INSTALL_TARGET=	install install-data distdir

PORTDOCS=	*.html

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for docs in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/doc/html/${docs} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
