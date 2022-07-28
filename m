Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B9C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO1pGDxBRVMhjXh/im3p6UxH98wCfNakA4YtA424nU8=; b=fKLT4mR97h19RoH3fMuP3HdyPD
	o8OIlwWPc2UifBrRuyKwrZVim45wRW7LVw9XNVgHRzgrQ1Q8aD6cndUDfxFmkq7urV7b+UBneVoAP
	+GYwVqKiAS8M3ccSgeNRz5rPHrgFeal0k7EzqSh52bvnhDUny/qcO/OKsZfphm+8ca6eua9t94vpm
	6W0Y4BJlnHI/z3/o87/iZK51SoLtjCpeV75VGWATKfD68dUZZpGP8FmLI2ErJk3KIuxircRgjZQ5U
	tEx060VCar/u2jaIqXKp7BQWhc2bBGcb9J4Zn6JThdDCm1V4GnKQ1mDMfR+KHcjQdLaTEknjWvEnK
	sRl0bHaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyfY-005gbV-Ta; Thu, 28 Jul 2022 08:14:56 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGyfM-005gUX-Eg; Thu, 28 Jul 2022 08:14:46 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Jul
 2022 16:14:41 +0800
Message-ID: <da68bb01-0ec9-4b18-c0f5-0cf3b830d4c3@amlogic.com>
Date: Thu, 28 Jul 2022 16:14:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Content-Language: en-US
From: Yu Tu <yu.tu@amlogic.com>
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
In-Reply-To: <032b3c3f-f899-bf53-ecbb-35191d39392b@amlogic.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_011444_514674_3EFA825F 
X-CRM114-Status: GOOD (  14.67  )
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

