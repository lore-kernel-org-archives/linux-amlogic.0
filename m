Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F327C982DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6572A1B/4vwH9pd0UJLyPjPCpDvZAMmUsOe45a1oScg=; b=U6a5QzJb/Lmpg1
	kjRNNN28eUkstl37zQOeWXMEPiO2sAdrmSonmEkRDxakVnZwLxAJQXl1ubwgjvpkxQMF6G+Y31i9f
	uwjf1icjS+eWJjdjYKcV/bfYCIF+uggF+1yoy7pC1rkPk8/OD53tgl/fxn9SXHetRGqFam10qk4sG
	4vl51WE3j7SGLo+Oa5W0FSi/qzz1FRXWEN0HKZ8okUFDUN9Oi0ajjxcoXZB01S3QPN53fMy7S0+Es
	u/fOa3unMu3sQqITV6dpP0axzQUTNUM6uUxnA4DhIS+1jB5P7LgThSdo9S2/8q69tgxqhrw+1xjSE
	avR6lenDTv4PyIQlOCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FZK-0000000HLZh-2uF8;
	Sun, 20 Sep 2026 11:18:50 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FZI-0000000HLYr-13YH;
	Sun, 20 Sep 2026 11:18:49 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 8CCBF7189A90; Sun, 20 Sep 2026 13:18:45 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:18:45 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 0/4] nvmem: migrate to const void * in reg_write
Message-ID: <aq_BFQ4wgnJqGngQ@desktop>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041848_453055_419C7C43 
X-CRM114-Status: GOOD (  25.43  )
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

