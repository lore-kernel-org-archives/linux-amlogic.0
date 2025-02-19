Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FEC021AA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsCmn2OL9jf/T7ZZLQxgVHE7uA+5XEyvFNqodQnK6Ng=; b=k/0MplW/SM7B3y
	+MFrJoVw/HS2qY4sixTJ5+KyDVDVSpexrb2SMMWy0LkiG33YYzhvYbOpjb8MuyOVW/6czizqaNbH8
	1sRCB39wykQnVrbieT2/2fdUyd3IiuBOfwNCnZ01cDivAvLW3TCuse88feh7d4/4TTnzNjRElUOtz
	gavyAfyd/ASHx2vsGwbhl9OC/0ezykCgSZGSAmBrpfNOOC8b7D+36ls/wIDavCVyNpCX7V7Oa1zvl
	ihzQ5SQj8EvC7uSSkQeMdhch0y8oJyfuvdWlyP4Roq+ZsoSCa3wJib8hcBe0LGS55AjmzFUQi4aQo
	1L+EqfDGTNQ0liYyDvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgQM-0000000BsG6-3Vhw;
	Wed, 19 Feb 2025 09:31:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgCi-0000000Bmz3-2B0w
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Feb 2025 09:17:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkgBq-00054h-Ak; Wed, 19 Feb 2025 10:16:22 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkgBp-001jq7-2H;
	Wed, 19 Feb 2025 10:16:21 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkgBp-0002qA-1n;
	Wed, 19 Feb 2025 10:16:21 +0100
Message-ID: <89d52c01503e2dbd2e23cce1ff9eb037e59eec5a.camel@pengutronix.de>
Subject: Re: [PATCH v4 6/8] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Danilo
 Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Douglas Anderson
 <dianders@chromium.org>,  Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?ISO-8859-1?Q?Th=E9o?= Lebrun
 <theo.lebrun@bootlin.com>,  Michael Turquette <mturquette@baylibre.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Date: Wed, 19 Feb 2025 10:16:21 +0100
In-Reply-To: <20250218-aux-device-create-helper-v4-6-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	 <20250218-aux-device-create-helper-v4-6-c3d7dfdea2e6@baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_011716_566605_2EFF3B78 
X-CRM114-Status: UNSURE (   9.24  )
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

T24gRGksIDIwMjUtMDItMTggYXQgMjA6MjkgKzAxMDAsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4g
RnJvbTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KPiAKPiBPdXIgcGFy
ZW50IGRyaXZlciAoY2xrLWV5ZXEpIG5vdyBkb2VzIHRoZQo+IAlkZXZpY2Vfc2V0X29mX25vZGVf
ZnJvbV9kZXYoZGV2LCBkZXYtPnBhcmVudCkKPiBjYWxsIHRocm91Z2ggdGhlIG5ld2x5IGludHJv
ZHVjZWQgZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0ZSgpIGhlbHBlci4KPiAKPiBEb2luZyBp
dCBhZ2FpbiBpbiB0aGUgcmVzZXQtZXllcSBwcm9iZSB3b3VsZCBiZSByZWR1bmRhbnQuCj4gRHJv
cCBib3RoIHRoZSBXQVJOX09OKCkgYW5kIHRoZSBkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYo
KSBjYWxsLgo+IEFsc28gZml4IHRoZSBmb2xsb3dpbmcgY29tbWVudCB0aGF0IHRhbGtzIGFib3V0
ICJvdXIgbmV3Zm91bmQgT0Ygbm9kZSIuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVu
IDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0
IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