SGkgSkIsCglXZSBzdXNwZWN0IHRoYXQgeW91IGFyZSBub3QgbG9va2luZyBjYXJlZnVsbHkuIFlv
dSBvbmx5IHNlZSB0d28gYmFzZSAKYWRkcmVzc2VzIGZvciBjb250cm9sbGVycywgc28geW91IHRo
aW5rIHlvdSBzaG91bGQgdXNlIHR3byBjbG9jayAKY29udHJvbGxlcnMuIEJ1dCB5b3UncmUgbWlz
c2luZyB0aGVpciBkaXJlY3QgY29ubmVjdGlvbi4KCk9uIDIwMjIvNy8yOCAxNjowNiwgWXUgVHUg
d3JvdGU6Cj4gSGkgSkLvvIwKPiAKPiBPbiAyMDIyLzcvMjggMTU6MDgsIEplcm9tZSBCcnVuZXQg
d3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+Pgo+PiBPbiBUaHUgMjggSnVsIDIwMjIg
YXQgMTM6NDEsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+PiAxLiBBZGQg
Y2xvY2sgY29udHJvbGxlciBkcml2ZXIgZm9yIFM0IFNPQy4KPj4+Cj4+PiBZdSBUdSAoMyk6Cj4+
PiDCoMKgIGR0LWJpbmRpbmdzOiBjbGs6IG1lc29uOiBhZGQgUzQgU29DIGNsb2NrIGNvbnRyb2xs
ZXIgYmluZGluZ3MKPj4+IMKgwqAgYXJtNjQ6IGR0czogbWVzb246IGFkZCBTNCBTb2MgY2xvY2sg
Y29udHJvbGxlciBpbiBEVAo+Pj4gwqDCoCBjbGs6IG1lc29uOiBzNDogYWRkIHM0IFNvQyBjbG9j
ayBjb250cm9sbGVyIGRyaXZlcgo+Pj4KPj4+IFYxIC0+IFYyOiBDaGFuZ2UgZm9ybWF0IGFzIGRp
c2N1c3NlZCBpbiB0aGUgZW1haWwuCj4+Pgo+Pj4gTGluazpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1hbWxvZ2ljLzIwMjIwNzA4MDYyNzU3LjM2NjItMS15dS50dUBhbWxvZ2ljLmNvbS8g
Cj4+Pgo+Pj4KPj4+IMKgIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGd4YmItY2xrYy50eHTC
oMKgwqDCoMKgIHzCoMKgwqAgMSArCj4+PiDCoCBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
wqAgMSArCj4+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzacKg
wqDCoMKgIHzCoMKgIDExICsKPj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL0tjb25maWfCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDE1ICsKPj4+IMKgIGRyaXZl
cnMvY2xrL21lc29uL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoCAxICsKPj4+IMKgIGRyaXZlcnMvY2xrL21lc29uL3M0LmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDczMiArKysrKysrKysrKysrKysr
Kwo+Pj4gwqAgZHJpdmVycy9jbGsvbWVzb24vczQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI5NiArKwo+Pj4gwqAgaW5jbHVkZS9kdC1iaW5kaW5n
cy9jbG9jay9zNC1jbGtjLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTQ2ICsKPj4+IMKgIDgg
ZmlsZXMgY2hhbmdlZCwgNTIwMyBpbnNlcnRpb25zKCspCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9jbGsvbWVzb24vczQuYwo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvY2xrL21lc29uL3M0LmgKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3M0LWNsa2MuaAo+Pj4KPj4+Cj4+PiBiYXNlLWNvbW1pdDogYjI5M2JjOTI4
NmVlMjE4MjRlOTNmMGZjZmVkM2I3OGZkZmVlMDFlNgo+Pgo+PiBQbGVhc2UgZG9uJ3QgcG9zdCB1
bnRpbCB5b3UgaGF2ZSBhZGRyZXNzZWQgKkFMTCogdGhlIGNvbW1lbnRzIGZyb20gdGhlCj4+IHBy
ZXZpb3VzIHZlcnNpb24uCj4gVGhlIGxhc3QgZW1haWwgYXNrZWQgeW91IHRvIGFkb3B0IEExIG1l
dGhvZCwgYnV0IHlvdSBkaWQgbm90IHJlcGx5Pwo+IAo+Pgo+PiBBdCBmaXJzdCBnbGFuY2UsIEkg
Y2FuIHNlZSB0aGF0IHRoaXMgaXMgc3RpbGwgYSBzaW5nbGUgZHJpdmVyIGZvcgo+PiB3aGF0IGlz
IG9idmlvdXNseSAyIGNvbnRyb2xsZXJzIHdpdGggMiByZWdpc3RlciBzcGFjZXMuIFNpbXBsZSBj
b21tZW50cwo+PiBsaWtlIHRoZSAiPDwgMiIgaW4gdGhlIHJlZ2lzdGVyIGRlY2xhcmF0aW9uIGhh
dmUgbm90IGJlZW4gYWRkcmVzc2VkIAo+PiBlaXRoZXIuCj4gSSB1bmRlcnN0YW5kIHRoYXQgdGhp
cyBzaG91bGQgYmUgYSBjb250cm9sbGVyLCBqdXN0IHR3byBhZGRyZXNzIAo+IGRlc2NyaXB0aW9u
cy4gT25lIGlzIHRoZSB2YXJpb3VzIFBMTCByZWdpc3RlcnMgYW5kIG9uZSBpcyB0aGUgY2xvY2sg
Zm9yIAo+IHRoZSBwZXJpcGhlcmFscy4gQW5kIFBMTCBpcyB0byBwcm92aWRlIGEgY2xvY2sgc291
cmNlIGZvciB2YXJpb3VzIAo+IHBlcmlwaGVyYWwgY2xvY2tzLiBTbyBhIGNsb2NrIGNvbnRyb2xs
ZXIgaXMgcmVhc29uYWJsZS4gSSB0aGluayB5b3UgZ290IAo+IGl0IHdyb25nLgo+IAo+IE9rLCBp
ZiB5b3UgaW5zaXN0IG9uIHVzaW5nIHR3byBjbG9jayBjb250cm9sbGVycywsIHBsZWFzZSBwcm92
aWRlIHlvdXIgCj4gdGhlIHJlYXNvbiBhbmQgZXhhbXBsZSBjb2RlPwo+IAo+Pgo+PiBTZWVpbmcg
dGhhdCwgSSBoYXZlIG5vdCByZXZpZXdlZCB0aGlzIHZlcnNpb24gZnVydGhlci4KPj4gSSB3b24n
dCB1bnRpbCBhbGwgdGhlIGNvbW1lbnRzIGZyb20gdjEgYXJlIGVpdGhlciBhZGRyZXNzZWQgb3Ig
YW5zd2VyCj4+Cj4+IFJlZ2FyZHMKPj4gSmVyb21lCj4+Cj4+IC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
