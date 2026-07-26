Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DF8C53200
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OclmR21VGpRLUDZ0DV4km/2VWdivMbFAOQvvBcf3PbU=; b=dmzUGoX9RP3r1I
	+6DtheryllqhUtHd1XBGQxzcUTkePw5cRqKL0tofQfeOfYKo1Rfi5MHG4hYn7FUY35COFsOvp7cRH
	rM+qXTDTH5ppKx6z6hssmGcHeoPa8QLFVO5BRXEOLTs7LebcNQSWZaHieh3Gw9V2NM3htdHoq9teA
	NlR7Gr1JrtIJfZWbEWhDkPVkYkXwo+Yocnnu1+iIuxbJqO8Q7m5fNUZMqY5B/iNiAmzjL/z5bH0uT
	R6wPlnxl3zPYXrM3N1K+HQ2nrrmKYobq2+/KZxeEuY8RWvYXjUcEfreiZXjZ8FgTKlk/KpbhMAk15
	wV4BfuIwrzcs74vtE8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyjc-00000001Bry-0G9k;
	Sun, 26 Jul 2026 13:17:40 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyjZ-00000001BrI-2cPd;
	Sun, 26 Jul 2026 13:17:39 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id AA003F40DC6; Sun, 26 Jul 2026 15:17:28 +0200 (CEST)
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
Subject: [PATCH v4 0/3] nvmem: migrate to const void * in reg_write
Date: Sun, 26 Jul 2026 15:17:18 +0200
Message-ID: <20260726131724.15299-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_061737_826580_51D956F8 
X-CRM114-Status: GOOD (  12.85  )
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
ZSBubyB1c2VyIHJlbWFpbnMgaW4gdGhlIGtlcm5lbC4KCkNoYW5nZXMgc2luY2UgdjM6Ci0gTGlu
ayB0byB2MzoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDcx
NjE0MjQxNS4yODcxOC0xLWxpbmttYXV2ZUBsaW5rbWF1dmUuZnIvVC8KLSBEcm9wIEFwcGxlIFNQ
TUkgcGF0Y2gsIHdoaWNoIGhhZCBhbHJlYWR5IGJlZW4gaW5kZXBlbmRlbnRseSBpbmNsdWRlZAog
IGluIGxpbnV4LW5leHQgYXMgNzA4OTE3MGUxZGYxNjBmNWY4ZmIzOTViYzVhYTJlMjY5N2I0ZTg5
Ni4KLSBSZXdvcmQgdGhlIGNvdmVyIGxldHRlcuKAmXMgc3ViamVjdC4KLSBSZW9yZGVyIHRoZSBt
ZXNvbiBmaXJtd2FyZSBwYXRjaCBiZWZvcmUgdGhlIG90aGVyIG9uZXMsIHNvIHRoYXQgZXZlcnkK
ICBjb21taXQgaXMgYWx3YXlzIHdvcmtpbmcgY29ycmVjdGx5LgoKQ2hhbmdlcyBzaW5jZSB2MjoK
LSBMaW5rIHRvIHYyOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4L2Fs
akFxQk5WWFYxYVZKcXhAbHVuYS9ULwotIFJlYmFzZSBvbiB0b3Agb2YgbGludXgtbmV4dC9tYXN0
ZXIuCi0gRml4IGxvZ2ljIGVycm9yIHdoaWNoIG1hZGUgYWxsIGRldmljZXMgcmVhZC1vbmx5Lgot
IFJlbW92ZSBhIGJsYW5rZXQgY2FzdCBvZiBmdW5jdGlvbiBwb2ludGVycyB0byB2b2lkICogaW4K
ICBhcHBsZS1zcG1pLW52bWVtIChwYXRjaCAzKS4KLSBBbHNvIGZpeCBjb25zdG5lc3Mgb2Ygd3Jp
dGUgYnVmZmVyIGluIGZpcm13YXJlOiBtZXNvbiwgd2hpY2ggaXMgdXNlZAogIGV4Y2x1c2l2ZWx5
IGJ5IG1lc29uLWVmdXNlIChwYXRjaCA0KS4KLSBSZS1yZXZpZXcgYWxsIGNoYW5nZXMgdG8gbWFr
ZSBzdXJlIHRoZSBwYXNzZWQgdHlwZXMgYXJlIG1vcmUgY29ycmVjdAogIHRoYW4gdGhleSB3ZXJl
IGJlZm9yZS4KLSBBY3R1YWxseSB0ZXN0IHdpdGggQ09NUElMRV9URVNULCB3aGljaCBJIGZvcmdv
dCB0byBlbmFibGUgYmVmb3Jl4oCmCgpDaGFuZ2VzIHNpbmNlIHYxOgotIExpbmsgdG8gdjE6CiAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNjA3MTUxNzUyMjkuMjQ2
NzItMS1saW5rbWF1dmVAbGlua21hdXZlLmZyLwotIFJlbW92ZWQgYWxsIGNoYW5nZXMgdG8gb3Ro
ZXIgc3Vic3lzdGVtcyB0aGFuIG52bWVtLgotIEFkZGVkIGEgbmV3IHJlZ193cml0ZV9jb25zdCBj
YWxsYmFjayBpbnN0ZWFkIG9mIGNoYW5naW5nIHRoZSBleGlzaXRuZwogIHJlZ193cml0ZS4KLSBE
ZXByZWNhdGVkIHRoZSBleGlzdGluZyByZWdfd3JpdGUgY2FsbGJhY2ssIGl0IHdpbGwgZ2V0IHJl
bW92ZWQgb25jZQogIGFsbCB1c2VycyBpbiB0aGUga2VybmVsIHdpbGwgYmUgZG9uZSBtaWdyYXRp
bmcgdG8gdGhlIG5ldyBvbmUuCgpMaW5rIE1hdXZlICgzKToKICBmaXJtd2FyZTogbWVzb246IHBh
c3MgYSBjb25zdCBidWZmZXIgdG8gbWVzb25fc21fY2FsbF93cml0ZSgpCiAgbnZtZW06IGNvcmU6
IGRlcHJlY2F0ZSByZWdfd3JpdGUgY2FsbGJhY2sgYW5kIGFkZCByZWdfd3JpdGVfY29uc3QKICBu
dm1lbTogbWFrZSBhbGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNvbnN0IHZvaWQgKgoKIGRy
aXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYyAgICAgICB8ICAyICstCiBkcml2ZXJzL252
bWVtL2FwcGxlLXNwbWktbnZtZW0uYyAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL252bWVtL2Jj
bS1vY290cC5jICAgICAgICAgICAgICAgfCAgOCArKystLS0tCiBkcml2ZXJzL252bWVtL2NvcmUu
YyAgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiBkcml2
ZXJzL252bWVtL2lteC1vY290cC1zY3UuYyAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMv
bnZtZW0vaW14LW9jb3RwLmMgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1l
bS9pbnRlcm5hbHMuaCAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9udm1lbS9sYW45NjYy
LW90cGMuYyAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL2xwYzE4eHhfZWVw
cm9tLmMgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vbWF4Nzc3NTktbnZtZW0u
YyAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbnZtZW0vbWVzb24tZWZ1c2UuYyAgICAgICAg
ICAgICB8ICA4ICsrKy0tLS0KIGRyaXZlcnMvbnZtZW0vcWNvbS1zcG1pLXNkYW0uYyAgICAgICAg
ICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9xZnByb20uYyAgICAgICAgICAgICAgICAgIHwg
IDYgKysrLS0tCiBkcml2ZXJzL252bWVtL3JhdmUtc3AtZWVwcm9tLmMgICAgICAgICAgfCAgNiAr
KystLS0KIGRyaXZlcnMvbnZtZW0vc252c19scGdwci5jICAgICAgICAgICAgICB8ICA0ICsrLS0K
IGRyaXZlcnMvbnZtZW0vc3ByZC1lZnVzZS5jICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogZHJp
dmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmMgICAgIHwgIDIgKy0KIGRyaXZlcnMvbnZt
ZW0vc3RtMzItYnNlYy1vcHRlZS10YS5oICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbnZtZW0vc3Rt
MzItcm9tZW0uYyAgICAgICAgICAgICB8IDEwICsrKystLS0tLQogZHJpdmVycy9udm1lbS96eW5x
bXBfbnZtZW0uYyAgICAgICAgICAgIHwgIDYgKysrLS0tCiBpbmNsdWRlL2xpbnV4L2Zpcm13YXJl
L21lc29uL21lc29uX3NtLmggfCAgMiArLQogaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5o
ICAgICAgICAgIHwgIDYgKysrKystCiAyMiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCsp
LCA2NCBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogOWVlYmYyNTlkNTM1MmI4NzA4MGQ2Nzc1
OGY0ODM1ODNkOWU3NjNkNwotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
