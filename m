Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B4C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZBDbmqjMiclilhw3hp+REF0jIVHZi28/uUMzs+vDVgA=; b=T3i66ns0Qf+Qn6
	+WbdJIv44EwGL3wsR9h6+slG/9duS/4ACGGLc13DQtbEXyln2fGAG6a6ueT6lTudLfHACOhyxx25W
	Z+ed2/FBX87xAsC3uYlUhy6PhGGwKXSFLnz3Z2kLdOBGQ6Rpu2IEhBnHrNwlbV0X54KMjKRYh6ZkN
	EiOePM8LQ+4u2zGzkiFbZN07xNT3tmTS/p8knRiHfWChNpX1YqpNlS20/zi0VI94l7DMra3YeHOkj
	PviWigtt3L67h/66ZJXfkmWTb6r/1tsXHysZDoi2rPmPXjrf1VGGA6TAKHoCTxolDWzs0HKoKqy++
	tWLYPAbu5L61cGyVf1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3n5-0000000Fav6-1tSR;
	Wed, 15 Jul 2026 17:53:03 +0000
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163] helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3n2-0000000FatV-3eER;
	Wed, 15 Jul 2026 17:53:02 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id E9559F40D1B; Wed, 15 Jul 2026 19:52:33 +0200 (CEST)
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
Subject: [PATCH 0/8] nvmem: make reg_write() take a const void *
Date: Wed, 15 Jul 2026 19:52:16 +0200
Message-ID: <20260715175229.24672-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_105301_093575_B7F4795B 
X-CRM114-Status: GOOD (  12.36  )
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

