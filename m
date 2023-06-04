Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998F0C7EE29
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Jun 2023 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5gC/kI7v5RsuBKsjobStXzlQZ0seaqgwOSLrR0pGpg=; b=BDpM31nW0+4unA
	4XAxLxhRRyYINT2M3DZGLnjcydyA+8sQoQmO52JDqmYT2YInc3cXEsk95audcQeq2PV0MmryxAeWn
	rDna0CTDnuJZiGQU7Dinwdf6trq+zwIG2W/yzrMXEP7GamAjQQMXuEHbjaUN+wWYYzaW8izTJbAm2
	/OwblKNhfLuHX72FXGfj0VoyXq67jHnggsEXa9R5M/H2NsYz28TNrORNW3ctzNbw2GRR4NHdXDe5z
	ZiEaM4zWGl0H0UrCtkq9h+46rRcYBTNwEVAa9BSVZzAlKLwPK1EOWYBjg1kM0wz689AE6MtnDlnGy
	XK1kgP121bGEUhQxpH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nDo-00CAcs-0M;
	Sun, 04 Jun 2023 12:52:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nDm-00CAbj-01;
	Sun, 04 Jun 2023 12:52:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F7C160A09;
	Sun,  4 Jun 2023 12:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C487DC433D2;
	Sun,  4 Jun 2023 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685883153;
	bh=jioYa8JgZJ877Due+C+TvMM5McsdOwLd9jYmABtS2fc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B+o59eYM0qTv7hoIgWYvZq6XQLgvc1bFaSXYqj/HES+XF9f7cBuYSczYcyl1PywFl
	 YSwy/tQWjKkn98S/UEWm4U/PegeVrxt9qOjXZhbPnruyXsOpN1vju0TTGMBLf8IwbF
	 zys5ifqsY19OQDt9bp2avP6EnZ7M7ljRrKvhi03jcyzENtyLF/800pki6uSsqEgfIH
	 Juo+XRyckUODxofmDd26+CLMd9Dr4+nUUIl/k8VYjqu/QVoe9Acl5gIpllUE+9DDns
	 u3SY30tAs9mLRpGmljNQSWAWJE969KCBbkoV+2SXOHSKPQcrbjD/M91EefXQ755+NB
	 MBEIFjfRn2B1w==
Date: Sun, 4 Jun 2023 13:52:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: George Stark <GNStark@sberdevices.ru>, "lars@metafoo.de"
 <lars@metafoo.de>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
 <jbrunet@baylibre.com>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "nuno.sa@analog.com"
 <nuno.sa@analog.com>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch
 channel 7 mux
Message-ID: <20230604135228.5a5d743d@jic23-huawei>
In-Reply-To: <CAFBinCA=earf119bN7ohmTQGDzSMeV9qcL8RU9DUYe0195H5=Q@mail.gmail.com>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
	<20230528161117.197f7e61@jic23-huawei>
	<4d5a7691-68ac-6626-5502-383fad3a9436@sberdevices.ru>
	<CAFBinCA=earf119bN7ohmTQGDzSMeV9qcL8RU9DUYe0195H5=Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_055234_142803_5517C7E0 
X-CRM114-Status: GOOD (  29.03  )
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

