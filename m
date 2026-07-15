Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA6C4450E
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 17:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPx5wZEnW8cP8HBwVo4fnJMBhGeY8ljBVAF7L8cngMs=; b=yLo4SKvgzSABjN
	CDqHyvlRRNXl97Me7aflXxB9QeBJmIpOYH8jeNN/tgz4+vN/z4F+PHxPU+fQkJS0L3Tof09P0awdj
	vtsY4eX1zeTWioa0goZFAl/dlODFUVkRWlWOfaow1tAGrA512t/jhHOG4thDM30iRGB3RC9X06/y9
	6V/gqMnI6PBVASW1j2cTEQ2BgRxk2RvhnOZAv+tkTYY8aoywINjVPVF2vLjmg8XTKWetf9do8sc17
	Lk2etJd98tMwWciTyLD62eNfI3aRtV+ntXDYJBsEoXG5SlRjtidcZP6KUAHa3hAy2hGEm8BjN2PSe
	2ljesu0QzdlHk9qCj1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3nM-0000000Fb2S-00MO;
	Wed, 15 Jul 2026 17:53:20 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3nI-0000000Fb0K-3k1n;
	Wed, 15 Jul 2026 17:53:18 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id D52EEF40D22; Wed, 15 Jul 2026 19:52:45 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joshua Kinard <linux@kumba.dev>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Salah Triki <salah.triki@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	David Carlier <devnexen@gmail.com>,
	Achim Gratz <Achim.Gratz@Stromeko.DE>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Patrick Wicki <patrick.wicki@siemens.com>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Markus Perkins <markus@notsyncing.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 5/8] iio: pressure: bmp280: make reg_write callback take const void *
Date: Wed, 15 Jul 2026 19:52:21 +0200
Message-ID: <20260715175229.24672-6-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715175229.24672-1-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_105317_071837_874B8A68 
X-CRM114-Status: GOOD (  11.47  )
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

VGhlIHByZXZpb3VzIGNvbW1pdCBzd2l0Y2hlZCBmcm9tIGEgcG9pbnRlciB0byBtdXRhYmxlIGRh
dGEgdG8gYSBwb2ludGVyCnRvIGltbXV0YWJsZSBkYXRhLCBzbyBsZXTigJlzIGZpeCBhbGwgdXNl
cnMgb2YgdGhlIG52bWVtX2NvbmZpZyBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBMaW5rIE1hdXZlIDxs
aW5rbWF1dmVAbGlua21hdXZlLmZyPgotLS0KIGRyaXZlcnMvaWlvL3ByZXNzdXJlL2JtcDI4MC1j
b3JlLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9wcmVzc3VyZS9ibXAyODAtY29yZS5j
IGIvZHJpdmVycy9paW8vcHJlc3N1cmUvYm1wMjgwLWNvcmUuYwppbmRleCA5OTAzNDBhOWIxMGMu
LjBhMzljNWYzOTM3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJlc3N1cmUvYm1wMjgwLWNv
cmUuYworKysgYi9kcml2ZXJzL2lpby9wcmVzc3VyZS9ibXAyODAtY29yZS5jCkBAIC0yMjYxLDEx
ICsyMjYxLDExIEBAIHN0YXRpYyBpbnQgYm1wNTgwX252bWVtX3JlYWQodm9pZCAqcHJpdiwgdW5z
aWduZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBp
bnQgYm1wNTgwX252bWVtX3dyaXRlX2ltcGwodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZnNl
dCwgdm9pZCAqdmFsLAorc3RhdGljIGludCBibXA1ODBfbnZtZW1fd3JpdGVfaW1wbCh2b2lkICpw
cml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCBjb25zdCB2b2lkICp2YWwsCiAJCQkJICAgc2l6ZV90
IGJ5dGVzKQogewogCXN0cnVjdCBibXAyODBfZGF0YSAqZGF0YSA9IHByaXY7Ci0JdTE2ICpidWYg
PSB2YWw7CisJY29uc3QgdTE2ICpidWYgPSB2YWw7CiAJaW50IHJldCwgYWRkcjsKIAogCWd1YXJk
KG11dGV4KSgmZGF0YS0+bG9jayk7CkBAIC0yMzIyLDcgKzIzMjIsNyBAQCBzdGF0aWMgaW50IGJt
cDU4MF9udm1lbV93cml0ZV9pbXBsKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZv
aWQgKnZhbCwKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGJtcDU4MF9udm1lbV93cml0
ZSh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsCitzdGF0aWMgaW50
IGJtcDU4MF9udm1lbV93cml0ZSh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCBjb25z
dCB2b2lkICp2YWwsCiAJCQkgICAgICBzaXplX3QgYnl0ZXMpCiB7CiAJc3RydWN0IGJtcDI4MF9k
YXRhICpkYXRhID0gcHJpdjsKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
