Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4872606A331
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mapvLXMr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4LUgG+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DSKRmBBg/HVq0nfa1dDSBrU8Vutn5MWUFsv7RmjakkU=; b=mapvLXMrStXI1W9rKlMBM4RQn9
	r/RTlfXA8qJRtnKwF25XGHxd+aDIuC0b4frtS3yJEUI+QFnpj7xHKQ/NPrCdwFRfnGQO/fP5WgPW5
	Ir0dVCqUqBl1qbsZ4Y9qn0gNPzDIs0x8WQMY2Uq1yEDleMGfbvcMeke1RIDmEgg0MEjMr4NyDvaub
	tkZQ2jL6ldEcVTFRZM4bDyaY428EfoUnkzp3GFG1MJCVTisPAsP1jTjuWbNhtORPRSlUW7cIc7v5x
	v3sh8uhO2FElS+gJMfXZOyvB8ORvM/DCJjV5N/dfkrH/9yKHlmCswn7Mbv6PylmQIiFWnqwL95JyW
	YNB3O5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsBh-0000000D8SX-1OaX;
	Fri, 13 Nov 2026 14:23:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsBg-0000000D8SM-3Y4E;
	Fri, 13 Nov 2026 14:23:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E91A6021D;
	Fri, 13 Nov 2026 14:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A091F000C4;
	Fri, 13 Nov 2026 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794579811;
	bh=oTXRYCpqjj1rl3vyHjx8W2/mRwY/DkjlcdCqq9U+cmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m4LUgG+4O9wOw5PECmOhmjElyPGjEyauwluxzttah1Qm4rZn1lH+6EbmtsEpGYM6Z
	 1pOjj1lnIQwn/m/JWEoRkZbJp+d0lVyDYNA3aUerzZYvYb2Hl5QMjLXUDo4h2ejIWl
	 XGyy1GonO7vjji4FZq1Xis8QL0A8zIookpUN2PAtMFxp7XIAj6hLJ20J+rrb1lhd2r
	 DQVzM1pjJojQBDknpYKRMXhcMwpyHhWyI36ByZmJgve+Yz5xs2tpekHiqAfcoLk3dk
	 uywxWeLFQChUcwlrTeFypKz7KeFdE1+upscnEjlIGCQtTFBjgQpacVUcNyOB9JjWVt
	 W08xaPWirg4cw==
Date: Fri, 13 Nov 2026 08:23:29 -0600
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <20261113142329.GA593855-robh@kernel.org>
References: <20261105100322.37816-1-tanure@linux.com>
 <20261105100322.37816-3-tanure@linux.com>
 <20261110175451.GA833369-robh@kernel.org>
 <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMTI6MDc6NTVQTSArMDAwMCwgTHVjYXMgVGFudXJlIHdy
