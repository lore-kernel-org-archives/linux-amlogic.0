Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BE5C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDd7IIPlq1l2SepvBJsURvmQMMsZV2Hlli5VGo2eOI0=; b=k86DCF2kcWAPg6
	0yh2S0IMn70rUAMi8TpdlfR4taoPcCNjTYmesaFwaSWGFQDX/BWhK9Z4NdwiCYki9BOUoBF+rzs1k
	zsOIH0dlL+5tfmMZ0oV1q8P/doPpovGas4fsJCjrxt2anOS+Avm7wOz/iUn4UwlJKN+WKZoF/Zt1j
	YT3mkrW6d+7oB7ZFkYzD7kYhC3cnxLiJqIwKT2QoFzI/2Z4MQ5S7Nd8P+JSFom0spHmrO+bAkhGvx
	yz9/mVbcvVjO1e5EPw5ZgzgsWEtGasDACadjzZds6SgEVv+839zoTZjoXjEfPtwK2RWIy1DHsur6d
	2RdnSvd7nHoud8WW//Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrJw-001Wt8-6V; Thu, 31 Mar 2022 09:42:24 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrJn-001WpV-RZ; Thu, 31 Mar 2022 09:42:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id A7D9580DB;
 Thu, 31 Mar 2022 09:40:03 +0000 (UTC)
Date: Thu, 31 Mar 2022 12:42:10 +0300
From: Tony Lindgren <tony@atomide.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <YkV3ch7R7YxlATW+@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330084710.3r6b5pjspz5hdmy6@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_024215_968227_73E7731D 
X-CRM114-Status: GOOD (  26.27  )
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

