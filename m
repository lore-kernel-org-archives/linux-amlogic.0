Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A8BC77B7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z16VRLQeuhZTq3CWiLc6HETrJIBA+0mmk03GWx5Wi6g=; b=ypZnvtXxvnL+C7
	FzMFC7AFkGrF3nmwTo+n4/R31WTXoQMlYHABTI09iuRchh5QbxFtK5+cLU9YSxU6VfGIwFWT+eoLG
	FWCWTrWbm10JmdZaSyupgIVobM1a+OaDPCSIK8e8WTaPhtrThLpBhXwx08xFnCfMMkwNHGi79Ofm7
	8/2aQZiaYpVYm9E4C17D8T1zVdcuIR7J/sFyoe8X/JH4goXVJdQnlEiGcE29nhurVf6r5qIuurTK4
	csaNwrAb+ev5CbWVwxVGzK4CXYUBzlQx7f5g9DwEAw1m4/YjUINRh2dKEkkewy1DbgnZexAQUGFVo
	FvN1jAsxMdub8pDFQsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTPx-00C7Af-1i;
	Fri, 12 May 2023 14:06:45 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTPs-00C78Z-1x;
	Fri, 12 May 2023 14:06:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 51F475FD7F;
	Fri, 12 May 2023 17:06:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683900392;
	bh=Wty4lPdUl1Ry9LEa9KvWzRRPn/a18yqNQKacXZMS6oc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=MQu3fETnqRD++Dvd5Edd/wJkzKTcTtmlgHgxPWSvbZqyZ050kPpnx4O7g+08Rc0ph
	 0KJ15CGO4YcM15Vvj9wTAuPujliJtd2tWOKhmdY99+ypLXLbhsgZ2Sq/lzlilebmmw
	 qdm9r+r2JbGrLrmnfnJsl1e7f0hdozXXHOm0SzpCVslCeTaWjk/+L+ukC8aiU6J022
	 J9IcGEFJjvnwsQHukaeim0kpRilczpixzAPoS0Kl/AEg3bJhuYhpdMcQA72MGmc96q
	 PnHXIn7O9lU++x6+dE5EPDZvVDs1T8rZDO2UXH/87lOpX+cKA+mY/RVzTpQKKQiA72
	 jw6M2QhHYphDQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 12 May 2023 17:06:31 +0300 (MSK)
Date: Fri, 12 May 2023 17:06:30 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Heiner Kallweit
	<hkallweit1@gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
Message-ID: <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-7-ddrokosov@sberdevices.ru>
 <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/12 11:36:00 #21269061
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_070640_989662_F8E5D518 
X-CRM114-Status: GOOD (  27.30  )
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

