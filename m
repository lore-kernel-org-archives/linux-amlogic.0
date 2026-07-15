Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E28C44508
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu0YTV+Lg6dNmKnLQgu1k7SHH/EOteUpkausGxgxumk=; b=OetgH4R1wZKr7q
	BhMJh2jaKO/FiwOCOqNlQFQat9aV44F5IE17PAPRXHjxRZ48R22xihY1DIC9MSx8kzSbzV7HcHgr3
	az17Gljg6dkQpoUDmUNooc+jcf4zGWYMpHrddWVH8GHAtwVHvmrp+bQu5x34oRvsCXzSugLHeNk00
	KxttPr+Ltrp8WsMHS371wZAnUdRJLJlOvDH5QXCUnIVjt084bLtRv0TjGofLwyKGNYZUwjjE3jMal
	xJsnv3pHWcbSBO3UJYGbayceeLGcidScESRnuQ3VtQJPXKl3nxrtw51Jw8CdFiiELEDmWFln+1BTC
	bGOqc3nu6VzBPL7F7GlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3nG-0000000Fb0O-3eQF;
	Wed, 15 Jul 2026 17:53:14 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3nE-0000000FayP-3B7d;
	Wed, 15 Jul 2026 17:53:14 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 093A2F40D21; Wed, 15 Jul 2026 19:52:42 +0200 (CEST)
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
Subject: [PATCH 4/8] misc: make all reg_write callbacks take const void *
Date: Wed, 15 Jul 2026 19:52:20 +0200
Message-ID: <20260715175229.24672-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715175229.24672-1-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_105313_084765_633F9D58 
X-CRM114-Status: GOOD (  13.21  )
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
aW5rbWF1dmVAbGlua21hdXZlLmZyPgotLS0KIGRyaXZlcnMvbWlzYy9kczE2ODIuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL21pc2MvZWVwcm9tL2F0MjQuYyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL21pc2MvZWVwcm9tL2F0MjUu
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9taXNjL2VlcHJvbS9lZXBy
b21fOTN4eDQ2LmMgICAgICAgICAgICAgICB8IDQgKystLQogZHJpdmVycy9taXNjL2VlcHJvbS9t
MjRsci5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvbWlzYy9rZWJhL2Nw
NTAwLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL21pc2MvbWNocF9w
Y2kxeHh4eC9tY2hwX3BjaTF4eHh4X290cGUycC5jIHwgOCArKysrLS0tLQogNyBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21pc2MvZHMxNjgyLmMgYi9kcml2ZXJzL21pc2MvZHMxNjgyLmMKaW5kZXggY2IwOWUwNTY1
MzFhLi40ZTQyYTQ1YzE3ZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9kczE2ODIuYworKysg
Yi9kcml2ZXJzL21pc2MvZHMxNjgyLmMKQEAgLTIwOSw3ICsyMDksNyBAQCBzdGF0aWMgaW50IGRz
MTY4Ml9udm1lbV9yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZh
bCwKIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7CiB9CiAKLXN0YXRpYyBpbnQgZHMxNjgyX252
bWVtX3dyaXRlKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwKK3N0
YXRpYyBpbnQgZHMxNjgyX252bWVtX3dyaXRlKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZz
ZXQsIGNvbnN0IHZvaWQgKnZhbCwKIAkJCSAgICAgIHNpemVfdCBieXRlcykKIHsKIAlzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50ID0gcHJpdjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9lZXBy
b20vYXQyNC5jIGIvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMKaW5kZXggNzcyYzRkOWZhNjUx
Li5jZDM4Y2Y4YWFkNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jCisr
KyBiL2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jCkBAIC00NzcsMTEgKzQ3NywxMSBAQCBzdGF0
aWMgaW50IGF0MjRfcmVhZCh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2ZmLCB2b2lkICp2YWws
IHNpemVfdCBjb3VudCkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBhdDI0X3dyaXRlKHZv
aWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmYsIHZvaWQgKnZhbCwgc2l6ZV90IGNvdW50KQorc3Rh
dGljIGludCBhdDI0X3dyaXRlKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmYsIGNvbnN0IHZv
aWQgKnZhbCwgc2l6ZV90IGNvdW50KQogewogCXN0cnVjdCBhdDI0X2RhdGEgKmF0MjQ7CiAJc3Ry
dWN0IGRldmljZSAqZGV2OwotCWNoYXIgKmJ1ZiA9IHZhbDsKKwljb25zdCBjaGFyICpidWYgPSB2
YWw7CiAJaW50IHJldDsKIAogCWF0MjQgPSBwcml2OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNj
L2VlcHJvbS9hdDI1LmMgYi9kcml2ZXJzL21pc2MvZWVwcm9tL2F0MjUuYwppbmRleCBiYzJjZmI3
NWQ5YmIuLjI4ZjFkYzFiOWJlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI1
LmMKKysrIGIvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI1LmMKQEAgLTIzNSw3ICsyMzUsNyBAQCBz
dGF0aWMgaW50IGF0MjVfd2FpdF9yZWFkeShzdHJ1Y3QgYXQyNV9kYXRhICphdDI1KQogCXJldHVy
biBib3VuY2VbMF07CiB9CiAKLXN0YXRpYyBpbnQgYXQyNV9lZV93cml0ZSh2b2lkICpwcml2LCB1
bnNpZ25lZCBpbnQgb2ZmLCB2b2lkICp2YWwsIHNpemVfdCBjb3VudCkKK3N0YXRpYyBpbnQgYXQy
NV9lZV93cml0ZSh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2ZmLCBjb25zdCB2b2lkICp2YWws
IHNpemVfdCBjb3VudCkKIHsKIAl1OCAqYm91bmNlIF9fZnJlZShrZnJlZSkgPSBrbWFsbG9jKG1p
bihjb3VudCwgaW9fbGltaXQpLCBHRlBfS0VSTkVMKTsKIAlzdHJ1Y3QgYXQyNV9kYXRhICphdDI1
ID0gcHJpdjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9lZXByb20vZWVwcm9tXzkzeHg0Ni5j
IGIvZHJpdmVycy9taXNjL2VlcHJvbS9lZXByb21fOTN4eDQ2LmMKaW5kZXggZjljM2FiNTJjMmY5
Li44MTNmMjk1YWYwOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9lZXByb20vZWVwcm9tXzkz
eHg0Ni5jCisrKyBiL2RyaXZlcnMvbWlzYy9lZXByb20vZWVwcm9tXzkzeHg0Ni5jCkBAIC0yNjgs
MTAgKzI2OCwxMCBAQCBlZXByb21fOTN4eDQ2X3dyaXRlX3dvcmQoc3RydWN0IGVlcHJvbV85M3h4
NDZfZGV2ICplZGV2LAogfQogCiBzdGF0aWMgaW50IGVlcHJvbV85M3h4NDZfd3JpdGUodm9pZCAq
cHJpdiwgdW5zaWduZWQgaW50IG9mZiwKLQkJCQkgICB2b2lkICp2YWwsIHNpemVfdCBjb3VudCkK
KwkJCSAgICAgICBjb25zdCB2b2lkICp2YWwsIHNpemVfdCBjb3VudCkKIHsKIAlzdHJ1Y3QgZWVw
cm9tXzkzeHg0Nl9kZXYgKmVkZXYgPSBwcml2OwotCWNoYXIgKmJ1ZiA9IHZhbDsKKwljb25zdCBj
aGFyICpidWYgPSB2YWw7CiAJaW50IHJldCwgc3RlcCA9IDE7CiAJdW5zaWduZWQgaW50IGk7CiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9lZXByb20vbTI0bHIuYyBiL2RyaXZlcnMvbWlzYy9l
ZXByb20vbTI0bHIuYwppbmRleCA3YTlmZDQ1YThlNDYuLjIyZjMyMjFlMjMyYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9taXNjL2VlcHJvbS9tMjRsci5jCisrKyBiL2RyaXZlcnMvbWlzYy9lZXByb20v
bTI0bHIuYwpAQCAtMzc0LDcgKzM3NCw3IEBAIHN0YXRpYyBpbnQgbTI0bHJfbnZtZW1fcmVhZCh2
b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyBpbnQgbTI0bHJfbnZtZW1fd3JpdGUodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50
IG9mZnNldCwgdm9pZCAqdmFsLAorc3RhdGljIGludCBtMjRscl9udm1lbV93cml0ZSh2b2lkICpw
cml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCBjb25zdCB2b2lkICp2YWwsCiAJCQkgICAgIHNpemVf
dCBieXRlcykKIHsKIAlzc2l6ZV90IGVycjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9rZWJh
L2NwNTAwLmMgYi9kcml2ZXJzL21pc2Mva2ViYS9jcDUwMC5jCmluZGV4IDZjNjVmYmYyMmU3NS4u
ZWU3ODg5Y2I2M2E4IDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2Mva2ViYS9jcDUwMC5jCisrKyBi
L2RyaXZlcnMvbWlzYy9rZWJhL2NwNTAwLmMKQEAgLTU5MCw3ICs1OTAsNyBAQCBzdGF0aWMgaW50
IGNwNTAwX252bWVtX3JlYWQodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAq
dmFsLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGNwNTAwX252bWVtX3dyaXRlKHZvaWQg
KnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwKK3N0YXRpYyBpbnQgY3A1MDBf
bnZtZW1fd3JpdGUodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZnNldCwgY29uc3Qgdm9pZCAq
dmFsLAogCQkJICAgICBzaXplX3QgYnl0ZXMpCiB7CiAJc3RydWN0IGNwNTAwX252bWVtICpudm1l
bSA9IHByaXY7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWNocF9wY2kxeHh4eC9tY2hwX3Bj
aTF4eHh4X290cGUycC5jIGIvZHJpdmVycy9taXNjL21jaHBfcGNpMXh4eHgvbWNocF9wY2kxeHh4
eF9vdHBlMnAuYwppbmRleCBhMmVkNDc3ZTAzNzAuLmYyNzU5ZTliNDEzOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9taXNjL21jaHBfcGNpMXh4eHgvbWNocF9wY2kxeHh4eF9vdHBlMnAuYworKysgYi9k
cml2ZXJzL21pc2MvbWNocF9wY2kxeHh4eC9tY2hwX3BjaTF4eHh4X290cGUycC5jCkBAIC0xNTks
MTEgKzE1OSwxMSBAQCBzdGF0aWMgaW50IHBjaTF4eHh4X2VlcHJvbV9yZWFkKHZvaWQgKnByaXZf
dCwgdW5zaWduZWQgaW50IG9mZiwKIH0KIAogc3RhdGljIGludCBwY2kxeHh4eF9lZXByb21fd3Jp
dGUodm9pZCAqcHJpdl90LCB1bnNpZ25lZCBpbnQgb2ZmLAotCQkJCSB2b2lkICp2YWx1ZV90LCBz
aXplX3QgY291bnQpCisJCQkJIGNvbnN0IHZvaWQgKnZhbHVlX3QsIHNpemVfdCBjb3VudCkKIHsK
IAlzdHJ1Y3QgcGNpMXh4eHhfb3RwX2VlcHJvbV9kZXZpY2UgKnByaXYgPSBwcml2X3Q7CiAJdm9p
ZCBfX2lvbWVtICpyYiA9IHByaXYtPnJlZ19iYXNlOwotCWNoYXIgKnZhbHVlID0gdmFsdWVfdDsK
Kwljb25zdCBjaGFyICp2YWx1ZSA9IHZhbHVlX3Q7CiAJdTMyIHJlZ3ZhbDsKIAl1MzIgYnl0ZTsK
IAlpbnQgcmV0OwpAQCAtMjYyLDExICsyNjIsMTEgQEAgc3RhdGljIGludCBwY2kxeHh4eF9vdHBf
cmVhZCh2b2lkICpwcml2X3QsIHVuc2lnbmVkIGludCBvZmYsCiB9CiAKIHN0YXRpYyBpbnQgcGNp
MXh4eHhfb3RwX3dyaXRlKHZvaWQgKnByaXZfdCwgdW5zaWduZWQgaW50IG9mZiwKLQkJCSAgICAg
IHZvaWQgKnZhbHVlX3QsIHNpemVfdCBjb3VudCkKKwkJCSAgICAgIGNvbnN0IHZvaWQgKnZhbHVl
X3QsIHNpemVfdCBjb3VudCkKIHsKIAlzdHJ1Y3QgcGNpMXh4eHhfb3RwX2VlcHJvbV9kZXZpY2Ug
KnByaXYgPSBwcml2X3Q7CiAJdm9pZCBfX2lvbWVtICpyYiA9IHByaXYtPnJlZ19iYXNlOwotCWNo
YXIgKnZhbHVlID0gdmFsdWVfdDsKKwljb25zdCBjaGFyICp2YWx1ZSA9IHZhbHVlX3Q7CiAJdTMy
IHJlZ3ZhbDsKIAl1MzIgYnl0ZTsKIAlpbnQgcmV0OwotLSAKMi41NS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
