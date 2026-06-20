Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EB9CD4F26
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Iw8UOjvt3faE/0OTe33wEk2/4BwbQ0u35sPLiWAZLw=; b=Y0SvF40VrEsTsD
	SN49z48KhiQzl/52Ez8rDIhT9BTGH0l0ZRLJLCOXRm9lfP+eoEkLtL8oZioc9u24Fm/MDWXR5bAq0
	bRwY/iZdLMyWlP9xm04xPltFxiXGNVeYm5mRwZZu6tCPwyoU1l9AWfIX/8vOT164Q+4j4JGUd+vt6
	XUNzwMJzKkgBuULR6bTJ+5eupZC/w3wzsNf6UdhEyZ6XKppcP0BkwNZTsowut496JnGMA9wy0RcYA
	9xuDmD7WIV14Bmoe9hKW2pK0M7JSu08LXgDfcHgJzjMVhEbs4UbYfHeCtZRG4aSJXZG2oVYpFxKh0
	uV9dLcV2K8WrYvv+/D9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waxLu-00000003QiB-3ZeM;
	Sat, 20 Jun 2026 15:11:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waxLt-00000003Qhz-24Yt;
	Sat, 20 Jun 2026 15:11:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99F32433BF;
	Sat, 20 Jun 2026 15:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911451F000E9;
	Sat, 20 Jun 2026 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781968280;
	bh=lIzVTXv8g8JnhDCGT+xWyfC+8ohfboGZ2syiLUj/bP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUOK5Rm/rfi1wA5O5FpPL+PMqg3/iiAY7S654kzd/xwP4OaH2dbPrFwjF/NLGeSEy
	 1arXfmKnr+pQhziePbA11lPXHwnpR107J2eTRm2qvMXgxMT8kkTKbEaovHsxFveHmE
	 DxAgwQZD3Ip3kKQutOWHZYX55/fkyqm7gwIS4hd008/4AvjIgkpZxlIbnUDuBnrKRR
	 EB0fp+Yn0QW7aKxQJjSD0s1O2bbH8QJ55Cm8YN4Z/Ub1sPaI+7TMPKBGCxMYEdwyTM
	 hoxfYrExcyjjyQUwzhmLAH+sROFRGD2MB0hvySTwxcSDr5ii1Sm8mA1asBeizXjvFA
	 T0BI9tEC3V5oA==
Date: Sat, 20 Jun 2026 20:41:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Gowtham Kudupudi <gowtham@ferryfair.com>, robh@kernel.org, 
	bhelgaas@google.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, yue.wang@amlogic.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
Message-ID: <qq4dum3xqs2stcrd6ula75snrxy34elhodrtp3gftjgzqhs3ir@ykl54gvrfwxs>
References: <20260614015620.20432-1-gowtham@ferryfair.com>
 <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
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

