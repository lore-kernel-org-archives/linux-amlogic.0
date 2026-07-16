Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F48C4450A
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4gj0q04EefiGQWFv3ruU8O+MFW7ghAcntoajz9YUJuQ=; b=Kyfx/dcn76zuPc
	yBUfSPqRtjkqaxgTU0CFV8qFJfkZxekEjmHIyGqLt380WpRAo4kENu18HDHIy/V9bBv0t6rhUfSWV
	kfVfrf9Oz1PPcEDDwJmT+JPKoqLaNxQTPKVy83rvB1/mL8vZIilJf+H09UO4J+GhSKBasjFljuUH8
	+zcGxRn+nkeUPuXprVLZ0EfHWPLN1dsP3+RAVVoX+ToJsmOdKWHPyik/SZ4Fz4t+guXSkZOI2Yz0M
	JPiwp6UOzx3Pr1Nmts/iANo2T590NGrIDWs6Or4S1W4dmb7HedxxMzJYzp4Hja2yMCDwDnBeQt2Ve
	LvU+2UlwC4vXAzb0Mj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN0v-0000000HTUA-470Q;
	Thu, 16 Jul 2026 14:24:37 +0000
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163] helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN0s-0000000HTTZ-2pf5;
	Thu, 16 Jul 2026 14:24:36 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 62DE9F40D31; Thu, 16 Jul 2026 16:24:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
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
Subject: [PATCH v3 0/4] nvmem: fix a const-unsoundness in reg_write
Date: Thu, 16 Jul 2026 16:24:07 +0200
Message-ID: <20260716142415.28718-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_072434_974621_5893A64D 
X-CRM114-Status: GOOD (  12.86  )
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
CgpUaGFua3MgdG8gdGhlIGd1aWRhbmNlIG9mIEFuZHkgU2hldmNoZW5rbywgdGhpcyBub3cgaW50
cm9kdWNlcyBhIG5ldwpjYWxsYmFjayBhbmQgZGVwcmVjYXRlcyB0aGUgZXhpc3Rpbmcgb25lLCB3
aXRoIHRoZSBnb2FsIG9mIHJlbmFtaW5nIHRoZQpuZXcgb25lIGludG8gdGhlIG9sZCBvbmUgb25j
ZSBubyB1c2VyIHJlbWFpbnMgaW4gdGhlIGtlcm5lbC4KCkNoYW5nZXMgc2luY2UgdjI6Ci0gTGlu
ayB0byB2MjoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC9hbGpBcUJO
VlhWMWFWSnF4QGx1bmEvVC8KLSBSZWJhc2Ugb24gdG9wIG9mIGxpbnV4LW5leHQvbWFzdGVyLgot
IEZpeCBsb2dpYyBlcnJvciB3aGljaCBtYWRlIGFsbCBkZXZpY2VzIHJlYWQtb25seS4KLSBSZW1v
dmUgYSBibGFua2V0IGNhc3Qgb2YgZnVuY3Rpb24gcG9pbnRlcnMgdG8gdm9pZCAqIGluCiAgYXBw
bGUtc3BtaS1udm1lbSAocGF0Y2ggMykuCi0gQWxzbyBmaXggY29uc3RuZXNzIG9mIHdyaXRlIGJ1
ZmZlciBpbiBmaXJtd2FyZTogbWVzb24sIHdoaWNoIGlzIHVzZWQKICBleGNsdXNpdmVseSBieSBt
ZXNvbi1lZnVzZSAocGF0Y2ggNCkuCi0gUmUtcmV2aWV3IGFsbCBjaGFuZ2VzIHRvIG1ha2Ugc3Vy
ZSB0aGUgcGFzc2VkIHR5cGVzIGFyZSBtb3JlIGNvcnJlY3QKICB0aGFuIHRoZXkgd2VyZSBiZWZv
cmUuCi0gQWN0dWFsbHkgdGVzdCB3aXRoIENPTVBJTEVfVEVTVCwgd2hpY2ggSSBmb3Jnb3QgdG8g
ZW5hYmxlIGJlZm9yZeKApgoKQ2hhbmdlcyBzaW5jZSB2MToKLSBMaW5rIHRvIHYxOgogIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNzE1MTc1MjI5LjI0NjcyLTEt
bGlua21hdXZlQGxpbmttYXV2ZS5mci8KLSBSZW1vdmVkIGFsbCBjaGFuZ2VzIHRvIG90aGVyIHN1
YnN5c3RlbXMgdGhhbiBudm1lbS4KLSBBZGRlZCBhIG5ldyByZWdfd3JpdGVfY29uc3QgY2FsbGJh
Y2sgaW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgZXhpc2l0bmcKICByZWdfd3JpdGUuCi0gRGVwcmVj
YXRlZCB0aGUgZXhpc3RpbmcgcmVnX3dyaXRlIGNhbGxiYWNrLCBpdCB3aWxsIGdldCByZW1vdmVk
IG9uY2UKICBhbGwgdXNlcnMgaW4gdGhlIGtlcm5lbCB3aWxsIGJlIGRvbmUgbWlncmF0aW5nIHRv
IHRoZSBuZXcgb25lLgoKTGluayBNYXV2ZSAoNCk6CiAgbnZtZW06IGNvcmU6IGRlcHJlY2F0ZSBy
ZWdfd3JpdGUgY2FsbGJhY2sgYW5kIGFkZCByZWdfd3JpdGVfY29uc3QKICBudm1lbTogbWFrZSBh
bGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNvbnN0IHZvaWQgKgogIG52bWVtOiBhcHBsZS1z
cG1pOiBpbXByb3ZlIGNhbGxpbmcgc2FmZXR5IHdpdGggd3JhcHBlciBmdW5jdGlvbnMKICBmaXJt
d2FyZTogbWVzb246IHBhc3MgYSBjb25zdCBidWZmZXIgdG8gbWVzb25fc21fY2FsbF93cml0ZSgp
CgogZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvbnZtZW0vYXBwbGUtc3BtaS1udm1lbS5jICAgICAgICB8IDE4ICsrKysrKysrKysrKysrLS0K
IGRyaXZlcnMvbnZtZW0vYmNtLW9jb3RwLmMgICAgICAgICAgICAgICB8ICA4ICsrKy0tLS0KIGRy
aXZlcnMvbnZtZW0vY29yZS5jICAgICAgICAgICAgICAgICAgICB8IDI4ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0KIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICAgICAgICAgICB8ICA2
ICsrKy0tLQogZHJpdmVycy9udm1lbS9pbXgtb2NvdHAuYyAgICAgICAgICAgICAgIHwgIDYgKysr
LS0tCiBkcml2ZXJzL252bWVtL2ludGVybmFscy5oICAgICAgICAgICAgICAgfCAgMSArCiBkcml2
ZXJzL252bWVtL2xhbjk2NjItb3RwYy5jICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMv
bnZtZW0vbHBjMTh4eF9lZXByb20uYyAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1l
bS9tYXg3Nzc1OS1udm1lbS5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9tZXNv
bi1lZnVzZS5jICAgICAgICAgICAgIHwgIDggKysrLS0tLQogZHJpdmVycy9udm1lbS9xY29tLXNw
bWktc2RhbS5jICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL3FmcHJvbS5jICAg
ICAgICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vcmF2ZS1zcC1lZXByb20u
YyAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9zbnZzX2xwZ3ByLmMgICAgICAg
ICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9zcHJkLWVmdXNlLmMgICAgICAgICAgICAg
IHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL3N0bTMyLWJzZWMtb3B0ZWUtdGEuYyAgICAgfCAg
MiArLQogZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmggICAgIHwgIDQgKystLQog
ZHJpdmVycy9udm1lbS9zdG0zMi1yb21lbS5jICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tCiBk
cml2ZXJzL252bWVtL3p5bnFtcF9udm1lbS5jICAgICAgICAgICAgfCAgNiArKystLS0KIGluY2x1
ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCB8ICAyICstCiBpbmNsdWRlL2xpbnV4
L252bWVtLXByb3ZpZGVyLmggICAgICAgICAgfCAgNiArKysrKy0KIDIyIGZpbGVzIGNoYW5nZWQs
IDg3IGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiBiODgwOTk2
OWUxZDdhNTkxZTBmNDlkZDQ2NGE1ZDA0YjNjZjAyYWIxCi0tIAoyLjU1LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
