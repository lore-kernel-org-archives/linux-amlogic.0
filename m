Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067E2C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Mar 2022 20:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyHCDVEfth8ySGf7DkHvqqTgKLF2auY71E48asLHcos=; b=Psn43zaK1Cc1pN
	GOHUrnN5jrOYNDSUprjyX85+9S7FEJLS9lFf8XYNVDRS1cmC8+FvowYQt9T6kqxeJdaiNQkgyl334
	HT3GAu5purXhZbIBvXCAOn334tg3vmdWinmH4W0VONeFGRJ9eJCmoGaIgEgLAdTg6RuLnyS9P2aR1
	A8BrUoBMwSEFVzNf0v93t3Qh7y0HZ1e0Bv2no28x65BpE5PX5zieSDCQtd+79xvM0Sw3cacXMmJ88
	DjYp7sQ+/4aIe9sOP8tB6kfPiPL+oojC2lU3ezZ3z/Akhfux7CPN36mdkceNKqpj6ClKJGUpihDEP
	NFB67EDm2Mfre8fCPBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVJYM-002rBy-Uc; Fri, 18 Mar 2022 20:50:31 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVJYJ-002rBL-Mx; Fri, 18 Mar 2022 20:50:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 565441515;
 Fri, 18 Mar 2022 13:50:26 -0700 (PDT)
