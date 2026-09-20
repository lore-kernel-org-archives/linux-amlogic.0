Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEB5C982DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpoc365hiVmxyHRrX1jC8Pl/pcXWUQZ1ALRrW4LDWR4=; b=06phT3/BZMpTba
	Da9fRhirj0pWCNLRA00hOlbblrQD63QXSL3QSj87faONI0VtlHc2uhLZ3SrckuxHLdgHh3tcEDrNO
	XUUN3Ot73pD11xboo2kKIDOSfwk2l/uG2Z+fQwsOQsAx2oRQLKOP94szQ7gCC8+v7xWKI1YAZ9JJn
	1Z4Qrr5x5Wg1WbpPZnXV95ngf0/2giB4ObZportCD1B2snzxiAha1u146tOQ0ncgcCWRk+WjhzYuV
	CCfV8wI/9KPXVVTVaRbwmdYuvq7SxKX9AD7mif19ePLuFBlXFaFreI1CksGELWetk2Fb1ML7sKlKH
	FFNlvNPWVhJqjOdM34wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FR6-0000000HJRd-0juK;
	Sun, 20 Sep 2026 11:10:20 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FQu-0000000HJMI-3pxV;
	Sun, 20 Sep 2026 11:10:13 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 796D87189A55; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
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
Subject: [PATCH v6 0/4] nvmem: migrate to const void * in reg_write
Date: Sun, 20 Sep 2026 13:09:53 +0200
Message-ID: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041009_121410_52A809AA 
X-CRM114-Status: GOOD (  15.29  )
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
ZSBubyB1c2VyIHJlbWFpbnMgaW4gdGhlIGtlcm5lbC4KCkNoYW5nZXMgc2luY2UgdjU6Ci0gTGlu
ayB0byB2NToKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDgw
NDEzNTk0MC4yMzc4NzM3LTEtbGlua21hdXZlQGxpbmttYXV2ZS5mci9ULwotIEFkZCBhIGRldl93
YXJuKCkgd2hlbiByZWdpc3RlcmluZyBhIG52bWVtIGRyaXZlciB3aXRoIGEgZGVwcmVjYXRlZAog
IHJlZ193cml0ZSBjYWxsYmFjay4KLSBBZGQgYSBmb3VydGggcGF0Y2ggZW5hYmxpbmcgQ09NUElM
RV9URVNUIG9uIHRocmVlIG1vcmUgbnZtZW0gZHJpdmVycywKICB3aGljaCBmb3Jnb3QgdG8gZGVw
ZW5kIG9uIHRoYXQgY29uZmlnLgotIFJlbW92ZSBhIGZldyB1bm5lZWRlZCAodm9pZCAqKSBhbmQg
KGNvbnN0IHZvaWQgKikgY2FzdHMgaW4gY29yZS5jLgoKQ2hhbmdlcyBzaW5jZSB2NDoKLSBMaW5r
IHRvIHY0OgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNzI2
MTMxNzI0LjE1Mjk5LTEtbGlua21hdXZlQGxpbmttYXV2ZS5mci9ULwotIFJlYmFzZSBvbiB0b3Ag
b2YgbGludXgtbmV4dCAyMDI2MDgwMywgdGhlIHByZXZpb3VzIHNlcmllcyBkaWRu4oCZdCBhcHBs
eQogIGFueSBtb3JlIGR1ZSB0byBjaGFuZ2VzIGluIGNvcmUuYy4KLSBBbHNvIGNvbnZlcnQgdGhl
IGF0MjQsIGF0MjUsIGVlcHJvbV85M3h4NDYgYW5kIG0yNGxyIGRyaXZlcnMgdG8gdGhlCiAgbmV3
IHJlZ193cml0ZV9jb25zdCBjYWxsYmFjaywgdGhlc2Ugd2VyZSBtaXNzZWQgYmVjYXVzZSB0aGV5
IGdvdCBtb3ZlZAogIHRvIHRoZSBudm1lbSBkaXJlY3RvcnkgaW4gbGludXgtbmV4dCBiZXR3ZWVu
IHYzIGFuZCB2NC4KCkNoYW5nZXMgc2luY2UgdjM6Ci0gTGluayB0byB2MzoKICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDcxNjE0MjQxNS4yODcxOC0xLWxpbmtt
YXV2ZUBsaW5rbWF1dmUuZnIvVC8KLSBEcm9wIEFwcGxlIFNQTUkgcGF0Y2gsIHdoaWNoIGhhZCBh
bHJlYWR5IGJlZW4gaW5kZXBlbmRlbnRseSBpbmNsdWRlZAogIGluIGxpbnV4LW5leHQgYXMgNzA4
OTE3MGUxZGYxNjBmNWY4ZmIzOTViYzVhYTJlMjY5N2I0ZTg5Ni4KLSBSZXdvcmQgdGhlIGNvdmVy
IGxldHRlcuKAmXMgc3ViamVjdC4KLSBSZW9yZGVyIHRoZSBtZXNvbiBmaXJtd2FyZSBwYXRjaCBi
ZWZvcmUgdGhlIG90aGVyIG9uZXMsIHNvIHRoYXQgZXZlcnkKICBjb21taXQgaXMgYWx3YXlzIHdv
cmtpbmcgY29ycmVjdGx5LgoKQ2hhbmdlcyBzaW5jZSB2MjoKLSBMaW5rIHRvIHYyOgogIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4L2FsakFxQk5WWFYxYVZKcXhAbHVuYS9U
LwotIFJlYmFzZSBvbiB0b3Agb2YgbGludXgtbmV4dC9tYXN0ZXIuCi0gRml4IGxvZ2ljIGVycm9y
IHdoaWNoIG1hZGUgYWxsIGRldmljZXMgcmVhZC1vbmx5LgotIFJlbW92ZSBhIGJsYW5rZXQgY2Fz
dCBvZiBmdW5jdGlvbiBwb2ludGVycyB0byB2b2lkICogaW4KICBhcHBsZS1zcG1pLW52bWVtIChw
YXRjaCAzKS4KLSBBbHNvIGZpeCBjb25zdG5lc3Mgb2Ygd3JpdGUgYnVmZmVyIGluIGZpcm13YXJl
OiBtZXNvbiwgd2hpY2ggaXMgdXNlZAogIGV4Y2x1c2l2ZWx5IGJ5IG1lc29uLWVmdXNlIChwYXRj
aCA0KS4KLSBSZS1yZXZpZXcgYWxsIGNoYW5nZXMgdG8gbWFrZSBzdXJlIHRoZSBwYXNzZWQgdHlw
ZXMgYXJlIG1vcmUgY29ycmVjdAogIHRoYW4gdGhleSB3ZXJlIGJlZm9yZS4KLSBBY3R1YWxseSB0
ZXN0IHdpdGggQ09NUElMRV9URVNULCB3aGljaCBJIGZvcmdvdCB0byBlbmFibGUgYmVmb3Jl4oCm
CgpDaGFuZ2VzIHNpbmNlIHYxOgotIExpbmsgdG8gdjE6CiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcnVzdC1mb3ItbGludXgvMjAyNjA3MTUxNzUyMjkuMjQ2NzItMS1saW5rbWF1dmVAbGlua21h
dXZlLmZyLwotIFJlbW92ZWQgYWxsIGNoYW5nZXMgdG8gb3RoZXIgc3Vic3lzdGVtcyB0aGFuIG52
bWVtLgotIEFkZGVkIGEgbmV3IHJlZ193cml0ZV9jb25zdCBjYWxsYmFjayBpbnN0ZWFkIG9mIGNo
YW5naW5nIHRoZSBleGlzaXRuZwogIHJlZ193cml0ZS4KLSBEZXByZWNhdGVkIHRoZSBleGlzdGlu
ZyByZWdfd3JpdGUgY2FsbGJhY2ssIGl0IHdpbGwgZ2V0IHJlbW92ZWQgb25jZQogIGFsbCB1c2Vy
cyBpbiB0aGUga2VybmVsIHdpbGwgYmUgZG9uZSBtaWdyYXRpbmcgdG8gdGhlIG5ldyBvbmUuCgpM
aW5rIE1hdXZlICg0KToKICBmaXJtd2FyZTogbWVzb246IHBhc3MgYSBjb25zdCBidWZmZXIgdG8g
bWVzb25fc21fY2FsbF93cml0ZSgpCiAgbnZtZW06IGNvcmU6IGRlcHJlY2F0ZSByZWdfd3JpdGUg
Y2FsbGJhY2sgd2l0aCByZWdfd3JpdGVfY29uc3QKICBudm1lbTogbWFrZSBhbGwgcmVnX3dyaXRl
IGNhbGxiYWNrcyB0YWtlIGNvbnN0IHZvaWQgKgogIG52bWVtOiBlbmFibGUgQ09NUElMRV9URVNU
IGZvciBtb3JlIGRyaXZlcnMKCiBkcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMgICAg
ICAgfCAgMiArLQogZHJpdmVycy9udm1lbS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgIDYg
KysrLS0tCiBkcml2ZXJzL252bWVtL2FwcGxlLXNwbWktbnZtZW0uYyAgICAgICAgfCAgNCArKy0t
CiBkcml2ZXJzL252bWVtL2F0MjQuYyAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KIGRy
aXZlcnMvbnZtZW0vYXQyNS5jICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMv
bnZtZW0vYmNtLW9jb3RwLmMgICAgICAgICAgICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJzL252
bWVtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrLS0tLS0t
LS0tCiBkcml2ZXJzL252bWVtL2VlcHJvbV85M3h4NDYuYyAgICAgICAgICAgfCAgNiArKystLS0K
IGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJp
dmVycy9udm1lbS9pbXgtb2NvdHAuYyAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJz
L252bWVtL2ludGVybmFscy5oICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL252bWVtL2xh
bjk2NjItb3RwYy5jICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vbHBjMTh4
eF9lZXByb20uYyAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9tMjRsci5jICAg
ICAgICAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9tYXg3Nzc1OS1udm1lbS5j
ICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jICAgICAgICAg
ICAgIHwgIDggKysrKy0tLS0KIGRyaXZlcnMvbnZtZW0vcWNvbS1zcG1pLXNkYW0uYyAgICAgICAg
ICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9xZnByb20uYyAgICAgICAgICAgICAgICAgIHwg
IDYgKysrLS0tCiBkcml2ZXJzL252bWVtL3JhdmUtc3AtZWVwcm9tLmMgICAgICAgICAgfCAgNiAr
KystLS0KIGRyaXZlcnMvbnZtZW0vc252c19scGdwci5jICAgICAgICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvbnZtZW0vc3ByZC1lZnVzZS5jICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJp
dmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmMgICAgIHwgIDIgKy0KIGRyaXZlcnMvbnZt
ZW0vc3RtMzItYnNlYy1vcHRlZS10YS5oICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbnZtZW0vc3Rt
MzItcm9tZW0uYyAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvbnZtZW0venlu
cW1wX252bWVtLmMgICAgICAgICAgICB8ICA2ICsrKy0tLQogaW5jbHVkZS9saW51eC9maXJtd2Fy
ZS9tZXNvbi9tZXNvbl9zbS5oIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIu
aCAgICAgICAgICB8ICA2ICsrKysrLQogMjcgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygr
KSwgNzQgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDNmMjQyNWY1YjViYmJkZDk5MWNhOWNk
ZmQ1NTAyZTY4ZDg4OTU5OTgKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
