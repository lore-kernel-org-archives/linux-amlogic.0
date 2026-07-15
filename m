Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29626C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0ollY9atBpmSdFEt08TgJEP5CN7IlsOY/j90EtvLh8=; b=SpSwbFMZQ6xhn0
	t2n+d2CyjpvAEq89OQsqRncY1sfgvfQocuTdIo8HK4N08scdgK81oYK06IasMmKJW1Apc1H0U5/u9
	mLFZV/hfwxCxLRlZHUxucAFT98BBomOss/EYqfVcIaeIgIIGQwtwTHjrIJwmIXw7PdKUOtKMarjLy
	VV5cBSrtMo8vVff5JjWlCFoR5DwQv1IJjaFNrfaTtad9k+jD1L9EWO9vp+/sbW5ddxnaQbu9epkEi
	hVkhtAjQpUDqi3SZeKwGSPPK563Gek2qLVWwsrr8dtY+8jlsB7K5x1b5+bTeCpNuD0k+5IkWVDGnp
	aZQCyqxO25YnIkbIsz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3nT-0000000Fb5d-0Zys;
	Wed, 15 Jul 2026 17:53:27 +0000
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163] helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3nQ-0000000Fb3i-1YKz;
	Wed, 15 Jul 2026 17:53:25 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 8AFA9F40D25; Wed, 15 Jul 2026 19:52:52 +0200 (CEST)
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
Subject: [PATCH 7/8] mfd: twl-core: make reg_write callback take const void *
Date: Wed, 15 Jul 2026 19:52:23 +0200
Message-ID: <20260715175229.24672-8-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715175229.24672-1-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_105324_650542_0BE3B3C3 
X-CRM114-Status: GOOD (  12.63  )
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
aW5rbWF1dmVAbGlua21hdXZlLmZyPgotLS0KIGRyaXZlcnMvbWZkL3R3bC1jb3JlLmMgIHwgMiAr
LQogaW5jbHVkZS9saW51eC9tZmQvdHdsLmggfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3R3
bC1jb3JlLmMgYi9kcml2ZXJzL21mZC90d2wtY29yZS5jCmluZGV4IGMwMjRhMjhiMDU3ZS4uZDdl
M2FiNDE3MTdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL21mZC90d2wtY29yZS5jCisrKyBiL2RyaXZl
cnMvbWZkL3R3bC1jb3JlLmMKQEAgLTQ0Nyw3ICs0NDcsNyBAQCBzdGF0aWMgc3RydWN0IHJlZ21h
cCAqdHdsX2dldF9yZWdtYXAodTggbW9kX25vKQogICoKICAqIFJldHVybnMgMCBvbiBzdWNjZXNz
IG9yIGVsc2UgYSBuZWdhdGl2ZSBlcnJvciBjb2RlLgogICovCi1pbnQgdHdsX2kyY193cml0ZSh1
OCBtb2Rfbm8sIHU4ICp2YWx1ZSwgdTggcmVnLCB1bnNpZ25lZCBudW1fYnl0ZXMpCitpbnQgdHds
X2kyY193cml0ZSh1OCBtb2Rfbm8sIGNvbnN0IHU4ICp2YWx1ZSwgdTggcmVnLCB1bnNpZ25lZCBu
dW1fYnl0ZXMpCiB7CiAJc3RydWN0IHJlZ21hcCAqcmVnbWFwID0gdHdsX2dldF9yZWdtYXAobW9k
X25vKTsKIAlpbnQgcmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvdHdsLmggYi9p
bmNsdWRlL2xpbnV4L21mZC90d2wuaAppbmRleCBiMzFlMDdmYTRkNTEuLjEzMTQ1MWQ3MDk2MCAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZmQvdHdsLmgKKysrIGIvaW5jbHVkZS9saW51eC9t
ZmQvdHdsLmgKQEAgLTE2OCw3ICsxNjgsNyBAQCBpbnQgdHdsX3NldF9yZWdjYWNoZV9ieXBhc3Mo
dTggbW9kX25vLCBib29sIGVuYWJsZSk7CiAvKgogICogUmVhZCBhbmQgd3JpdGUgc2V2ZXJhbCA4
LWJpdCByZWdpc3RlcnMgYXQgb25jZS4KICAqLwotaW50IHR3bF9pMmNfd3JpdGUodTggbW9kX25v
LCB1OCAqdmFsdWUsIHU4IHJlZywgdW5zaWduZWQgbnVtX2J5dGVzKTsKK2ludCB0d2xfaTJjX3dy
aXRlKHU4IG1vZF9ubywgY29uc3QgdTggKnZhbHVlLCB1OCByZWcsIHVuc2lnbmVkIG51bV9ieXRl
cyk7CiBpbnQgdHdsX2kyY19yZWFkKHU4IG1vZF9ubywgdTggKnZhbHVlLCB1OCByZWcsIHVuc2ln
bmVkIG51bV9ieXRlcyk7CiAKIC8qCkBAIC0xODYsNyArMTg2LDcgQEAgc3RhdGljIGlubGluZSBp
bnQgdHdsX2kyY193cml0ZV91MTYodTggbW9kX25vLCB1MTYgdmFsLCB1OCByZWcpIHsKIAlfX2xl
MTYgdmFsdWU7CiAKIAl2YWx1ZSA9IGNwdV90b19sZTE2KHZhbCk7Ci0JcmV0dXJuIHR3bF9pMmNf
d3JpdGUobW9kX25vLCAodTggKikgJnZhbHVlLCByZWcsIDIpOworCXJldHVybiB0d2xfaTJjX3dy
aXRlKG1vZF9ubywgKGNvbnN0IHU4ICopICZ2YWx1ZSwgcmVnLCAyKTsKIH0KIAogc3RhdGljIGlu
bGluZSBpbnQgdHdsX2kyY19yZWFkX3UxNih1OCBtb2Rfbm8sIHUxNiAqdmFsLCB1OCByZWcpIHsK
LS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
