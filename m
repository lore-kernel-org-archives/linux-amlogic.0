Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C0EECAAD8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Sep 2022 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23xhL0uMXgTLitiyCq9y6M6bYn0XC2KDeXkTUFS7+lg=; b=dSLidv15wKkKdPXwn2+AeqNhMG
	Wnz0HxJTBfFqUfQ8PHFp+NDRFh5805multb/d11Wjtfvk3jeaEkW/8KMtMNEA5aezhm0zBi6W76er
	lQC5L/S4VQ5VLOoOMCDUjINhp9vYmmDzRTVH3uNiS7a6O3ZuB0i4qfrPMcd/1tqFAzzwWsKi8EyFT
	DcBAAAPUsBFSmjmk2IbWSpEWKU2Z5QP1lIVT3ZEd+Ci140bjMkovErPe6R3I1+KwqFslj67ka+6hM
	TmwuVyhMB08bKGYcPGGk+TYgzS3L+nA/vtXY0ioR1q8BfZPBla3lvhlA1APPY9xCs3yVc4iFRSl4K
	2rjwVAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavLT-00A4Vk-Ev; Wed, 21 Sep 2022 08:44:39 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavHe-00A2UK-5g; Wed, 21 Sep 2022 08:40:43 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 21 Sep
 2022 16:40:35 +0800
Message-ID: <21e14cc1-6b34-e6b0-8da2-ad4b34dac149@amlogic.com>
Date: Wed, 21 Sep 2022 16:40:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver
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
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
 <4e3cdd6b-5861-8a4f-1df7-af763f77bad5@amlogic.com>
 <1jsflftm1y.fsf@starbuckisacylon.baylibre.com>
 <0c7e6d90-2ce3-25ab-84b6-026ce8a238a8@amlogic.com>
 <1jtu5uz0ry.fsf@starbuckisacylon.baylibre.com>
 <9f9cf980-c0c6-d5c3-ced8-8ab50e392470@amlogic.com>
In-Reply-To: <9f9cf980-c0c6-d5c3-ced8-8ab50e392470@amlogic.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_014042_241917_1BFD286E 
X-CRM114-Status: GOOD (  19.40  )
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

