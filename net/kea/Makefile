# $FreeBSD$

PORTNAME=	kea
PORTVERSION=	0.9.2
CATEGORIES=	net ipv6
MASTER_SITES=	ISC
MASTER_SITE_SUBDIR=	kea/${PORTVERSION}

MAINTAINER=	hrs@FreeBSD.org
COMMENT=	Alternative DHCP implementation by ISC

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	liblog4cplus.so:${PORTSDIR}/devel/log4cplus \
		libboost_system.so:${PORTSDIR}/devel/boost-libs

USES=		libtool python:3.1+ autoreconf
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
USE_RC_SUBR=	${PORTNAME}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-silent-rules \
		--with-openssl=${OPENSSLBASE} \
		--with-log4cplus=${LOCALBASE} \
		--with-boost-include=${LOCALBASE}/include \
		--without-werror
INSTALL_TARGET=	install-strip
PORTDOCS=	AUTHORS COPYING ChangeLog README \
		kea-guide.css kea-guide.html kea-guide.txt \
		kea-messages.html \
		examples

OPTIONS_DEFINE=	DOCS MYSQL PGSQL
OPTIONS_DEFAULT=DOCS
DOCS_MAKE_ARGS_OFF= \
		INSTALL_STRIP_PROGRAM="${WRKSRC}/install-sh -c -s" \
		INSTALL_STRIP_FLAG="-s" \
		INSTALL_PROGRAM_ENV="STRIPPROG=${STRIP}"
DOCS_INSTALL_TARGET_OFF= \
		install-exec-am \
		install-pkgconfigDATA \
		install-pkgincludeHEADERS
MYSQL_USE=	MYSQL=client
MYSQL_CONFIGURE_ON=	--with-dhcp-mysql=${LOCALBASE}/bin/mysql_config
MYSQL_CONFIGURE_OFF=	--without-dhcp-mysql
PGSQL_USES=	pgsql
WANT_PGSQL=	client
PGSQL_CONFIGURE_ON=	--with-dhcp-pgsql=${LOCALBASE}/bin/pg_config
PGSQL_CONFIGURE_OFF=	--without-dhcp-pgsql

.include <bsd.port.mk>
