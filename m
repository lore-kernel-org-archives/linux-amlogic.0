Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B504E94137
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6bLZQlYDqCfXgWhI/9kO23FFBVPWk/Hz/5swqKnht4=; b=rJGsZGYyF7xrnm
	hxipeb21iK+DlHj96PxD3bnlajBxgFN0NkgzkKJpouAg52AgUHBCzPP50HyBTuVM48nm/RuB+BiPE
	WyY/WXyBYywy+sjZhncl/0cI0zd/SWmpMrKx+BOdEjq6+qRVTjdTjiNanN082TuMfZF77uiIVeRY2
	4/BPjctwLfGasy8dn8NOXbyxUE7L/F/YGQxYY9jZKVAa7GgqWs0ro7dRrzICmY9Tg7uzEG4pOHQj1
	OHQeMEDF9sGF2Y5KQPk1jLY75mT+cbBFd9wT6rCnrI7PayN0a1rARvZzcqG1P+AagK6ODTi9apoGv
	OB6M4bUGQPgAhZu+YhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVrA-00000004f3w-1FpD;
	Tue, 30 Dec 2025 09:17:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVr7-00000004f3W-00EA;
	Tue, 30 Dec 2025 09:17:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37B664E40C59;
	Tue, 30 Dec 2025 09:17:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E54CE6072C;
	Tue, 30 Dec 2025 09:17:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E979D113B05C1;
	Tue, 30 Dec 2025 10:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767086241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rZGTwUQXXsaH9P/sj36gCU1NPe3EIdV70fYUKRoUz14=;
	b=CrPy81H0ZL6UTXpsNBD6TmghQkFld1EUqrMmDF/sauZPPbByFEHCvAfe9XNGnQNeDKRfIc
	AxZslYDC3B68czrpggoz9i3fH7+4HCM1zh/TlP2eHZPlds25F8mr+9yAt90ws1Hc7hKHG7
	4Pfw/d9dX6lnm51ysE4yyTkKBXjs2fuFiVpkLnYyZTTZ2GGPD6ZBdJ97epu9jA/+hhlOPu
	UYCSytTI99tgN4NL9+kP1yL4KVpDrA1TR0lypBQN8ajzCb2Np8JTV6VvOhctGM90PvTYmK
	zF3QLxNsYiGFylS/TvdJvFhe8w+FpMshXSIkJ8lPEYBMyjiySddhKV+2cmLHig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
Subject: Re: [PATCH v3 00/22] drm/bridge: add of_drm_find_and_get_bridge()
 and a managed *next_bridge, deprecate of_drm_find_bridge()
Message-Id: <176708623356.127863.8623917477288453126.b4-ty@bootlin.com>
Date: Tue, 30 Dec 2025 10:17:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011729_326410_A74ED6BA 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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

