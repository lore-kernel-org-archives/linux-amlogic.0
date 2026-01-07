Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0223CFD65E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jan 2026 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zb+9WJtILc5LWdM+lkfiScmOEyo1XY3VtYx+RzEO1YA=; b=J/mPRScG/rldWC
	/GDTakMW1JIrkx0sW1bty0GDTbyK+wWBFKGVEm1MEfCKEJHyxLq/FiO7blIw0QZg/Hy81SMHoDPjZ
	Mfi7vWYirJLqoMoEM6SaR42dArYjlf/PmOcG9za8BIXm+bEBtZTRham59ktbxd+rOx/3x7GNYcP+4
	qmPSXeVEhMy+eCvA7wyeuaKI1PzNEmq4mG3iQ8EwnLG+ipUZYeSZMMEb8/HmkDtjKPVgz4i8HLxvV
	GYHGbpJlV7/hpt8R5BoovsTcl2VhvViB8iqke4MfHXSf6CKbReeOucy7wyTqHPoXunxcMTT4ul/T+
	rruTxBWFsdvoOxE88cQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWIq-0000000FG8M-2L3O;
	Wed, 07 Jan 2026 16:22:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWIh-0000000FG4o-17mi
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jan 2026 16:22:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD1381A26DF;
	Wed,  7 Jan 2026 16:22:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96426606F8;
	Wed,  7 Jan 2026 16:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81AB8103C87CB;
	Wed,  7 Jan 2026 17:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767802937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JdLe8UY54Ycj4piloj+rsekA1/AGyqvm+QpBgA+1OYI=;
	b=ZJ/XqDa0OSr4NYaLF8zcX+MPxD7NKgB+Hnw1y/rmL1ezS6TIK3DjMcoiPkOfBvWHC/bUOj
	gT7MIWvzWZ9cM3gWVjHaA2EsfQ76m7OiPjoGL3hbQVVn3NsxrMTripI10GGBdeogG9daJw
	pjLmjhL17iBrYq1psBENAaWnS46q7xyXsOR5hhAMD1mJPtXaT6gctPkjCKmQGYW/uUEIcs
	NiJSg1LN9O1HqzipnBoPU+bH5wfTXsoNYms2T01h4vpLHHY+ZIdJfqR9+qQaWYQy1cNghr
	zGzKHLAYHJCK7ubwgRrghHeOBIzLRAyrTK63Zl/Wm68beHX1TYgd1NG8KQHxrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/6] drm/bridge: convert users of of_drm_find_bridge(),
 part 3
Date: Wed, 07 Jan 2026 17:21:58 +0100
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACeIXmkC/y2NUQrCMBAFr1L224W0iiFeRSTEZLcu1KRsWhFK7
 24UP+cNzNugkgpVuHQbKL2kSskN+kMH8RHySCipMQxmOJveWEz6xLtKaiZMU4k40jKvy3f3hT1
 LTv7vj3hi5ywFG61jaMlZieX9u7ve9v0D/wtEBn4AAAA=
