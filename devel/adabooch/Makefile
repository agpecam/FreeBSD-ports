# Created by: David Holm <david@realityrift.com>
# $FreeBSD$

PORTNAME=	adabooch
PORTVERSION=	20130322
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/booch95/booch95/${PORTVERSION}
DISTNAME=	bc-${PORTVERSION}

MAINTAINER=	marino@FreeBSD.org
COMMENT=	Ada 95 Booch Components

LICENSE=	GPLv2 GMGPL
LICENSE_COMB=	multi

BUILD_DEPENDS=	gprbuild:${PORTSDIR}/devel/gprbuild

USES=		ada gmake tar:bzip2
HAS_CONFIGURE=	yes
ALL_TARGET=	libs

# Demos are available but require that the libraries are already installed
# In other words, adabooch demos requires a separate port to do correctly
OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/html/* ${STAGEDIR}${DOCSDIR}/
	${RM} ${STAGEDIR}${DOCSDIR}/Makefile

.include <bsd.port.mk>