Ck9uIFR1ZSwgMTYgRGVjIDIwMjUgMTg6NTg6MzMgKzAxMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6
Cj4gVGhpcyBzZXJpZXMgZGVwcmVjYXRlcyBvZl9kcm1fZmluZF9icmlkZ2UoKSwgYWRkcyBhIHJl
cGxhY2VtZW50IHdoaWNoCj4gaGFuZGxlcyBicmlkZ2UgcmVmY291bnRpbmcsIGFuZCBjb252ZXJ0
cyBzb21lIG9mIHRoZSBkaXJlY3QgdXNlcnMuCj4gCj4gVGhpcyBpcyBwYXJ0IG9mIHRoZSB3b3Jr
IHRvIHN1cHBvcnQgaG90cGx1ZyBvZiBEUk0gYnJpZGdlcy4gVGhlIGdyYW5kIHBsYW4KPiB3YXMg
ZGlzY3Vzc2VkIGluIFswXS4KPiAKPiBIZXJlJ3MgdGhlIHdvcmsgYnJlYWtkb3duICjinpwgbWFy
a3MgdGhlIGN1cnJlbnQgc2VyaWVzKToKPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzAx
LzIyXSBkcm0vYnJpZGdlOiBhZGQgb2ZfZHJtX2ZpbmRfYW5kX2dldF9icmlkZ2UoKQogICAgICAg
IGNvbW1pdDogMjkzYThmZDc3MjFhOTA5ODdkOWJmMTQ5ZmVhYjYwZTc1NmRhYzI2OQpbMDIvMjJd
IGRybS9icmlkZ2U6IGRlcHJlY2F0ZSBvZl9kcm1fZmluZF9icmlkZ2UoKQogICAgICAgIGNvbW1p
dDogOWRhMGUwNmFiZGE4N2IxZjk3MDE0MTEzZDUyMzFmZGViNDcwMDc0OQpbMDMvMjJdIGRybS90
b2RvOiBhZGQgZW50cnkgYWJvdXQgY29udmVydGluZyB0byBvZl9kcm1fZmluZF9hbmRfZ2V0X2Jy
aWRnZSgpCiAgICAgICAgY29tbWl0OiBjNjM3MjE3ZWZiODkyYWM1ZDBkNWY5YWVhM2RmOTIxNDdj
MmUyNGRiClswNC8yMl0gZHJtL2JyaWRnZTogbWFrZSBvZl9kcm1fZmluZF9icmlkZ2UoKSBhIHdy
YXBwZXIgb2Ygb2ZfZHJtX2ZpbmRfYW5kX2dldF9icmlkZ2UoKQogICAgICAgIGNvbW1pdDogNWQ3
Y2IzNjI1NGI1ZmFjZDJhMzQ5MzMxYzFhNDcxMDJkNGU2NmU0MApbMDUvMjJdIGRybS9hcmNwZ3U6
IGNvbnZlcnQgdG8gb2ZfZHJtX2ZpbmRfYW5kX2dldF9icmlkZ2UoKQogICAgICAgIGNvbW1pdDog
NzI4MjA2NmU1NTM0N2IyNmNiMzE3ODQwNTlhYjYyYzJkZThhM2UwMQpbMDYvMjJdIGRybS9icmlk
Z2U6IGFkZCBuZXh0X2JyaWRnZSBwb2ludGVyIHRvIHN0cnVjdCBkcm1fYnJpZGdlCiAgICAgICAg
Y29tbWl0OiAzZmRlYWUxMzRiYTk1NmFhY2JkODdkNTUzMmMwMjU5MTNjOThmYzQ5ClswNy8yMl0g
ZHJtL2JyaWRnZTogaXRlLWl0NjYxMjE6IGdldC9wdXQgdGhlIG5leHQgYnJpZGdlCiAgICAgICAg
Y29tbWl0OiA4ZjkyYTVmY2JmZTMzZjg2YjA4ZjVmNzRkY2M1OGE0MTQyNWVhOGMwClswOC8yMl0g
ZHJtL2JyaWRnZTogaW14OHF4cC1waXhlbC1jb21iaW5lcjogZ2V0L3B1dCB0aGUgbmV4dCBicmlk
Z2UKICAgICAgICBjb21taXQ6IGFlNzU0ZjA0OWNlMWMwMWYwOWQxNzVmODAyNjU5NzBmMGQ1YjQ0
ODkKWzA5LzIyXSBkcm0vYnJpZGdlOiBzaW1wbGUtYnJpZGdlOiBnZXQvcHV0IHRoZSBuZXh0IGJy
aWRnZQogICAgICAgIGNvbW1pdDogYjlhN2Q1OTE4YmQ0MzZkNjQ2OTliODBhZjA2MWYyMWMxNjhk
ZjY5OQpbMTAvMjJdIGRybS9tZXNvbjogZW5jb2Rlcl9jdmJzOiBnZXQvcHV0IHRoZSBuZXh0IGJy
aWRnZQogICAgICAgIGNvbW1pdDogNDdmYTQ4YjNmYWE3Y2FlOTI1YzliMTRiMTgzNzZjZGM0NjIy
YmFlMApbMTEvMjJdIGRybS9tZXNvbjogZW5jb2Rlcl9kc2k6IGdldC9wdXQgdGhlIG5leHQgYnJp
ZGdlCiAgICAgICAgY29tbWl0OiBiZmI4ZjVkMGE5ZTc1NmM1N2Q0ZmMwZjc5NjZlNDg3M2JiZmIz
NGE1ClsxMi8yMl0gZHJtL21lc29uOiBlbmNvZGVyX2hkbWk6IGdldC9wdXQgdGhlIG5leHQgYnJp
ZGdlCiAgICAgICAgY29tbWl0OiBjODdhZDc4NGFhY2I4OWNmODhjMDBjZGU3ODk3MDU0MzAxMGE2
ZDY3ClsxMy8yMl0gZHJtL2JyaWRnZTogaW14OHF4cC1weGwyZHBpOiBzaW1wbGlmeSBwdXQgb2Yg
ZGV2aWNlX25vZGUgcG9pbnRlcnMKICAgICAgICBjb21taXQ6IGNlZWEzZjc4MDZhMTA5YmFiYTRh
MjNjOTA2NmViOWU4NjY1OTQwOGIKWzE0LzIyXSBkcm0vYnJpZGdlOiBpbXg4cXhwLXB4bDJkcGk6
IHJlbW92ZSBleGNlc3MgZXJyb3IgbWVzc2FnZQogICAgICAgIGNvbW1pdDogNTRhZjE3Nzg4NjI5
ZmJmMzQzYzVhOWViYzU1NDU0ZDZhNTQ4NmZmOApbMTUvMjJdIGRybS9icmlkZ2U6IGlteDhxeHAt
cHhsMmRwaTogaW14OHF4cF9weGwyZHBpX2ZpbmRfbmV4dF9icmlkZ2U6IHJldHVybiBpbnQsIG5v
dCBFUlJfUFRSCiAgICAgICAgY29tbWl0OiAwZGM0YThkNmQwOTZmOTdhMDBiMTA5MTllOGZmZTI0
NjY2NjZmMDNjClsxNi8yMl0gZHJtL2JyaWRnZTogaW14OHF4cC1weGwyZHBpOiBnZXQvcHV0IHRo
ZSBuZXh0IGJyaWRnZQogICAgICAgIGNvbW1pdDogNjgwMmM3ZWUzNjBkOThhMDE4OTYyYWRiODQx
MmQ0MmRjY2EyODI3MgpbMTcvMjJdIGRybS9icmlkZ2U6IGlteDhxeHAtcHhsMmRwaTogZ2V0L3B1
dCB0aGUgY29tcGFuaW9uIGJyaWRnZQogICAgICAgIGNvbW1pdDogOTAwNjk5YmE4MzBmZDM1NThi
YTAwZjU1ZmJmMDE0MDIyZGM3ZWNkYgpbMTgvMjJdIGRybS9icmlkZ2U6IGlteDhxeHAtcGl4ZWwt
bGluazogc2ltcGxpZnkgbG9naWMgdG8gZmluZCBuZXh0IGJyaWRnZQogICAgICAgIChubyBjb21t
aXQgaW5mbykKWzE5LzIyXSBkcm0vYnJpZGdlOiBpbXg4cXhwLXBpeGVsLWxpbms6IHNpbXBsaWZ5
IGZyZWVpbmcgb2YgdGhlIHJlbW90ZSBkZXZpY2Vfbm9kZQogICAgICAgIChubyBjb21taXQgaW5m
bykKWzIwLzIyXSBkcm0vYnJpZGdlOiBpbXg4cXhwLXBpeGVsLWxpbms6IHJlbW92ZSBleGNlc3Mg
ZXJyb3IgbWVzc2FnZQogICAgICAgIGNvbW1pdDogNDA2MzAyMTAyMTFhMzRmMDcxNGZlOTc2NTMw
Y2NmMTI5MWU1ZWY3OApbMjEvMjJdIGRybS9icmlkZ2U6IGlteDhxeHAtcGl4ZWwtbGluazogaW14
OHF4cF9waXhlbF9saW5rX2ZpbmRfbmV4dF9icmlkZ2U6IHJldHVybiBpbnQsIG5vdCBFUlJfUFRS
CiAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMjIvMjJdIGRybS9icmlkZ2U6IGlteDhxeHAtcGl4
ZWwtbGluazogZ2V0L3B1dCB0aGUgbmV4dCBicmlkZ2UKICAgICAgICAobm8gY29tbWl0IGluZm8p
CgpCZXN0IHJlZ2FyZHMsCi0tIApMdWNhIENlcmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4u
Y29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