X-Change-ID: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-4f997ea7c79f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082225_052761_7D165778 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgY29udmVydHMgbWFueSBEUk0gZHJpdmVycyBmcm9tIHRoZSBub3cgZGVwcmVj
YXRlZApvZl9kcm1fZmluZF9icmlkZ2UoKSB0byBpdHMgcmVwbGFjZW1lbnQgb2ZfZHJtX2ZpbmRf
YW5kX2dldF9icmlkZ2UoKSB3aGljaAphbGxvd3MgY29ycmVjdCBicmlkZ2UgcmVmY291bnRpbmcu
IFdoZXJlIGFwcGxpY2FibGUgaXQgYWxzbyBjb252ZXJ0cwpwZXItZHJpdmVyICJuZXh0X2JyaWRn
ZSIgcG9pbnRlcnMgdG8gdGhlIHVuaWZpZWQgZHJtX2JyaWRnZTo6bmV4dF9icmlkZ2UKd2hpY2gg
cHV0cyB0aGUgcmVmZXJlbmNlIGF1dG9tYXRpY2FsbHkgb24gYnJpZGdlIGRlYWxsb2NhdGlvbi4K
ClRoaXMgaXMgcGFydCBvZiB0aGUgd29yayB0byBzdXBwb3J0IGhvdHBsdWcgb2YgRFJNIGJyaWRn
ZXMuIFRoZSBncmFuZCBwbGFuCndhcyBkaXNjdXNzZWQgaW4gWzBdLgoKSGVyZSdzIHRoZSB3b3Jr
IGJyZWFrZG93biAo4p6cIG1hcmtzIHRoZSBjdXJyZW50IHNlcmllcyk6CgogMS4g4p6cIGFkZCBy
ZWZjb3VudGluZyB0byBEUk0gYnJpZGdlcyBzdHJ1Y3QgZHJtX2JyaWRnZSwKICAgICAgYmFzZWQg
b24gZGV2bV9kcm1fYnJpZGdlX2FsbG9jKCkKICAgIEEuIOKclCBhZGQgbmV3IGFsbG9jIEFQSSBh
bmQgcmVmY291bnRpbmcgKHY2LjE2KQogICAgQi4g4pyUIGNvbnZlcnQgYWxsIGJyaWRnZSBkcml2
ZXJzIHRvIG5ldyBBUEkgKHY2LjE3KQogICAgQy4g4pyUIGt1bml0IHRlc3RzICh2Ni4xNykKICAg
IEQuIOKclCBhZGQgZ2V0L3B1dCB0byBkcm1fYnJpZGdlX2FkZC9yZW1vdmUoKSArIGF0dGFjaC9k
ZXRhY2goKQogICAgICAgICBhbmQgd2FybiBvbiBvbGQgYWxsb2NhdGlvbiBwYXR0ZXJuICh2Ni4x
NykKICAgIEUuIOKenCBhZGQgZ2V0L3B1dCBvbiBkcm1fYnJpZGdlIGFjY2Vzc29ycwogICAgICAg
MS4g4pyUIGRybV9icmlkZ2VfY2hhaW5fZ2V0X2ZpcnN0X2JyaWRnZSgpLCBhZGQgY2xlYW51cCBh
Y3Rpb24gKHY2LjE4KQogICAgICAgMi4g4pyUIGRybV9icmlkZ2VfZ2V0X3ByZXZfYnJpZGdlKCkg
KHY2LjE4KQogICAgICAgMy4g4pyUIGRybV9icmlkZ2VfZ2V0X25leHRfYnJpZGdlKCkgKHY2LjE5
KQogICAgICAgNC4g4pyUIGRybV9mb3JfZWFjaF9icmlkZ2VfaW5fY2hhaW4oKSAodjYuMTkpCiAg
ICAgICA1LiDinJQgZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCAodjYuMTkpCiAgICAgICA2LiDi
gKYgcHJvdGVjdCBlbmNvZGVyIGJyaWRnZSBjaGFpbiB3aXRoIGEgbXV0ZXgKICAgICAgIDcuIOKe
nCBvZl9kcm1fZmluZF9icmlkZ2UKICAgICAgICAgIGEuIOKclOKApiBhZGQgb2ZfZHJtX2dldF9i
cmlkZ2UoKSwgY29udmVydCBiYXNpYyBkaXJlY3QgdXNlcnMKCSAgICAgICAgKHY2LjIwPywgb25l
IGRyaXZlciBzdGlsbCBwZW5kaW5nKQoJICBiLiDigKYgY29udmVydCBkaXJlY3Qgb2ZfZHJtX2dl
dF9icmlkZ2UoKSB1c2VycywgcGFydCAyCgkgIGMuIOKenCBjb252ZXJ0IGRpcmVjdCBvZl9kcm1f
Z2V0X2JyaWRnZSgpIHVzZXJzLCBwYXJ0IDMKCSAgZC4gICBjb252ZXJ0IGRpcmVjdCBvZl9kcm1f
Z2V0X2JyaWRnZSgpIHVzZXJzLCBwYXJ0IDQKCSAgZS4gICBjb252ZXJ0IGJyaWRnZS1vbmx5IGRy
bV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSgpIHVzZXJzCiAgICAgICA4LiBkcm1fb2ZfZmluZF9w
YW5lbF9vcl9icmlkZ2UsICpfb2ZfZ2V0X2JyaWRnZQogICAgICAgOS4g4pyUIGVuZm9yY2UgZHJt
X2JyaWRnZV9hZGQgYmVmb3JlIGRybV9icmlkZ2VfYXR0YWNoICh2Ni4xOSkKICAgIEYuIOKclCBk
ZWJ1Z2ZzIGltcHJvdmVtZW50cwogICAgICAgMS4g4pyUIGFkZCB0b3AtbGV2ZWwgJ2JyaWRnZXMn
IGZpbGUgKHY2LjE2KQogICAgICAgMi4g4pyUIHNob3cgcmVmY291bnQgYW5kIGxpc3QgbGluZ2Vy
aW5nIGJyaWRnZXMgKHY2LjE5KQogMi4g4oCmIGhhbmRsZSBncmFjZWZ1bGx5IGF0b21pYyB1cGRh
dGVzIGR1cmluZyBicmlkZ2UgcmVtb3ZhbAogICAgQS4g4pyUIEFkZCBkcm1fZGV2X2VudGVyL2V4
aXQoKSB0byBwcm90ZWN0IGRldmljZSByZXNvdXJjZXMgKHY2LjIwPykKICAgIEIuIOKApiBwcm90
ZWN0IHByaXZhdGVfb2JqIHJlbW92YWwgZnJvbSBsaXN0CiAzLiDigKYgRFNJIGhvc3QtZGV2aWNl
IGRyaXZlciBpbnRlcmFjdGlvbgogNC4g4pyUIHJlbW92aW5nIHRoZSBuZWVkIGZvciB0aGUgImFs
d2F5cy1kaXNjb25uZWN0ZWQiIGNvbm5lY3RvcgogNS4gZmluaXNoIHRoZSBob3RwbHVnIGJyaWRn
ZSB3b3JrLCBtb3ZpbmcgY29kZSB0byB0aGUgY29yZSBhbmQgcG90ZW50aWFsbHkKICAgIHJlbW92
aW5nIHRoZSBob3RwbHVnLWJyaWRnZSBpdHNlbGYgKHRoaXMgbmVlZHMgdG8gYmUgY2xhcmlmaWVk
IGFzCiAgICBwb2ludHMgMS0zIGFyZSBkZXZlbG9wZWQpCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDI1MDIwNi1ob3RwbHVnLWRybS1icmlkZ2UtdjYtMC05ZDZmMmM5YzMwNThA
Ym9vdGxpbi5jb20vI3QKClRoaXMgd29yayBpcyBhIGNvbnRpbnVhdGlvbiBvZiB0aGUgd29yayB0
byBjb3JyZWN0bHkgaGFuZGxlIGJyaWRnZQpyZWZjb3VudGluZyBmb3IgZXhpc3Rpbmcgb2ZfZHJt
X2ZpbmRfYnJpZGdlKCkuIFRoZSBncm91bmQgd29yayBpcyBpbjoKCiAtIGNvbW1pdCAyOTNhOGZk
NzcyMWEgKCJkcm0vYnJpZGdlOiBhZGQgb2ZfZHJtX2ZpbmRfYW5kX2dldF9icmlkZ2UoKSIpCiAt
IGNvbW1pdCA5ZGEwZTA2YWJkYTggKCJkcm0vYnJpZGdlOiBkZXByZWNhdGUgb2ZfZHJtX2ZpbmRf
YnJpZGdlKCkiKQogLSBjb21taXQgM2ZkZWFlMTM0YmE5ICgiZHJtL2JyaWRnZTogYWRkIG5leHRf
YnJpZGdlIHBvaW50ZXIgdG8gc3RydWN0IGRybV9icmlkZ2UiKQoKVGhlIHdob2xlIGNvbnZlcnNp
b24gaXMgc3BsaXQgaW4gbXVsdGlwbGUgc2VyaWVzIHRvIG1ha2UgdGhlIHJldmlldyBwcm9jZXNz
CmEgYml0IHNtb290aGVyOgoKIC0gUGFydCAyOiBtb3N0bHkgZHJpdmVycyBpbiBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlIFsyXQogLSBQYXJ0IDM6IG90aGVyIGRyaXZlcnMsIGxvdy1tZWRpdW0gY29t
cGxleGl0eSBbdGhpcyBzZXJpZXNdCiAtIFBhcnQgNDogb3RoZXIgZHJpdmVycywgY29tcGxleCAo
bm90IHNlbnQgeWV0KQoKWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDEwNy1k
cm0tYnJpZGdlLWFsbG9jLWdldHB1dC1kcm1fb2ZfZmluZF9icmlkZ2UtMi12MS0wLTI4M2Q3YmJh
MDYxYUBib290bGluLmNvbS8KClNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+Ci0tLQpMdWNhIENlcmVzb2xpICg2KToKICAgICAgZHJtL2JyaWRn
ZTogZHctaGRtaTogY29udmVydCB0byBvZl9kcm1fZmluZF9hbmRfZ2V0X2JyaWRnZSgpCiAgICAg
IGRybS9tZXNvbi9kdy1oZG1pOiBjb252ZXJ0IHRvIG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdl
KCkKICAgICAgZHJtL2lteC9kdy1oZG1pOiBjb252ZXJ0IHRvIG9mX2RybV9maW5kX2FuZF9nZXRf
YnJpZGdlKCkKICAgICAgZHJtL21lZGlhdGVrOiBtdGtfaGRtaSo6IGNvbnZlcnQgdG8gb2ZfZHJt
X2ZpbmRfYW5kX2dldF9icmlkZ2UoKQogICAgICBkcm0vZXh5bm9zOiBoZG1pOiBjb252ZXJ0IHRv
IG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdlKCkKICAgICAgZHJtOiByY2FyLWR1OiBsdmRzOiBj
b252ZXJ0IHRvIG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdlKCkKCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyAgIHwgIDcgKysrLS0tLQogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfaGRtaS5jICAgICAgICB8ICA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9p
bXgvaXB1djMvZHdfaGRtaS1pbXguYyAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWlfY29tbW9uLmMgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pX2NvbW1vbi5oICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV92Mi5jICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdf
aGRtaS5jICAgICAgIHwgIDYgKysrKystCiBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1
L3JjYXJfbHZkcy5jIHwgMTAgKysrKysrKysrLQogOSBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBmYWViNGZmNmQ2ZTQxYzQy
NzQxZmQxZGY4ZTFkMGI4MGY5NDUyNDAzCmNoYW5nZS1pZDogMjAyNjAxMDctZHJtLWJyaWRnZS1h
bGxvYy1nZXRwdXQtZHJtX29mX2ZpbmRfYnJpZGdlLTMtNGY5OTdlYTdjNzlmCgpCZXN0IHJlZ2Fy
ZHMsCi0tIApMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