VGhpcyBjYWxsYmFjayB1c2VkIHRvIHRha2UgYSBtdXRhYmxlIHZvaWQgKiBmb3Igbm8gcmVhc29u
LCB3aGljaCBjYXVzZXMKdGhlIGNvbXBpbGVyIHRvIGJlIHVuYXdhcmUgdGhhdCB0aGUgdmFsIGJ1
ZmZlciBzaG91bGQgbmV2ZXIgYmUgbW9kaWZpZWQKYnkgdGhlIGNhbGxiYWNrLgoKVGhpcyB3YXMg
Zm91bmQgd2hpbGUgZHJhZnRpbmcgdGhlIG52bWVtLXByb3ZpZGVyIFJ1c3QgYWJzdHJhY3Rpb24u
CgpJ4oCZdmUgc3BsaXQgdGhpcyBzZXJpZXMgYmFzZWQgb24gdGhlIHN1YnN5c3RlbSBlYWNoIHBh
dGNoIGFmZmVjdHMsIGJ1dCBJCnRoaW5rIGl0IHNob3VsZCBnbyB0aHJvdWdoIHRoZSBudm1lbSB0
cmVlIGluIG9uZSBnbyBhZnRlciBnYXRoZXJpbmcgdGhlCmFja3MgZnJvbSB0aGUgb3RoZXIgc3Vi
c3lzdGVtIG1haW50YWluZXJzLgoKSeKAmXZlIGJlZW4gdG9sZCBwcmV2aW91c2x5IHRvIG5vdCBp
bmNsdWRlIHRvbyBtYW55IG1haW50YWluZXJzIGluIENjLCBidXQKSSBkb27igJl0IGtub3cgd2hp
Y2ggb25lcyB0byByZW1vdmUgZnJvbSB0aGUgZ2V0X21haW50YWluZXJzLnBsIG91dHB1dCwgc28K
SeKAmXZlIHN0aWxsIGluY2x1ZGVkIGV2ZXJ5b25lLCBzb3JyeSBhYm91dCB0aGF0LgoKVGhhbmtz
LAoKTGluayBNYXV2ZSAoOCk6CiAgbnZtZW06IGNvcmU6IG1ha2UgcmVnX3dyaXRlKCkgdGFrZSBh
IGNvbnN0IHZvaWQgKgogIG52bWVtOiBtYWtlIGFsbCByZWdfd3JpdGUgY2FsbGJhY2tzIHRha2Ug
Y29uc3Qgdm9pZCAqCiAgcnRjOiBtYWtlIGFsbCByZWdfd3JpdGUgY2FsbGJhY2tzIHRha2UgY29u
c3Qgdm9pZCAqCiAgbWlzYzogbWFrZSBhbGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNvbnN0
IHZvaWQgKgogIGlpbzogcHJlc3N1cmU6IGJtcDI4MDogbWFrZSByZWdfd3JpdGUgY2FsbGJhY2sg
dGFrZSBjb25zdCB2b2lkICoKICBmaXJtd2FyZTogbWVzb25fc206IG1ha2UgcmVnX3dyaXRlIGNh
bGxiYWNrIHRha2UgY29uc3Qgdm9pZCAqCiAgbWZkOiB0d2wtY29yZTogbWFrZSByZWdfd3JpdGUg
Y2FsbGJhY2sgdGFrZSBjb25zdCB2b2lkICoKICBtZWRpYTogb3YyNzQwOiByZW1vdmUgTlVMTCBy
ZWdfd3JpdGUgY2FsbGJhY2sKCiBkcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgICAg
ICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9paW8vcHJlc3N1cmUvYm1wMjgwLWNvcmUuYyAg
ICAgICAgICAgICAgICB8IDYgKysrLS0tCiBkcml2ZXJzL21lZGlhL2kyYy9vdjI3NDAuYyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL21mZC90d2wtY29yZS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9taXNjL2RzMTY4Mi5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvbWlzYy9lZXByb20vYXQyNS5j
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL21pc2MvZWVwcm9tL2VlcHJv
bV85M3h4NDYuYyAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL21pc2MvZWVwcm9tL20y
NGxyLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9taXNjL2tlYmEvY3A1
MDAuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvbWlzYy9tY2hwX3Bj
aTF4eHh4L21jaHBfcGNpMXh4eHhfb3RwZTJwLmMgfCA4ICsrKystLS0tCiBkcml2ZXJzL252bWVt
L2JjbS1vY290cC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL252
bWVtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9u
dm1lbS9pbXgtb2NvdHAtc2N1LmMgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogZHJpdmVy
cy9udm1lbS9pbXgtb2NvdHAuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogZHJp
dmVycy9udm1lbS9sYW45NjYyLW90cGMuYyAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQog
ZHJpdmVycy9udm1lbS9scGMxOHh4X2VlcHJvbS5jICAgICAgICAgICAgICAgICAgICB8IDQgKyst
LQogZHJpdmVycy9udm1lbS9tYXg3Nzc1OS1udm1lbS5jICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KIGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYyAgICAgICAgICAgICAgICAgICAgICAgfCA0
ICsrLS0KIGRyaXZlcnMvbnZtZW0vcWNvbS1zcG1pLXNkYW0uYyAgICAgICAgICAgICAgICAgICAg
fCAyICstCiBkcml2ZXJzL252bWVtL3FmcHJvbS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNCArKy0tCiBkcml2ZXJzL252bWVtL3JhdmUtc3AtZWVwcm9tLmMgICAgICAgICAgICAgICAg
ICAgIHwgNCArKy0tCiBkcml2ZXJzL252bWVtL3NudnNfbHBncHIuYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQogZHJpdmVycy9udm1lbS9zcHJkLWVmdXNlLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8IDQgKystLQogZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmMgICAg
ICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvbnZtZW0vc3RtMzItYnNlYy1vcHRlZS10YS5oICAg
ICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyAgICAgICAg
ICAgICAgICAgICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9udm1lbS96eW5xbXBfbnZtZW0uYyAg
ICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogZHJpdmVycy9ydGMvcnRjLWFieDgweC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogZHJpdmVycy9ydGMvcnRjLWNtb3MuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvcnRjL3J0Yy1kczEzMDUu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvcnRjL3J0Yy1kczEz
MDcuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3J0Yy9ydGMtZHMx
MzQzLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ydGMvcnRjLWRz
MTUxMS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvcnRjL3J0Yy1k
czE1NTMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvcnRjL3J0
Yy1kczE2ODUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvcnRj
L3J0Yy1kczE3NDIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMv
cnRjL3J0Yy1kczMyMzIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJz
L3J0Yy9ydGMtaXNsMTIwMjYuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2
ZXJzL3J0Yy9ydGMtaXNsMTIwOC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJp
dmVycy9ydGMvcnRjLW00OHQ1OS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQog
ZHJpdmVycy9ydGMvcnRjLW00OHQ4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
IGRyaXZlcnMvcnRjL3J0Yy1tYXgzMTMzNS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAyICst
CiBkcml2ZXJzL3J0Yy9ydGMtbWVzb24uYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQogZHJpdmVycy9ydGMvcnRjLW9tYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQg
KystLQogZHJpdmVycy9ydGMvcnRjLXBjZjIxMjcuYyAgICAgICAgICAgICAgICAgICAgICAgICB8
IDIgKy0KIGRyaXZlcnMvcnRjL3J0Yy1wY2Y4NTA2My5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAyICstCiBkcml2ZXJzL3J0Yy9ydGMtcGNmODUzNjMuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtcnA1YzAxLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtcnYzMDI4LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNiArKystLS0KIGRyaXZlcnMvcnRjL3J0Yy1ydjMwMjljMi5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL3J0Yy9ydGMtcnYzMDMyLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtcnY4ODAzLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtcng4NTgxLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtc3RrMTd0YTgu
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtc3VuNmku
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL3J0Yy9ydGMtdGkt
azMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ydGMvcnRjLXR3
bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGluY2x1ZGUvbGludXgvZmly
bXdhcmUvbWVzb24vbWVzb25fc20uaCAgICAgICAgICAgfCAyICstCiBpbmNsdWRlL2xpbnV4L21m
ZC90d2wuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiBpbmNsdWRlL2xpbnV4
L252bWVtLXByb3ZpZGVyLmggICAgICAgICAgICAgICAgICAgIHwgMiArLQogNjIgZmlsZXMgY2hh
bmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDEwMSBkZWxldGlvbnMoLSkKCi0tIAoyLjU1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
