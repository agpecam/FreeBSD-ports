# Created by: Nicolas de Bari Embriz <nbari@dalmp.com>
# $FreeBSD$

PORTNAME=	dalmp
PORTVERSION=	3.0.3
DISTVERSIONPREFIX=	v
CATEGORIES=	databases

MAINTAINER=	nbari@dalmp.com
COMMENT=	Database Abstraction Layer for MySQL using PHP

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USE_GITHUB=	yes
GH_ACCOUNT=	nbari
GH_PROJECT=	${PORTNAME:tu}

USES=		tar:bzip2

NO_BUILD=	yes
USE_PHP=	pcre mysql mysqli session memcache sqlite3 curl

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})

.include <bsd.port.mk>
