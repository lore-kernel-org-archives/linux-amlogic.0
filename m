Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5590C0219E
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Feb 2025 20:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXZNgD7qluA910qq2utvJMS6nfFDx2oYplLIkQcFSXs=; b=eZPvBi6ewmPWE9
	EPCcRAqowNv6TEVRdbH+EGAcT7nATdyw2q3t+NwoIwAFDHNxKvbNh22sp8mNRaAMLnnATM6Ibh3V3
	B5ODWtkZ15JxGkZ8blzSVcg/f/n6/2LWPkeZwQLZFBGWYXYyr/EOTqpCvkVo9NFPLiBqHGkiHIT86
	Uw4cGQ5+XwCqMuL7k07bAeRvfvNQARDdKX1LFaDktWDUt9k9eoYNy//V5P8d0Bix+azeuKMO7f1Is
	tzNycyMw2MjZJUsWjzEYbnGFLHW9caY37Yw5fmkUyEQ9IBH1Ss4ghWl5zjqQxRKCOwJN1jmNaGoNp
	XeVMqYeH1hmRh6W55glQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwcV-00000005ATJ-1eQ6;
	Tue, 11 Feb 2025 20:12:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwcT-00000005ASs-1U8E;
	Tue, 11 Feb 2025 20:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C079A40C61;
	Tue, 11 Feb 2025 20:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105B3C4CEDD;
	Tue, 11 Feb 2025 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739304752;
	bh=v/Jok9KiEPoYdLkGoT5WJHe5oUzwY5NHLVXVVA+iJRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgY9IZVp67cVbFI4jfVr7xHVisU4vQHZuG1uZWlCrEFpbmg/2dNn4b/SuQvmUd0eq
	 CVT/QkfAtdvp0+v1yC0NXDVvzmV4xeu1X1dDyeOxYM13irap3UlVed8o3FtqY43MUV
	 /yoASTYArEkmeTqV/2DOvzzVgE1ytQqwU8toQtqau5UpYjKg1ZsC7npOemFAo2CXP+
	 bHKrvp8r80hHPa+g8Hd6z41qLUigcsUjraZ6ZBD6qBRWZkSWrx3f8TyqEF2bQYdNSQ
	 ySnRzKmC3aBxnzOtNbZMA9AeGIj9pMbZR9kqDyfnwWWYfr+78qRfb/Vs7lfYelK/Y7
	 k1zOIv5I20AsQ==
Date: Tue, 11 Feb 2025 14:12:30 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma.B@microchip.com
Cc: neil.armstrong@linaro.org, ulf.hansson@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2] dt-bindings: mmc: mmc-slot: make compatible
 property optional
Message-ID: <20250211201230.GA600687-robh@kernel.org>
References: <20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com>
 <f6d7ffa0-6c08-45fb-9153-5e4aad1ca86a@linaro.org>
 <003ffa44-c88a-4234-a54a-50cd1140982a@microchip.com>
 <7180babd-302a-4f86-8770-bdd9f5c773cf@linaro.org>
 <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7de20917-3176-4e80-8ccd-9c01c037cc9a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_121233_517890_A3A3CE70 