T24gTW9uLCBKdW4gMTUsIDIwMjYgYXQgMTI6MzQ6MTFQTSArMDIwMCwgUm9uYWxkIENsYXZlYXUg
d3JvdGU6Cj4gT24gNi8xNC8yNiAzOjU2IEFNLCBHb3d0aGFtIEt1ZHVwdWRpIHdyb3RlOgo+ID4g
T24gd2FybSByZWJvb3QsIHRoZSBQQ0llIGNvbnRyb2xsZXIncyBMVFNTTSBzdGFydHMgbGluayB0
cmFpbmluZwo+ID4gaW1tZWRpYXRlbHkgaWYgUEVSU1QjIGlzIGFscmVhZHkgZGVhc3NlcnRlZCBm
cm9tIHRoZSBwcmV2aW91cyBib290Lgo+ID4gVGhlIGRyaXZlciB0aGVuIHB1bHNlcyBQRVJTVCMg
Zm9yIG9ubHkgNTAwdXMsIHdoaWNoIGlzIHRvbyBzaG9ydCB0bwo+ID4gcHJvcGVybHkgcmVzZXQg
dGhlIGVuZHBvaW50IGRldmljZSB0aGF0IGhhcyBhbHJlYWR5IHN0YXJ0ZWQgdHJhaW5pbmcuCj4g
PiAKPiA+IEZpeCBieSBtb3ZpbmcgdGhlIFBFUlNUIyBhc3NlcnQvZGVhc3NlcnQgcHVsc2UgQkVG
T1JFIGVuYWJsaW5nIExUU1NNLAo+ID4gc28gdGhlIGVuZHBvaW50IGdldHMgYSBjbGVhbiByZXNl
dCBjeWNsZSBiZWZvcmUgbGluayB0cmFpbmluZyBiZWdpbnMuCj4gPiAKPiA+IFRoaXMgd2FzIGZv
dW5kIG9uIEFtbG9naWMgRzEyQiAoQTMxMUQpIHdpdGggTlZNZSBvbiBhbiBNLjIgc2xvdC4KPiA+
IENvbGQgYm9vdCB3b3JrZWQgYmVjYXVzZSBQT1IgaGVsZCBQRVJTVCMgbG93OyB3YXJtIHJlYm9v
dCBkaWQgbm90Lgo+ID4gVGhlIGZpeCB3YXMgY29uZmlybWVkIG9uIGEgQmFuYW5hIFBpIENNNCB3
aXRoIFdhdmVzaGFyZSBJTyBiYXNlIGJvYXJkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHb3d0
aGFtIEt1ZHVwdWRpIDxnb3d0aGFtQGZlcnJ5ZmFpci5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLW1lc29uLmMKPiA+IGluZGV4IDVmOGUyZjRiM2MxMi4uM2E3ZTlmMWQ1Yjhj
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMK
PiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCj4gPiBAQCAt
MzEwLDggKzMxMCw4IEBAIHN0YXRpYyBpbnQgbWVzb25fcGNpZV9zdGFydF9saW5rKHN0cnVjdCBk
d19wY2llICpwY2kpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgbWVzb25fcGNpZSAqbXAgPSB0b19tZXNv
bl9wY2llKHBjaSk7Cj4gPiAgCj4gPiArCW1lc29uX3BjaWVfYXNzZXJ0X3Jlc2V0KG1wKTsKPiA+
ICAJbWVzb25fcGNpZV9sdHNzbV9lbmFibGUobXApOwo+ID4gLQltZXNvbl9wY2llX2Fzc2VydF9y
ZXNldChtcCk7CgptZXNvbl9wY2llX2Fzc2VydF9yZXNldCgpIGl0c2VsZiBpcyB3cm9uZyBhcyBp
dCB0b2dnbGVzIFBFUlNUIy4gWW91J2QganVzdCBuZWVkOgoKbXNsZWVwKFBDSUVfVF9QRVJTVF9D
TEtfVVMpOwpncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAobXAtPnJlc2V0X2dwaW8sIEdQSU9EX09V
VF9MT1cpCgpidXQgaW4gcHJvYmUoKSwgYWZ0ZXIgbWVzb25fcGNpZV9wcm9iZV9jbG9ja3MoKSBh
cyB0aGF0J3Mgd2hlbiBib3RoIHBvd2VyIGFuZApSRUZDTEsgYmVjb21lcyBzdGFibGUuCgo+ID4g
IAo+ID4gIAlyZXR1cm4gMDsKPiA+ICB9Cj4gCj4gSGkgR293dGhhbSwKPiAKPiBJIGhhdmUgYSBw
YXRjaCBbMV0gdGhhdCBJIGhhdmVuJ3Qgc3VibWl0dGVkIHlldC4KPiBUaGlzIG1pZ2h0IGJlIHJl
bGF0ZWQgdG8geW91ciBpc3N1ZSwgd2hhdCBkbyB5b3UgdGhpbmsgPwo+IAo+IFsxXSBodHRwczov
L2dpdGh1Yi5jb20vcmNsYXZlYXUtdGVjaC9saW51eC1raGFkYXMvY29tbWl0L2JlZTBhMDJkOTc1
Ngo+IAoKVGhpcyBwYXRjaCBpcyBhbHNvIG5lZWRlZCBhcyBpdCBjb3JyZWN0bHkgZml4ZXMgdGhl
IFBFUlNUIyBwb2xhcml0eSB3aGVuCnJlcXVlc3RpbmcgdGhlIEdQSU8uIFNpbmNlIHRoZSBkZXZp
Y2V0cmVlIGlzIGRlZmluaW5nIHRoZSBQRVJTVCMgR1BJTyBhcwpBQ0lWRV9MT1csIHRoZSBkcml2
ZXIgc2hvdWxkIHJlcXVlc3QgaXQgYXMgR1BJT0RfT1VUX0hJR0ggdG8gbWFrZSBzdXJlIHRoYXQK
UEVSU1QjIGlzIGFzc2VydGVkLgoKU28gcGxlYXNlIHN1Ym1pdCB0aGUgcmVmZXJlbmNlZCBwYXRj
aC4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprg
rr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
