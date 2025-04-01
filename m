Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9DFC36018
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Apr 2025 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfHLfQSnwvAHeNnWxeHzJN6mrHM1DRc3fPeIGWWk720=; b=CS+t2QWM3gCTTW
	2lMNkLyuUmDGixbG2bmbrimwVciZySpQk8rDL21o8oDlRPO+fNQzsDJmlSstMWwoRFgq6iH0NnUEH
	wpqrnU/Xqb7FVxMt1GWZo/7s+m+fjaUgHF+ag9G4JMDkksNuJ1TdlrfUYjaOby4WhWtPjncEKP88k
	2d9NiuJs2E4T3Xn4Aj4eGkq5xbk0echOXjseUQlrbvhVpvqBSCMjxYfvv4dwsQiR8SIwBAfsleEkG
	ingGQHc34n0jUuQgKGezu0LojI5OSjbyI7pbqNXQy65fxH9pVnjYTvxr+xXlJs3bmSr60gh/q0d/Z
	fk3RoMXr278M5KXd43bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbG5-00000003NkV-3MUh;
	Tue, 01 Apr 2025 13:02:25 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbDy-00000003NMi-0lhm
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Apr 2025 13:00:15 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 80A60240028
	for <linux-amlogic@lists.infradead.org>; Tue,  1 Apr 2025 15:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1743512410; bh=DzC9bukHy47TjGfwcug8gM7evmzmuBLiRPZ4FYnSoOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=LOKHmYAD92WGXRYddpx9klsLdIa724JsAZvgeQYdDVzxgFeVHQVircrF0Jg2GRDRO
	 t20sTFLJqDPmw9155QtOZ1Q4Z1roVmL/RFOxMYkrif9+oqi6cMHJIWxu3N9+12bTtX
	 70ioAt5Wez9Fissvl4aWiIy1WpaNucvTzDkLqv4uwiGB2r22uKxDeZMHgdFo365xUD
	 Z2oXanIvf0eGai3JG8orStMdKbhIoRk6CojNipN0QaP8u2o8XQENAmeJWpuaJ9Q53O
	 2RFwDOD5ESxHtEvKCG0gTnhG39w2EHSWkvM1LqPeHcPUkFXpapc09WOtwn4O75CtF0
	 Jmkng6GGUxR/g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZRp4m3h9Mz9rxQ;
	Tue,  1 Apr 2025 15:00:08 +0200 (CEST)
Date: Tue,  1 Apr 2025 13:00:08 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
Message-ID: <Z-vjWFFWvo1gesCe@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
 <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_060014_508609_617B7327 
X-CRM114-Status: GOOD (  25.54  )
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