X-CRM114-Status: GOOD (  22.34  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDU6Mjg6MjdBTSArMDAwMCwgRGhhcm1hLkJAbWljcm9j
aGlwLmNvbSB3cm90ZToKPiBPbiAwNy8wMi8yNSAyOjQ3IHBtLCBuZWlsLmFybXN0cm9uZ0BsaW5h
cm8ub3JnIHdyb3RlOgo+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyAKPiA+IHRoZSBjb250ZW50IGlzIHNhZmUK
PiA+IAo+ID4gT24gMDcvMDIvMjAyNSAxMDowMiwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90
ZToKPiA+PiBPbiAwNy8wMi8yNSAyOjI1IHBtLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiA+Pj4g
RVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3Uga25vdwo+ID4+PiB0aGUgY29udGVudCBpcyBzYWZlCj4gPj4+Cj4gPj4+IE9uIDA1
LzAyLzIwMjUgMDQ6NDgsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToKPiA+Pj4+IFJlbW92
ZSB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBmcm9tIHRoZSBsaXN0IG9mIHJlcXVpcmVkIHByb3Bl
cnRpZXMgYW5kCj4gPj4+PiBtYXJrIGl0IGFzIG9wdGlvbmFsLgoKVGhlIGRpZmYgdGVsbHMgdXMg
dGhhdC4gUGxlYXNlIHNheSB3aHkgJ2NvbXBhdGlibGUnIGJlaW5nIHJlcXVpcmVkIGlzIGEgCnBy
b2JsZW0gYW5kIG5lZWRzIHRvIG5vdCBiZSByZXF1aXJlZC4KCj4gPj4+Pgo+ID4+Pj4gU2lnbmVk
LW9mZi1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFybWEuYkBtaWNyb2NoaXAuY29tPgo+
ID4+Pj4gLS0tCj4gPj4+PiBDaGFuZ2VzIGluIHYyOgo+ID4+Pj4gLSBJbnN0ZWFkIG9mIG1vdmlu
ZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIG90aGVyIGJpbmRpbmcsIGp1c3QKPiA+Pj4+
IG1ha2UgaXQKPiA+Pj4+IMKgwqDCoCBvcHRpb25hbCAocmVtb3ZlIGZyb20gcmVxdWlyZWQgbGlz
dCkuCj4gPj4+PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEy
MTktbW1jLXNsb3QtdjEtMS0KPiA+Pj4+IGRmYzc0N2EzZDNmYkBtaWNyb2NoaXAuY29tCj4gPj4+
PiAtLS0KPiA+Pj4+IMKgwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9t
bWMtc2xvdC55YW1sIHwgMSAtCj4gPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tbWMvbW1jLXNsb3QueWFtbCBiLwo+ID4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21tYy9tbWMtc2xvdC55YW1sCj4gPj4+PiBpbmRleCAxZjA2Njc4MjgwNjMu
LmNhM2QwMTE0YmZjNiAxMDA2NDQKPiA+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tbWMvbW1jLXNsb3QueWFtbAo+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtc2xvdC55YW1sCj4gPj4+PiBAQCAtMjksNyArMjks
NiBAQCBwcm9wZXJ0aWVzOgo+ID4+Pj4gwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxCj4gPj4+Pgo+
ID4+Pj4gwqDCoCByZXF1aXJlZDoKPiA+Pj4+IC3CoCAtIGNvbXBhdGlibGUKPiA+Pj4+IMKgwqDC
oMKgIC0gcmVnCj4gPj4+Cj4gPj4+IElmIHlvdSByZW1vdmUgaXQgZnJvbSBoZXJlIHRoZW4gaXQn
cyBzdGlsbCByZXF1aXJlZCBpbiBEb2N1bWVudGF0aW9uLwo+ID4+PiBkZXZpY2V0cmVlL2JpbmRp
bmdzL21tYy9hbWxvZ2ljLG1lc29uLW14LXNkaW8ueWFtbAo+ID4+PiBzbyBwbGVhc2UgYWRkIGl0
Lgo+ID4+Cj4gPj4gSWYgbW92aW5nIHRoZSBjb21wYXRpYmxlIHRvIGl0cyBzcGVjaWZpYyBiaW5k
aW5nIGlzbid0IGFwcHJvcHJpYXRlIChhcwo+ID4+IHBlciBDb25vciksCj4gPj4gYW5kIGlmIHJl
bW92aW5nIGl0IGZyb20gdGhlIHJlcXVpcmVkIGxpc3QgaGVyZSBkb2VzbuKAmXQgc2VlbSByZWFz
b25hYmxlCj4gPj4gdG8geW91LAo+ID4+IHRoZW4gYWRkaW5nIGFuIHVubmVjZXNzYXJ5IGNvbXBh
dGlibGUgc3RyaW5nIGluIG91ciBEVFMgZmlsZXMgZG9lc27igJl0Cj4gPj4gbWFrZSBzZW5zZSB0
byBtZS4KPiA+Pgo+ID4+IFdoYXQgY291bGQgYmUgdGhlIHNvbHV0aW9uIHRoZW4/Cj4gPiAKPiA+
IFRoZSBzb2x1dGlvbiBpcyByaWdodCBidXQgeW91IG1vZGlmeSB0aGUgbWVzb24tbXgtc2RpbyBi
aW5kaW5ncywgc28KPiA+IHNpbXBseSBhZGQgY29tcGF0aWJsZSBpbiBhIHJlcXVpcmVkIGxpc3Qg
Zm9yIHRoZSBzbG90IG5vZGUuCj4gCj4gT2theSwgd2UgZGVjbGFyZSBjb21wYXRpYmxlIGFzIG9w
dGlvbmFsIGluIHRoZSBnZW5lcmljIG1tYy1zbG90IGJpbmRpbmcgCj4gYnV0IG1ha2UgaXQgcmVx
dWlyZWQgaW4gdGhlIG1lc29uLW14LXNkaW8gYmluZGluZywgd2hpY2ggaW5oZXJpdHMgZnJvbSBp
dC4KPiAKPiBTbyB3aHkgbm90IGRlZmluZSB0aGUgcHJvcGVydHkgZGlyZWN0bHkgaW4gdGhlIG1l
c29uLW14LXNkaW8gYmluZGluZyAKPiBpbnN0ZWFkPwoKQmVjYXVzZSBtbWMtc2xvdC55YW1sIGlz
IGRlc2lnbmVkIHRvIGJlIGNvbXBsZXRlIChoZW5jZSAKInVuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UiKS4gVGhlcmUncyBhdCBsZWFzdCAyIGJpbmRpbmdzIHdoaWNoIHVzZSAKaXQgKHdpdGgg
Im1tYy1zbG90IiBjb21wYXRpYmxlKS4gTGVhdmluZyBpdCBhdCBsZWFzdCBwcmV2ZW50cyBmb2xr
cyBmcm9tIApjb21pbmcgdXAgd2l0aCB0aGVpciBvd24gcmFuZG9tIGNvbXBhdGlibGUgc3RyaW5n
cyBmb3IgbW1jLXNsb3QuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
