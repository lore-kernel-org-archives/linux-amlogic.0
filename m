Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2AC04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq7UfrA8emReV1++Ijuv4hdWO7uUUdGXqOEIY33n8aQ=; b=oOxFgDDxCvQsiyLZJ831961cZH
	L+0W7Uot8pQ2t1/bw1+kjEUOBBs7/wVKdWDHHFL5o0fGxvjKXWf/0Mvm9PWs8Fw4NWIKUUPy70CwG
	9nCDoI6vuJ5MRL/KY1GZgT7HVrzMOtgczjAibgQbs+5+c1R01i4H6ZVY24nm5vZkdgH9P+K2i01FK
	MTZUNkx2GI2G5GgX4EOp+dJGlcKqhU+eCtQ7PZKiNM6CfBgUrBLTy8mRVVHPDPPSFIa/Ztc4pSS/i
	vxOUMDOkot5ZO9lAs0ccYGxBXlWZm7KKAjPeP4MqUxME1cj0un9h7hRnvNYcTV1apiKWtKotwjpFj
	e/0GEelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzJH-005zmn-9M; Thu, 28 Jul 2022 08:55:59 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzJ2-005zdy-Mn; Thu, 28 Jul 2022 08:55:46 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Jul
 2022 16:55:41 +0800
Message-ID: <965f83cf-4695-f89c-5ede-2f6b2524f392@amlogic.com>
Date: Thu, 28 Jul 2022 16:55:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
	<khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
 <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
 <1j4jz1hbr5.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1j4jz1hbr5.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_015544_796949_09D831B6 
X-CRM114-Status: GOOD (  18.86  )
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

