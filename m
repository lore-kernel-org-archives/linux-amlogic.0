Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61861C04A94
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmhCgTzr0imn8mCQRCLldR/30qePqhO32e3SeuKqJwo=; b=3acu5pFx6JcVmy
	HBlAYtX8MN1Gu+sweV8DHgwGBb0Uweu9d9tJtC753IIvxpf2qnL9wdhgxcHyvGcfaCIMqBDRyCzpq
	adJRUWcW3gxkvgq+SW0OzeVVZ+Oif1dfHDULHjgHv8+efSXtxNqi1XuuqrhbvK2CGIYWy7izUcazh
	iMk+dGZm+tQaHy0UeOqOPXGeVhBc7KlS/W5n+7jKmbpaqWIJEF9lfnA0jH7ZVdb74SLA4Gw0QfFhW
	MHOQUIjfgQ6wetGGA2k+TkFKyslznxUgHVewDa4aESr79OokPC52CqAQcPeLVmWj6jJeYc9HcFq10
	Hsu1bRk96hrR9nvGy1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFvG-001nX4-2D;
	Tue, 08 Aug 2023 06:10:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFvD-001nVg-3C;
	Tue, 08 Aug 2023 06:10:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 568066238A;
	Tue,  8 Aug 2023 06:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E904C433C8;
	Tue,  8 Aug 2023 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691475022;
	bh=EOGAaHCEP1owoAYsDzjK3qET7oP6l2+V/Y0rh3FHdLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9VfyL5O+92X/TbxQmSC8SpxCmww997RuNiU5C7Xlk8BOK+qKNNmMCgZzQ1/b2Na6
	 4DlzEkK0Fki41R73GZAHXoieTxnYzvPn28GaTIk/oznq158pibD88Isse9K2sVOo4K
	 azpa9Jj9IboFC4ttS87DfGUbW6scQPkzXy3xBu0U=
Date: Tue, 8 Aug 2023 08:10:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Da Xue <da@libre.computer>
Cc: Luke Lu <luke.lu@libre.computer>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
Message-ID: <2023080832-plated-slackness-20e4@gregkh>
References: <20230808032510.31754-1-luke.lu@libre.computer>
 <2023080851-duh-scroll-09bf@gregkh>
 <CACqvRUaK_Pj1DT4QY+YpKmvGeFqmM8KPcYWqTLNJoUJJaEbFAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACqvRUaK_Pj1DT4QY+YpKmvGeFqmM8KPcYWqTLNJoUJJaEbFAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_231024_078417_B32DB941 
X-CRM114-Status: GOOD (  20.48  )
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

T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDE6MzM6NDVBTSAtMDQwMCwgRGEgWHVlIHdyb3RlOgo+
IE9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgMTI6NTbigK9BTSBHcmVnIEtyb2FoLUhhcnRtYW4KPiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDA4
LCAyMDIzIGF0IDAzOjI1OjEwQU0gKzAwMDAsIEx1a2UgTHUgd3JvdGU6Cj4gPiA+IERldmljZSBj
b25uZWN0ZWQgdG8gdXNiIG90ZyBwb3J0IG9mIEdYTC1iYXNlZCBib2FyZHMgY2FuIG5vdCBiZQo+
ID4gPiByZWNvZ25pc2VkIGFmdGVyIHJlc3VtcHRpb24sIGRvZXNuJ3QgcmVjb3ZlciBldmVuIGlm
IGRpc2Nvbm5lY3QgYW5kCj4gPiA+IHJlY29ubmVjdCB0aGUgZGV2aWNlLiBkbWVzZyBzaG93cyBp
dCBkaXNjb25uZWN0cyBkdXJpbmcgcmVzdW1wdGlvbi4KPiA+ID4KPiA+ID4gWyAgIDQxLjQ5Mjkx
MV0gdXNiIDEtMjogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMwo+ID4gPiBbICAgNDEu
NDk5MzQ2XSB1c2IgMS0yOiB1bnJlZ2lzdGVyaW5nIGRldmljZQo+ID4gPiBbICAgNDEuNTExOTM5
XSB1c2IgMS0yOiB1bnJlZ2lzdGVyaW5nIGludGVyZmFjZSAxLTI6MS4wCj4gPiA+Cj4gPiA+IENh
bGxpbmcgdXNiX3Bvc3RfaW5pdCgpIHdpbGwgZml4IHRoaXMgaXNzdWUsIGFuZCBpdCdzIHRlc3Rl
ZCBhbmQKPiA+ID4gdmVyaWZpZWQgb24gbGlicmV0ZWNoJ3MgYW1sLXM5MDV4LWNjIGJvYXJkLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWtlIEx1IDxsdWtlLmx1QGxpYnJlLmNvbXB1dGVy
Pgo+ID4KPiA+IFdoYXQgY29tbWl0IGlkIGRvZXMgdGhpcyBmaXg/ICBTaG91bGQgaXQgYWxzbyBn
byB0byBzdGFibGUga2VybmVscz8KPiAKPiBIaSBHcmVnLAo+IAo+IFN1c3BlbmQgZGV2aWNlIHRy
ZWUgZmxhZyBoYXMgbm90IGJlZW4gZW5hYmxlZCBpbi10cmVlIGZvciB0aGUgQW1sb2dpYwo+IEdY
TCAoUzgwNVgvUzkwNVgvUzkwNUQpIHNlcmllcyBkdWUgaXQgaGF2aW5nIFBTQ0kgMC4yIGFuZCB0
aHVzIG5ldmVyCj4gdW50ZXN0ZWQuIE1vc3Qgb2YgdGhlIHN1c3BlbmQgcmVzdW1lIGNvZGUgd2Fz
IG9ubHkgdGVzdGVkIG9uIG5ld2VyCj4gRzEyQS9CIHNlcmllcy4KPiAKPiBUaGlzIGFuZCAiW1BB
VENIIHYzXSBuZXQ6IHBoeTogbWVzb24tZ3hsOiBpbXBsZW1lbnQKPiBtZXNvbl9neGxfcGh5X3Jl
c3VtZSgpIiBmaXhlcyBVU0IgYW5kIEV0aGVybmV0IGFmdGVyIHJlc3VtZS4gSERNSQo+IHJlcXVp
cmVzIGFub3RoZXIgZml4Lgo+IAo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoZXkgY291bGQgZ28g
aW50byBzdGFibGUgc2luY2Ugd2UgYXJlIGNhcnJ5aW5nCj4gdGhlc2UgdHdvIHBhdGNoZXMgaW4g
b3VyIHRyZWUgb24gNi4xIGFuZCB0aGV5J3JlIGFwcGxpY2FibGUgYmFjayB0bwo+IDUuNCBidXQg
SSBhbSBub3Qgc3VyZSB3aGF0IHRoZSBjcml0ZXJpYSBpcy4KCmh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3RhYmxlLWtlcm5lbC1ydWxlcy5odG1sCmhhcyB0
aGUgY3JpdGVyaWEuICBJZiB5b3UgdGhpbmsgaXQgc2hvdWxkIGdvIHRoZXJlLCB0aGVuIHBsZWFz
ZSByZXNlbmQKd2l0aCBhIGNjOiBzdGFibGUgdGFnIGluIHRoZSBzaWduZWQtb2ZmLWJ5IGFyZWEu
Cgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
