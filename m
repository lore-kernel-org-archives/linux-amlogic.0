Return-Path: <SRS0=JVYJ=LC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725FBC47082
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 12:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414F060FF0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 12:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 414F060FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8RA6I+i77JXrBo06Gb52Cg1bfwQq6VvjcwUTw91DnM=; b=CzeLuBu0bcfHK6
	suQhTflj1EbhUyUfPSVVwI6AQVKSpKefP4jRP/7/Q2GFqlTLh3nWGsDfXwJ5+hg3SPDvJUH0o19D9
	xR3o+WFFd2VIFR+vN/pIasfJMa5dwHLJmr6zMvFTGN5OjlceyyAwswzRX0U/xJo/eEWDzJ84C31kp
	cvVgqeRONbE2yuKStr9rTPqwVduwzN8MQbTMmNB+axRq8vvNuQiqfVopmLYOinZO91v8R61V9X2mi
	WOSRKxmeLY/Vvo1VfgdiWb6sDtfbCyXrscUZSorFUFiFjyU0H4WhRCH17JxvE7d6aRCDd9hHhqT/a
	gKYWJCNyxSJNB+4HbVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqbAL-008TMu-Cu; Tue, 08 Jun 2021 12:49:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqb4O-008QyM-0J; Tue, 08 Jun 2021 12:43:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9C81D6E;
 Tue,  8 Jun 2021 05:42:56 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.5.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5110C3F73D;
 Tue,  8 Jun 2021 05:42:55 -0700 (PDT)
Date: Tue, 8 Jun 2021 13:42:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 6/8] arm64: Import latest memcpy()/memmove()
 implementation
Message-ID: <20210608124248.GA16585@C02TD0UTHF1T.local>
References: <cover.1622128527.git.robin.murphy@arm.com>
 <3c953af43506581b2422f61952261e76949ba711.1622128527.git.robin.murphy@arm.com>
 <CGME20210608111534eucas1p2964e360336878b9e7a791c0fbeb12940@eucas1p2.samsung.com>
 <acb244ad-0759-5a96-c659-5c23003d3dcd@samsung.com>
 <00519b97-7e09-49ed-817e-de234b0c1cd4@arm.com>
 <7624e09f-cd52-9430-ab18-1d816c8d2898@samsung.com>
 <66d01d91-f52c-1318-aa12-175afff86bad@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66d01d91-f52c-1318-aa12-175afff86bad@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_054300_149496_F429057C 
X-CRM114-Status: GOOD (  16.79  )
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

T24gVHVlLCBKdW4gMDgsIDIwMjEgYXQgMDI6MzY6MjZQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gT24gMDgvMDYvMjAyMSAxNDoyMSwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiA+
IE9uIDA4LjA2LjIwMjEgMTM6MzcsIFJvYmluIE11cnBoeSB3cm90ZToKPiA+PiBPbiAyMDIxLTA2
LTA4IDEyOjE1LCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+ID4+PiBUaGlzIHBhdGNoIGxhbmRl
ZCByZWNlbnRseSBpbiBsaW51eC1uZXh0IGFzIGNvbW1pdCAyODUxMzMwNDBlNmMgKCJhcm02NDoK
PiA+Pj4gSW1wb3J0IGxhdGVzdCBtZW1jcHkoKS9tZW1tb3ZlKCkgaW1wbGVtZW50YXRpb24iKS4g
U2FkbHkgaXQgY2F1c2VzCj4gPj4+IHNlcmlvdXMgaXNzdWVzIG9uIEtoYWRhcyBWSU0zIGJvYXJk
LiBSZXZlcnRpbmcgaXQgb24gdG9wIG9mIGxpbnV4Cj4gPj4+IG5leHQtMjAyMTA2MDcgKHRvZ2V0
aGVyIHdpdGggNmI4ZjY0ODk1OWU1IGFuZCByZXNvbHZpbmcgdGhlIGNvbmZsaWN0IGluCj4gPj4+
IHRoZSBNYWtlZmlsZSkgZml4ZXMgdGhlIGlzc3VlLiBIZXJlIGlzIHRoZSBrZXJuZWwgbG9nOgo+
ID4+Pgo+ID4+PiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0
dWFsIGFkZHJlc3MgCj4gPj4+IGZmZmY4MDAwMTM2YmQyMDQKPiA+Pj4gTWVtIGFib3J0IGluZm86
Cj4gPj4+IMKgIMKgIEVTUiA9IDB4OTYwMDAwNjEKPiA+Pj4gwqAgwqAgRUMgPSAweDI1OiBEQUJU
IChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzCj4gPj4+IMKgIMKgIFNFVCA9IDAsIEZuViA9IDAK
PiA+Pj4gwqAgwqAgRUEgPSAwLCBTMVBUVyA9IDAKPiA+Pj4gRGF0YSBhYm9ydCBpbmZvOgo+ID4+
PiDCoCDCoCBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMDYxCj4gPj4KPiA+PiBUaGF0J3MgYW4gYWxp
Z25tZW50IGZhdWx0LCB3aGljaCBpbXBsaWVzIHdlJ3JlIGFjY2Vzc2luZyBzb21ldGhpbmcgCj4g
Pj4gd2hpY2ggaXNuJ3Qgbm9ybWFsIG1lbW9yeS4KClsuLi5dCgo+ID4+PiBJIGhvcGUgdGhhdCB0
aGUgYWJvdmUgbG9nIGhlbHBzIGZpeGluZyB0aGUgaXNzdWUuIElJUkMgdGhlIFNESENJIGRyaXZl
cgo+ID4+PiBvbiBWSU0zIGJvYXJkIHVzZXMgaW50ZXJuYWwgU1JBTSBmb3IgdHJhbnNmZXJyaW5n
IGRhdGEgKGluc3RlYWQgb2YgRE1BKSwKPiA+Pj4gc28gdGhlIGlzc3VlIGlzIHNvbWVob3cgcmVs
YXRlZCB0byB0aGF0Lgo+ID4+Cj4gPj4gRHJpdmVycyBzaG91bGRuJ3QgYmUgdXNpbmcgbWVtY3B5
KCkgb24gaW9tZW0gbWFwcGluZ3MuIEV2ZW4gaWYgdGhleSAKPiA+PiBoYXBwZW4gdG8gaGF2ZSBn
b3QgYXdheSB3aXRoIGl0IHNvbWV0aW1lcyA7KQo+ID4+Cj4gPj4gVGFraW5nIGEgcXVpY2sgbG9v
ayBhdCB0aGF0IGRyaXZlciwKPiA+Pgo+ID4+IMKgwqDCoMKgaG9zdC0+Ym91bmNlX2J1ZiA9IGhv
c3QtPnJlZ3MgKyBTRF9FTU1DX1NSQU1fREFUQV9CVUZfT0ZGOwo+ID4+Cj4gPj4gaXMgY29tcGxl
dGVseSBib2d1cywgYXMgU3BhcnNlIHdpbGwgcmVhZGlseSBwb2ludCBvdXQuCj4gCj4gTXkgYmFk
LCB3aGF0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGNvcHkgZGF0YSB0byBhbiBpb21lbSBtYXBwaW5n
ID8KCldlIGhhdmUgbWVtY3B5X3RvaW8oKSBhbmQgbWVtY3B5X2Zyb21pbygpIGZvciB0aGlzLgoK
VGhhbmtzLApNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