T29wcywgSSBmb3Jnb3QgdG8gY2FycnkgdGhlIHRhZyBJIGdvdCBpbiB2NeKApgoKSGVyZSBpdCBp
czoKUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwu
Y29tPgoKT24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgMDE6MDk6NTNQTSArMDIwMCwgTGluayBNYXV2
ZSB3cm90ZToKPiBUaGlzIGNhbGxiYWNrIHVzZWQgdG8gdGFrZSBhIG11dGFibGUgdm9pZCAqIGZv
ciBubyByZWFzb24sIHdoaWNoIGNhdXNlcwo+IHRoZSBjb21waWxlciB0byBiZSB1bmF3YXJlIHRo
YXQgdGhlIHZhbCBidWZmZXIgc2hvdWxkIG5ldmVyIGJlIG1vZGlmaWVkCj4gYnkgdGhlIGNhbGxi
YWNrLgo+IAo+IFRoaXMgd2FzIGZvdW5kIHdoaWxlIGRyYWZ0aW5nIHRoZSBudm1lbS1wcm92aWRl
ciBSdXN0IGFic3RyYWN0aW9uLgo+IAo+IFRoYW5rcyB0byB0aGUgZ3VpZGFuY2Ugb2YgQW5keSBT
aGV2Y2hlbmtvLCB0aGlzIG5vdyBpbnRyb2R1Y2VzIGEgbmV3Cj4gY2FsbGJhY2sgYW5kIGRlcHJl
Y2F0ZXMgdGhlIGV4aXN0aW5nIG9uZSwgd2l0aCB0aGUgZ29hbCBvZiByZW5hbWluZyB0aGUKPiBu
ZXcgb25lIGludG8gdGhlIG9sZCBvbmUgb25jZSBubyB1c2VyIHJlbWFpbnMgaW4gdGhlIGtlcm5l
bC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHY1Ogo+IC0gTGluayB0byB2NToKPiAgIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwODA0MTM1OTQwLjIzNzg3MzctMS1saW5r
bWF1dmVAbGlua21hdXZlLmZyL1QvCj4gLSBBZGQgYSBkZXZfd2FybigpIHdoZW4gcmVnaXN0ZXJp
bmcgYSBudm1lbSBkcml2ZXIgd2l0aCBhIGRlcHJlY2F0ZWQKPiAgIHJlZ193cml0ZSBjYWxsYmFj
ay4KPiAtIEFkZCBhIGZvdXJ0aCBwYXRjaCBlbmFibGluZyBDT01QSUxFX1RFU1Qgb24gdGhyZWUg
bW9yZSBudm1lbSBkcml2ZXJzLAo+ICAgd2hpY2ggZm9yZ290IHRvIGRlcGVuZCBvbiB0aGF0IGNv
bmZpZy4KPiAtIFJlbW92ZSBhIGZldyB1bm5lZWRlZCAodm9pZCAqKSBhbmQgKGNvbnN0IHZvaWQg
KikgY2FzdHMgaW4gY29yZS5jLgo+IAo+IENoYW5nZXMgc2luY2UgdjQ6Cj4gLSBMaW5rIHRvIHY0
Ogo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNjA3MjYxMzE3
MjQuMTUyOTktMS1saW5rbWF1dmVAbGlua21hdXZlLmZyL1QvCj4gLSBSZWJhc2Ugb24gdG9wIG9m
IGxpbnV4LW5leHQgMjAyNjA4MDMsIHRoZSBwcmV2aW91cyBzZXJpZXMgZGlkbuKAmXQgYXBwbHkK
PiAgIGFueSBtb3JlIGR1ZSB0byBjaGFuZ2VzIGluIGNvcmUuYy4KPiAtIEFsc28gY29udmVydCB0
aGUgYXQyNCwgYXQyNSwgZWVwcm9tXzkzeHg0NiBhbmQgbTI0bHIgZHJpdmVycyB0byB0aGUKPiAg
IG5ldyByZWdfd3JpdGVfY29uc3QgY2FsbGJhY2ssIHRoZXNlIHdlcmUgbWlzc2VkIGJlY2F1c2Ug
dGhleSBnb3QgbW92ZWQKPiAgIHRvIHRoZSBudm1lbSBkaXJlY3RvcnkgaW4gbGludXgtbmV4dCBi
ZXR3ZWVuIHYzIGFuZCB2NC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYzOgo+IC0gTGluayB0byB2MzoK
PiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNzE2MTQyNDE1
LjI4NzE4LTEtbGlua21hdXZlQGxpbmttYXV2ZS5mci9ULwo+IC0gRHJvcCBBcHBsZSBTUE1JIHBh
dGNoLCB3aGljaCBoYWQgYWxyZWFkeSBiZWVuIGluZGVwZW5kZW50bHkgaW5jbHVkZWQKPiAgIGlu
IGxpbnV4LW5leHQgYXMgNzA4OTE3MGUxZGYxNjBmNWY4ZmIzOTViYzVhYTJlMjY5N2I0ZTg5Ni4K
PiAtIFJld29yZCB0aGUgY292ZXIgbGV0dGVy4oCZcyBzdWJqZWN0Lgo+IC0gUmVvcmRlciB0aGUg
bWVzb24gZmlybXdhcmUgcGF0Y2ggYmVmb3JlIHRoZSBvdGhlciBvbmVzLCBzbyB0aGF0IGV2ZXJ5
Cj4gICBjb21taXQgaXMgYWx3YXlzIHdvcmtpbmcgY29ycmVjdGx5Lgo+IAo+IENoYW5nZXMgc2lu
Y2UgdjI6Cj4gLSBMaW5rIHRvIHYyOgo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1m
b3ItbGludXgvYWxqQXFCTlZYVjFhVkpxeEBsdW5hL1QvCj4gLSBSZWJhc2Ugb24gdG9wIG9mIGxp
bnV4LW5leHQvbWFzdGVyLgo+IC0gRml4IGxvZ2ljIGVycm9yIHdoaWNoIG1hZGUgYWxsIGRldmlj
ZXMgcmVhZC1vbmx5Lgo+IC0gUmVtb3ZlIGEgYmxhbmtldCBjYXN0IG9mIGZ1bmN0aW9uIHBvaW50
ZXJzIHRvIHZvaWQgKiBpbgo+ICAgYXBwbGUtc3BtaS1udm1lbSAocGF0Y2ggMykuCj4gLSBBbHNv
IGZpeCBjb25zdG5lc3Mgb2Ygd3JpdGUgYnVmZmVyIGluIGZpcm13YXJlOiBtZXNvbiwgd2hpY2gg
aXMgdXNlZAo+ICAgZXhjbHVzaXZlbHkgYnkgbWVzb24tZWZ1c2UgKHBhdGNoIDQpLgo+IC0gUmUt
cmV2aWV3IGFsbCBjaGFuZ2VzIHRvIG1ha2Ugc3VyZSB0aGUgcGFzc2VkIHR5cGVzIGFyZSBtb3Jl
IGNvcnJlY3QKPiAgIHRoYW4gdGhleSB3ZXJlIGJlZm9yZS4KPiAtIEFjdHVhbGx5IHRlc3Qgd2l0
aCBDT01QSUxFX1RFU1QsIHdoaWNoIEkgZm9yZ290IHRvIGVuYWJsZSBiZWZvcmXigKYKPiAKPiBD
aGFuZ2VzIHNpbmNlIHYxOgo+IC0gTGluayB0byB2MToKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwNzE1MTc1MjI5LjI0NjcyLTEtbGlua21hdXZlQGxpbmtt
YXV2ZS5mci8KPiAtIFJlbW92ZWQgYWxsIGNoYW5nZXMgdG8gb3RoZXIgc3Vic3lzdGVtcyB0aGFu
IG52bWVtLgo+IC0gQWRkZWQgYSBuZXcgcmVnX3dyaXRlX2NvbnN0IGNhbGxiYWNrIGluc3RlYWQg
b2YgY2hhbmdpbmcgdGhlIGV4aXNpdG5nCj4gICByZWdfd3JpdGUuCj4gLSBEZXByZWNhdGVkIHRo
ZSBleGlzdGluZyByZWdfd3JpdGUgY2FsbGJhY2ssIGl0IHdpbGwgZ2V0IHJlbW92ZWQgb25jZQo+
ICAgYWxsIHVzZXJzIGluIHRoZSBrZXJuZWwgd2lsbCBiZSBkb25lIG1pZ3JhdGluZyB0byB0aGUg
bmV3IG9uZS4KPiAKPiBMaW5rIE1hdXZlICg0KToKPiAgIGZpcm13YXJlOiBtZXNvbjogcGFzcyBh
IGNvbnN0IGJ1ZmZlciB0byBtZXNvbl9zbV9jYWxsX3dyaXRlKCkKPiAgIG52bWVtOiBjb3JlOiBk
ZXByZWNhdGUgcmVnX3dyaXRlIGNhbGxiYWNrIHdpdGggcmVnX3dyaXRlX2NvbnN0Cj4gICBudm1l
bTogbWFrZSBhbGwgcmVnX3dyaXRlIGNhbGxiYWNrcyB0YWtlIGNvbnN0IHZvaWQgKgo+ICAgbnZt
ZW06IGVuYWJsZSBDT01QSUxFX1RFU1QgZm9yIG1vcmUgZHJpdmVycwo+IAo+ICBkcml2ZXJzL2Zp
cm13YXJlL21lc29uL21lc29uX3NtLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL252bWVtL0tj
b25maWcgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9udm1lbS9hcHBs
ZS1zcG1pLW52bWVtLmMgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL252bWVtL2F0MjQuYyAg
ICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9udm1lbS9hdDI1LmMgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL252bWVtL2JjbS1vY290cC5jICAg
ICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+ICBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAg
ICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIGRyaXZlcnMvbnZt
ZW0vZWVwcm9tXzkzeHg0Ni5jICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL252bWVt
L2lteC1vY290cC1zY3UuYyAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9udm1lbS9p
bXgtb2NvdHAuYyAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbnZtZW0vaW50
ZXJuYWxzLmggICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9udm1lbS9sYW45NjYyLW90
cGMuYyAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbnZtZW0vbHBjMTh4eF9lZXBy
b20uYyAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL252bWVtL20yNGxyLmMgICAgICAg
ICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbnZtZW0vbWF4Nzc3NTktbnZtZW0uYyAg
ICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jICAgICAgICAg
ICAgIHwgIDggKysrKy0tLS0KPiAgZHJpdmVycy9udm1lbS9xY29tLXNwbWktc2RhbS5jICAgICAg
ICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbnZtZW0vcWZwcm9tLmMgICAgICAgICAgICAgICAg
ICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL252bWVtL3JhdmUtc3AtZWVwcm9tLmMgICAgICAgICAg
fCAgNiArKystLS0KPiAgZHJpdmVycy9udm1lbS9zbnZzX2xwZ3ByLmMgICAgICAgICAgICAgIHwg
IDQgKystLQo+ICBkcml2ZXJzL252bWVtL3NwcmQtZWZ1c2UuYyAgICAgICAgICAgICAgfCAgNiAr
KystLS0KPiAgZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmMgICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9udm1lbS9zdG0zMi1ic2VjLW9wdGVlLXRhLmggICAgIHwgIDQgKystLQo+ICBk
cml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4g
IGRyaXZlcnMvbnZtZW0venlucW1wX252bWVtLmMgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBp
bmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmggfCAgMiArLQo+ICBpbmNsdWRl
L2xpbnV4L252bWVtLXByb3ZpZGVyLmggICAgICAgICAgfCAgNiArKysrKy0KPiAgMjcgZmlsZXMg
Y2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCj4gCj4gCj4gYmFzZS1j
b21taXQ6IDNmMjQyNWY1YjViYmJkZDk5MWNhOWNkZmQ1NTAyZTY4ZDg4OTU5OTgKPiAtLSAKPiAy
LjU1LjAKPiAKCi0tIApMaW5rIE1hdXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
