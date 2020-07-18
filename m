Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D23FC433E1
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 22:57:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467EB2076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 22:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVhb0f3p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467EB2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Subject:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M/P2fk9lDnvqCjjpPem1QV9aSpSbuyreda8SMeL57d4=; b=HVhb0f3p/S4uNqguXeShsq3KH
	0/LSvMjtuw0RKh7LJmeecmPrfIHK5MlKwEiR1cXsURPu9umSO8XdR5zi4Els8MFM7OeCDuDEqmqEb
	64ag9LE3K/6Lw/U5jZbvme83liKRcb9dt6MSkbS4cTr/Flr2lKluibHvP7F8iCxLlwXcJ0Zw01ddZ
	KgJEjxXWsZfDuMDi4TC4VPMRqpTTrTUNdUUVinBAtB4X6g/YRahTJax64vQnoTrnc5kCR68BCKsZC
	g4UdYOYnkSpg6HQ/2V3+3NGl7Sr/nLjFKOOz/aPXQwY6LWxO8oDwKPVNV7YfQfcnzsNUhsW1RnCIF
	uYr6euPyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwvlg-0004Dk-GG; Sat, 18 Jul 2020 22:57:27 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwvld-0004DF-KR; Sat, 18 Jul 2020 22:57:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1595113028; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k9UoHNlzwkdtf0Mjmdng6nBhrMSL160T5NP72dKlMbxhG4UT3ypej7bkwxmesiMR0Uk2G9KMPW2s7CVvrMvNQ6e5t0AYhEObzQ6tZ5hU8yTK+Ag4kzfaNt/sCnQHw4I+cgQEGvm2U0Vxsf+OkSEhedJnYIOReEdtC4LG2GPw80c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1595113028;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=lyGInogPye2qCZtSAptPACNiTAvz7ary0Fijaw+mmho=; 
 b=Vv6KVKD4AM9rtmJPDGn/n0z0hApM0y9eVbHM+DxsxQ38F/G024+QdRgkcOuLFbysP1ZdNqzr3l1ybIT9MeRiHSc17I0SxvTPZ7rjHqkWOiCovEWvSmBNZpqZyHXJc2+b0phV3xyqkWE56YzwShSXSOXl+VHDR02OufgrqMYa1+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 1595113024776755.2426526892198;
 Sat, 18 Jul 2020 15:57:04 -0700 (PDT)
