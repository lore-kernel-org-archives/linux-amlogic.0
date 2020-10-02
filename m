Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B169CC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 11:14:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6930C206C1
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 11:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FotWjxKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6930C206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=om7iMMznX+iRL1f2WxwN4UI2px9K1q2hUXPLh5UHeRg=; b=FotWjxKLMlsgOUmDRD7TRlriP
	EAoCk1jmw5S2ezrhalL03rKON4NH+3jYi9uRueH1Bm0EEtLbPKH9bK512+4VenPSlTudDRjjBoLDh
	0xuTo7BKaqgwwLpUI0EBTdOiFhB9nLrLq1Y8hzSqDKkYu38z2VRpD+uHVPy9OxvANAwdzjwgDNCT/
	0C7IvRolzLzKliSAO+dgmYAeDT9vQODvCAbvVl26sU1/ZdPvGa6N6vEiD55B8AXOznja42XUb7jGZ
	poazpQRngWcyM85O7FDBSjy4VsxyKnxqfOQhm4FJUBuMShlB/ok3H01hN8puW7N8h7kJ/PoG/uALj
	SdI48koRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOJ11-0001iB-Us; Fri, 02 Oct 2020 11:14:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOJ0z-0001hN-VV
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 11:14:18 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kOJ0y-0002nf-TV; Fri, 02 Oct 2020 13:14:16 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kOJ0y-0004FX-Ay; Fri, 02 Oct 2020 13:14:16 +0200
Message-ID: <87ac087154f461b6cac632bb62b92b8b94d90a67.camel@pengutronix.de>
Subject: Re: [PATCH] reset: Add reset controller API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 02 Oct 2020 13:14:16 +0200
In-Reply-To: <CAHNvnFO=kH25CqrAcndVO4xTQ2pGDFi5ZHEALpFaZaGL=e_c0Q@mail.gmail.com>
References: <20201001132758.12280-1-aouledameur@baylibre.com>
 <CAHNvnFO=kH25CqrAcndVO4xTQ2pGDFi5ZHEALpFaZaGL=e_c0Q@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_071418_027388_B969042E 
