Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E115BC982DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 11:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZexRpJ6QZWk9h8/+gaoJVk+bfCL1rQNPnQXX3rbelo=; b=w9QmUXpo67G2bf
	QVnVNoEv9M0D55TaO7d/Jki5F2wqQnF46f1Leevcv7ic+P3i++nfYu6EpRzTbd6/K/4x2yO8RgIgD
	GV6Ix9VM9WHkIprlV3W7lZ8/UsFm9Umw8vAzL4aT/ZAVEL2Kz7dQNgAeDieF1S+ClH//twTpqmlih
	USXNkfuQji/kAsTgMFltq7UjR/jDtHYpq4aB8zov2exABawNSlal6HVWwloiP6xylV8Wdb75vPBfC
	A4tPKlxyo6CKj7fyDbEwQ7r9ExG68+cJZnWZ2W4joBpuGv6b0ofcbj2JGyztOa0y6HrPWxVujq0dY
	MYd3jTW2xZPA5hzgZmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FQz-0000000HJO2-2wKm;
	Sun, 20 Sep 2026 11:10:13 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FQu-0000000HJMN-3nQB;
	Sun, 20 Sep 2026 11:10:12 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 8E1657189A61; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
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
Subject: [PATCH v6 4/4] nvmem: enable COMPILE_TEST for more drivers
Date: Sun, 20 Sep 2026 13:09:57 +0200
Message-ID: <20260920111000.2404131-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041009_102371_962F7123 
X-CRM114-Status: GOOD (  11.48  )
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

VGhyZWUgZHJpdmVycyBoYWQgYSBkZXBlbmRzIG9uIEFSQ0hfKiwgYnV0IGRpZG7igJl0IGFsc28g
Y29tcGlsZSB3aGVuCkNPTVBJTEVfVEVTVCBpcyBlbmFibGVkLCBtYWtpbmcgaXQgaGFyZGVyIHRo
YW4gaXQgc2hvdWxkIGJlIHRvIHRlc3QKdGhlbS4KClNvbWUgb3RoZXIgZHJpdmVycyBhbHNvIGRv
buKAmXQgaGF2ZSBhIENPTVBJTEVfVEVTVCwgYnV0IHRob3NlIGhhdmUKYWRkaXRpb25hbCBkZXBl
bmRlbmNpZXMgYW5kIEkgZGlkbuKAmXQgd2FudCB0byBpbnZlc3RpZ2F0ZSB0b28gbXVjaC4KClNp
Z25lZC1vZmYtYnk6IExpbmsgTWF1dmUgPGxpbmttYXV2ZUBsaW5rbWF1dmUuZnI+Ci0tLQogZHJp
dmVycy9udm1lbS9LY29uZmlnIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9LY29uZmln
IGIvZHJpdmVycy9udm1lbS9LY29uZmlnCmluZGV4IGMzNmMyYTRjMmEwYi4uZDM4MDk3ZDY2NDhi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWVtL0tjb25maWcKKysrIGIvZHJpdmVycy9udm1lbS9L
Y29uZmlnCkBAIC0zNTQsNyArMzU0LDcgQEAgY29uZmlnIE5WTUVNX05JTlRFTkRPX09UUAogCiBj
b25maWcgTlZNRU1fUzMyR19PQ09UUAogCXRyaXN0YXRlICJTMzJHIFNvQyBPQ09UUCBzdXBwb3J0
IgotCWRlcGVuZHMgb24gQVJDSF9TMzIKKwlkZXBlbmRzIG9uIEFSQ0hfUzMyIHx8IENPTVBJTEVf
VEVTVAogCWhlbHAKIAkgIFRoaXMgaXMgYSBkcml2ZXIgZm9yIHRoZSAnT0NPVFAnIHBlcmlwaGVy
YWwgYXZhaWxhYmxlIG9uIFMzMkcKIAkgIHBsYXRmb3Jtcy4KQEAgLTUxOCw3ICs1MTgsNyBAQCBj
b25maWcgTlZNRU1fU1VOUExVU19PQ09UUAogCiBjb25maWcgTlZNRU1fU1VOWElfU0lECiAJdHJp
c3RhdGUgIkFsbHdpbm5lciBTb0NzIFNJRCBzdXBwb3J0IgotCWRlcGVuZHMgb24gQVJDSF9TVU5Y
SQorCWRlcGVuZHMgb24gQVJDSF9TVU5YSSB8fCBDT01QSUxFX1RFU1QKIAloZWxwCiAJICBUaGlz
IGlzIGEgZHJpdmVyIGZvciB0aGUgJ3NlY3VyaXR5IElEJyBhdmFpbGFibGUgb24gdmFyaW91cyBB
bGx3aW5uZXIKIAkgIGRldmljZXMuCkBAIC01NjMsNyArNTYzLDcgQEAgY29uZmlnIE5WTUVNX1ZG
NjEwX09DT1RQCiAKIGNvbmZpZyBOVk1FTV9aWU5RTVAKIAl0cmlzdGF0ZSAiWGlsaW54IFpZTlFN
UCBTb0MgbnZtZW0gZmlybXdhcmUgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIEFSQ0hfWllOUU1QCisJ
ZGVwZW5kcyBvbiBBUkNIX1pZTlFNUCB8fCBDT01QSUxFX1RFU1QKIAloZWxwCiAJICBUaGlzIGlz
IGEgZHJpdmVyIHRvIGFjY2VzcyBoYXJkd2FyZSByZWxhdGVkIGRhdGEgbGlrZQogCSAgc29jIHJl
dmlzaW9uLCBJRENPREUuLi4gZXRjIGJ5IHVzaW5nIHRoZSBmaXJtd2FyZQotLSAKMi41NS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
