Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4FC55822
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Aug 2026 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=maISZmgbTILqiSDY78UF+9I9gpzzoT71QW1kBacCIoM=; b=G6sow0CNE86VJ8
	MiTdQN2FHxcD5kMG6dQK4YnJwE5Llg9IRwB8RmC3WEKDVmxHoYUYv1M1A61i0RO398sWDNv6EpEB9
	5ZI8EzmyFRT9u3tKsisA94EhrL3LjiH1uh4YYNFq5VVQemu7bfqP7cf4chbIKp90Ubc8noiKtlMeK
	U7AfSu9duwjwgyIRe+Bbk1gqd+i9Li+splE521LYoesoHu4jIIjlX7DHu2SYLGgRU8tiEuW1V8nQ5
	98WNx19dvTUhL8Q1nPPVpoPR+nO9guRtesBuOYYiQijssqFMt4M0xfqrtOedA+23+hTJGjuGQZxTS
	0j6VKAJGDkFDoBR88VSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFgN-00000001z2m-0RR7;
	Tue, 04 Aug 2026 13:59:51 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFgJ-00000001z0S-3ROA;
	Tue, 04 Aug 2026 13:59:49 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 4861970A054E; Tue, 04 Aug 2026 15:59:42 +0200 (CEST)
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
Subject: [PATCH v5 0/3] nvmem: migrate to const void * in reg_write
Date: Tue,  4 Aug 2026 15:59:34 +0200
Message-ID: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_065948_013381_96C571C5 
X-CRM114-Status: GOOD (  14.25  )
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
ZSBubyB1c2VyIHJlbWFpbnMgaW4gdGhlIGtlcm5lbC4KCkNoYW5nZXMgc2luY2UgdjQ6Ci0gTGlu
ayB0byB2NDoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI2MDcy
NjEzMTcyNC4xNTI5OS0xLWxpbmttYXV2ZUBsaW5rbWF1dmUuZnIvVC8KLSBSZWJhc2Ugb24gdG9w
IG9mIGxpbnV4LW5leHQgMjAyNjA4MDMsIHRoZSBwcmV2aW91cyBzZXJpZXMgZGlkbuKAmXQgYXBw
bHkKICBhbnkgbW9yZSBkdWUgdG8gY2hhbmdlcyBpbiBjb3JlLmMuCi0gQWxzbyBjb252ZXJ0IHRo
ZSBhdDI0LCBhdDI1LCBlZXByb21fOTN4eDQ2IGFuZCBtMjRsciBkcml2ZXJzIHRvIHRoZQogIG5l
dyByZWdfd3JpdGVfY29uc3QgY2FsbGJhY2ssIHRoZXNlIHdlcmUgbWlzc2VkIGJlY2F1c2UgdGhl
eSBnb3QgbW92ZWQKICB0byB0aGUgbnZtZW0gZGlyZWN0b3J5IGluIGxpbnV4LW5leHQgYmV0d2Vl
biB2MyBhbmQgdjQuCgpDaGFuZ2VzIHNpbmNlIHYzOgotIExpbmsgdG8gdjM6CiAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNjA3MTYxNDI0MTUuMjg3MTgtMS1saW5r
bWF1dmVAbGlua21hdXZlLmZyL1QvCi0gRHJvcCBBcHBsZSBTUE1JIHBhdGNoLCB3aGljaCBoYWQg
YWxyZWFkeSBiZWVuIGluZGVwZW5kZW50bHkgaW5jbHVkZWQKICBpbiBsaW51eC1uZXh0IGFzIDcw
ODkxNzBlMWRmMTYwZjVmOGZiMzk1YmM1YWEyZTI2OTdiNGU4OTYuCi0gUmV3b3JkIHRoZSBjb3Zl
ciBsZXR0ZXLigJlzIHN1YmplY3QuCi0gUmVvcmRlciB0aGUgbWVzb24gZmlybXdhcmUgcGF0Y2gg
YmVmb3JlIHRoZSBvdGhlciBvbmVzLCBzbyB0aGF0IGV2ZXJ5CiAgY29tbWl0IGlzIGFsd2F5cyB3
b3JraW5nIGNvcnJlY3RseS4KCkNoYW5nZXMgc2luY2UgdjI6Ci0gTGluayB0byB2MjoKICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC9hbGpBcUJOVlhWMWFWSnF4QGx1bmEv
VC8KLSBSZWJhc2Ugb24gdG9wIG9mIGxpbnV4LW5leHQvbWFzdGVyLgotIEZpeCBsb2dpYyBlcnJv
ciB3aGljaCBtYWRlIGFsbCBkZXZpY2VzIHJlYWQtb25seS4KLSBSZW1vdmUgYSBibGFua2V0IGNh
c3Qgb2YgZnVuY3Rpb24gcG9pbnRlcnMgdG8gdm9pZCAqIGluCiAgYXBwbGUtc3BtaS1udm1lbSAo
cGF0Y2ggMykuCi0gQWxzbyBmaXggY29uc3RuZXNzIG9mIHdyaXRlIGJ1ZmZlciBpbiBmaXJtd2Fy
ZTogbWVzb24sIHdoaWNoIGlzIHVzZWQKICBleGNsdXNpdmVseSBieSBtZXNvbi1lZnVzZSAocGF0
Y2ggNCkuCi0gUmUtcmV2aWV3IGFsbCBjaGFuZ2VzIHRvIG1ha2Ugc3VyZSB0aGUgcGFzc2VkIHR5
cGVzIGFyZSBtb3JlIGNvcnJlY3QKICB0aGFuIHRoZXkgd2VyZSBiZWZvcmUuCi0gQWN0dWFsbHkg
dGVzdCB3aXRoIENPTVBJTEVfVEVTVCwgd2hpY2ggSSBmb3Jnb3QgdG8gZW5hYmxlIGJlZm9yZeKA
pgoKQ2hhbmdlcyBzaW5jZSB2MToKLSBMaW5rIHRvIHYxOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNzE1MTc1MjI5LjI0NjcyLTEtbGlua21hdXZlQGxpbmtt
YXV2ZS5mci8KLSBSZW1vdmVkIGFsbCBjaGFuZ2VzIHRvIG90aGVyIHN1YnN5c3RlbXMgdGhhbiBu
dm1lbS4KLSBBZGRlZCBhIG5ldyByZWdfd3JpdGVfY29uc3QgY2FsbGJhY2sgaW5zdGVhZCBvZiBj
aGFuZ2luZyB0aGUgZXhpc2l0bmcKICByZWdfd3JpdGUuCi0gRGVwcmVjYXRlZCB0aGUgZXhpc3Rp
bmcgcmVnX3dyaXRlIGNhbGxiYWNrLCBpdCB3aWxsIGdldCByZW1vdmVkIG9uY2UKICBhbGwgdXNl
cnMgaW4gdGhlIGtlcm5lbCB3aWxsIGJlIGRvbmUgbWlncmF0aW5nIHRvIHRoZSBuZXcgb25lLgoK
TGluayBNYXV2ZSAoMyk6CiAgZmlybXdhcmU6IG1lc29uOiBwYXNzIGEgY29uc3QgYnVmZmVyIHRv
IG1lc29uX3NtX2NhbGxfd3JpdGUoKQogIG52bWVtOiBjb3JlOiBkZXByZWNhdGUgcmVnX3dyaXRl
IGNhbGxiYWNrIHdpdGggcmVnX3dyaXRlX2NvbnN0CiAgbnZtZW06IG1ha2UgYWxsIHJlZ193cml0
ZSBjYWxsYmFja3MgdGFrZSBjb25zdCB2b2lkICoKCiBkcml2ZXJzL2Zpcm13YXJlL21lc29uL21l
c29uX3NtLmMgICAgICAgfCAgMiArLQogZHJpdmVycy9udm1lbS9hcHBsZS1zcG1pLW52bWVtLmMg
ICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9hdDI0LmMgICAgICAgICAgICAgICAgICAg
IHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL2F0MjUuYyAgICAgICAgICAgICAgICAgICAgfCAg
NCArKy0tCiBkcml2ZXJzL252bWVtL2JjbS1vY290cC5jICAgICAgICAgICAgICAgfCAgOCArKyst
LS0tCiBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL252bWVtL2VlcHJvbV85M3h4NDYuYyAgICAgICAg
ICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICAgICAgICAgICB8
ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9pbXgtb2NvdHAuYyAgICAgICAgICAgICAgIHwgIDYg
KysrLS0tCiBkcml2ZXJzL252bWVtL2ludGVybmFscy5oICAgICAgICAgICAgICAgfCAgMSArCiBk
cml2ZXJzL252bWVtL2xhbjk2NjItb3RwYy5jICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZl
cnMvbnZtZW0vbHBjMTh4eF9lZXByb20uYyAgICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9u
dm1lbS9tMjRsci5jICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9t
YXg3Nzc1OS1udm1lbS5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9tZXNvbi1l
ZnVzZS5jICAgICAgICAgICAgIHwgIDggKysrLS0tLQogZHJpdmVycy9udm1lbS9xY29tLXNwbWkt
c2RhbS5jICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL252bWVtL3FmcHJvbS5jICAgICAg
ICAgICAgICAgICAgfCAgNiArKystLS0KIGRyaXZlcnMvbnZtZW0vcmF2ZS1zcC1lZXByb20uYyAg
ICAgICAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9udm1lbS9zbnZzX2xwZ3ByLmMgICAgICAgICAg
ICAgIHwgIDQgKystLQogZHJpdmVycy9udm1lbS9zcHJkLWVmdXNlLmMgICAgICAgICAgICAgIHwg
IDYgKysrLS0tCiBkcml2ZXJzL252bWVtL3N0bTMyLWJzZWMtb3B0ZWUtdGEuYyAgICAgfCAgMiAr
LQogZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmggICAgIHwgIDQgKystLQogZHJp
dmVycy9udm1lbS9zdG0zMi1yb21lbS5jICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tCiBkcml2
ZXJzL252bWVtL3p5bnFtcF9udm1lbS5jICAgICAgICAgICAgfCAgNiArKystLS0KIGluY2x1ZGUv
bGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCB8ICAyICstCiBpbmNsdWRlL2xpbnV4L252
bWVtLXByb3ZpZGVyLmggICAgICAgICAgfCAgNiArKysrKy0KIDI2IGZpbGVzIGNoYW5nZWQsIDgz
IGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA5YTRjZGM5NThk
ZDc5ZmM2YzNiMjBiNTFhMTBkZWJlYzZjYTA5ZmVjCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
