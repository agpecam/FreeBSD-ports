# Created by: Jeremy Johnston <jeremy@smart-serv.net>
# $FreeBSD$

PORTNAME=	tuptime
PORTREVISION=	1
DISTVERSIONPREFIX=	v
DISTVERSION=	3.2.01
CATEGORIES=	sysutils

MAINTAINER=	jeremy@smart-serv.net
COMMENT=	Historical and statistical system running time report tool

LICENSE=	GPLv2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>=2.7:${PORTSDIR}/databases/py-sqlite3

USES=		python:run shebangfix

USE_GITHUB=	yes
GH_ACCOUNT=	rfrail3

NO_BUILD=	yes
USE_RC_SUBR=	${PORTNAME}

SHEBANG_FILES=	${WRKSRC}/latest/tuptime ${WRKSRC}/scripts/*
SUB_FILES=	pkg-message

PLIST_FILES=	bin/tuptime \
		${EXAMPLESDIR}/db-tuptime-migrate.sh \
		${EXAMPLESDIR}/db-tuptime-migrate-3.0-to-3.1.sh

do-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/latest/tuptime ${STAGEDIR}${PREFIX}/bin/tuptime
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/db-tuptime-migrate.sh ${STAGEDIR}${EXAMPLESDIR}/db-tuptime-migrate.sh
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/db-tuptime-migrate-3.0-to-3.1.sh ${STAGEDIR}${EXAMPLESDIR}/db-tuptime-migrate-3.0-to-3.1.sh

.include <bsd.port.mk>
