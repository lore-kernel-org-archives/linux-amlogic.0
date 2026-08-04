Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE54DC55184
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Aug 2026 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGucwye0oMFJ1ZA6T2LlG3wx0UEXaLT1oY++SW6hnBg=; b=3IwGCRW4BoK/Zb
	BnR1csPZWKj1qmc+7meeqvrMzLnPWg/DDeBTRvF9osadTpvyv4+mhhH5CL8C9C0jPSmLEQlbL2l4K
	bgAhl6R+WksUjn3fEfJ6BU2CN7EsMAdrflE4banOE0WerUYlhL0Ttf+GbuVc6E7N7TLDYmNOzLbpN
	QEN+DlEq8tmgFEnbNyZSPM6AISrEsIuNc9CgRq7slBCOA8h3+M0iH54u4m4QeHPv/cZHZLYv5xsSV
	B0tkBpR9QtWDevbT5KNadVJVhBu19IvUbtQIuad7C+/bXb+hrAZZHvjv+pc6RrtZgfyobnk8OYthn
	u2bgh9diU3uIE56Td1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFgO-00000001z3G-1AQk;
	Tue, 04 Aug 2026 13:59:52 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFgJ-00000001z0R-3pbD;
	Tue, 04 Aug 2026 13:59:50 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 4C1C870A0552; Tue, 04 Aug 2026 15:59:42 +0200 (CEST)
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
Subject: [PATCH v5 1/3] firmware: meson: pass a const buffer to meson_sm_call_write()
Date: Tue,  4 Aug 2026 15:59:35 +0200
Message-ID: <20260804135940.2378737-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_065948_103757_393CE23B 
X-CRM114-Status: GOOD (  10.73  )
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
dXZlQGxpbmttYXV2ZS5mcj4KLS0tCiBkcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMg
ICAgICAgfCAyICstCiBkcml2ZXJzL252bWVtL21lc29uLWVmdXNlLmMgICAgICAgICAgICAgfCA0
ICsrLS0KIGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCB8IDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYyBiL2RyaXZlcnMvZmlybXdhcmUv
bWVzb24vbWVzb25fc20uYwppbmRleCBhYjk3NTFhNTliNTUuLjVkNGRhMmUzYzNhOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCisrKyBiL2RyaXZlcnMvZmly
bXdhcmUvbWVzb24vbWVzb25fc20uYwpAQCAtMTk2LDcgKzE5Niw3IEBAIEVYUE9SVF9TWU1CT0wo
bWVzb25fc21fY2FsbF9yZWFkKTsKICAqCiAgKiBSZXR1cm46CXNpemUgb2Ygc2VudCBkYXRhIG9u
IHN1Y2Nlc3MsIGEgbmVnYXRpdmUgdmFsdWUgb24gZXJyb3IKICAqLwotaW50IG1lc29uX3NtX2Nh
bGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgdm9pZCAqYnVmZmVyLAoraW50
IG1lc29uX3NtX2NhbGxfd3JpdGUoc3RydWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgY29uc3Qg
dm9pZCAqYnVmZmVyLAogCQkJdW5zaWduZWQgaW50IHNpemUsIHVuc2lnbmVkIGludCBjbWRfaW5k
ZXgsIHUzMiBhcmcwLAogCQkJdTMyIGFyZzEsIHUzMiBhcmcyLCB1MzIgYXJnMywgdTMyIGFyZzQp
CiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL21lc29uLWVmdXNlLmMgYi9kcml2ZXJzL252
bWVtL21lc29uLWVmdXNlLmMKaW5kZXggZDdmOWFjOTlhMjEyLi5mNzE4NTRmODk5NTAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYworKysgYi9kcml2ZXJzL252bWVtL21l
c29uLWVmdXNlLmMKQEAgLTIwLDcgKzIwLDcgQEAgc3RhdGljIGludCBtZXNvbl9lZnVzZV9yZWFk
KHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJc3RydWN0IG1lc29uX3NtX2Zp
cm13YXJlICpmdyA9IGNvbnRleHQ7CiAJaW50IHJldDsKIAotCXJldCA9IG1lc29uX3NtX2NhbGxf
cmVhZChmdywgKHU4ICopdmFsLCBieXRlcywgU01fRUZVU0VfUkVBRCwgb2Zmc2V0LAorCXJldCA9
IG1lc29uX3NtX2NhbGxfcmVhZChmdywgdmFsLCBieXRlcywgU01fRUZVU0VfUkVBRCwgb2Zmc2V0
LAogCQkJCSBieXRlcywgMCwgMCwgMCk7CiAKIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7CkBA
IC0zMiw3ICszMiw3IEBAIHN0YXRpYyBpbnQgbWVzb25fZWZ1c2Vfd3JpdGUodm9pZCAqY29udGV4
dCwgdW5zaWduZWQgaW50IG9mZnNldCwKIAlzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmUgKmZ3ID0g
Y29udGV4dDsKIAlpbnQgcmV0OwogCi0JcmV0ID0gbWVzb25fc21fY2FsbF93cml0ZShmdywgKHU4
ICopdmFsLCBieXRlcywgU01fRUZVU0VfV1JJVEUsIG9mZnNldCwKKwlyZXQgPSBtZXNvbl9zbV9j
YWxsX3dyaXRlKGZ3LCB2YWwsIGJ5dGVzLCBTTV9FRlVTRV9XUklURSwgb2Zmc2V0LAogCQkJCSAg
Ynl0ZXMsIDAsIDAsIDApOwogCiAJcmV0dXJuIHJldCA8IDAgPyByZXQgOiAwOwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oIGIvaW5jbHVkZS9saW51
eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCmluZGV4IDNlYmMyYmQ5YTk3Ni4uOTJjYzYxZjNh
MWMwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgK
KysrIGIvaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oCkBAIC0yMSw3ICsy
MSw3IEBAIHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZTsKIAogaW50IG1lc29uX3NtX2NhbGwoc3Ry
dWN0IG1lc29uX3NtX2Zpcm13YXJlICpmdywgdW5zaWduZWQgaW50IGNtZF9pbmRleCwKIAkJICBz
MzIgKnJldCwgdTMyIGFyZzAsIHUzMiBhcmcxLCB1MzIgYXJnMiwgdTMyIGFyZzMsIHUzMiBhcmc0
KTsKLWludCBtZXNvbl9zbV9jYWxsX3dyaXRlKHN0cnVjdCBtZXNvbl9zbV9maXJtd2FyZSAqZncs
IHZvaWQgKmJ1ZmZlciwKK2ludCBtZXNvbl9zbV9jYWxsX3dyaXRlKHN0cnVjdCBtZXNvbl9zbV9m
aXJtd2FyZSAqZncsIGNvbnN0IHZvaWQgKmJ1ZmZlciwKIAkJCXVuc2lnbmVkIGludCBiX3NpemUs
IHVuc2lnbmVkIGludCBjbWRfaW5kZXgsIHUzMiBhcmcwLAogCQkJdTMyIGFyZzEsIHUzMiBhcmcy
LCB1MzIgYXJnMywgdTMyIGFyZzQpOwogaW50IG1lc29uX3NtX2NhbGxfcmVhZChzdHJ1Y3QgbWVz
b25fc21fZmlybXdhcmUgKmZ3LCB2b2lkICpidWZmZXIsCi0tIAoyLjU1LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