SGkgSmVyb21l77yMCgpPbiAyMDIyLzgvMzAgMTU6MzcsIFl1IFR1IHdyb3RlOgo+IAo+IAo+IE9u
IDIwMjIvOC8zMCAxNDo0NCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJ
TCBdCj4+Cj4+Cj4+IE9uIFR1ZSAzMCBBdWcgMjAyMiBhdCAxNDoxMywgWXUgVHUgPHl1LnR1QGFt
bG9naWMuY29tPiB3cm90ZToKPj4KPj4+IE9uIDIwMjIvOC8yOSAxNzo0OCwgSmVyb21lIEJydW5l
dCB3cm90ZToKPj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+PiBPbiBNb24gMTUgQXVnIDIwMjIg
YXQgMjE6MjAsIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4+Pj4g
Kwo+Pj4+Pj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVnbWFwIHM0X2hkbWlfcGxsX2RjbyA9IHsK
Pj4+Pj4+Pj4gK8KgwqDCoCAuZGF0YSA9ICYoc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSl7Cj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZW4gPSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLAo+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMjgsCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC53aWR0aMKgwqAgPSAxLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwKPj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5tID0gewo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAucmVnX29mZiA9IEFOQUNUUkxfSERNSVBMTF9DVFJMMCwKPj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLnNoaWZ0wqDCoCA9IDAsCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC53aWR0aMKgwqAgPSA4LAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5uID0gewo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAucmVnX29mZiA9IEFOQUNUUkxfSERNSVBMTF9DVFJMMCwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLnNoaWZ0wqDCoCA9IDEwLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAud2lkdGjCoMKgID0gNSwKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sCj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAuZnJhYyA9IHsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLnJlZ19vZmYgPSBBTkFDVFJMX0hETUlQTExfQ1RSTDEsCj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5zaGlmdMKgwqAgPSAwLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAud2lkdGjCoMKgID0gMTcsCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgLmwgPSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMzEsCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC53aWR0aMKgwqAgPSAxLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIC5yc3QgPSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5yZWdfb2ZmID0gQU5BQ1RSTF9IRE1JUExMX0NUUkwwLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuc2hpZnTCoMKgID0gMjksCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC53aWR0aMKgwqAgPSAxLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+Pj4g
K8KgwqDCoCB9LAo+Pj4+Pj4+PiArwqDCoMKgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRf
ZGF0YSl7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAubmFtZSA9ICJoZG1pX3BsbF9kY28iLAo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLm9wcyA9ICZtZXNvbl9jbGtfcGxsX3JvX29wcywKPj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5wYXJlbnRfZGF0YSA9IChjb25zdCBzdHJ1Y3QgY2xrX3Bh
cmVudF9kYXRhIFtdKSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsgLmZ3X25h
bWUgPSAieHRhbCIsIH0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0sCj4+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAubnVtX3BhcmVudHMgPSAxLAo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyoK
Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBEaXNwbGF5IGRpcmVjdGx5IGhhbmRsZSBoZG1p
IHBsbCByZWdpc3RlcnMgQVRNLCB3ZSBuZWVkCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
Tk9DQUNIRSB0byBrZWVwIG91ciB2aWV3IG9mIHRoZSBjbG9jayBhcyBhY2N1cmF0ZSBhcwo+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHBvc3NpYmxlCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgICovCj4+Pj4+Pj4KPj4+Pj4+PiBJcyBpdCByZWFsbHkgPwo+Pj4+Pj4+Cj4+Pj4+Pj4gR2l2
ZW4gdGhhdCBIRE1JIHN1cHBvcnQgZm9yIHRoZSBzNCBpcyB0aGVyZSB5ZXQsIHRoZQo+Pj4+Pj4+
IGFkZHJlc3NlcyBoYXZlIGNoYW5nZXMgYW5kIHRoZSByZWdpb24gaXMgbm8gbG9uZ2VyIGEgc3lz
Y29uLCBpdCAKPj4+Pj4+PiBpcyB0aW1lCj4+Pj4+Pj4gZm9yIHRoZSBIRE1JIGRyaXZlciB0byBn
ZXQgZml4ZWQuCj4+Pj4+IFRoZSBIRE1JIFBMTCBpcyBjb25maWd1cmVkIGluIHRoZSBVYm9vdCBw
aGFzZSBhbmQgZG9lcyBub3QgY2hhbmdlIHRoZQo+Pj4+PiBmcmVxdWVuY3kgaW4gdGhlIGtlcm5l
bCBwaGFzZS4gU28gd2UgdXNlIHRoZSBOT0NBQ0hFIGZsYWcgYW5kCj4+Pj4+ICJyb19vcHMiLgo+
Pj4+IFRoYXQncyBubyByZWFzb24gdG8gcHV0IE5PQ0FDSEUgb3Igcm8tb3BzCj4+Pj4gSWYgeW91
IHdhbnQgdGhlIGZyZXF1ZW5jaWVzIHRvIGJlIHN0YXRpY2FsbHkgYXNzaW5nZWQsIHRoZSBjb3Jy
ZWN0IHdheQo+Pj4+IHdvdWxkIGJlIHRocm91Z2ggYXNzaWduZWQtcmF0ZSBpbiBEVCBJIGd1ZXNz
Lgo+Pj4KPj4+IE9rYXkuIFlvdSdyZSByaWdodC4gSG93ZXZlciwgd2hlbiByZWdpc3RlcmluZyB3
aXRoIE9QUywgSERNSSBQTEwgd2lsbCBiZQo+Pj4gcmVzZXQuIEl0IHRha2VzIHRpbWUgZm9yIFBM
TCB0byBzdGFiaWxpemUgdGhlIG91dHB1dCBmcmVxdWVuY3ksIHdoaWNoIAo+Pj4gd2lsbAo+Pj4g
bGVhZCB0byB0aGUgc3RhcnR1cCBzY3JlZW4gZmxhc2hpbmcuCj4+Pgo+Pj4gSSB3b3VsZCBsaWtl
IHRvIGtub3cgaG93IHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBpZiBub3QgdXNpbmcgcm9fb3BzLgo+
Pj4KPj4+Pgo+Pgo+PiBZb3UgY2FuIGFkZCBuZXcgb3BzIG9yIHR3ZWFrIHRoZSBjdXJyZW50IGlu
aXQgZnVuY3Rpb24uCj4gCj4gSERNSSBQTEwgaXMgbm90IGRpZmZlcmVudCBmcm9tIG90aGVyIFBM
TFMsIHNvIEkgdGhpbmsgYWRkaW5nIE9QUyBpcyB3ZWlyZC4KPiAKPj4KPj4gU2FmZXN0IHdvdWxk
IGJlIHRvIGRvIHRoZSBmb2xsb3dpbmcgOgo+PiDCoCAqIENoZWNrIGlmIHRoZSBQTExzIGlzIGFs
cmVhZHkgb24uCj4+IMKgICogQ2hlY2sgaWYgdGhlICdwbGwtPmluaXRfcmVncycgbWF0Y2hlcyB3
aGF0IGlzIGFscmVhZHkgc2V0Cj4+IMKgwqDCoCAtIGlmIHNvLCB5b3UgY2FuIHNraXAgdGhlIHJl
c2V0Cj4+IMKgwqDCoCAtIGlmIG5vdCwgeW91IG5lZWQgdG8gcmVzZXQgYXMgdXN1YWwKPiAKPiBz
dGF0aWMgaW50IG1lc29uX2Nsa19wbGxfaW5pdChzdHJ1Y3QgY2xrX2h3ICpodykKPiB7Cj4gIMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBjbGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsK
PiAgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqcGxsID0gbWVzb25f
Y2xrX3BsbF9kYXRhKGNsayk7Cj4gCj4gCj4gIMKgwqDCoMKgwqDCoMKgIGlmIChwbGwtPmluaXRf
Y291bnQpIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX3Bhcm1fd3Jp
dGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMSk7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWdtYXBfbXVsdGlfcmVnX3dyaXRlKGNsay0+bWFwLCBwbGwtPmluaXRfcmVncywKPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqAgcGxsLT5pbml0X2NvdW50KTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1lc29uX3Bhcm1fd3JpdGUoY2xrLT5tYXAsICZwbGwtPnJzdCwgMCk7Cj4g
IMKgwqDCoMKgwqDCoMKgIH0KPiAKPiAKPiAgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gfQo+
IAo+IEJlY2F1c2UgdGhlIGluaXQgZnVuY3Rpb24gbG9va3MgbGlrZSB0aGlzLiBUaGVyZWZvcmUs
IEhETUkgUExMIAo+IGluaXRfY291bnQgaXMgbm90IGdpdmVuLiBDYW4gSSBjaGFuZ2UgaXQgbGlr
ZSB0aGlzPwoKSSBkb24ndCBrbm93IGlmIHRoaXMgY2hhbmdlIG1lZXRzIHlvdXIgcmVxdWlyZW1l
bnRzPyBQbGVhc2UgZ2l2ZSB1cyB5b3VyIAp2YWx1YWJsZSBhZHZpY2UuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
