# Created by: Matthias Petermann <matthias@petermann-it.de>
# $FreeBSD$

PORTNAME=	trytond28_company_work_time
PORTVERSION=	2.8.0
PORTREVISION=	1
CATEGORIES=	finance python
MASTER_SITES=	https://pypi.python.org/packages/source/t/trytond_company_work_time/ \
		http://downloads.tryton.org/${PORTVERSION:R}/
DISTNAME=	trytond_company_work_time-${PORTVERSION}

MAINTAINER=	matthias@petermann-it.de
COMMENT=	Tryton Application Platform (Company Work Time Module)

LICENSE=	GPLv3

RUN_DEPENDS=	trytond28_company>=2.8.0:${PORTSDIR}/finance/trytond28_company

CONFLICTS=	trytond_company_work_time-2.[46].*

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
