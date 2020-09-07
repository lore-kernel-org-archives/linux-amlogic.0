Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7504BC433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20988208C7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Isupwyze";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="anOBH6nr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20988208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cMWWqRDRNwnv3wRdz6hlbU8wtWZAVF1T0Hw8ftfgAc4=; b=IsupwyzeoylhhLLMOKi2W8y4p
	fSWOba+lqjPKXtU2XiVP9d2ejsOW5mR6cJOLSYA/sjuhF/3P0vWX/fi+EdLrVimqFhNpQalQUK7ep
	NSjpeAvek9qol5AuKVUhX2poBnJ4888Y7/Evbnd/ro+eVOLC+BqzkzwO0bzxx85ibPGryH6KxQ5uP
	XOGAa4jrClx7L6bcx4tJvN5JcWs4l2D/qMw3xKe/fa3tDfc/PABFL/xzNToEtCmywMoyU4kyG8zJh
	MI5o/9rtbnNHhLYbW/4/2hEBerVLLaOlj4rw0zETV+TbLXDAFXaLuxtxJLdEN6R6azUsJDZmNlTsb
	GyC3/Nzeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCbP-00043j-2k; Mon, 07 Sep 2020 08:34:15 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCbG-0003xr-GD
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:34:07 +0000
Received: by mail-vk1-xa41.google.com with SMTP id x142so3134168vke.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OhAa3dkRhupfYhPbrSvYRNjuERTImcRBCu+4dGQXuHE=;
 b=anOBH6nryFltsKB+grOT0oVm31IA2peEKmy/JJWb1pH8yEktvQHA5gUHIASLe7lHRv
 3PwSWNUNvfG44/5gWBx0rKz8oydkb77qE4vL2vF0gfMos/MAsbjaEYGW9Qb1boDk3MnL
 szLpGIyTpdCs/o0LOMyDANJs4RLgKBAOBHe/0v51p2HfG59scznndSWSPNoKTzjdPy2v
 Dnxb58lMZk6Bj8puI3BF8X4+ImCJnqo/gCTQ5riIzeNoND74ZYvzLR3mvemhcX56RsbW
 n6iv7yO9jkYICGAPnTWUVSPFkDj+RIu1vXkI56Ro3SEs6z5PJuS5FSF1sIdkUlCeaxx6
 Vs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OhAa3dkRhupfYhPbrSvYRNjuERTImcRBCu+4dGQXuHE=;
 b=Xl5UjffmWIpICxQ2WYITlWmnTnRuGijP/E3YnqaursUmNCguOvR0rvapMO+Eo+cM9T
 G6hBIbPT2Zyqp2A5NxFtkJzCKpGsYsCHyv4ty/aXd5Z1Yfb4tOGipQj3xB4UzkM7LOST
 jzysyCLh97iuTQEc/ajYd60WGO9rmCfXphkwATPFa0UgJGo+I4tjFox9E2u0dotosb9W
 bS+v2s8xAQdzNfF+4uZo3JOazlpKexVASs8aMdqpW5MjG00XGVye8A5xFnlXaQCVgF/P
 DCDBG/jwK4ZZYSPORuXuxOKd/8GBlgDPqfvRRylmQ5JzPoj/b+R62mQ78m2TTlxzYDEh
 9olA==
X-Gm-Message-State: AOAM532stMWqkTMwX+l56PcJeF6oxbDkzvPWtdTL+L3nxAQiDJNBoF+V
 BwDafi4IC6mdthPJHmV1NFUztygBFX/TUrE1ypt6+w==
X-Google-Smtp-Source: ABdhPJy0ehAoIcdSs+1xkTH6aaSvcMjYTTsO1eO0w2BGW0J7vIh6uBoSdHfXFfx3jbudIe2Z6IadAoncTA8rAzLVgz8=
X-Received: by 2002:a1f:eac3:: with SMTP id i186mr11295139vkh.11.1599467642082; 
 Mon, 07 Sep 2020 01:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
 <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
 <1jr1reasy4.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jr1reasy4.fsf@starbuckisacylon.baylibre.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Mon, 7 Sep 2020 10:33:51 +0200
Message-ID: <CAHNvnFNCrRV48ixzaz8xDta3ggy5=FgBXUhQuCx3a3XvDUdujg@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043406_621478_30A3CFAF 
X-CRM114-Status: GOOD (  30.47  )
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
Cc: Dan Robertson <dan@dlrobertson.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

