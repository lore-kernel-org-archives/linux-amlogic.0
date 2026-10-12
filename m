Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1412CA9EDE
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nvh45NxWRYkvEy2p0gyRHHKxoZ9VlnWkoU0/h14XDUs=; b=iWJSfEt0Y8cJxs
	9vzZlCyGY2reMHiXBkOhGIu866LoLUrWExq3asQKHJ930gJX2JDzmdl+tsjBe2yjuV/tUVMZflAz7
	bYkjkh13YJH0NA5DwVplERpFErEMZM045CID7kUyKYqsfxbLAjrqKdzLPkqcntVRYO4C5v3OhaFVN
	iVjxueN9DknOcVx9DE0gaQS2KJ+OrwgTbaStG0ZFZzD3rB4Y7P7jEBh38DIe+KxnM4VMttA6zpRRv
	LpJf6/JEVHn5izg/aAmTniPVbPFCFwx99MSS3iQK2HR7AyIboqEft/Y8Drx7hBHvJIJbBMyOTgwxm
	sbqrNNu8r85N0GAm50Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM4R-0000000BQ0m-27m3;
	Mon, 12 Oct 2026 19:52:27 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM4M-0000000BPzG-3WPv;
	Mon, 12 Oct 2026 19:52:26 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 1FDD571FB397; Mon, 12 Oct 2026 21:52:16 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
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
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
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
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v7 1/3] firmware: meson: pass a const buffer to meson_sm_call_write()
Date: Mon, 12 Oct 2026 21:52:08 +0200
Message-ID: <20261012195213.875403-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012195213.875403-1-linkmauve@linkmauve.fr>
References: <20261012195213.875403-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_125223_033018_11DD9028 
X-CRM114-Status: UNSURE (   9.93  )
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

VGhpcyB3YXMgZm91bmQgd2hpbGUgaW50cm9kdWNpbmcgdGhlIG5ldyBudm1lbS1wcm92aWRlciBy
ZWdfd3JpdGVfY29uc3QKY2FsbGJhY2sgaW4gbWVzb25fc21fY2FsbF93cml0ZSgp4oCZcyBvbmx5
IHVzZXIsIGluIG1lc29uLWVmdXNlLgoKU2lnbmVkLW9mZi1ieTogTGluayBNYXV2ZSA8bGlua21h
dXZlQGxpbmttYXV2ZS5mcj4KUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNo
ZXZjaGVua29AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20u
YyAgICAgICB8IDIgKy0KIGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYyAgICAgICAgICAgICB8
IDQgKystLQogaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oIHwgMiArLQog
MyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jIGIvZHJpdmVycy9maXJtd2Fy
ZS9tZXNvbi9tZXNvbl9zbS5jCmluZGV4IGFiOTc1MWE1OWI1NS4uNWQ0ZGEyZTNjM2E5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMKKysrIGIvZHJpdmVycy9m
aXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCkBAIC0xOTYsNyArMTk2LDcgQEAgRVhQT1JUX1NZTUJP
TChtZXNvbl9zbV9jYWxsX3JlYWQpOwogICoKICAqIFJldHVybjoJc2l6ZSBvZiBzZW50IGRhdGEg
b24gc3VjY2VzcywgYSBuZWdhdGl2ZSB2YWx1ZSBvbiBlcnJvcgogICovCi1pbnQgbWVzb25fc21f
Y2FsbF93cml0ZShzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3LCB2b2lkICpidWZmZXIsCitp
bnQgbWVzb25fc21fY2FsbF93cml0ZShzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3LCBjb25z
dCB2b2lkICpidWZmZXIsCiAJCQl1bnNpZ25lZCBpbnQgc2l6ZSwgdW5zaWduZWQgaW50IGNtZF9p
bmRleCwgdTMyIGFyZzAsCiAJCQl1MzIgYXJnMSwgdTMyIGFyZzIsIHUzMiBhcmczLCB1MzIgYXJn
NCkKIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYyBiL2RyaXZlcnMv
bnZtZW0vbWVzb24tZWZ1c2UuYwppbmRleCBkN2Y5YWM5OWEyMTIuLmY3MTg1NGY4OTk1MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jCisrKyBiL2RyaXZlcnMvbnZtZW0v
bWVzb24tZWZ1c2UuYwpAQCAtMjAsNyArMjAsNyBAQCBzdGF0aWMgaW50IG1lc29uX2VmdXNlX3Jl
YWQodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IG9mZnNldCwKIAlzdHJ1Y3QgbWVzb25fc21f
ZmlybXdhcmUgKmZ3ID0gY29udGV4dDsKIAlpbnQgcmV0OwogCi0JcmV0ID0gbWVzb25fc21fY2Fs
bF9yZWFkKGZ3LCAodTggKil2YWwsIGJ5dGVzLCBTTV9FRlVTRV9SRUFELCBvZmZzZXQsCisJcmV0
ID0gbWVzb25fc21fY2FsbF9yZWFkKGZ3LCB2YWwsIGJ5dGVzLCBTTV9FRlVTRV9SRUFELCBvZmZz
ZXQsCiAJCQkJIGJ5dGVzLCAwLCAwLCAwKTsKIAogCXJldHVybiByZXQgPCAwID8gcmV0IDogMDsK
QEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIGludCBtZXNvbl9lZnVzZV93cml0ZSh2b2lkICpjb250
ZXh0LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCXN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAqZncg
PSBjb250ZXh0OwogCWludCByZXQ7CiAKLQlyZXQgPSBtZXNvbl9zbV9jYWxsX3dyaXRlKGZ3LCAo
dTggKil2YWwsIGJ5dGVzLCBTTV9FRlVTRV9XUklURSwgb2Zmc2V0LAorCXJldCA9IG1lc29uX3Nt
X2NhbGxfd3JpdGUoZncsIHZhbCwgYnl0ZXMsIFNNX0VGVVNFX1dSSVRFLCBvZmZzZXQsCiAJCQkJ
ICBieXRlcywgMCwgMCwgMCk7CiAKIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7CmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmggYi9pbmNsdWRlL2xp
bnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKaW5kZXggM2ViYzJiZDlhOTc2Li45MmNjNjFm
M2ExYzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20u
aAorKysgYi9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKQEAgLTIxLDcg
KzIxLDcgQEAgc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlOwogCiBpbnQgbWVzb25fc21fY2FsbChz
dHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3LCB1bnNpZ25lZCBpbnQgY21kX2luZGV4LAogCQkg
IHMzMiAqcmV0LCB1MzIgYXJnMCwgdTMyIGFyZzEsIHUzMiBhcmcyLCB1MzIgYXJnMywgdTMyIGFy
ZzQpOwotaW50IG1lc29uX3NtX2NhbGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpm
dywgdm9pZCAqYnVmZmVyLAoraW50IG1lc29uX3NtX2NhbGxfd3JpdGUoc3RydWN0IG1lc29uX3Nt
X2Zpcm13YXJlICpmdywgY29uc3Qgdm9pZCAqYnVmZmVyLAogCQkJdW5zaWduZWQgaW50IGJfc2l6
ZSwgdW5zaWduZWQgaW50IGNtZF9pbmRleCwgdTMyIGFyZzAsCiAJCQl1MzIgYXJnMSwgdTMyIGFy
ZzIsIHUzMiBhcmczLCB1MzIgYXJnNCk7CiBpbnQgbWVzb25fc21fY2FsbF9yZWFkKHN0cnVjdCBt
ZXNvbl9zbV9maXJtd2FyZSAqZncsIHZvaWQgKmJ1ZmZlciwKLS0gCjIuNTYuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