T24gTW9uLCAyOSBNYXkgMjAyMyAyMjowNDoxOCArMDIwMApNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gSGkgR2VvcmdlLAo+
IAo+IE9uIFN1biwgTWF5IDI4LCAyMDIzIGF0IDExOjUy4oCvUE0gR2VvcmdlIFN0YXJrIDxHTlN0
YXJrQHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiBbLi4uXQo+ID4gPiBCYXNlZCBvbiB0aGUgbGlt
aXRlZCBkZXNjcmlwdGlvbiB3ZSBoYXZlIGhlcmUsIEknbSBub3QgdW5kZXJzdGFuZGluZyB3aHkK
PiA+ID4geW91IGRvbid0IGp1c3QgZXhwcmVzcyB0aGlzIGFzIGEgc2V0IG9mIGNoYW5uZWxzLiBP
bmUgY2hhbm5lbCBwZXIgbXV4Cj4gPiA+IHNldHRpbmcsIHdpdGggdGhlIGluX3ZvbHRhZ2VYX2xh
YmVsIHByb3ZpZGluZyB0aGUgaW5mb3JtYXRpb24gb24gd2hhdCB0aGUKPiA+ID4gY2hhbm5lbCBp
cyBjb25uZWN0ZWQgdG8uCj4gPiA+Cj4gPiA+IFRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgZmFjaWxp
dHksIHNvIGdvb2QgdG8gZW5hYmxlIGZvciBoaWdoIHByZWNpc2lvbiBjYWxpYnJhdGlvbgo+ID4g
PiBidXQgd2Ugc3RpbGwgd2FudCB0byBtYXAgaXQgdG8gc3RhbmRhcmRzIHNpZ25hbHMuICBVc2Vy
c3BhY2UgZG9lc24ndAo+ID4gPiBjYXJlIHRoYXQgdGhlc2UgYXJlIGFsbCBiZWluZyBtZWFzdXJl
ZCB2aWEgdGhlIHNhbWUgaW5wdXQgNyAtIHdoaWNoCj4gPiA+IGlzIGl0c2VsZiBwcm9iYWJseSBh
biBpbnB1dCB0byBhIE1VWC4KPiA+ID4KPiA+ID4gSm9uYXRoYW4gIAo+ID4KPiA+IEhlbGxvIEpv
bmF0aGFuCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+ID4KPiA+IFlvdXIgaWRlYSBv
ZiBleHBvc2luZyB0aGUgbXV4IHNldHRpbmcgYXMgaWlvIGNoYW5uZWxzIGlzIHZlcnkKPiA+IGlu
dGVyZXN0aW5nIGFuZCBhdCBsZWFzdCB3b3J0aCB0cnlpbmcuCj4gPiBUaGUgc3lzZnMgYXBwcm9h
Y2ggd2FzIGNob3NlbiBiZWNhdXNlIG9mIHRoZSBjb2RlIGNoYW5nZXMgYXJlIHNpbXBsZSBhbmQK
PiA+IG5lYXQgKGNvbXBhcmUgdG8gY2hhbm5lbHMgYXBwcm9hY2gpLgo+ID4gQWxzbyBjYWxpYnJh
dGlvbiBieSB1c2luZyB0aG9zZSBtdXggaW5wdXRzIGFyZSBhbHJlYWR5IHN1cHBvcnRlZCBpbiB0
aGUKPiA+IGRyaXZlciAocGVyZm9ybWVkIGF0IHByb2JlIHN0YWdlKSBzbyBJIGV4cGVjdCB2ZXJ5
IHNwZWNpYWwgdXNlY2FzZXMgZm9yCj4gPiB0aG9zZSBtdXggc2V0dGluZ3MgbGlrZSBkZWJ1ZyBv
ciBkZXZpY2UgcHJvZHVjdGlvbiBzdGFnZSB0ZXN0cy4gSW4gdGhvc2UKPiA+IHVzZXNjYXNlcyBo
YXJkd2FyZSBzcGVjaWZpYyBrbm93bGVkZ2UgaXMgcmVxdWlyZWQgYW55d2F5LiAgCgpBZ3JlZWQg
dGhhdCB1c2luZyBjaGFubmVscyBmb3IgdGhpcyBpcyBtb3JlIGNvbXBsZXggY29kZSB3aXNlLCBi
dXQgdGhlCmF2b2lkYW5jZSBvZiBjdXN0b20gQUJJIGlzIHVzdWFsbHkgd29ydGh3aGlsZS4gIEhv
d2V2ZXIgSSBnZXQgeW91ciBwb2ludAp0aGF0IHRoaXMgaXMgd2VpcmQgZGVidWcgLyBjb3JuZXIg
Y2FzZSBwYXRocyBhbnl3YXkuCkhvd2V2ZXIuLi4KCgo+IEFub3RoZXIgZG93bnNpZGUgdG8gdGhl
IGRlYnVnZnMgYXBwcm9hY2ggaXMgdXNlciBzdXBwb3J0Ogo+IElmIHNvbWVvbmUgcmVwb3J0cyBv
ZGQgdmFsdWVzIG9uIEFEQyBjaGFubmVsIDcgdGhlbiB3ZSBuZWVkIHRvIG1ha2UKPiBzdXJlIHRv
IGRvdWJsZSBjaGVjayBpZiB0aGUgbXV4IGhhcyBiZWVuIGFsdGVyZWQgZnJvbSB1c2Vyc3BhY2Ug
KHRoZQo+IGNhbGlicmF0aW9uIGR1cmluZyBpbml0aWFsaXphdGlvbiBlbnN1cmVzIHRvIGxlYXZl
IGNoYW5uZWwgNyBpbiBhCj4gY29uc2lzdGVudCBzdGF0ZSwgd2hpbGUgYSB1c2VyIG1heSBjaGFu
Z2UgdGhlIG11eCwgZm9yZ2V0IGFib3V0IGl0IGFuZAo+IHRoZW4gY29tcGxhaW4gdGhhdCB2YWx1
ZXMgYXJlIHdyb25nKS4KClRoaXMgcHJvYmxlbSByYWlzZXMgcmVkIGZsYWdzIGZvciBtZS4gIElm
IHRoZSBjaGFubmVsIHdhc24ndCBvdGhlcndpc2UKdXNlZnVsIHRoZW4gdHJlYXRpbmcgaXQgYXMg
YSB3ZWlyZCBkZWJ1ZyB0aGluZyBpcyBmaW5lLCBidXQgaWYgYSBub3JtYWwKcmVhZCBjYW4gZW5k
IHVwIHJldHVybmluZyB3ZWlyZCBhbnN3ZXJzIGJlY2F1c2Ugb2YgbGVmdG92ZXIgY29uZmlndXJh
dGlvbgp0aGF0IGlzIGN1c3RvbSBBQkksIHNvIHN0YW5kYXJkIGNvZGUgaXNuJ3QgZXZlbiBhd2Fy
ZSBvZiBpdCwgdGhhdCdzIGJhZC4KCkhlbmNlIEkgd291bGQgbm90IHdhbnQgdG8gc2VlIGFueSBw
YXRoIHVuZGVyIHdoaWNoIHRoYXQgY2FuIGhhcHBlbi4KQSByZWFkIG9mIGluX3ZvbHRhZ2U3X3Jh
dyBzaG91bGQgY29udGludWUgdG8gcmV0dXJuIHRoZSBub3JtYWwgdmFsdWUKd2hhdGV2ZXIgdGhp
cyBwYXRjaCBhZGRzLgoKSm9uYXRoYW4KCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
