# Created by: Steve Wills <swills@FreeBSD.org>
# $FreeBSD$

PORTNAME=	unicorn
PORTVERSION=	5.0.1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Unicorn is an HTTP server for Rack applications

LICENSE=	GPLv2 GPLv3 RUBY
LICENSE_COMB=	dual

RUN_DEPENDS=	rubygem-kgio>=2.6:${PORTSDIR}/devel/rubygem-kgio \
		rubygem-rack16>=0:${PORTSDIR}/www/rubygem-rack16 \
		rubygem-raindrops>=0.7:${PORTSDIR}/www/rubygem-raindrops

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes
USES=		shebangfix

PLIST_FILES=	bin/unicorn bin/unicorn_rails

SHEBANG_FILES=	bin/unicorn* test/aggregate.rb
ruby_OLD_CMD=	.*ruby

.include <bsd.port.mk>