SGksCgoqIE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPiBbNzAwMTAxIDAyOjAwXToK
PiBIaSBNYXJlaywKPiAKPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCAxMDowNjoxM0FNICswMjAw
LCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+ID4gT24gMjUuMDMuMjAyMiAxNzoxMSwgTWF4aW1l
IFJpcGFyZCB3cm90ZToKPiA+ID4gV2hpbGUgdGhlIGN1cnJlbnQgY29kZSB3aWxsIHRyaWdnZXIg
YSBuZXcgY2xrX3NldF9yYXRlIGNhbGwgd2hlbmV2ZXIgdGhlCj4gPiA+IHJhdGUgYm91bmRhcmll
cyBhcmUgY2hhbmdlZCB0aHJvdWdoIGNsa19zZXRfcmF0ZV9yYW5nZSwgdGhpcyBkb2Vzbid0Cj4g
PiA+IG9jY3VyIHdoZW4gY2xrX3B1dCgpIGlzIGNhbGxlZC4KPiA+ID4KPiA+ID4gSG93ZXZlciwg
dGhpcyBpcyBlc3NlbnRpYWxseSBlcXVpdmFsZW50IHNpbmNlLCBhZnRlciBjbGtfcHV0KCkKPiA+
ID4gY29tcGxldGVzLCB0aG9zZSBib3VuZGFyaWVzIHdvbid0IGJlIGVuZm9yY2VkIGFueW1vcmUu
Cj4gPiA+Cj4gPiA+IExldCdzIGFkZCBhIGNhbGwgdG8gY2xrX3NldF9yYXRlX3JhbmdlIGluIGNs
a19wdXQgdG8gbWFrZSBzdXJlIHRob3NlCj4gPiA+IHJhdGUgYm91bmRhcmllcyBhcmUgZHJvcHBl
ZCBhbmQgdGhlIGNsb2NrIGRyaXZlcnMgY2FuIHJlYWN0Lgo+ID4gPgo+ID4gPiBMZXQncyBhbHNv
IGFkZCBhIGZldyB0ZXN0cyB0byBtYWtlIHN1cmUgdGhpcyBjYXNlIGlzIGNvdmVyZWQuCj4gPiA+
Cj4gPiA+IEZpeGVzOiBjODBhYzUwY2JiMzcgKCJjbGs6IEFsd2F5cyBzZXQgdGhlIHJhdGUgb24g
Y2xrX3NldF9yYW5nZV9yYXRlIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lQGNlcm5vLnRlY2g+Cj4gPiAKPiA+IFRoaXMgcGF0Y2ggbGFuZGVkIHJlY2VudGx5IGlu
IGxpbnV4LW5leHQgMjAyMjAzMjggYXMgY29tbWl0IDdkYWJmYTJiYzQ4MCAKPiA+ICgiY2xrOiBE
cm9wIHRoZSByYXRlIHJhbmdlIG9uIGNsa19wdXQoKSIpLiBTYWRseSBpdCBicmVha3MgYm9vdGlu
ZyBvZiAKPiA+IHRoZSBmZXcgb2YgbXkgdGVzdCBzeXN0ZW1zOiBTYW1zdW5nIEFSTSAzMmJpdCBF
eHlub3MzMjUwIGJhc2VkIFJpbmF0byAKPiA+IGJvYXJkIGFuZCBhbGwgQW1sb2dpYyBNZXNvbiBH
MTJCL1NNMSBiYXNlZCBib2FyZHMgKE9kcm9pZCBDNCwgTjIsIEtoYWRhcyAKPiA+IFZJTTMvVklN
M2wpLiBSaW5hdG8gaGFuZ3MgYWx3YXlzIHdpdGggdGhlIGZvbGxvd2luZyBvb3BzOgo+ID4gCj4g
PiAtLS0+OC0tLQo+ID4gCj4gPiBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogTUNUIGhhbmdz
IGFmdGVyIHdyaXRpbmcgNCAob2Zmc2V0OjB4NDIwKQo+ID4gQ1BVOiAxIFBJRDogMCBDb21tOiBz
d2FwcGVyLzEgTm90IHRhaW50ZWQgNS4xNy4wLXJjMS0wMDAxNC1nN2RhYmZhMmJjNDgwIAo+ID4g
IzExNTUxCj4gPiBIYXJkd2FyZSBuYW1lOiBTYW1zdW5nIEV4eW5vcyAoRmxhdHRlbmVkIERldmlj
ZSBUcmVlKQo+ID4gIMKgdW53aW5kX2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHgxMC8weDE0
Cj4gPiAgwqBzaG93X3N0YWNrIGZyb20gZHVtcF9zdGFja19sdmwrMHg1OC8weDcwCj4gPiAgwqBk
dW1wX3N0YWNrX2x2bCBmcm9tIHBhbmljKzB4MTBjLzB4MzI4Cj4gPiAgwqBwYW5pYyBmcm9tIGV4
eW5vczRfbWN0X3RpY2tfc3RvcCsweDAvMHgyYwo+ID4gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IE1DVCBoYW5ncyBhZnRlciB3cml0aW5nIDQgCj4gPiAob2Zmc2V0OjB4NDIw
KSBdLS0tCj4gPiAKPiA+IC0tLT44LS0tCj4gPiAKPiA+IEFtbG9naWMgYm9hcmRzIGhhbmcgcmFu
ZG9tbHkgZHVyaW5nIGVhcmx5IHVzZXJzcGFjZSBpbml0LCB1c3VhbGx5IGp1c3QgCj4gPiBhZnRl
ciBsb2FkaW5nIHRoZSBkcml2ZXIgbW9kdWxlcy4KPiA+IAo+ID4gUmV2ZXJ0aW5nICRzdWJqZWN0
IG9uIHRvcCBvZiBsaW51eC1uZXh0IGZpeGVzIGFsbCB0aG9zZSBwcm9ibGVtcy4KPiA+IAo+ID4g
SSB3aWxsIHRyeSB0byBhbmFseXplIGl0IGEgYml0IG1vcmUgYW5kIGlmIHBvc3NpYmxlIHByb3Zp
ZGUgc29tZSBtb3JlIAo+ID4gdXNlZnVsL21lYW5pbmcgZnVsbCBsb2dzIGxhdGVyLgo+IAo+IEkn
bSBub3Qgc3VyZSB3aGF0IGNvdWxkIGdvIHdyb25nIHRoZXJlLCBidXQgaWYgeW91IGNhbiBmaWd1
cmUgb3V0IHRoZQo+IGNsb2NrLCBpZiBpdCB0cmllcyB0byBzZXQgYSBuZXcgcmF0ZSBhbmQgd2hh
dCByYXRlIGl0IGlzLCBpdCB3b3VsZCBiZQo+IGF3ZXNvbWUgOikKCkknbSBhbHNvIHNlZWluZyBj
bG9ja2V2ZW50IGJyZWFrIG9uIG9tYXBzIGFzIGEgd3Jvbmcgc291cmNlIGNsb2NrIGdldHMKcGlj
a2VkLgoKSXQgc2VlbXMgdGhlIGR0cyBhc3NpZ25lZC1jbG9jay1wYXJlbnRzIG5vIGxvbmdlciB3
b3JrcyBub3c/CgpTbyB0aGUgZm9sbG93aW5nIG5vIGxvbmdlciBzZXRzIG9tYXBfMzJrX2ZjayBh
cyB0aGUgY2xvY2tldmVudCBzb3VyY2U6Cgp0aW1lckAwIHsKCWFzc2lnbmVkLWNsb2NrcyA9IDwm
Z3B0MV9mY2s+OwoJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmb21hcF8zMmtfZmNrPjsKfTsK
ClJlZ2FyZHMsCgpUb255CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
