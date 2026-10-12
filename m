Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8C1CC6B02
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gqYbU4LFCkRPAzf184hfmPy69V6OFbJN7jOgQIdRkjk=; b=w9WtnxpJFviUwX
	IcGJo/0wmbsFzoSrC9PzTMqJb/arPiCpWA+nHuPq//RDb7KFaS+YooXHftnUzZMKCbZrONdBEi/RU
	J47alZ7ZiWbD0iaMGQlSANdpF5s3VPRK7cxE6Mw5YVM01l5o3BiUFoI5+RVMSeex61W9xPOetl4rG
	sfk+1LduuioealhneWybZ+gO7p0D8Ygxi1wELk03zNHLaxsJExJSIDUYj0kHUom61kq9Z+viBqQJY
	JMh+UZPH9OYQwAT4fcPJVWxneUsX6SAMTQ2O0FoTDC4NqBhFJm8vrISEJ/Mxyl1NuojP7PafYpjAJ
	Ditw5ggPozekSbmGyCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM4V-0000000BQ3L-3uz1;
	Mon, 12 Oct 2026 19:52:31 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM4M-0000000BPzI-3U0f;
	Mon, 12 Oct 2026 19:52:27 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 1AC0F71FB393; Mon, 12 Oct 2026 21:52:16 +0200 (CEST)
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
Subject: [PATCH v7 0/3] nvmem: migrate to const void * in reg_write
Date: Mon, 12 Oct 2026 21:52:07 +0200
Message-ID: <20261012195213.875403-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_125223_028237_C75AB8ED 
X-CRM114-Status: GOOD (  15.94  )
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
ZSBubyB1c2VyIHJlbWFpbnMgaW4gdGhlIGtlcm5lbC4KCkNoYW5nZXMgc2luY2UgdjY6Ci0gTGlu
ayB0byB2NjoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDky
MDExMTAwMC4yNDA0MTMxLTEtbGlua21hdXZlQGxpbmttYXV2ZS5mci9ULwotIFJlYmFzZSBvbiB0
b3Agb2YgbGludXgtbmV4dCAyMDI2MTAxMiwgd2hpY2ggaGFkIGEgZmV3IGNoYW5nZXMgaW4KICBj
b3JlLmMuCi0gRHJvcCB0aGUgZm91cnRoIHBhdGNoLCB0aGUgQ09NUElMRV9URVNUIGZpeCwgc2lu
Y2UgaXQgd2FzIHVucmV2aWV3ZWQKICBhbmQgY2FuIGdvIGludG8gaXRzIG93biBzZXJpZXMuCi0g
Rml4IGEgcG90ZW50aWFsIGJ1ZyBmb3VuZCBieSBhIGJvdCwgaW4gdGhlIHJlcG9ydGVkIG5hbWUg
b2YgdGhlCiAgZGV2X3dhcm4oKS4KLSBBZGQgdGhlIGNvbGxlY3RlZCBSZXZpZXdlZC1ieSB0YWcu
CgpDaGFuZ2VzIHNpbmNlIHY1OgotIExpbmsgdG8gdjU6CiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcnVzdC1mb3ItbGludXgvMjAyNjA4MDQxMzU5NDAuMjM3ODczNy0xLWxpbmttYXV2ZUBsaW5r
bWF1dmUuZnIvVC8KLSBBZGQgYSBkZXZfd2FybigpIHdoZW4gcmVnaXN0ZXJpbmcgYSBudm1lbSBk
cml2ZXIgd2l0aCBhIGRlcHJlY2F0ZWQKICByZWdfd3JpdGUgY2FsbGJhY2suCi0gQWRkIGEgZm91
cnRoIHBhdGNoIGVuYWJsaW5nIENPTVBJTEVfVEVTVCBvbiB0aHJlZSBtb3JlIG52bWVtIGRyaXZl
cnMsCiAgd2hpY2ggZm9yZ290IHRvIGRlcGVuZCBvbiB0aGF0IGNvbmZpZy4KLSBSZW1vdmUgYSBm
ZXcgdW5uZWVkZWQgKHZvaWQgKikgYW5kIChjb25zdCB2b2lkICopIGNhc3RzIGluIGNvcmUuYy4K
CkNoYW5nZXMgc2luY2UgdjQ6Ci0gTGluayB0byB2NDoKICBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9ydXN0LWZvci1saW51eC8yMDI2MDcyNjEzMTcyNC4xNTI5OS0xLWxpbmttYXV2ZUBsaW5rbWF1
dmUuZnIvVC8KLSBSZWJhc2Ugb24gdG9wIG9mIGxpbnV4LW5leHQgMjAyNjA4MDMsIHRoZSBwcmV2
aW91cyBzZXJpZXMgZGlkbuKAmXQgYXBwbHkKICBhbnkgbW9yZSBkdWUgdG8gY2hhbmdlcyBpbiBj
b3JlLmMuCi0gQWxzbyBjb252ZXJ0IHRoZSBhdDI0LCBhdDI1LCBlZXByb21fOTN4eDQ2IGFuZCBt
MjRsciBkcml2ZXJzIHRvIHRoZQogIG5ldyByZWdfd3JpdGVfY29uc3QgY2FsbGJhY2ssIHRoZXNl
IHdlcmUgbWlzc2VkIGJlY2F1c2UgdGhleSBnb3QgbW92ZWQKICB0byB0aGUgbnZtZW0gZGlyZWN0
b3J5IGluIGxpbnV4LW5leHQgYmV0d2VlbiB2MyBhbmQgdjQuCgpDaGFuZ2VzIHNpbmNlIHYzOgot
IExpbmsgdG8gdjM6CiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAy
NjA3MTYxNDI0MTUuMjg3MTgtMS1saW5rbWF1dmVAbGlua21hdXZlLmZyL1QvCi0gRHJvcCBBcHBs
ZSBTUE1JIHBhdGNoLCB3aGljaCBoYWQgYWxyZWFkeSBiZWVuIGluZGVwZW5kZW50bHkgaW5jbHVk
ZWQKICBpbiBsaW51eC1uZXh0IGFzIDcwODkxNzBlMWRmMTYwZjVmOGZiMzk1YmM1YWEyZTI2OTdi
NGU4OTYuCi0gUmV3b3JkIHRoZSBjb3ZlciBsZXR0ZXLigJlzIHN1YmplY3QuCi0gUmVvcmRlciB0
aGUgbWVzb24gZmlybXdhcmUgcGF0Y2ggYmVmb3JlIHRoZSBvdGhlciBvbmVzLCBzbyB0aGF0IGV2
ZXJ5CiAgY29tbWl0IGlzIGFsd2F5cyB3b3JraW5nIGNvcnJlY3RseS4KCkNoYW5nZXMgc2luY2Ug
djI6Ci0gTGluayB0byB2MjoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51
eC9hbGpBcUJOVlhWMWFWSnF4QGx1bmEvVC8KLSBSZWJhc2Ugb24gdG9wIG9mIGxpbnV4LW5leHQv
bWFzdGVyLgotIEZpeCBsb2dpYyBlcnJvciB3aGljaCBtYWRlIGFsbCBkZXZpY2VzIHJlYWQtb25s
eS4KLSBSZW1vdmUgYSBibGFua2V0IGNhc3Qgb2YgZnVuY3Rpb24gcG9pbnRlcnMgdG8gdm9pZCAq
IGluCiAgYXBwbGUtc3BtaS1udm1lbSAocGF0Y2ggMykuCi0gQWxzbyBmaXggY29uc3RuZXNzIG9m
IHdyaXRlIGJ1ZmZlciBpbiBmaXJtd2FyZTogbWVzb24sIHdoaWNoIGlzIHVzZWQKICBleGNsdXNp
dmVseSBieSBtZXNvbi1lZnVzZSAocGF0Y2ggNCkuCi0gUmUtcmV2aWV3IGFsbCBjaGFuZ2VzIHRv
IG1ha2Ugc3VyZSB0aGUgcGFzc2VkIHR5cGVzIGFyZSBtb3JlIGNvcnJlY3QKICB0aGFuIHRoZXkg
d2VyZSBiZWZvcmUuCi0gQWN0dWFsbHkgdGVzdCB3aXRoIENPTVBJTEVfVEVTVCwgd2hpY2ggSSBm
b3Jnb3QgdG8gZW5hYmxlIGJlZm9yZeKApgoKQ2hhbmdlcyBzaW5jZSB2MToKLSBMaW5rIHRvIHYx
OgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNzE1MTc1MjI5
LjI0NjcyLTEtbGlua21hdXZlQGxpbmttYXV2ZS5mci8KLSBSZW1vdmVkIGFsbCBjaGFuZ2VzIHRv
IG90aGVyIHN1YnN5c3RlbXMgdGhhbiBudm1lbS4KLSBBZGRlZCBhIG5ldyByZWdfd3JpdGVfY29u
c3QgY2FsbGJhY2sgaW5zdGVhZCBvZiBjaGFuZ2luZyB0aGUgZXhpc2l0bmcKICByZWdfd3JpdGUu
Ci0gRGVwcmVjYXRlZCB0aGUgZXhpc3RpbmcgcmVnX3dyaXRlIGNhbGxiYWNrLCBpdCB3aWxsIGdl
dCByZW1vdmVkIG9uY2UKICBhbGwgdXNlcnMgaW4gdGhlIGtlcm5lbCB3aWxsIGJlIGRvbmUgbWln
cmF0aW5nIHRvIHRoZSBuZXcgb25lLgoKTGluayBNYXV2ZSAoMyk6CiAgZmlybXdhcmU6IG1lc29u
OiBwYXNzIGEgY29uc3QgYnVmZmVyIHRvIG1lc29uX3NtX2NhbGxfd3JpdGUoKQogIG52bWVtOiBj
b3JlOiBkZXByZWNhdGUgcmVnX3dyaXRlIGNhbGxiYWNrIHdpdGggcmVnX3dyaXRlX2NvbnN0CiAg
bnZtZW06IG1ha2UgYWxsIHJlZ193cml0ZSBjYWxsYmFja3MgdGFrZSBjb25zdCB2b2lkICoKCiBk
cml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgICAgICAgfCAgMiArLQogZHJpdmVycy9u
dm1lbS9hcHBsZS1zcG1pLW52bWVtLmMgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9h
dDI0LmMgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL2F0MjUu
YyAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL252bWVtL2JjbS1vY290cC5j
ICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9udm1lbS9jb3JlLmMgICAgICAg
ICAgICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9udm1l
bS9lZXByb21fOTN4eDQ2LmMgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL2lt
eC1vY290cC1zY3UuYyAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vaW14LW9j
b3RwLmMgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9pbnRlcm5hbHMu
aCAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9udm1lbS9sYW45NjYyLW90cGMuYyAgICAg
ICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL2xwYzE4eHhfZWVwcm9tLmMgICAgICAg
ICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vbTI0bHIuYyAgICAgICAgICAgICAgICAgICB8
ICA0ICsrLS0KIGRyaXZlcnMvbnZtZW0vbWF4Nzc3NTktbnZtZW0uYyAgICAgICAgICB8ICA0ICsr
LS0KIGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYyAgICAgICAgICAgICB8ICA4ICsrKystLS0t
CiBkcml2ZXJzL252bWVtL3Fjb20tc3BtaS1zZGFtLmMgICAgICAgICAgfCAgNiArKystLS0KIGRy
aXZlcnMvbnZtZW0vcWZwcm9tLmMgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVy
cy9udm1lbS9yYXZlLXNwLWVlcHJvbS5jICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252
bWVtL3NudnNfbHBncHIuYyAgICAgICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL252bWVtL3Nw
cmQtZWZ1c2UuYyAgICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vc3RtMzIt
YnNlYy1vcHRlZS10YS5jICAgICB8ICAyICstCiBkcml2ZXJzL252bWVtL3N0bTMyLWJzZWMtb3B0
ZWUtdGEuaCAgICAgfCAgNCArKy0tCiBkcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMgICAgICAg
ICAgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJzL252bWVtL3p5bnFtcF9udm1lbS5jICAgICAg
ICAgICAgfCAgNiArKystLS0KIGluY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20u
aCB8ICAyICstCiBpbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggICAgICAgICAgfCAgNiAr
KysrKy0KIDI2IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygt
KQoKCmJhc2UtY29tbWl0OiA0ZWIyNTg2YmQ0MGRiMjdkNzdjYzViNzI0Y2E5Mzg2ZWQwYzcxZDUz
Ci0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