Date: Sat, 18 Jul 2020 18:57:02 -0400
From: Dan Robertson <dan@dlrobertson.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <20200718225702.GB9969@gothmog.test>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <d9c2c755-452d-62bd-f792-1d84b76ceea4@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9c2c755-452d-62bd-f792-1d84b76ceea4@baylibre.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_185717_871757_0BD17ED7 
X-CRM114-Status: GOOD (  15.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdWwgMTgsIDIwMjAgYXQgMTA6NDc6NTVBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gSGksCj4gCj4gTGUgMTMvMDcvMjAyMCDDoCAxODowNSwgRGFuIFJvYmVydHNvbiBh
IMOpY3JpdCA6Cj4gPiBUaGUgcmVzZXQgaXMgYSBzaGFyZWQgcmVzZXQgbGluZSwgYnV0IHJlc2V0
X2NvbnRyb2xfcmVzZXQgaXMgc3RpbGwgdXNlZAo+ID4gYW5kIHJlc2V0X2NvbnRyb2xfZGVhc3Nl
cnQgaXMgbm90IGd1YXJhbnRlZWQgdG8gaGF2ZSBiZWVuIGNhbGxlZCBiZWZvcmUKPiA+IHRoZSBm
aXJzdCByZXNldF9jb250cm9sX2Fzc2VydCBjYWxsLiBXaGVuIHN1c3BlbmRpbmcgdGhlIGZvbGxv
d2luZwo+ID4gd2FybmluZyBtYXkgYmUgc2VlbjoKPiA+IAo+ID4gV0FSTklORzogQ1BVOiAxIFBJ
RDogNTUzMCBhdCBkcml2ZXJzL3Jlc2V0L2NvcmUuYzozNTUgcmVzZXRfY29udHJvbF9hc3NlcnQr
MHgxODQvMHgxOWMKPiA+IEhhcmR3YXJlIG5hbWU6IEhhcmRrZXJuZWwgT0RST0lELU4yIChEVCkK
PiA+IFsuLl0KPiA+IHBjIDogcmVzZXRfY29udHJvbF9hc3NlcnQrMHgxODQvMHgxOWMKPiA+IGxy
IDogZHdjM19tZXNvbl9nMTJhX3N1c3BlbmQrMHg2OC8weDdjCj4gPiBbLi5dCj4gPiBDYWxsIHRy
YWNlOgo+ID4gIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KzB4MTg0LzB4MTljCj4gPiAgZHdjM19tZXNv
bl9nMTJhX3N1c3BlbmQrMHg2OC8weDdjCj4gPiAgcGxhdGZvcm1fcG1fc3VzcGVuZCsweDI4LzB4
NTQKPiA+ICBfX2RldmljZV9zdXNwZW5kKzB4NTkwLzB4YWJjCj4gPiAgZHBtX3N1c3BlbmQrMHgx
MDQvMHg0MDQKPiA+ICBkcG1fc3VzcGVuZF9zdGFydCsweDg0LzB4MWJjCj4gPiAgc3VzcGVuZF9k
ZXZpY2VzX2FuZF9lbnRlcisweGM0LzB4NGZjCj4gPiAgcG1fc3VzcGVuZCsweDE5OC8weDJkNAo+
ID4gCj4gPiBGaXhlczogNmQ5ZmEzNWEzNDdhODcgKCJ1c2I6IGR3YzM6IG1lc29uLWcxMmE6IGdl
dCB0aGUgcmVzZXQgYXMgc2hhcmVkIikKPiA+IFNpZ25lZC1vZmYtYnk6IERhbiBSb2JlcnRzb24g
PGRhbkBkbHJvYmVydHNvbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
bWVzb24tZzEyYS5jIHwgMTUgKysrKysrKysrLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVz
b24tZzEyYS5jCj4gPiBpbmRleCAxZjdmNGQ4OGVkOWQuLjg4Yjc1YjVhMDM5YyAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMKPiA+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMKPiA+IEBAIC03MzcsMTMgKzczNywxMyBAQCBz
dGF0aWMgaW50IGR3YzNfbWVzb25fZzEyYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4gIAkJZ290byBlcnJfZGlzYWJsZV9jbGtzOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCXJl
dCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+cmVzZXQpOwo+ID4gKwlyZXQgPSByZXNldF9j
b250cm9sX2RlYXNzZXJ0KHByaXYtPnJlc2V0KTsKPiA+ICAJaWYgKHJldCkKPiA+IC0JCWdvdG8g
ZXJyX2Rpc2FibGVfY2xrczsKPiA+ICsJCWdvdG8gZXJyX2Fzc2VydF9yZXNldDsKPiA+ICAKPiA+
ICAJcmV0ID0gZHdjM19tZXNvbl9nMTJhX2dldF9waHlzKHByaXYpOwo+ID4gIAlpZiAocmV0KQo+
ID4gLQkJZ290byBlcnJfZGlzYWJsZV9jbGtzOwo+ID4gKwkJZ290byBlcnJfYXNzZXJ0X3Jlc2V0
Owo+ID4gIAo+ID4gIAlyZXQgPSBwcml2LT5kcnZkYXRhLT5zZXR1cF9yZWdtYXBzKHByaXYsIGJh
c2UpOwo+ID4gIAlpZiAocmV0KQo+ID4gQEAgLTc1Miw3ICs3NTIsNyBAQCBzdGF0aWMgaW50IGR3
YzNfbWVzb25fZzEyYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAlp
ZiAocHJpdi0+dmJ1cykgewo+ID4gIAkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShwcml2LT52YnVz
KTsKPiA+ICAJCWlmIChyZXQpCj4gPiAtCQkJZ290byBlcnJfZGlzYWJsZV9jbGtzOwo+ID4gKwkJ
CWdvdG8gZXJyX2Fzc2VydF9yZXNldDsKPiA+ICAJfQo+ID4gIAo+ID4gIAkvKiBHZXQgZHJfbW9k
ZSAqLwo+ID4gQEAgLTc2NSwxMyArNzY1LDEzIEBAIHN0YXRpYyBpbnQgZHdjM19tZXNvbl9nMTJh
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgCj4gPiAgCXJldCA9IHBy
aXYtPmRydmRhdGEtPnVzYl9pbml0KHByaXYpOwo+ID4gIAlpZiAocmV0KQo+ID4gLQkJZ290byBl
cnJfZGlzYWJsZV9jbGtzOwo+ID4gKwkJZ290byBlcnJfYXNzZXJ0X3Jlc2V0Owo+ID4gIAo+ID4g
IAkvKiBJbml0IFBIWXMgKi8KPiA+ICAJZm9yIChpID0gMCA7IGkgPCBQSFlfQ09VTlQgOyArK2kp
IHsKPiA+ICAJCXJldCA9IHBoeV9pbml0KHByaXYtPnBoeXNbaV0pOwo+ID4gIAkJaWYgKHJldCkK
PiA+IC0JCQlnb3RvIGVycl9kaXNhYmxlX2Nsa3M7Cj4gPiArCQkJZ290byBlcnJfYXNzZXJ0X3Jl
c2V0Owo+ID4gIAl9Cj4gPiAgCj4gPiAgCS8qIFNldCBQSFkgUG93ZXIgKi8KPiA+IEBAIC04MDks
NiArODA5LDkgQEAgc3RhdGljIGludCBkd2MzX21lc29uX2cxMmFfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+ICAJZm9yIChpID0gMCA7IGkgPCBQSFlfQ09VTlQgOyArK2kp
Cj4gPiAgCQlwaHlfZXhpdChwcml2LT5waHlzW2ldKTsKPiA+ICAKPiA+ICtlcnJfYXNzZXJ0X3Jl
c2V0Ogo+ID4gKwlyZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yZXNldCk7Cj4gPiArCj4gPiAg
ZXJyX2Rpc2FibGVfY2xrczoKPiA+ICAJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+
ZHJ2ZGF0YS0+bnVtX2Nsa3MsCj4gPiAgCQkJCSAgIHByaXYtPmRydmRhdGEtPmNsa3MpOwo+ID4g
Cj4gCj4gCj4gVGhpcyBzaG91bGQgZG8gdGhlIHRyaWNrLCBJJ2xsIG5lZWQgdG8gY2hlY2sgZmly
c3QgaWYgaXQgZG9lc24ndCBicmVhayB0aGUgR1hML0dYTQo+IHN1cHBvcnQgZmlyc3QuCgpBd2Vz
b21lLiBMZXQgbWUga25vdyBpZiB5b3UgZmluZCBhbnl0aGluZy4KCkNoZWVycywKCiAtIERhbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
