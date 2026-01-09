Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC0D167FB
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jan 2026 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JNtgbtO90ce7h6UGasBOPhsJeZdjpUNy6O5bJkNIzHc=; b=qExWWNM/jXeC5W
	/fMsqkCtIpnj4VabB7BQ51dqNHDv4KYGLsl97rmpNWwr1H0m3G7qoZNENNYj9zUZnzjiEwlJipk+j
	Sa5UP665gMM+OiFbT+vRk15WMhzn90GvG87aFI5feOICq9gBYxYDDfUGvlrC4FpoaHf2Y+k4QDIHB
	MetlU+eL0m9li3741jdnJl4VsuUrNHy5GPAVfpq3sNdFUkmog70nmOVs72p689RFJM+VUfk1Ar7t/
	z1kNneJCtB1zyB7gPAGH2xm7thFT9KXd2OhkGUKGhBObzHJ4/XBO6PyaSjuBVq0wIj617CD2eLaO7
	9CDIzQSLhy8fmpItCfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ky-000000025Ew-0spy;
	Fri, 09 Jan 2026 10:03:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ku-000000025Dl-089q;
	Fri, 09 Jan 2026 10:03:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E54554E4201A;
	Fri,  9 Jan 2026 10:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 941D860734;
	Fri,  9 Jan 2026 10:03:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34B8F103C88BF;
	Fri,  9 Jan 2026 11:02:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767952990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8alxgy33jWjnXMagw/l/0CRaIbDfLVcYqloF5nxf24g=;
	b=Y+viVM2eBcACHs1bFBv3S7gQrQfaczfHaNQ3EhNbsOYqV4YgrWL4CYTM+sACmVJekaTv96
	tROuxIVWWeR7BIAmuUBhMVpRmtXG4dhprIddP+E/sXgL5YRhFzBglDCOOuelsEM04L3geh
	vFeWDyCpX1rwMTN/uPPfHy26MVpSS9aEM98/7IOJsFdUfyVmFhf7tyHUN86+3FMSyOqiBT
	TjHoSObyU0jGMwPtSdy5prytFkn6CmNCvtvTtdVkK0blN7rbo+GVZuhhvFHLzRR+xtoZQc
	idY4z178sGyslRew5Iqcg9xDv9P+g0jFFo3uENvfarCn2sVTSyIgdwUuY5pH3g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/6] drm/bridge: convert users of of_drm_find_bridge(),
 part 3
Date: Fri, 09 Jan 2026 11:02:49 +0100
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEnSYGkC/52NQQ6DIBQFr2JYlwaoLdpV79EYg/DRnygYoKaN8
 e5F0xN0OfOSNyuJEBAiuRcrCbBgRO8yiFNB9KBcDxRNZiKYuDHOJDVhol1Akxc1jl7THtL8Srt
 vvW0tOtP+9gstbV1LUFLL2pJ8OQew+D5yzybzgDH58DnqC9/tn6GFU0bBlpW6clmJCh6d92lEd
 9Z+Is22bV+aMdqI6gAAAA==
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_020316_206603_A3D0AD72 
X-CRM114-Status: GOOD (  12.03  )
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
ZXNvbGlAYm9vdGxpbi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIFBhdGNoIDM6IGZpeCBtaXNz
aW5nIGRybV9icmlkZ2VfcHV0KCkKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjYwMTA3LWRybS1icmlkZ2UtYWxsb2MtZ2V0cHV0LWRybV9vZl9maW5kX2JyaWRnZS0z
LXYxLTAtZWY0OGE1MTc4MjhlQGJvb3RsaW4uY29tCgotLS0KTHVjYSBDZXJlc29saSAoNik6CiAg
ICAgIGRybS9icmlkZ2U6IGR3LWhkbWk6IGNvbnZlcnQgdG8gb2ZfZHJtX2ZpbmRfYW5kX2dldF9i
cmlkZ2UoKQogICAgICBkcm0vbWVzb24vZHctaGRtaTogY29udmVydCB0byBvZl9kcm1fZmluZF9h
bmRfZ2V0X2JyaWRnZSgpCiAgICAgIGRybS9pbXgvZHctaGRtaTogY29udmVydCB0byBvZl9kcm1f
ZmluZF9hbmRfZ2V0X2JyaWRnZSgpCiAgICAgIGRybS9tZWRpYXRlazogbXRrX2hkbWkqOiBjb252
ZXJ0IHRvIG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdlKCkKICAgICAgZHJtL2V4eW5vczogaGRt
aTogY29udmVydCB0byBvZl9kcm1fZmluZF9hbmRfZ2V0X2JyaWRnZSgpCiAgICAgIGRybTogcmNh
ci1kdTogbHZkczogY29udmVydCB0byBvZl9kcm1fZmluZF9hbmRfZ2V0X2JyaWRnZSgpCgogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICB8ICA3ICsrKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYyAgICAgICAgfCAgNCArKystCiBkcml2
ZXJzL2dwdS9kcm0vaW14L2lwdXYzL2R3X2hkbWktaW14LmMgICAgIHwgIDcgKysrKystLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICB8ICA0ICsrLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyAgfCAgNCArKy0tCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmggIHwgIDEgLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX3YyLmMgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgICAgfCAgNiArKysrKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9yZW5lc2FzL3JjYXItZHUvcmNhcl9sdmRzLmMgfCAxMCArKysrKysrKystCiA5IGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6
IDEzNDUwYTFmNzJmZDI0YzQwNTYyNmM4ODFhZTdjOWNlNWYwZDJhMjgKY2hhbmdlLWlkOiAyMDI2
MDEwNy1kcm0tYnJpZGdlLWFsbG9jLWdldHB1dC1kcm1fb2ZfZmluZF9icmlkZ2UtMy00Zjk5N2Vh
N2M3OWYKCkJlc3QgcmVnYXJkcywKLS0gCkx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9v
dGxpbi5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
