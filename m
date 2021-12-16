Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20892C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Dec 2021 06:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdT+VZmAGTMMlQ+MnByVBnbRkLJPAqqGaPThbvC2tnc=; b=J8vSQtQO892K3ikA8WsAo7go01
	T4mvpHoWYjrKnVyoTpBLaYkCqD/sGGHKnFc6fNvbPimvUNrFkhn5IQE6sHPQ/ualJcikbaCeIV9kc
	cJr9+b8mJm0WGEtZ+gu+ipi0q/65SGP8BfAQvZLR7gvwT63vVyycc+s03pFg8+Qd9LsTpZZjuIMgb
	3WGcnavnI1wohzAweOvE4jy/H7h/hMO3RZdlvFY7uE/G7sWQa8rQKK+kYRZJYBRDY7SkRMhNyrR50
	Kv6TeExzwMBCu+0r71DF3fy91rqFdfuM/qWtEKNE/qqawUafJhK4EYxt5XA5PdTf+FaxzKSZ9NPWQ
	aK9xedCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxjuj-003jl8-RL; Thu, 16 Dec 2021 06:06:49 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxjug-003jiD-V5; Thu, 16 Dec 2021 06:06:48 +0000
Received: from [10.28.39.221] (10.28.39.221) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 16 Dec
 2021 14:06:37 +0800
Subject: Re: [PATCH 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-4-qianggui.song@amlogic.com>
 <1j35mv31c1.fsf@starbuckisacylon.baylibre.com>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <0a3efa6f-f048-ee04-a2d6-30f337f3d484@amlogic.com>
Date: Thu, 16 Dec 2021 14:07:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1j35mv31c1.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.221]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_220647_056027_58040757 
X-CRM114-Status: GOOD (  26.58  )
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