Received: from [10.57.43.230] (unknown [10.57.43.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FBB43F7D7;
 Fri, 18 Mar 2022 13:50:24 -0700 (PDT)
Message-ID: <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
Date: Fri, 18 Mar 2022 20:50:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Content-Language: en-GB
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_135027_873461_9643C31B 
X-CRM114-Status: GOOD (  19.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAyMi0wMi0yNSAyMToxMywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IEFkZCBhIFlBTUwg
c2NoZW1hIGJpbmRpbmcgZm9yIFRNMTYyOCBhdXhkaXNwbGF5Cj4gKDcvMTEtc2VnbWVudCBMRUQp
IGNvbnRyb2xsZXIuCj4gCj4gVGhpcyBwYXRjaCBpcyBwYXJ0aWFsbHkgYmFzZWQgb24gcHJldmlv
dXMgd29yayBmcm9tCj4gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPi4KPiAKPiBD
by1kZXZlbG9wZWQtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gU2lnbmVkLW9m
Zi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPiAtLS0KPiB2NToK
PiAtIGFkZCB2ZW5kb3IgcHJlZml4IHRvIGRyaXZlci1zcGVjaWZpYyBwcm9wZXJ0aWVzCj4gLS0t
Cj4gICAuLi4vYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCAgfCA5MiAr
KysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
dXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMs
dG0xNjI4LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uMmEx
ZWY2OTJjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4gQEAgLTAsMCArMSw5MiBA
QAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vci1sYXRlciBPUiBCU0Qt
Mi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sIwo+ICskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxl
OiBUaXRhbiBNaWNybyBFbGVjdHJvbmljcyBUTTE2MjggTEVEIGNvbnRyb2xsZXIKPiArCj4gK21h
aW50YWluZXJzOgo+ICsgIC0gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgo+ICsg
IC0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPiArCj4gK2FsbE9mOgo+
ICsgIC0gJHJlZjogL3NjaGVtYXMvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwjCj4gKwo+
ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogdGl0YW5tZWMsdG0x
NjI4Cj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIHRpdGFubWVjLGdy
aWQ6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgTWFwcGluZyBvZiBkaXNwbGF5IGRpZ2l0
IHBvc2l0aW9uIHRvIGdyaWQgbnVtYmVyLgo+ICsgICAgICBUaGlzIGltcGxpY2l0bHkgZGVmaW5l
cyB0aGUgZGlzcGxheSBzaXplLgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDgtYXJyYXkKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBtYXhJdGVtczog
Nwo+ICsKPiArICB0aXRhbm1lYyxzZWdtZW50LW1hcHBpbmc6Cj4gKyAgICBkZXNjcmlwdGlvbjoK
PiArICAgICAgTWFwcGluZyBvZiA3IHNlZ21lbnQgZGlzcGxheSBzZWdtZW50cyBBLUcgdG8gYml0
IG51bWJlcnMgMS0xMi4KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQ4LWFycmF5Cj4gKyAgICBtaW5JdGVtczogNwo+ICsgICAgbWF4SXRlbXM6IDcKPiAr
Cj4gKyAgIiNhZGRyZXNzLWNlbGxzIjoKPiArICAgIGNvbnN0OiAyCj4gKwo+ICsgICIjc2l6ZS1j
ZWxscyI6Cj4gKyAgICBjb25zdDogMAo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxl
Cj4gKyAgLSByZWcKCldvdWxkIGl0IGJlIGZhaXIgdG8gc2F5IHRoYXQgInNwaS1sc2ItZmlyc3Qi
IGFuZCAic3BpLTN3aXJlIiBhcmUgYWxzbyAKcmVxdWlyZWQ/IFRoZSBjaGlwcyBhcmVuJ3QgY29u
ZmlndXJhYmxlIHNvIHdvbid0IGV4YWN0bHkgYmUgdXNhYmxlIGFueSAKb3RoZXIgd2F5LiBGdXJ0
aGVybW9yZSBJIGJlbGlldmUgdGhlIHRyYW5zbWlzc2lvbiBmb3JtYXQgYWN0dWFsbHkgd29ya3Mg
Cm91dCBlcXVpdmFsZW50IHRvIFNQSSBtb2RlIDMsIHNvIHNob3VsZCB3YXJyYW50ICJzcGktY3Bo
YSIgYW5kIAoic3BpLWNwb2wiIGFzIHdlbGwuCgo+ICsKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4g
KyAgIl4uKkBbMS03XSwoWzEtOV18MVswLTZdKSQiOgo+ICsgICAgdHlwZTogb2JqZWN0Cj4gKyAg
ICAkcmVmOiAvc2NoZW1hcy9sZWRzL2NvbW1vbi55YW1sIwo+ICsgICAgdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQo+ICsgICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgUHJvcGVydGllcyBm
b3IgYSBzaW5nbGUgTEVELgo+ICsKPiArICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgIHJlZzoKPiAr
ICAgICAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAgICAgICAgMS1iYXNlZCBncmlkIG51bWJlciwg
Zm9sbG93ZWQgYnkgMS1iYXNlZCBzZWdtZW50IGJpdCBudW1iZXIuCj4gKyAgICAgICAgbWF4SXRl
bXM6IDEKPiArCj4gKyAgICByZXF1aXJlZDoKPiArICAgICAgLSByZWcKCkknbSBjb25jZXJuZWQg
dGhhdCB0aGlzIGxlYXZlcyB1cyBubyByb29tIHRvIHN1cHBvcnQgdGhlIGFkZGl0aW9uYWwgCmtl
eXBhZCBmdW5jdGlvbmFsaXR5IGluIGZ1dHVyZS4gSGF2aW5nIG5vdyBkb3VibGUtY2hlY2tlZCBh
IGRhdGFzaGVldCwgCnRoZSBpbnB1dHMgYXJlIGFsc28gYSB0d28tZGltZW5zaW9uYWwgbXV4IChz
aGFyaW5nIHRoZSBzZWdtZW50IGxpbmVzKSwgCnNvIHRoZSBkZXZpY2UgZWZmZWN0aXZlbHkgaGFz
IHR3byBkaXN0aW5jdCBidXQgbnVtZXJpY2FsbHktb3ZlcmxhcHBpbmcgCmNoaWxkIGFkZHJlc3Mg
c3BhY2VzIC0gb25lIGFkZHJlc3NlZCBieSAoZ3JpZCxzZWdtZW50KSBhbmQgdGhlIG90aGVyIGJ5
IAooc2VnbWVudCxrZXkpLgoKUm9iLCBLcnlzenRvZiwgYW55IHRob3VnaHRzIG9uIHRoZSBiZXN0
IERUIGlkaW9tIHRvIGxlYXZlIGFjY29tbW9kYXRpb24gCmZvciB0aGF0PyBJJ20gdGhpbmtpbmcg
ZWl0aGVyIHJlcXVpcmUgYW4gaW50ZXJtZWRpYXRlIG5vZGUgdG8gY29udGFpbiAKZWFjaCBub3Rp
b25hbCBhZGRyZXNzIHNwYWNlLCBvciBwZXJoYXBzIGFkZCBhbm90aGVyIGxlYWRpbmcgYWRkcmVz
cyBjZWxsIAp0byBzZWxlY3QgYmV0d2VlbiB0aGVtPyBJIGRvbid0IGJlbGlldmUgYW55IG9mIHRo
ZXNlIHRoaW5ncyBoYXZlIGZ1cnRoZXIgCmZ1bmN0aW9uYWxpdHkgYmV5b25kIHRoYXQuCgpUaGFu
a3MsClJvYmluLgoKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4
YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2xlZHMvY29tbW9u
Lmg+Cj4gKwo+ICsgICAgc3BpIHsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAr
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKyAgICAgICAgbGVkLWNvbnRyb2xsZXJA
MCB7Cj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGl0YW5tZWMsdG0xNjI4IjsKPiArICAg
ICAgICAgICAgcmVnID0gPDA+Owo+ICsgICAgICAgICAgICBzcGktMy13aXJlOwo+ICsgICAgICAg
ICAgICBzcGktbHNiLWZpcnN0Owo+ICsgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1
MDAwMDA+Owo+ICsgICAgICAgICAgICB0aXRhbm1lYyxncmlkID0gL2JpdHMvIDggPDQgMyAyIDE+
Owo+ICsgICAgICAgICAgICB0aXRhbm1lYyxzZWdtZW50LW1hcHBpbmcgPSAvYml0cy8gOCA8NCA1
IDYgMSAyIDMgNz47Cj4gKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICsgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKyAgICAgICAgICAgIGFsYXJtQDUsNCB7
Cj4gKyAgICAgICAgICAgICAgICByZWcgPSA8NSA0PjsKPiArICAgICAgICAgICAgICAgIGZ1bmN0
aW9uID0gTEVEX0ZVTkNUSU9OX0FMQVJNOwo+ICsgICAgICAgICAgICB9Owo+ICsgICAgICAgIH07
Cj4gKyAgICB9Owo+ICsuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