T24gU3VuLCBNYXIgMzAsIDIwMjUgYXQgMTE6MTA6MjhQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gT24gU3VuLCBNYXIgMjMs
IDIwMjUgYXQgMTozOOKAr1BNIEouIE5ldXNjaMOkZmVyIHZpYSBCNCBSZWxheQo+IDxkZXZudWxs
K2oubmUucG9zdGVvLm5ldEBrZXJuZWwub3JnPiB3cm90ZToKPiBbLi4uXQo+ID4gKyAgICAgICAg
ICAgICAgIGV0aF9waHkwOiBldGhlcm5ldC1waHlAMCB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAvKiBJQyBQbHVzIElQMTAxQSAoMHgwMjQzMGM1NCkgKi8KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwwPjsKPiBEb2VzIHJlZyA9IDwxPiBhbHNvIHdvcmsgb24geW91ciBi
b2FyZD8KPiAwIGlzIHRoZSBicm9hZGNhc3QgYWRkcmVzcy4gSXQncyB1bmZvcnR1bmF0ZWx5IHNv
bWV0aGluZyB0aGF0IHdlIHN0aWxsCj4gaGF2ZSBpbmNvcnJlY3QgaW4gYSBsb3Qgb2YgLmR0cyBm
aWxlcy4KClVuZm9ydHVuYXRlbHkgbm90LiBJIHRyaWVkIGFkZHJlc3NlcyAxIHRvIDMxIHdpdGhv
dXQgc3VjY2Vzcywgd2hpY2gKc2VlbXMgc3RyYW5nZTsgbXkgZ3Vlc3Mgd2FzIHRoYXQgdGhlIFBI
WSBzaG91bGQgcmVzcG9uZCB0byBvbmUgb2YgdGhlbS4KSSBnZXQgdGhpcyBlcnJvcjoKCiMgaXAg
bCBzZXQgZXRoMCB1cApbICAgIDYuODA2ODQ3XSBtZXNvbjYtZHdtYWMgYzk0MTAwMDAuZXRoZXJu
ZXQgZXRoMDogUmVnaXN0ZXIgTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0wClsgICAgNi44MTA2MDld
IG1lc29uNi1kd21hYyBjOTQxMDAwMC5ldGhlcm5ldCBldGgwOiBfX3N0bW1hY19vcGVuOiBDYW5u
b3QgYXR0YWNoIHRvIFBIWSAoZXJyb3I6IC0xOSkKCgo+IAo+IFsuLi5dCj4gPiArJmkyY19BTyB7
Cj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZp
MmNfYW9fcGlucz47Cj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiAr
Cj4gPiArICAgICAgIHBtaWNAMzIgewo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
cmljb2gscm41dDYxOCI7Cj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4MzI+Owo+ID4gKyAg
ICAgICAgICAgICAgIHN5c3RlbS1wb3dlci1jb250cm9sbGVyOwo+IEhlcmUgSSdtIGEgYml0IHN1
cnByaXNlZDoKPiBBcmVuJ3Qgc29tZSBvZiB0aGUgb3V0cHV0cyB1c2VkIHRvIGRyaXZlIFZDQ0sg
KENQVSBwb3dlciByYWlsKSBhbmQKPiBWRERFRSAoZXZlcnl0aGluZyBlbHNlIHBvd2VyIHJhaWws
IHdoaWNoIGFsc28gcG93ZXJzIHRoZSBHUFUpPwoKVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUg
c2NoZW1hdGljcyBhbmQgSSB3YXNuJ3QgYWJsZSB0byB0cmFjZSB0aGUKY29ubmVjdGlvbnMgb24g
dGhlIGJvYXJkIGJlY2F1c2UgdGhleSdyZSBzbyB0aW55LiBTbyBpdCdzIHF1aXRlIHBvc3NpYmxl
IHRoYXQKeW91J3JlIHJpZ2h0LCBidXQgSSBjYW4ndCBiZSBzdXJlLgoKQXJlIHRoZXJlIHZvbHRh
Z2Ugc2Vuc29ycyBpbiB0aGUgTWVzb244IFNvQyB0aGF0IEkgY291bGQgdXNlIHRvIGVzdGFibGlz
aHMgdGhlCnJlbGF0aW9uIGJldHdlZW4gUE1JQyBvdXRwdXRzIGFuZCBTb0Mgc3VwcGxpZXM/Cgo+
IAo+IFsuLi5dCj4gPiArJnVzYjEgewo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAr
ICAgICAgIGRyX21vZGUgPSAiaG9zdCI7Cj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIFRo
aXMgYnVzIGZlYXR1cmVzIGEgUmVhbHRlayBSVEw4MTg4IDIuNEdIeiBXaUZpIG1vZHVsZSwgd2l0
aCBhCj4gPiArICAgICAgICAqIDMuM1Ygc3VwcGx5IHZvbHRhZ2UgdGhhdCBtdXN0IGJlIGVuYWJs
ZWQgYmVmb3JlIHVzZS4KPiA+ICsgICAgICAgICovCj4gPiArICAgICAgIHZidXMtc3VwcGx5ID0g
PCZ3aWZpXzN2Mz47Cj4gSWYgeW91IHdhbnQgdG8gZ28gZm9yIHBlcmZlY3Rpb24gdGhlbiB5b3Ug
Y2FuIHVzZQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC94bW9zLHh2
ZjM1MDAueWFtbCBhcwo+IHJlZmVyZW5jZS4KPiBJdCdzIGFsc28gYW4gIm9uYm9hcmQiIFVTQiBk
ZXZpY2Ugd2hpY2ggcmVxdWlyZXMgdG9nZ2xpbmcgYSBHUElPIGFuZCByZWd1bGF0b3JzLgo+IFRo
ZSBkcml2ZXIgc2lkZSBpcyBzdXBlciBlYXN5IHRvIG1hbmFnZSBhcyBpdCdzIGdlbmVyaWMgKG1l
YW5pbmc6IGl0Cj4gcGFyc2VzIGFueSBHUElPIGFuZCByZWd1bGF0b3IgYXMgbG9uZyBhcyB0aGUg
VVNCIElEIGlzIHJlZ2lzdGVyZWQpOgo+IGRyaXZlcnMvdXNiL21pc2Mvb25ib2FyZF91c2JfZGV2
LmMKCkkgY29uc2lkZXJlZCB1c2luZyBvbmJvYXJkX3VzYl9kZXYsIGJ1dCB0aGVuIGNhbWUgdG8g
dGhlIGNvbmNsdXNpb24gdGhhdApJIGRvbid0IG5lZWQgaXQgYmVjYXVzZSBJIGRvbid0IG5lZWQg
cmVzZXQgc2VxdWVuY2luZywgb25seSBwb3dlci4KCj4gVGhhdCB3YXkgeW91IGNhbiBqdXN0IGRl
c2NyaWJlIHRoZSBSVEw4MTg4IG9uIHRoZSBVU0IgYnVzIGFuZCBhc3NpZ24KPiBpdCdzIHZkMzMt
c3VwcGx5IHdpdGhvdXQgaGF2aW5nIHRvIChhYil1c2UgdmJ1cy1zdXBwbHkgb2YgdGhlIFVTQgo+
IGNvbnRyb2xsZXIuCgpUaGlzIGRvZXMgc291bmQgcmVhc29uYWJsZS4gSSdsbCByZWNvbnNpZGVy
IHRoZSBvbmJvYXJkX3VzYl9kZXYKYXBwcm9hY2guCgo+IAo+IFsuLi5dCj4gPiArICAgICAgICAg
ICAgICAgc2R4Y19jX3BpbnM6IHNkeGMtYyB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBt
dXggewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncm91cHMgPSAic2R4Y19k
MF9jIiwgInNkeGNfZDEzX2MiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJzZHhjX2Nsa19jIiwgInNkeGNfY21kX2MiLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJzZHhjX2Q0N19jIjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAic2R4Y19jIjsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYmlhc19wdWxsX3VwOwo+IFRoaXMgaGFzIHRvIGJlIGJpYXMtcHVsbC11
cCAoZGFzaGVzIGluc3RlYWQgb2YgdW5kZXJzY29yZXMpLgoKT2gsIGdvb2QgY2F0Y2gsIEknbGwg
Zml4IGl0LgoKClRoYW5rcyBmb3IgeW91ciByZXZpZXcsCkouIE5ldXNjaMOkZmVyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