X-CRM114-Status: GOOD (  34.04  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQW1qYWQsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgY29tbWVudHMgYmVsb3c6CgpPbiBU
aHUsIDIwMjAtMTAtMDEgYXQgMTU6NTUgKzAyMDAsIEFtamFkIE91bGVkLUFtZXVyIHdyb3RlOgo+
IEFuIHVwZGF0ZSBvbiB0aGUgcGF0Y2ggdGl0bGUsIHNpbmNlIHdlIGRvbid0IGFkZCBhbiBBUEkg
YnV0IGV4dGVuZCBpdCwKPiBUaGUgdGl0bGUgc2hvdWxkIHJhdGhlciBiZTogQWRkIGEgbmV3IGNh
bGwgdG8gdGhlIHJlc2V0IGZyYW1ld29yawoKSSB0aGluayBpdCBzaG91bGQgZXZlbiBzYXkgd2hh
dCBmdW5jdGlvbmFsaXR5IGlzIGFkZGVkLCBmb3IgZXhhbXBsZQoKInJlc2V0OiBtYWtlIHNoYXJl
ZCBwdWxzZWQgcmVzZXQgY29udHJvbHMgcmUtdHJpZ2dlcmFibGUiCgo+IExlIGpldS4gMSBvY3Qu
IDIwMjAgw6AgMTU6MjgsIEFtamFkIE91bGVkLUFtZXVyCj4gPGFvdWxlZGFtZXVyQGJheWxpYnJl
LmNvbT4gYSDDqWNyaXQgOgo+ID4gVGhlIGN1cnJlbnQgcmVzZXQgZnJhbWV3b3JrIEFQSSBkb2Vz
IG5vdCBhbGxvdyB0byByZWxlYXNlIHdoYXQgaXMgZG9uZSBieQo+ID4gcmVzZXRfY29udHJvbF9y
ZXNldCgpLCBJT1cgZGVjcmVtZW50IHRyaWdnZXJlZF9jb3VudC4gQWRkIHRoZSBuZXcKPiA+IHJl
c2V0X2NvbnRyb2xfcmVzZXR0YWJsZSgpIGNhbGwgdG8gZG8gc28uCj4gPiAKPiA+IFdoZW4gcmVz
ZXRfY29udHJvbF9yZXNldCgpIGhhcyBiZWVuIGNhbGxlZCBvbmNlLCB0aGUgY291bnRlcgo+ID4g
dHJpZ2dlcmVkX2NvdW50LCBpbiB0aGUgcmVzZXQgZnJhbWV3b3JrLCBpcyBpbmNyZW1lbnRlZCBp
LmUgdGhlIHJlc291cmNlCj4gPiB1bmRlciB0aGUgcmVzZXQgaXMgaW4tdXNlIGFuZCB0aGUgcmVz
ZXQgc2hvdWxkIG5vdCBiZSBkb25lIGFnYWluLgo+ID4gcmVzZXRfY29udHJvbF9yZXNldHRhYmxl
KCkgd291bGQgYmUgdGhlIHdheSB0byBzdGF0ZSB0aGF0IHRoZSByZXNvdXJjZSBpcwo+ID4gbm8g
bG9uZ2VyIHVzZWQgYW5kLCB0aGF0IGZyb20gdGhlIGNhbGxlcidzIHBlcnNwZWN0aXZlLCB0aGUg
cmVzZXQgY2FuIGJlCj4gPiBmaXJlZCBhZ2FpbiBpZiBuZWNlc3NhcnkuCj4gPiAKPiA+IFRoaXMg
cGF0Y2ggd2lsbCBmaXggYSB1c2Igc3VzcGVuZCB3YXJuaW5nIHNlZW4gb24gdGhlIGxpYnJldGVj
aC1jYwo+ID4gcmVsYXRlZCB0byB0aGUgc2hhcmVkIHJlc2V0IGxpbmUuIFRoaXMgd2FybmluZyB3
YXMgYWRkcmVzc2VkIGJ5IHRoZQo+ID4gcHJldmlvdXNseSByZXZlcnRlZCBjb21taXQgN2E0MTA5
NTNkMWZiICgidXNiOiBkd2MzOiBtZXNvbi1nMTJhOiBmaXggc2hhcmVkCj4gPiByZXNldCBjb250
cm9sIHVzZSIpCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFtamFkIE91bGVkLUFtZXVyIDxhb3Vs
ZWRhbWV1ckBiYXlsaWJyZS5jb20+Cj4gPiBSZXBvcnRlZC1ieTogSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3Jlc2V0L2NvcmUuYyAgfCA1
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgaW5jbHVk
ZS9saW51eC9yZXNldC5oIHwgIDEgKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9u
cygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9jb3JlLmMgYi9kcml2ZXJz
L3Jlc2V0L2NvcmUuYwo+ID4gaW5kZXggMDFjMGM3YWE4MzVjLi41MzY1M2Q0YjU1YzQgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL3Jlc2V0L2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9j
b3JlLmMKPiA+IEBAIC0yMDcsNiArMjA3LDE5IEBAIHN0YXRpYyBpbnQgcmVzZXRfY29udHJvbF9h
cnJheV9yZXNldChzdHJ1Y3QgcmVzZXRfY29udHJvbF9hcnJheSAqcmVzZXRzKQo+ID4gICAgICAg
ICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAKPiA+ICtzdGF0aWMgaW50IHJlc2V0X2NvbnRyb2xfYXJy
YXlfcmVzZXR0YWJsZShzdHJ1Y3QgcmVzZXRfY29udHJvbF9hcnJheSAqcmVzZXRzKQo+ID4gK3sK
PiA+ICsgICAgICAgaW50IHJldCwgaTsKPiA+ICsKPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8
IHJlc2V0cy0+bnVtX3JzdGNzOyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSByZXNl
dF9jb250cm9sX3Jlc2V0dGFibGUocmVzZXRzLT5yc3RjW2ldKTsKPiA+ICsgICAgICAgICAgICAg
ICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsg
ICAgICAgfQoKVGhpcyBpcyB0cmlja3ksIGFzIHdlIGNhbid0IHJlYWxseSByb2xsIGJhY2sgZGVj
cmVtZW50aW5nCnRyaWdnZXJlZF9jb3VudCBpbiBjYXNlIGp1c3Qgb25lIG9mIHRob3NlIGZhaWxz
LgoKSSB0aGluayByZXNldF9jb250cm9sX2FycmF5X3Jlc2V0dGFibGUgaGFzIHRvIGJlIG9wZW4g
Y29kZWQgdG8gZmlyc3QKY2hlY2sgZm9yIGVycm9ycyBhbmQgb25seSB0aGVuIGxvb3AgdGhyb3Vn
aCBhbGwgY29udHJvbHMgYW5kIGRlY3JlbWVudAp0aGVpciB0cmlnZ2VyZWRfY291bnQuCgo+ID4g
Kwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGludCByZXNl
dF9jb250cm9sX2FycmF5X2Fzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbF9hcnJheSAqcmVzZXRz
KQo+ID4gIHsKPiA+ICAgICAgICAgaW50IHJldCwgaTsKPiA+IEBAIC0zMjQsNiArMzM3LDUwIEBA
IGludCByZXNldF9jb250cm9sX3Jlc2V0KHN0cnVjdCByZXNldF9jb250cm9sICpyc3RjKQo+ID4g
IH0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChyZXNldF9jb250cm9sX3Jlc2V0KTsKPiA+IAo+ID4g
Ky8qKgo+ID4gKyAqIHJlc2V0X2NvbnRyb2xfcmVzZXR0YWJsZSAtIGRlY3JlbWVudHMgdHJpZ2dl
cmVkX2NvdW50IG9mIHRoZSBjb250cm9sbGVkIGRldmljZQo+ID4gKyAqIEByc3RjOiByZXNldCBj
b250cm9sbGVyCgpJdCBpcyBtb3JlIGltcG9ydGFudCB0byBkb2N1bWVudCB0aGUgcHVycG9zZSBv
ZiB0aGUgZnVuY3Rpb24gdGhhbiB0aGUKbWVjaGFuaXNtIGJ5IHdoaWNoIGl0IGlzIGFjaGlldmVk
LiB0cmlnZ2VyZWRfY291bnQgaXMgYW4gaW1wbGVtZW50YXRpb24KZGV0YWlsLgoKTWF5YmUgImFs
bG93IHNoYXJlZCByZXNldCBsaW5lIHRvIGJlIHRyaWdnZXJlZCBhZ2FpbiIgb3Igc2ltaWxhci4g
Cgo+ID4gKyAqCj4gPiArICogT24gYSBzaGFyZWQgcmVzZXQgbGluZSB0aGUgYWN0dWFsIHJlc2V0
IHB1bHNlIGlzIG9ubHkgdHJpZ2dlcmVkIG9uY2UgZm9yIHRoZQo+ID4gKyAqIGxpZmV0aW1lIG9m
IHRoZSByZXNldF9jb250cm9sIGluc3RhbmNlLCBleGNlcHQgaWYgdGhpcyBmdW5jdGlvbiBpcyB1
c2VkLgo+ID4gKyAqIEluIGZhY3QsIEl0IGRlY3JlbWVudHMgdHJpZ2dlcmVkX2NvdW50IHRoYXQg
bWFrZXMgc3VyZSBvZiBub3QgYWxsb3dpbmcKPiA+ICsgKiBhIHJlc2V0IGlmIHRyaWdnZXJlZF9j
b3VudCBpcyBub3QgbnVsbC4KPiA+ICsgKgo+ID4gKyAqIFRoaXMgaXMgYSBuby1vcCBpbiBjYXNl
IHRyaWdnZXJlZF9jb3VudCBpcyBhbHJlYWR5IG51bGwgaS5lIHNoYXJlZCByZXNldCBsaW5lCj4g
PiArICogaXMgcmVhZHkgdG8gYmUgdHJpZ2dlcmVkLgoKVGhpcyBpcyBub3QgYSBnb29kIGlkZWEg
SU1ITy4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGRvY3VtZW50IHRoYXQgY2FsbHMKdG8gdGhpcyBm
dW5jdGlvbiBtdXN0IGJlIGJhbGFuY2VkIHdpdGggY2FsbHMgdG8gcmVzZXRfY29udHJvbF9yZXNl
dCwgYW5kCnRoZW4gdGhyb3cgYSBiaWcgd2FybmluZyBiZWxvdyBpbiBjYXNlIGRlYXNzZXJ0X2Nv
dW50IGV2ZXIgZGlwcyBiZWxvdyAwLgoKT3RoZXJ3aXNlIG5vdGhpbmcgc3RvcHMgZHJpdmVycyBm
cm9tIHNpbGVudGx5IGRlY3JlbWVudGluZyBvdGhlcgpkcml2ZXIncyB0cmlnZ2VyIGNvdW50IGJ5
IGFjY2lkZW50YWxseSBjYWxsaW5nIHRoaXMgbXVsdGlwbGUgdGltZXMuCgo+ID4gKyAqCj4gPiAr
ICogQ29uc3VtZXJzIG11c3Qgbm90IHVzZSByZXNldF9jb250cm9sXyhkZSlhc3NlcnQgb24gc2hh
cmVkIHJlc2V0IGxpbmVzIHdoZW4KPiA+ICsgKiByZXNldF9jb250cm9sX3Jlc2V0IGhhcyBiZWVu
IHVzZWQuCj4gPiArICoKPiA+ICsgKiBJZiByc3RjIGlzIE5VTEwgaXQgaXMgYW4gb3B0aW9uYWwg
Y2xlYXIgYW5kIHRoZSBmdW5jdGlvbiB3aWxsIGp1c3QKPiA+ICsgKiByZXR1cm4gMC4KPiA+ICsg
Ki8KPiA+ICtpbnQgcmVzZXRfY29udHJvbF9yZXNldHRhYmxlKHN0cnVjdCByZXNldF9jb250cm9s
ICpyc3RjKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKCFyc3RjKQo+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgICBpZiAoV0FSTl9PTihJU19FUlIocnN0YykpKQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgICBpZiAo
cmVzZXRfY29udHJvbF9pc19hcnJheShyc3RjKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
cmVzZXRfY29udHJvbF9hcnJheV9yZXNldHRhYmxlKHJzdGNfdG9fYXJyYXkocnN0YykpOwo+ID4g
Kwo+ID4gKyAgICAgICBpZiAocnN0Yy0+c2hhcmVkKSB7Cj4gPiArICAgICAgICAgICAgICAgaWYg
KFdBUk5fT04oYXRvbWljX3JlYWQoJnJzdGMtPmRlYXNzZXJ0X2NvdW50KSAhPSAwKSkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICAgIGlmIChhdG9taWNfcmVhZCgmcnN0Yy0+dHJpZ2dlcmVkX2NvdW50KSA+IDApCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBhdG9taWNfZGVjKCZyc3RjLT50cmlnZ2VyZWRfY291bnQp
OwoKSSB0aGluayB0aGlzIHNob3VsZCBiZQoKCQlXQVJOX09OKGF0b21pY19kZWNfcmV0dXJuKCZy
c3RjLT50cmlnZ2VyZWRfY291bnQpIDwgMCk7CgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