SGkgSmVyb21lLAoJVGhhbmtzIGZvciB5b3VyIHJlcGx5IGFuZCBleHBsYW5hdGlvbi4KCk9uIDIw
MjIvNy8yOCAxNjoyNywgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0K
PiAKPiAKPiBPbiBUaHUgMjggSnVsIDIwMjIgYXQgMTY6MDYsIFl1IFR1IDx5dS50dUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cj4gCj4+IEhpIEpC77yMCj4+Cj4+IE9uIDIwMjIvNy8yOCAxNTowOCwgSmVy
b21lIEJydW5ldCB3cm90ZToKPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIFRodSAy
OCBKdWwgMjAyMiBhdCAxMzo0MSwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+
Cj4+Pj4gMS4gQWRkIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyIGZvciBTNCBTT0MuCj4+Pj4KPj4+
PiBZdSBUdSAoMyk6Cj4+Pj4gICAgIGR0LWJpbmRpbmdzOiBjbGs6IG1lc29uOiBhZGQgUzQgU29D
IGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MKPj4+PiAgICAgYXJtNjQ6IGR0czogbWVzb246IGFk
ZCBTNCBTb2MgY2xvY2sgY29udHJvbGxlciBpbiBEVAo+Pj4+ICAgICBjbGs6IG1lc29uOiBzNDog
YWRkIHM0IFNvQyBjbG9jayBjb250cm9sbGVyIGRyaXZlcgo+Pj4+Cj4+Pj4gVjEgLT4gVjI6IENo
YW5nZSBmb3JtYXQgYXMgZGlzY3Vzc2VkIGluIHRoZSBlbWFpbC4KPj4+Pgo+Pj4+IExpbms6aHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDIyMDcwODA2Mjc1Ny4zNjYyLTEt
eXUudHVAYW1sb2dpYy5jb20vCj4+Pj4KPj4+PiAgICAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dp
YyxneGJiLWNsa2MudHh0ICAgICAgfCAgICAxICsKPj4+PiAgICBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4+PiAgICBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSAgICAgfCAgIDExICsKPj4+PiAgICBkcml2ZXJz
L2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDE1ICsKPj4+PiAgICBk
cml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4+
PiAgICBkcml2ZXJzL2Nsay9tZXNvbi9zNC5jICAgICAgICAgICAgICAgICAgICAgICAgfCA0NzMy
ICsrKysrKysrKysrKysrKysrCj4+Pj4gICAgZHJpdmVycy9jbGsvbWVzb24vczQuaCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDI5NiArKwo+Pj4+ICAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svczQtY2xrYy5oICAgICAgICAgICB8ICAxNDYgKwo+Pj4+ICAgIDggZmlsZXMgY2hhbmdlZCwg
NTIwMyBpbnNlcnRpb25zKCspCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xr
L21lc29uL3M0LmMKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVzb24v
czQuaAo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L3M0LWNsa2MuaAo+Pj4+Cj4+Pj4KPj4+PiBiYXNlLWNvbW1pdDogYjI5M2JjOTI4NmVlMjE4MjRl
OTNmMGZjZmVkM2I3OGZkZmVlMDFlNgo+Pj4gUGxlYXNlIGRvbid0IHBvc3QgdW50aWwgeW91IGhh
dmUgYWRkcmVzc2VkICpBTEwqIHRoZSBjb21tZW50cyBmcm9tIHRoZQo+Pj4gcHJldmlvdXMgdmVy
c2lvbi4KPj4gVGhlIGxhc3QgZW1haWwgYXNrZWQgeW91IHRvIGFkb3B0IEExIG1ldGhvZCwgYnV0
IHlvdSBkaWQgbm90IHJlcGx5Pwo+Pgo+Pj4gQXQgZmlyc3QgZ2xhbmNlLCBJIGNhbiBzZWUgdGhh
dCB0aGlzIGlzIHN0aWxsIGEgc2luZ2xlIGRyaXZlciBmb3IKPj4+IHdoYXQgaXMgb2J2aW91c2x5
IDIgY29udHJvbGxlcnMgd2l0aCAyIHJlZ2lzdGVyIHNwYWNlcy4gU2ltcGxlIGNvbW1lbnRzCj4+
PiBsaWtlIHRoZSAiPDwgMiIgaW4gdGhlIHJlZ2lzdGVyIGRlY2xhcmF0aW9uIGhhdmUgbm90IGJl
ZW4gYWRkcmVzc2VkIGVpdGhlci4KPj4gSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBzaG91bGQgYmUg
YSBjb250cm9sbGVyLCBqdXN0IHR3byBhZGRyZXNzCj4+IGRlc2NyaXB0aW9ucy4gT25lIGlzIHRo
ZSB2YXJpb3VzIFBMTCByZWdpc3RlcnMgYW5kIG9uZSBpcyB0aGUgY2xvY2sgZm9yCj4+IHRoZSBw
ZXJpcGhlcmFscy4gQW5kIFBMTCBpcyB0byBwcm92aWRlIGEgY2xvY2sgc291cmNlIGZvciB2YXJp
b3VzCj4+IHBlcmlwaGVyYWwgY2xvY2tzLiBTbyBhIGNsb2NrIGNvbnRyb2xsZXIgaXMgcmVhc29u
YWJsZS4gSSB0aGluayB5b3UgZ290Cj4+IGl0IHdyb25nLgo+IAo+IEkgZG9uJ3QgdGhpbmsgSSBk
by4gVGhpcyBsb29rcyBleGFjdGx5IGxpa2UgdGhlIEExLgo+IFRoZSBwb3N0IG9mIHRoYXQgY29u
dHJvbGxlciBhcmUgc3RpbGwgaW4gdGhlICBhcmNoaXZlIGFuZCBJIGFtIHN1cmUgeW91cgo+IGNv
bGxlYWd1ZXMgY2FuIGdpdmUgeW91IHRoZSBoaXN0b3J5Lgo+IAo+IFlvdSBjbGVhcmx5IGhhdmUg
cmVnaXN0ZXIgcmVnaW9ucyBwcm92aWRpbmcgY2xvY2ssIHNlcGFyYXRlZCBieQo+IDB4ODAwMC4g
Q2xhaW1pbmcgdGhhdCBhcyBvbmUgYmlnIHJlZ2lvbiBpcyBiYWQgZGVzaWduLgo+IAo+IFRoZXJl
IGhhcyBiZWVuIHNldmVyYWwgcmVtYXJrcyBhYm91dCB1c2luZyBhIGJpZyBzeXNjb24gb24gVjEs
Cj4gdW5hZGRyZXNzZWQgdG9vLgo+IAo+IENDRiBoYXMgZXZlcnl0aGluZyBuZWNlc3NhcnkgaW4g
cGxhY2UgdG8gaGFuZGxlIGVhY2ggcmVnaXN0ZXIgcmVnaW9uCj4gc2VwYXJhdGVseSwgcHJvcGVy
bHkgYW5kIHBhc3MgY2xvY2sgYXJvdW5kLgo+IAo+IFlvdSBjYW4gaGFuZGxlIGl0IGFzIGEgc2lu
Z2xlIGNvbnRyb2xsZXIsIGNsYWltaW5nIHRoZSB0d28gcmVnaW9ucwo+IGluZGl2aWR1YWxseSBi
dXQ6Cj4gIyAxIC0gaGFuZGxpbmcgMiBkaWZmZXJlbnQgcmVnbWFwcyBpbiB0aGUgY29udHJvbGxl
ciBpcyBnb2luZyB0byBiZQo+ICAgICAgICBiaWdnZXIgbWVzcyB0aGFuIHlvdSB0aGluawo+ICMg
MiAtIEkgYW0gZmFyIGZyb20gY29udmluY2VkIHRoZXJlIGlzIGFueSByZWFzb24gdG8gZG8gc28K
PiAKSXQgbWFrZXMgc2Vuc2UsIGFzIHlvdSBzYXksIHRvIHNlcGFyYXRlIHRoZSB0d28gY29udHJv
bGxlcnMuIEJ1dCBJIHRoaW5rIAp0aGUgb25seSB0aGluZyB0aGF0IHdhcyBmb3JjZWQgYXBhcnQg
d2FzIHRoYXQgdGhlIGRpZ2l0YWwgZGVzaWduZXJzIApkaWRuJ3QgcHV0IHRoZXNlIHJlZ2lzdGVy
cyB0b2dldGhlciB3aGVuIHRoZXkgd2VyZSBkZXNpZ25pbmcgdGhlIGNoaXBzLgoKSSdtIGdvaW5n
IHRvIHNlcGFyYXRlIHRoZSB0d28gY29udHJvbGxlcnMgbGlrZSB5b3Ugc2FpZC4KCj4gCj4+Cj4+
IE9rLCBpZiB5b3UgaW5zaXN0IG9uIHVzaW5nIHR3byBjbG9jayBjb250cm9sbGVycywsIHBsZWFz
ZSBwcm92aWRlIHlvdXIgdGhlCj4+IHJlYXNvbiBhbmQgZXhhbXBsZSBjb2RlPwo+Pgo+Pj4gU2Vl
aW5nIHRoYXQsIEkgaGF2ZSBub3QgcmV2aWV3ZWQgdGhpcyB2ZXJzaW9uIGZ1cnRoZXIuCj4+PiBJ
IHdvbid0IHVudGlsIGFsbCB0aGUgY29tbWVudHMgZnJvbSB2MSBhcmUgZWl0aGVyIGFkZHJlc3Nl
ZCBvciBhbnN3ZXIKPj4+IFJlZ2FyZHMKPj4+IEplcm9tZQo+Pj4gLgo+IAo+IC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
