# $FreeBSD$

PORTNAME=	pond
PORTVERSION=	20150830
CATEGORIES=	security
MASTER_SITES=	http://c-s.li/ports/
DISTFILES=	pond-20150830.tar.gz \
		go-gtk-20151214.tar.gz \
		ed25519-20150830.tar.gz

MAINTAINER=	cs@FreeBSD.org
COMMENT=	Forward secure, asynchronous messenger

LICENSE=	BSD3CLAUSE

BUILD_DEPENDS=	${LOCALBASE}/${GO_LIBDIR}/code.google.com/p/go.crypto/bcrypt.a:${PORTSDIR}/security/go.crypto \
		${LOCALBASE}/${GO_LIBDIR}/github.com/golang/protobuf/proto.a:${PORTSDIR}/devel/goprotobuf \
		${LOCALBASE}/${GO_LIBDIR}/code.google.com/p/go.net/dict.a:${PORTSDIR}/net/go.net
RUN_DEPENDS=	tor:${PORTSDIR}/security/tor
LIB_DEPENDS=	libgtkspell.so:${PORTSDIR}/textproc/gtkspell \
		libtspi.so:${PORTSDIR}/security/trousers

PLIST_FILES=	bin/pond-server bin/pond
USE_GNOME=	gtk30
GO_PKGNAME=	github.com/agl/pond
GO_TARGET=	${GO_PKGNAME}/pond-server \
		${GO_PKGNAME}/pond

post-extract:
	@${MKDIR} ${GO_WRKSRC:H}
	@${LN} -sf ${WRKSRC} ${GO_WRKSRC}
	@${LN} -sf ${WRKSRC}/client ${WRKSRC}/pond
	@${LN} -sf ${WRKSRC}/server ${WRKSRC}/pond-server
	@${LN} -sf ${WRKDIR}/go-gtk-20151214 ${GO_WRKDIR_SRC}/github.com/agl/go-gtk
	@${LN} -sf ${WRKDIR}/ed25519-20150830 ${GO_WRKDIR_SRC}/github.com/agl/ed25519

post-patch:
	@${REINPLACE_CMD} -e 's|\<gdk|\<gtk-3.0\/gdk|g' \
		${WRKDIR}/go-gtk-20151214/gdk/gdk.go \
		${WRKDIR}/go-gtk-20151214/gdk/gdk_linux.go \
		${WRKDIR}/go-gtk-20151214/gdk/gdk_windows.go \
		${WRKDIR}/go-gtk-20151214/gtk/gtk.go
	@${REINPLACE_CMD} -e 's|\<pango|\<pango-1.0\/pango|g' \
		${WRKDIR}/go-gtk-20151214/pango/pango.go
	@${REINPLACE_CMD} -e 's|\<gtk|\<gtk-3.0\/gtk|g' \
		${WRKDIR}/go-gtk-20151214/gtk/gtk.go \
		${WRKDIR}/go-gtk-20151214/gtkspell/gtkspell_fedora.go \
		${WRKDIR}/go-gtk-20151214/gtkspell/gtkspell_ubuntu.go
	@${REINPLACE_CMD} -e 's|\<glib|\<glib-2.0\/glib|g' \
		${WRKDIR}/go-gtk-20151214/glib/glib.go
	@${REINPLACE_CMD} -e 's|\<gdk-pixbuf|\<gdk-pixbuf-2.0\/gdk-pixbuf|g' \
		${WRKDIR}/go-gtk-20151214/gdkpixbuf/gdkpixbuf.go
	@${REINPLACE_CMD} -e 's|\<gtkspell|\<gtkspell-2.0\/gtkspell|g' \
		${WRKDIR}/go-gtk-20151214/gtkspell/gtkspell_fedora.go \
		${WRKDIR}/go-gtk-20151214/gtkspell/gtkspell_ubuntu.go
	@${REINPLACE_CMD} -e 's|golang.org\/x\/crypto|code.google.com\/p\/go.crypto|g' \
		${WRKDIR}/pond-20150830/bbssig/bbssig.go \
		${WRKDIR}/pond-20150830/transport/transport.go \
		${WRKDIR}/pond-20150830/pond-server/main.go \
		${WRKDIR}/pond-20150830/protos/const.go \
		${WRKDIR}/pond-20150830/client/ratchet/ratchet.go \
		${WRKDIR}/pond-20150830/panda/panda.go \
		${WRKDIR}/pond-20150830/pond/client.go \
		${WRKDIR}/pond-20150830/pond/disk.go \
		${WRKDIR}/pond-20150830/pond/network.go \
		${WRKDIR}/pond-20150830/client/disk/disk.go \
		${WRKDIR}/pond-20150830/pond/background.go \
		${WRKDIR}/pond-20150830/pond/cli-input.go \
		${WRKDIR}/pond-20150830/pond/cli.go
	@${REINPLACE_CMD} -e 's|golang.org/x/net|code.google.com\/p\/go.net|g' \
		${WRKDIR}/pond-20150830/panda/appengine.go \
		${WRKDIR}/pond-20150830/pond/network.go

do-build:
	@(cd ${GO_WRKSRC}; ${SETENV} ${GO_ENV} ${GO_CMD} install -tags nogui -v ${GO_TARGET})

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/lang/go/files/bsd.go.mk"
.include <bsd.port.post.mk>