SGksIEplcm9tZQoKT24gMjAyMS8xMi8xNCDkuIvljYg2OjAwLCBKZXJvbWUgQnJ1bmV0IHdyb3Rl
Ogo+IAo+IAo+IE9uIFR1ZSAxNCBEZWMgMjAyMSBhdCAxMDoyMSwgUWlhbmdndWkgU29uZyA8cWlh
bmdndWkuc29uZ0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4gCj4+IEFkZCBuZXcgcGluY3RybCBkcml2
ZXIgZm9yIEFtbG9naWMncyBNZXNvbi1TNCBTb0Mgd2hpY2ggc2hhcmUgdGhlCj4+IHNhbWUgcmVn
aXN0ZXIgbGF5dG91dCBhcyB0aGUgcHJldmlvdXMgTWVzb24tQTEuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFFpYW5nZ3VpIFNvbmcgPHFpYW5nZ3VpLnNvbmdAYW1sb2dpYy5jb20+Cj4+IC0tLQo+IAo+
IFsuLi5dCj4gCj4+ICsKPj4gKy8qIEJhbmsgRCBmdW5jMSAqLwo+PiArc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGludCB1YXJ0X2JfdHhfZF9waW5zW10JCT0geyBHUElPRF8wIH07Cj4+ICtzdGF0aWMg
Y29uc3QgdW5zaWduZWQgaW50IHVhcnRfYl9yeF9kX3BpbnNbXQkJPSB7IEdQSU9EXzEgfTsKPj4g
K3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgdWFydF9iX2N0c19kX3BpbnNbXQkJPSB7IEdQSU9E
XzIgfTsKPj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgdWFydF9iX3J0c19kX3BpbnNbXQkJ
PSB7IEdQSU9EXzMgfTsKPiAKPiBZb3VyIFM4MDV4MiBkb2N1bWVuYXRpb24gc2F5cyB0aGUgNCBw
aW5zIGFib3ZlIGFyZSBIRE1JIHJlbGF0ZWQgZm9yIGZ1bmMgMQo+IAo+PiArc3RhdGljIGNvbnN0
IHVuc2lnbmVkIGludCByZW1vdGVfb3V0X3BpbnNbXQkJPSB7IEdQSU9EXzQgfTsKPj4gK3N0YXRp
YyBjb25zdCB1bnNpZ25lZCBpbnQgcmVtb3RlX2luX3BpbnNbXQkJPSB7IEdQSU9EXzUgfTsKPiAK
PiBTUERJRiBmb3IgdGhvc2UgMgo+IAo+PiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBqdGFn
XzFfY2xrX3BpbnNbXQkJPSB7IEdQSU9EXzYgfTsKPj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBp
bnQganRhZ18xX3Rtc19waW5zW10JCT0geyBHUElPRF83IH07Cj4+ICtzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IGp0YWdfMV90ZGlfcGluc1tdCQk9IHsgR1BJT0RfOCB9Owo+PiArc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCBqdGFnXzFfdGRvX3BpbnNbXQkJPSB7IEdQSU9EXzkgfTsKPiAKPiBJ
MkMgZm9yIHRob3NlIDQKPiAKPiBJdCBnb2VzIG9uIGxpa2UgdGhpcyBmb3IgdGhlIHJlc3Qgb2Yg
R1BJTyBCYW5rIEQgYW5kIEkgZGlkIG5vdCBjaGVjayB0aGUKPiBvdGhlciBiYW5rcwo+IAo+IENv
dWxkIHlvdSBwbGVhc2UgY2xhcmlmeQo+ICogRG9lcyB0aGUgUzQgYXBwbGllcyB0byBTODA1WDIs
IFM5MDVZNCwgQm90aCA/Cj4gKiBJcyB0aGUgUzgwNVgyIERhdGFzaGVldCBSZXZpc2lvbiAwLjQg
YWNjdXJhdGUgPwoKRXhwbGFpbiB0aGUgYWJvdmUgY29uZnVzZSBoZXJlLCB5ZXMsIHRoZSBTNCBk
b2VzIGFwcGx5IHRvIGJvdGggUzgwNVgyIAphbmQgUzkwNVk0LCBhbmQgSSBjcmVhdGUgdGhpcyAu
YyBkcml2ZXIgYmFzZWQgb24gUzgwNVgyIERhdGFzaGVldCAKUmV2aXNpb24gMC41LiBJIGhhdmUg
bm8gUzgwNVgyIERhdGFzaGVldCAwLjQgb24gaGFuZCBob3dldmVyIG91ciAKcmVmZXJlbmNlIGJv
YXJkIHdvcmtzIHdlbGwgYmFzZWQgb24gUmV2aXNpb24gMC41IGNvbmZpZ3VyYXRpb24uCj4gCj4+
ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IGNsazEyXzI0X3BpbnNbXQkJPSB7IEdQSU9EXzEw
IH07Cj4+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHB3bV9nX2hpel9waW5zW10JCT0geyBH
UElPRF8xMSB9Owo+PiArCj4gCj4gWy4uLl0KPiAKPj4gKwo+PiArc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCB0ZG1fZ3JvdXBzW10gPSB7Cj4+ICsJInRkbV9kMl9jIiwgInRkbV9kM19jIiwgInRk
bV9mczFfYyIsICJ0ZG1fZDRfYyIsICJ0ZG1fZDVfYyIsCj4+ICsJInRkbV9mczFfZCIsICJ0ZG1f
ZDRfZCIsICJ0ZG1fZDNfZCIsICJ0ZG1fZDJfZCIsICJ0ZG1fc2NsazFfZCIsCj4+ICsJInRkbV9z
Y2xrMV9oIiwgInRkbV9mczFfaCIsICJ0ZG1fZDJfaCIsICJ0ZG1fZDNfaCIsICJ0ZG1fZDRfaCIs
Cj4+ICsJInRkbV9kMSIsICJ0ZG1fZDAiLCAidGRtX2ZzMCIsICJ0ZG1fc2NsazAiLCAidGRtX2Zz
MiIsICJ0ZG1fc2NsazIiLAo+PiArCSJ0ZG1fZDRfeiIsICJ0ZG1fZDVfeiIsICJ0ZG1fZDYiLCAi
dGRtX2Q3Igo+PiArfTsKPiAKPiBPbiBwcmV2aW91cyBjaGlwLCB0aGVyZSB3ZXJlIHBpbiBhc3Np
Z25lZCB0byB0ZG0gQSwgQiBvciBDLgo+IE9uIHRoaXMgZ2VuZXJhdGlvbiwgaXQgc2VlbXMgeW91
IGhhdmUgYWRkZWQgYSBzZWNvbmQgbGV2ZWwgb24gcGlubXV4aW5nCj4gdG8gcmUtcm91dGUgdGhl
IGF1ZGlvIHBpbnMgdG8gZGlmZmVyZW50IGNvbnRyb2xsZXJzCj4gCj4gSW4gc3VjaCBjYXNlLCBJ
IGRvbid0IHRoaW5rIHRoZXkgYmVsb25nIGluIHRoZSBzYW1lIGdyb3VwLgo+IERlcGVuZGluZyBv
biBzZXR0aW5zLCBEMiBhbmQgRDMgY291bGQgYmUgdW5yZWxhdGVkCj4gCj4gSSB0aGluayBlYWNo
IGF1ZGlvIHBpbiBzaG91bGQgaGF2ZSBpdHMgb3duIGdyb3VwIChvbmUgZ3JvdXAgZm9yIEQzLCBv
bmUKPiBENCwgZXRjIC4uLikKPiAKQWNjb3JkaW5nIHRvIG91ciBhdWRpbyBjb2xsZWFndWUsIG9u
IHRoaXMgY2hpcCwgdGRtIEEvQi9DIGNhbiBjaG9vc2UgCndoaWNoIHBpbnMgYXJlIHJvdXRlZCB0
byB0aGVpciBjb250cm9sbGVycyBmcmVlbHkgYnkgd3JpdGluZyBzcGVjaWFsIApyZWdpc3RlcnMs
IHNheSwgdGRtX2QyX2MgY2FuIGJlIGFzc2lnbmVkIHRvIGFueSBvZiB0ZG0gYSwgYiBhbmQgYyBi
eSAKZGVtYW5kLCBzbyBubyBuZWVkIHRvIHNwZWNpZnkgYS9iL2Mgd29yZHMgYW55IG1vcmUuCj4+
ICsKPj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbWNsa19ncm91cHNbXSA9IHsKPj4gKwki
bWNsa18xX2MiLCAibWNsa18xX2QiLCAibWNsa18xX2giLCAibWNsa18yIgo+PiArCj4+ICt9Owo+
IAo+IG1jbGtfMSBhbmQgbWNsa18yIHNob3VsZCBiZSBpbiBzZXBhcmF0ZSBncm91cHMKPiAKT2th
eSx3aWxsIGZpeCBpdCBpbiBuZXh0IHBhdGNoLgo+PiArCj4+ICtzdGF0aWMgY29uc3QgY2hhciAq
IGNvbnN0IHJlbW90ZV9vdXRfZ3JvdXBzW10gPSB7Cj4+ICsJInJlbW90ZV9vdXQiCj4+ICt9Owo+
PiArCj4+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHJlbW90ZV9pbl9ncm91cHNbXSA9IHsK
Pj4gKwkicmVtb3RlX2luIgo+PiArfTsKPj4gKwo+PiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25z
dCBjbGsxMl8yNF9ncm91cHNbXSA9IHsKPj4gKwkiY2xrMTJfMjQiCj4+ICt9Owo+PiArCj4+ICtz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGNsa18zMmtfaW5fZ3JvdXBzW10gPSB7Cj4+ICsJImNs
a18zMmtfaW4iCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHB3bV9h
X2hpel9ncm91cHNbXSA9IHsKPj4gKwkicHdtX2FfaGl6Igo+PiArfTsKPj4gKwo+IAo+IEknbSBj
dXJpb3VzIHRvIGtub3cgd2hhdCB0aGUgcHdtIGhpeiBmdW5jdGlvbiBpcyA/Cj4gClRoaXMgaXMg
YSBzcGVjaWFsIG1vZGUgb2YgcHdtIGFuZCBzaG9ydCBmb3IgaGlnaC1pbnRlbnNpdHkgem9uZS4g
SWYgdGhpcyAKbW9kZSBpcyBlbmFibGUsIHdoZW4gcHdtIGlzIGluICJvbiIgdGltZSwgcGluIG9m
IHB3bSBiZWNvbWUgaGl6IHN0YXRlLCAKdGhlIGhpZ2ggbGV2ZWwgaXMgbm90IGRyaXZlbiBieSBj
aGlwcyBidXQgYSBwdWxsLXVwIHJlc2lzdG9yLgo+IC4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