b3RlOgo+IE9uIFR1ZSwgTm92IDEwLCAyMDI2IGF0IDU6NTTigK9QTSBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE5vdiAwNSwgMjAyNiBhdCAxMDow
MzoxN0FNICswMDAwLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiA+IFRoZSBUNyBoYXMgdGhlIHNh
bWUgZXRoZXJuZXQgZ2x1ZSBhcyB0aGUgRzEyQSBidXQgbmVlZHMgdHdvIGNsb2NrcyBvZgo+ID4g
PiBpdHMgb3duLiBUaGUgY29udHJvbGxlciByZWFjaGVzIG1lbW9yeSB0aHJvdWdoIGEgcGlwZWxp
bmUgc3RhZ2Ugd2l0aAo+ID4gPiBpdHMgb3duIGdhdGU7IG5vdGhpbmcgZWxzZSBjbGFpbXMgaXQs
IHNvIGl0IGlzIHN3aXRjaGVkIG9mZiBhcyB1bnVzZWQKPiA+ID4gYW5kIHRyYW5zZmVycyBuZXZl
ciBmaW5pc2guIFRoZSBnbHVlIHJlZ2lzdGVycyBzaXQgaW4gYSBibG9jayBjbG9ja2VkCj4gPiA+
IHRvZ2V0aGVyIHdpdGggdGhlIE1ESU8gbXVsdGlwbGV4ZXIsIHdoaWNoIHByb2JlcyBhZnRlciB0
aGUgY29udHJvbGxlcgo+ID4gPiBoYXMgcHJvZ3JhbW1lZCB0aGVtOiB0aGUgd3JpdGVzIGFyZSBs
b3N0IGFuZCB0aGUgcG9ydCBrZWVwcyB0aGUKPiA+ID4gYm9vdGxvYWRlcidzIGRlbGF5cy4KPiA+
ID4KPiA+ID4gU28gdGhlIFQ3IGdldHMgaXRzIG93biBjbG9jayBsaXN0LCB3aXRob3V0IHRoZSB0
aW1pbmcgYWRqdXN0bWVudCBjbG9jawo+ID4gPiBpdCBuZXZlciB1c2VzLiBJdHMgZGVsYXlzIGZv
bGxvdyBldGhlcm5ldC1jb250cm9sbGVyLnlhbWw6IHRoZSBQSFkgYWRkcwo+ID4gPiB0aGUgMm5z
LCBhbmQgb25seSB0aGUgcmVjZWl2ZSBkZWxheSBsaW5lIG9mZmVycyBmaW5lIHR1bmluZywgc28g
b25seQo+ID4gPiByeC1pbnRlcm5hbC1kZWxheS1wcyBpcyB2YWxpZCBoZXJlLgo+ID4gPgo+ID4g
PiBBc3Npc3RlZC1ieTogTExNCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFu
dXJlQGxpbnV4LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vYmluZGluZ3MvbmV0L2FtbG9naWMs
bWVzb24tZHdtYWMueWFtbCAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IEkgdGVuZCB0byBhZ3JlZSB3aXRo
IHRoZSBzYXNoaWtvIGNvbW1lbnQsIGJ1dCBhbSBmaW5lIGVpdGhlciB3YXkuIE9uY2UKPiA+IHRo
ZSBpZi90aGVuIHNjaGVtYXMgYXJlIGxvbmdlciB0aGFuIHRoZSBtYWluIHNjaGVtYSwgaXQncyBh
IHNpZ24gdG8KPiA+IHNwbGl0Lgo+IAo+IEluIFY3IEkgd2lsbCBzcGxpdCBhcyBJIHRoaW5rIGl0
IHdpbGwgYmUgZWFzaWVyIHRvIHJldmlldy4KPiAKPiA+Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdt
YWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxt
ZXNvbi1kd21hYy55YW1sCj4gPiA+IGluZGV4IGU3NjljOWJiNzBkOC4uZmY1ZTUwZjY1MTE0IDEw
MDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Ft
bG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbAo+ID4gPiBAQCAtMjMsNiAr
MjMsNyBAQCBzZWxlY3Q6Cj4gPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdt
YWMKPiA+ID4gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4gPiA+ICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMKPiA+ID4gKyAgICAgICAgICAtIGFtbG9n
aWMsdDctZHdtYWMKPiA+ID4gICAgcmVxdWlyZWQ6Cj4gPiA+ICAgICAgLSBjb21wYXRpYmxlCj4g
PiA+Cj4gPiA+IEBAIC04NCw2ICs4NSw0OSBAQCBhbGxPZjoKPiA+ID4gICAgICAgICAgcngtaW50
ZXJuYWwtZGVsYXktcHM6Cj4gPiA+ICAgICAgICAgICAgZGVmYXVsdDogMAo+ID4gPgo+ID4gPiAr
ICAtIGlmOgo+ID4gPiArICAgICAgcHJvcGVydGllczoKPiA+ID4gKyAgICAgICAgY29tcGF0aWJs
ZToKPiA+ID4gKyAgICAgICAgICBjb250YWluczoKPiA+ID4gKyAgICAgICAgICAgIGNvbnN0OiBh
bWxvZ2ljLHQ3LWR3bWFjCj4gPiA+ICsgICAgdGhlbjoKPiA+ID4gKyAgICAgIHByb3BlcnRpZXM6
Cj4gPiA+ICsgICAgICAgIGNsb2NrczoKPiA+ID4gKyAgICAgICAgICBpdGVtczoKPiA+ID4gKyAg
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IEdNQUMgbWFpbiBjbG9jawo+ID4gPiArICAgICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogRmlyc3QgcGFyZW50IGNsb2NrIG9mIHRoZSBpbnRlcm5hbCBtdXgK
PiA+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IFNlY29uZCBwYXJlbnQgY2xvY2sgb2Yg
dGhlIGludGVybmFsIG11eAo+ID4gPiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoKPiA+ID4g
KyAgICAgICAgICAgICAgICBjbG9jayBvZiB0aGUgcGlwZWxpbmUgc3RhZ2UgaW5zZXJ0ZWQgaW4g
dGhlIGJ1cyBwYXRoIGJldHdlZW4KPiA+ID4gKyAgICAgICAgICAgICAgICB0aGUgY29udHJvbGxl
ciBhbmQgdGhlIERSQU0uIFdpdGhvdXQgaXQsIHRoZSBjb250cm9sbGVyIGNhbm5vdAo+ID4gPiAr
ICAgICAgICAgICAgICAgIGNvbXBsZXRlIERNQSB0cmFuc2ZlcnMuCj4gPiA+ICsgICAgICAgICAg
ICAtIGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgICAgICAgIGNsb2NrIG9mIHRoZSByZWdp
c3RlciBibG9jayBob2xkaW5nIFBSR19FVEgwIGFuZCBQUkdfRVRIMS4KPiA+ID4gKyAgICAgICAg
ICAgICAgICBXaXRob3V0IGl0LCB0aGUgYmxvY2sgcmVhZHMgYXMgemVybyBhbmQgaWdub3JlcyB3
cml0ZXMuCj4gPiA+ICsKPiA+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6Cj4gPiA+ICsgICAgICAg
ICAgaXRlbXM6Cj4gPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBzdG1tYWNldGgKPiA+ID4gKyAg
ICAgICAgICAgIC0gY29uc3Q6IGNsa2luMAo+ID4gPiArICAgICAgICAgICAgLSBjb25zdDogY2xr
aW4xCj4gPiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBwaXBlbGluZQo+ID4gPiArICAgICAgICAg
ICAgLSBjb25zdDogcGNsawo+ID4gPiArCj4gPiA+ICsgICAgICAgICMgVGhlIFBIWSBhZGRzIHRo
ZSAybnMgUkdNSUkgZGVsYXlzLCBzZWUgZXRoZXJuZXQtY29udHJvbGxlci55YW1sLgo+ID4gPiAr
ICAgICAgICAjIFRoZSBSWCBkZWxheSBsaW5lIG9mIHRoaXMgZ2x1ZSBpcyBmaW5lIHR1bmluZyBp
biAyMDBwcyBzdGVwcywKPiA+Cj4gPiBTb3VuZHMgbGlrZSBjb25zdHJhaW50czoKPiA+Cj4gPiBt
YXhpbXVtOiAyMDAwCj4gPiBtdWx0aXBsZU9mOiAyMDAKPiAKPiBZZXMsIHdpdGggbWF4aW11bTog
MzAwMDogdGhlIGZpZWxkIGlzIGZvdXIgYml0cywgMCB0byAxNSBzdGVwcyBvZgo+IDIwMHBzLgo+
ID4KPiA+ID4gKyAgICAgICAgIyBhZGRlZCBvbiB0b3Agb2Ygd2hhdCBwaHktbW9kZSBkZXNjcmli
ZXMuIFRoZSBUWCBzaWRlIGhhcyBubyBmaW5lCj4gPiA+ICsgICAgICAgICMgdHVuaW5nOiBpdHMg
b25seSBzdGVwIGlzIGEgcXVhcnRlciBvZiB0aGUgY2xvY2sgcGVyaW9kLCB0aGUgZnVsbAo+ID4g
PiArICAgICAgICAjIDJucyBhdCAxR2JpdC9zLCBzbyB0aGUgVFggcHJvcGVydHkgaXMgbm90IGFj
Y2VwdGVkLgo+ID4KPiA+IE1vdmUgdGhpcyB0byB0eC1pbnRlcm5hbC1kZWxheS1wcy4gWW91IGNh
biAoa2luZCBvZiBhY2t3YXJkbHkpIGRvOgo+ID4KPiA+IHR4LWludGVybmFsLWRlbGF5LXBzOgo+
ID4gICBkZXNjcmlwdGlvbjogLi4uCj4gPiAgIG5vdDoge30KPiAKPiBkdF9iaW5kaW5nX2NoZWNr
IGRvZXMgbm90IGFjY2VwdCAibm90IiBvbiBhIHByb3BlcnR5IHVuZGVyCj4gcHJvcGVydGllczog
b3IgaW4gYW4gYWxsT2YgZW50cnk6IGNlbGwueWFtbCBhbGxvd3Mgb25seSBkZXNjcmlwdGlvbiwK
PiBkZXByZWNhdGVkLCBjb25zdCwgZW51bSwgbWluaW11bSwgbWF4aW11bSwgbXVsdGlwbGVPZiwg
ZGVmYXVsdCwgJHJlZgo+IGFuZCBvbmVPZiB0aGVyZS4gSXQgcGFzc2VzIG9ubHkgaW5zaWRlIGlm
L3RoZW4sIGFuZCB0aGUgbmV3IGZpbGUgaGFzCj4gbm8gaWYvdGhlbi4gU28gdGhlIHByb3BlcnR5
IHN0YXlzIGZhbHNlLCB3aXRoIHRoZSBleHBsYW5hdGlvbiBhcyBhCj4gY29tbWVudCBhYm92ZSBp
dC4KCk9rYXksIGJ1dCB3ZSBzaG91bGQgZml4IHRoYXQuCgpSb2IKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