SGVsbG8gTWFydGluLAoKT24gTW9uLCBNYXkgMDEsIDIwMjMgYXQgMDk6MDY6MjRQTSArMDIwMCwg
TWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBEbWl0cnksCj4gCj4gb3ZlcmFsbCB0aGlz
IGxvb2tzIHByZXR0eSBnb29kLgoKVGhhbmsgeW91ISBQbGVhc2UgZmluZCBteSB0aG91Z2h0cyBh
Ym91dCBSVEMgY2xvY2sgYmVsb3cuCgo+IAo+ICtDYyBIZWluZXIKPiAKPiBPbiBXZWQsIEFwciAy
NiwgMjAyMyBhdCAxMTo1OOKAr0FNIERtaXRyeSBSb2tvc292Cj4gPGRkcm9rb3NvdkBzYmVyZGV2
aWNlcy5ydT4gd3JvdGU6Cj4gWy4uLl0KPiA+ICtzdGF0aWMgc3RydWN0IGNsa19yZWdtYXAgcHdt
X2Ffc2VsID0gewo+ID4gKyAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfbXV4X2Rh
dGEpewo+ID4gKyAgICAgICAgICAgICAgIC5vZmZzZXQgPSBQV01fQ0xLX0FCX0NUUkwsCj4gPiAr
ICAgICAgICAgICAgICAgLm1hc2sgPSAweDEsCj4gPiArICAgICAgICAgICAgICAgLnNoaWZ0ID0g
OSwKPiA+ICsgICAgICAgfSwKPiA+ICsgICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5p
dF9kYXRhKXsKPiA+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJwd21fYV9zZWwiLAo+ID4gKyAg
ICAgICAgICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9tdXhfb3BzLAo+ID4gKyAgICAgICAgICAg
ICAgIC5wYXJlbnRfZGF0YSA9IHB3bV9hYmNkX3BhcmVudHMsCj4gPiArICAgICAgICAgICAgICAg
Lm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShwd21fYWJjZF9wYXJlbnRzKSwKPiA+ICsgICAgICAg
ICAgICAgICAvKiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgcGxlYXNlIHJlZmVyIHRvIHJ0YyBjbG9j
ayAqLwo+ID4gKyAgICAgICAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9OT19SRVBBUkVO
VCwKPiBIZWluZXIgaXMgd29ya2luZyBvbiBhIHNlcmllcyB0aGF0IGFkZHMgY29tbW9uIGNsb2Nr
IHN1cHBvcnQgdG8gdGhlCj4gUFdNIGRyaXZlciBbMF0uCj4gSSB0aGluayBoaXMgcGxhbnMgZm9y
IGEgbmV4dCBzdGVwIGFyZSBhZGRpbmcgc3VwcG9ydCBmb3IgU29DcyB3aGVyZQo+IHRoZSBQV00g
Y2xvY2tzIGFyZSBwYXJ0IG9mIHRoZSBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIgKGluc3Rl
YWQgb2YKPiBiZWluZyBwYXJ0IG9mIHRoZSBQV00gY29udHJvbGxlciByZWdpc3RlcnMpLgo+IAoK
WWVzLCBJJ20ga2VlcGluZyB1cCB3aXRoIHRoaXMgcmV2aWV3IGFuZCBzdGF5aW5nIGluZm9ybWVk
LiBJdCdzIHdvcnRoCm5vdGluZyB0aGF0IHRoZSBwZXJpcGhlcmFsIGNsb2NrIGRyaXZlciBhbHJl
YWR5IGluY2x1ZGVzIFBXTSBjbG9ja3MsCndpdGggYW4gaW1wb3J0YW50IHJlbWFyayBhYm91dCBy
ZXBhcmVudGluZyBiZWluZyBzd2l0Y2hlZCBvZmYuIEl0J3MKZGVzY3JpYmVkIGJlbG93LgoKPiBI
YXZlIHlvdSBjb25zaWRlcmVkIHJlbW92aW5nIENMS19TRVRfUkFURV9QQVJFTlQgZnJvbSB0aGUg
JnJ0YyBjbG9jawo+IHNvIGRvd25zdHJlYW0gY2xvY2tzIHdvbid0IGNoYW5nZSB0aGUgcnRjIGNs
b2NrIHJhdGUgYnkgYWNjaWRlbnQ/Cj4gVGhlbiB3ZSBjb3VsZCBkcm9wIHRoZSBDTEtfU0VUX1JB
VEVfTk9fUkVQQVJFTlQgZmxhZyBmcm9tIHRoZSBQV00KPiBjbG9ja3MgdG8gYWxsb3cgdGhlbSB0
byBwaWNrIHRoZSBiZXN0IGF2YWlsYWJsZSBwYXJlbnQgKHdoZXRoZXIgdGhhdCdzCj4gdGhlIHJ0
YyBjbG9jaywgeHRhbCBvciBzeXNfcGxsKS4KPiBUaGF0IHNhaWQsIGl0IHdvdWxkIHJlcXVpcmUg
bWFuYWdpbmcgdGhlIENMS0lEX1JUQ18zMktfU0VMIGNsb2NrIChvcgo+IGl0J3MgcGFyZW50cykg
dXNpbmcgYXNzaWduZWQtY2xvY2tzIGluc3RlYWQgb2YgZG9pbmcgc28gd2l0aCB0aGUgUFdNCj4g
KGFuZCBvdGhlcikgY2xvY2tzLiBXaGV0aGVyIHRoaXMgd291bGQgY2F1c2UgcHJvYmxlbXM6IEkn
bSBub3Qgc3VyZSwKPiBzbyBJJ20gaG9waW5nIHRoYXQgeW91IGNhbiBzaGFyZSBzb21lIGluc2ln
aHRzLgo+IAo+IAoKQWxsb3cgbWUgdG8gc2hhcmUgbXkgdGhvdWdodHMgb24gdGhpcyBtYXR0ZXIu
IEZyb20gbXkgdW5kZXJzdGFuZGluZywKQW1sb2dpYyBwcm92aWRlcyBhbiBSVEMgY2xvY2sgdGhh
dCBpcyBib3RoIGFjY3VyYXRlIGFuZCBwb3dlci1lZmZlY3RpdmUKaW4gYWNoaWV2aW5nIGEgMzJL
SHogc2lnbmFsIGZyb20gYW4gaW50ZXJuYWwgeHRhbCBvZiAyNE1Iei4gSG93ZXZlciwKdGhpcyBy
ZXF1aXJlcyBhIGNvbXBsZXggUlRDIGRpdmlkZXIgd2l0aCBmb3VyIHBhcmFtZXRlcnMgKG0xLCBt
MiwgbjEsCm4yKSwgYXMgaXQgY2Fubm90IGJlIGFjY29tcGxpc2hlZCB3aXRoIGEgc2luZ2xlIGRp
dmlkZXIuIE91ciB0ZWFtIGhhcwptZWFzdXJlZCB0aGUgUlRDIGNsb2NrIHVzaW5nIGFuIG9zY2ls
bG9zY29wZSBvbiB0aGUgR0VOIENMSyBwaW4gYW5kCmZvdW5kIHRoYXQgaXQgcHJvdmlkZXMgYSBz
dGFibGUgMzJLSHogc2lnbmFsIHdpdGggYWNjZXB0YWJsZSBqaXR0ZXIuIE9uCnRoZSBvdGhlciBo
YW5kLCBvdGhlciBhcHByb2FjaGVzLCBzdWNoIGFzIHRoZSBQV00gd2F5LCB5aWVsZCBsZXNzIHN0
YWJsZQphbmQgbGVzcyBhY2N1cmF0ZSAzMktIeiBzaWduYWxzIHdpdGggZ3JlYXRlciBqaXR0ZXIu
CgpBZGRpdGlvbmFsbHksIHRoZSBDQ0YgZGV0ZXJtaW5lcyB0aGUgYmVzdCBhbmNlc3RvciBiYXNl
ZCBvbiBob3cgY2xvc2UKaXRzIHJhdGUgaXMgdG8gdGhlIGdpdmVuIG9uZSwgYmFzZWQgb24gYXJp
dGhtZXRpYyBjYWxjdWxhdGlvbnMuIEhvd2V2ZXIsCndlIGhhdmUgaW5kZXBlbmRlbnQga25vd2xl
ZGdlIHRoYXQgYSBjZXJ0YWluIGNsb2NrIHdvdWxkIGJlIGJldHRlciwgd2l0aApsZXNzIGppdHRl
ciBhbmQgZmV3ZXIgaW50ZXJtZWRpYXJpZXMsIHdoaWNoIHdpbGwgbGlrZWx5IGltcHJvdmUgZW5l
cmd5CmVmZmljaWVuY3kuIFNhZGx5LCB0aGUgQ0NGIGNhbm5vdCB0YWtlIHRoaXMgaW50byBhY2Nv
dW50LgoKR2l2ZW4gdGhlIGFkdmFudGFnZXMgb2YgdGhlIFJUQyBjbG9jaywgd2Ugd2lzaCB0byBi
ZSBhYmxlIHRvIGNvbnRyb2wgdGhlClJUQyBhcyBhIHBhcmVudCBmb3Igc3BlY2lmaWMgbGVhZiBj
bG9ja3MuIFRoaXMgaXMgYWNoaWV2YWJsZSB3aXRoIHRoZQonYXNzaWduZWQtY2xvY2tzJyBmZWF0
dXJlIG9mIENDRiBPRiwgYnV0IGl0IHBvc2VzIGEgc2lnbmlmaWNhbnQKYXJjaGl0ZWN0dXJhbCBw
cm9ibGVtLiBUaGUgJ2Fzc2lnbmVkLWNsb2Nrcycgbm9kZSBkb2VzIG5vdCBsb2NrL3BpbiB0aGUK
cGFyZW50LCBhbmQgYSBzaW1wbGUgY2xrX3NldF9yYXRlKCkgY2FsbCBjYW4gY2hhbmdlIHRoZSBw
YXJlbnQgZHVyaW5nCnJhdGUgcHJvcGFnYXRpb24uIEluIG15IG9waW5pb24sIGFuIGlkZWFsIHNv
bHV0aW9uIHRvIHRoaXMgcHJvYmxlbSB3b3VsZApiZSBhbiBhZGRpdGlvbmFsIHBhdGNoIHRvIHRo
ZSBDQ0YgY29yZSB0aGF0IHByb3ZpZGVzIHRoaXMgbG9ja2luZwpjYXBhYmlsaXR5LiBBcyBhIGJv
YXJkIERUUyBkZXZlbG9wZXIsIEkga25vdyB3aGljaCBjbG9jayBJIHdhbnQgdG8gdXNlCmFzIHRo
ZSBwYXJlbnQgYW5kIGhhdmUgYSBzdHJvbmcgcmVhc29uIGZvciBkb2luZyBzbywgYW5kIEkgZG8g
bm90IHdpc2gKdG8gb3BlbiB1cCBteSBwYXJlbnQgbXV4aW5nIHRvIG90aGVyIGRyaXZlcnMuIEJ1
dCB1bnRpbCB0aGUgYmVoYXZpb3Igb2YKJ2Fzc2lnbmVkLWNsb2NrcycgaXMgbm90IGF2YWlsYWJs
ZSwgd2Ugd2lsbCBzaW1wbHkgbGFiZWwgYWxsIFJUQwpjaGlsZHJlbiB3aXRoIHRoZSBDTEtfU0VU
X1JBVEVfTk9fUkVQQVJFTlQgZmxhZy4KCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+IAo+IAo+
IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzlmYWNhMmU2LWI3YTEt
NDc0OC03ZWIwLTQ4ZjgwNjRlMzIzZUBnbWFpbC5jb20vCgotLSAKVGhhbmsgeW91LApEbWl0cnkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