cmVzZXRfY29udHJvbF9wdXQoKSBpcyBhbHJlYWR5IHVzZWQgaW4gdGhlIHJlc2V0IGZyYW1ld29y
ay4KCgpMZSBsdW4uIDcgc2VwdC4gMjAyMCDDoCAxMDozMSwgSmVyb21lIEJydW5ldCA8amJydW5l
dEBiYXlsaWJyZS5jb20+IGEgw6ljcml0IDoKPgo+Cj4gT24gV2VkIDAyIFNlcCAyMDIwIGF0IDE2
OjEzLCBBbWphZCBPdWxlZC1BbWV1ciA8YW91bGVkYW1ldXJAYmF5bGlicmUuY29tPiB3cm90ZToK
Pgo+ID4gTGUgc2FtLiAyOSBhb8O7dCAyMDIwIMOgIDE3OjI1LCBNYXJ0aW4gQmx1bWVuc3Rpbmds
Cj4gPiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gYSDDqWNyaXQgOgo+ID4+
Cj4gPj4gSGkgUGhpbGlwcCwKPiA+Pgo+ID4+IE9uIFR1ZSwgQXVnIDI1LCAyMDIwIGF0IDEyOjIw
IFBNIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4+IFsu
Li5dCj4gPj4gPiA+IHJlc2V0X2NvbnRyb2xfY2xlYXIoKQo+ID4+ID4gPiB3b3VsZCBiZSB0aGUg
d2F5IHRvIHN0YXRlIHRoYXQgdGhlIHJlc3NvdXJjZSBpcyBubyBsb25nZXIgdXNlZCBhbmQsIHRo
YXQKPiA+PiA+ID4gZnJvbSB0aGUgY2FsbGVyIHBlcnNwZWN0aXZlLCB0aGUgcmVzZXQgY2FuIGZp
cmVkIGFnYWluIGlmIG5lY2Vzc2FyeS4KPiA+PiA+ID4KPiA+PiA+ID4gSWYgd2UgdGFrZSB0aGUg
cHJvYmUgLyBzdXNwZW5kIC8gcmVzdW1lIGV4YW1wbGU6Cj4gPj4gPiA+ICogMXN0IGRldmljZSB1
c2luZyB0aGUgc2hhcmVkIHdpbGwgYWN0dWFsbHkgdHJpZ2dlciBpdCAoYXMgaXQgaXMgbm93KQo+
ID4+ID4gPiAqIGZvbGxvd2luZyBkZXZpY2UganVzdCBpbmNyZWFzZSB0cmlnZ2VyZWRfY291bnQK
PiA+PiA+ID4KPiA+PiA+ID4gSWYgYWxsIGRldmljZXMgZ28gdG8gc3VzcGVuZCAoY2FsbGluZyBy
ZXNldF9jb250cm9sX2NsZWFyKCkpIHRoZW4KPiA+PiA+ID4gdHJpZ2dlcmVkX2NvdW50IHdpbGwg
cmVhY2ggemVybywgYWxsb3dpbmcgdGhlIGZpcnN0IGRldmljZSByZXN1bWluZyB0bwo+ID4+ID4g
PiB0cmlnZ2VyIHRoZSByZXNldCBhZ2FpbiAuLi4gdGhpcyBpcyBpbXBvcnRhbnQgc2luY2UgaXQg
bWlnaHQgbm90IGJlIHRoZQo+ID4+ID4gPiBvbmUgd2hpY2ggd291bGQgaGF2ZSBnb3QgdGhlIGV4
Y2x1c2l2ZSBjb250cm9sCj4gPj4gPiA+Cj4gPj4gPiA+IElmIGFueSBkZXZpY2UgZG9uJ3QgZ28g
dG8gc3VzcGVuZCwgbWVhbmluZyB0aGUgcmVzc291cmNlIHVuZGVyIHJlc2V0Cj4gPj4gPiA+IGtl
ZXAgb24gYmVpbmcgdXNlZCwgbm8gcmVzZXQgd2lsbCBwZXJmb3JtZWQuIFdpdGggZXhsdXNpdmUg
Y29udHJvbCwKPiA+PiA+ID4gdGhlcmUgaXMgYSByaXNrIHRoYXQgdGhlIHJlc3VtaW5nIGRldmlj
ZSByZXNldHMgc29tZXRoaW5nIGFscmVhZHkgaW4gdXNlLgo+ID4+ID4gPgo+ID4+ID4gPiBSZWdh
cmRpbmcgdGhlIGNvbmRpdGlvbiwgb24gc2hhcmVkIHJlc2V0cywgY2FsbCByZXNldF9jb250cm9s
X3Jlc2V0KCkKPiA+PiA+ID4gc2hvdWxkIGJlIGJhbGFuY2VkIHJlc2V0X2NvbnRyb2xfY2xlYXIo
KSAtIG5vIGNsZWFyIGJlZm9yZSByZXNldC4KPiA+PiA+Cj4gPj4gPiBNYXJ0aW4sIGlzIHRoaXMg
c29tZXRoaW5nIHRoYXQgd291bGQgYmUgdXNlZnVsIGZvciB0aGUgY3VycmVudCB1c2VycyBvZgo+
ID4+ID4gdGhlIHNoYXJlZCByZXNldCB0cmlnZ2VyIGZ1bmN0aW9uYWxpdHkgKHBoeS1tZXNvbi1n
eGwtdXNiMiBhbmQgcGh5LQo+ID4+ID4gbWVzb244Yi11c2IyIHdpdGggcmVzZXQtbWVzb24pPwo+
ID4+IGZvciB0aGUgc3BlY2lmaWMgdXNlLWNhc2UgKHN5c3RlbSBzdXNwZW5kKSB0aGlzIHdvdWxk
IGN1cnJlbnRseSBub3QgYmUKPiA+PiB1c2VmdWwgZm9yIHRoZSB0d28gZHJpdmVycyB5b3UgaGF2
ZSBuYW1lZC4gVGhpcyBpcyBiZWNhdXNlIHRoZQo+ID4+IHBsYXRmb3JtcyBvbiB3aGljaCB0aGV5
IGFyZSB1c2VkIGN1cnJlbnRseSBkb24ndCBzdXBwb3J0IHN5c3RlbQo+ID4+IHN1c3BlbmQuCj4g
Pj4gaWYgb3RoZXIgZHJpdmVycyBhcmUgZ29pbmcgdG8gYmVuZWZpdCBmcm9tIHRoaXMgY2hhbmdl
IHRoZW4gcGxlYXNlIGdvCj4gPj4gYWhlYWQgYW5kIGFkZCB0aGUgbmVjZXNzYXJ5IEFQSS4gVGhl
biBJIGNhbiBhbHNvIHVzZSBpdCBpbiB0aGVzZQo+ID4+IGRyaXZlcnMuIGhvd2V2ZXIsIChhcyBm
YXIgYXMgSSB1bmRlcnN0YW5kKSBJIHdvbid0IGJlIGFibGUgdG8gdmVyaWZ5Cj4gPj4gdGhlIG5l
dyAiZml4ZWQiIGJlaGF2aW9yCj4gPj4KPiA+Pgo+ID4+IEJlc3QgcmVnYXJkcywKPiA+PiBNYXJ0
aW4KPiA+Cj4gPiBIaSBQaGlsaXBwLAo+ID4KPiA+IFJlZ2FyZGluZyB0aGUgbmFtaW5nIG9mIHRo
ZSBuZXcgY2FsbCwgc2luY2UgcmVzZXRfY29udHJvbF9jbGVhcigpIGlzIG5vdAo+ID4gcmVhbGx5
IHJlcHJlc2VudGF0aXZlIG9mIHRoZSBpbnRlbmRlZCBiZWhhdmlvdXIsIEkgaGF2ZSB0aG91Z2h0
IG9mIHNvbWUKPiA+IG90aGVyIG1ldGFwaG9ycyBzdWNoIGFzOgo+ID4KPiA+IHJlc2V0X2NvbnRy
b2xfcmVzZXR0YWJsZSgpICAgIChzb3VuZHMgdGhlIG1vc3QgcmVsZXZhbnQgdG8gbWUpCj4gPiBy
ZXNldF9jb250cm9sX3N0YW5kYnkoKQo+ID4gcmVzZXRfY29udHJvbF91bnNlYWwoKQo+ID4gcmVz
ZXRfY29udHJvbF91bnRpZSgpCj4gPiByZXNldF9jb250cm9sX2xvb3NlbigpL2xvb3NlKCkKPiA+
IHJlc2V0X2NvbnRyb2xfdW5mZXR0ZXIoKQo+ID4KPiA+IFdoYXQgZG8geW91IHRoaW5rPwo+Cj4g
bXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSByZXNldF9jb250cm9sX3B1dCgpCj4KPiA+Cj4gPiBSZWdh
cmRzLAo+ID4gQW1qYWQKPgoKCi0tCkFtamFkIE91bGVkLUFtZXVyCkVtYmVkZGVkIExpbnV4IEVu
Z2luZWVyIC0gVmlsbGVuZXV2ZSBMb3ViZXQsIEZSCkVuZ2l0QEJheUxpYnJlIC0gQXQgdGhlIEhl
YXJ0IG9mIEVtYmVkZGVkIExpbnV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
