Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25754C44508
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNcqck0Y9ieQzk++IQg85wLZI+mFGCz8o4iRZMz8hQo=; b=2WDwGEnxrPFOiC
	YPLC4rtTGAkv00n8MDDVDRlY0ujfEyIyo7BmTJ3pWUU7Y2vxOpejnHFxU9MMp1MryVkCl+nnMHIIl
	4GljgER7/F5TiARhyAicKJEb+OtdrydnAmam4mNkoEzvl/Ackf58H0wMP50YyWa6dyYbJbGFUV4yi
	Z5qsDDP7ycZApuQO0MCoV9JlKjsNxv5NRgwU450UwzQZn12DEVK4QKeNiFwHQn+cKhW848ibPbAWR
	zfFY3T9/exPtXjh9J1e8A/VePpkIn4F2C1kW5+2enCM/V7VoUX49mVtRRLV5/2FTZNs439WUceIph
	H6MQ/PvKCAJ8IN2Ff/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3wj-0000000Fc1n-35gc;
	Wed, 15 Jul 2026 18:03:01 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3wh-0000000Fc10-21Ir;
	Wed, 15 Jul 2026 18:03:01 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id B9800F40D23; Wed, 15 Jul 2026 19:52:48 +0200 (CEST)
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
Subject: [PATCH 6/8] firmware: meson_sm: make reg_write callback take const void *
Date: Wed, 15 Jul 2026 19:52:22 +0200
Message-ID: <20260715175229.24672-7-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715175229.24672-1-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110300_047148_CCD4AAF8 
X-CRM114-Status: GOOD (  11.87  )
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
aW5rbWF1dmVAbGlua21hdXZlLmZyPgotLS0KIGRyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uYyAgICAgICB8IDIgKy0KIGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20u
aCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYyBiL2RyaXZl
cnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwppbmRleCBhYjk3NTFhNTliNTUuLjVkNGRhMmUz
YzNhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCisrKyBi
L2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwpAQCAtMTk2LDcgKzE5Niw3IEBAIEVY
UE9SVF9TWU1CT0wobWVzb25fc21fY2FsbF9yZWFkKTsKICAqCiAgKiBSZXR1cm46CXNpemUgb2Yg
c2VudCBkYXRhIG9uIHN1Y2Nlc3MsIGEgbmVnYXRpdmUgdmFsdWUgb24gZXJyb3IKICAqLwotaW50
IG1lc29uX3NtX2NhbGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgdm9pZCAq
YnVmZmVyLAoraW50IG1lc29uX3NtX2NhbGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJl
ICpmdywgY29uc3Qgdm9pZCAqYnVmZmVyLAogCQkJdW5zaWduZWQgaW50IHNpemUsIHVuc2lnbmVk
IGludCBjbWRfaW5kZXgsIHUzMiBhcmcwLAogCQkJdTMyIGFyZzEsIHUzMiBhcmcyLCB1MzIgYXJn
MywgdTMyIGFyZzQpCiB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29u
L21lc29uX3NtLmggYi9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKaW5k
ZXggM2ViYzJiZDlhOTc2Li45MmNjNjFmM2ExYzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
ZmlybXdhcmUvbWVzb24vbWVzb25fc20uaAorKysgYi9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21l
c29uL21lc29uX3NtLmgKQEAgLTIxLDcgKzIxLDcgQEAgc3RydWN0IG1lc29uX3NtX2Zpcm13YXJl
OwogCiBpbnQgbWVzb25fc21fY2FsbChzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3LCB1bnNp
Z25lZCBpbnQgY21kX2luZGV4LAogCQkgIHMzMiAqcmV0LCB1MzIgYXJnMCwgdTMyIGFyZzEsIHUz
MiBhcmcyLCB1MzIgYXJnMywgdTMyIGFyZzQpOwotaW50IG1lc29uX3NtX2NhbGxfd3JpdGUoc3Ry
dWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgdm9pZCAqYnVmZmVyLAoraW50IG1lc29uX3NtX2Nh
bGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgY29uc3Qgdm9pZCAqYnVmZmVy
LAogCQkJdW5zaWduZWQgaW50IGJfc2l6ZSwgdW5zaWduZWQgaW50IGNtZF9pbmRleCwgdTMyIGFy
ZzAsCiAJCQl1MzIgYXJnMSwgdTMyIGFyZzIsIHUzMiBhcmczLCB1MzIgYXJnNCk7CiBpbnQgbWVz
b25fc21fY2FsbF9yZWFkKHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAqZncsIHZvaWQgKmJ1ZmZl
ciwKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
