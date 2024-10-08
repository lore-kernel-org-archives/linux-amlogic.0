Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8731CED26B
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 06:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0zeY4NKAFarbMmBZaRW5mL47fElj2E2brBVHcMcpWM=; b=I+mvKSJ6X3RUgd
	10w+443y5Foj8GWXKbiWWYSWomJDcqyodxaCYSFnxVQsbZGdoWzuEtf8aBnkTsGNA+CGaE2uyYKym
	LnXCl6NwxMethpzrIzm0dhkWwsicHusCFGtbz4169nogMW8wGQ/nt2VZfgOw7IlhKlbIEwHhhwUUw
	5rxDSgLRm6/8bxutLhXwmh7n+elimvfgo3ZfIlaY2Nc+WIx5dLvXBo01nupDmYG9q1cROBKet9l+y
	xRUpdLGtd6sJ81dh1FtelF9jh9MdGK7QiIW/goy6v81lrL2Cz0f2eCiBxklGZyvZe39PSlPF/k/bR
	2aNRsbYwP4tX4J3YeGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3If-00000004bjX-2Zz2;
	Tue, 08 Oct 2024 06:02:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3Ib-00000004bib-2yWN
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 06:02:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37cce5b140bso3587629f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 23:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728367340; x=1728972140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFnX9PjNcVwbuqSXpJJLYjtAhapfOLBOMv5cyvvkYNA=;
        b=mtqYGWsxxRBUhSNNZ9Ve++ODwYkxJ1v6GXKEtMMfC2KrQnb0ZjUn37U53lji9DdhAa
         iI4p8JFO0e7DUpU8b7Ag6ULxYtzJc3Dr3mXNhMPdwJrWscKw5B8UQaDMvgg3jIcb0vnL
         /M/8PbLr955tc+74IHJNhyrcH40jloeDAU3SvGRtSidjbvtN/iKp7jV7jN90pXsnlgAD
         OHKIRJ7e+DFrNJEVq+bxHhec+3r1l6j0FcRUpZfLLU0Xt+AvyFv0pOCERKxt2oaKbxRo
         9pDwDmSsTOP04rOaqhb6qvox+kM8olLaJF0mB4q7+IDqXnWCOMhNTN3gnrYk0Uo0opxZ
         MSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728367340; x=1728972140;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFnX9PjNcVwbuqSXpJJLYjtAhapfOLBOMv5cyvvkYNA=;
        b=wUfhnpvWLXYclDGuc7DZHYXaMiEWT2ddQHctOrcxCdia6W4xlwIkZoILRVymkHOaDs
         1RTC+Yi6cXSJs0M3erjVkdDm9JQ6SaaFMk8ohtRZW24n5IAbye41C08wTmeu0AWO7p/7
         VA0rtrd6+JCMXW39az+kr1f1BsJLOr9VKY+0o+hL29Xnge1sHgwYI4NsphB8C1YmGIIN
         kAHvwXfgh/n+UrAi79KgrysJ3ANe7AX3gyDuXKvTldnNw7BvFufbyBDUmhq9ydBxTctj
         ECBWTikE1oTzsh8y42ZRAKE66ZxfcjosfTUY7LXjfSFFc7Jrj8214F0F9DELSyn/H2tu
         kQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2CBEwCng2Cwnnct4jZda4ReTTYXikbyxhldDSrqi/dYxGyBpVscgNUFH+lIDgCoC6zK2Fa9CxrT104aVb@lists.infradead.org
X-Gm-Message-State: AOJu0YwshVaFGQe95qgUDNzWaLU2ff5tNDQ8NYIHDgWaomPspig8UwLs
	x1ZGI/VV3v7SzH+rMhN0dbS3YI5cbYSOatK8Y20IDVn2VNm9DshdtNpL9ph1uPU=
X-Google-Smtp-Source: AGHT+IHe+A9wTyATKAfiRoVRSil4JXvoDYrf57UaYrGEMYze/HZIN0MycxHFtINVSh9VQvZZ8GlaIA==
X-Received: by 2002:a5d:598f:0:b0:37c:cdcd:68ac with SMTP id ffacd0b85a97d-37d0e8f74e6mr10479650f8f.52.1728367339614;
        Mon, 07 Oct 2024 23:02:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:41f2:4244:ce34:c273])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1697024fsm7195797f8f.95.2024.10.07.23.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 23:02:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com> (Chuan Liu's
	message of "Tue, 8 Oct 2024 13:44:54 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
Date: Tue, 08 Oct 2024 08:02:18 +0200
Message-ID: <1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_230222_046235_46BA30A1 
X-CRM114-Status: GOOD (  31.71  )
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

T24gVHVlIDA4IE9jdCAyMDI0IGF0IDEzOjQ0LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IEhpIE1hcnRpbiwKPgo+Cj4gT24gMjAyNC8xMC8xIDQ6MDgsIE1hcnRp
biBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBIZWxsbywK
Pj4KPj4gT24gU3VuLCBTZXAgMjksIDIwMjQgYXQgODoxMOKAr0FNIENodWFuIExpdSB2aWEgQjQg
UmVsYXkKPj4gPGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pj4gRnJvbTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+Pgo+Pj4gZ2xp
dGNoIGZyZWUgbXV4IGhhcyB0d28gY2xvY2sgY2hhbm5lbHMgKGNoYW5uZWwgMCBhbmQgY2hhbm5l
bCAxKSB3aXRoCj4+PiB0aGUgc2FtZSBjb25maWd1cmF0aW9uLiBXaGVuIHRoZSBmcmVxdWVuY3kg
bmVlZHMgdG8gYmUgY2hhbmdlZCwgdGhlIHR3bwo+Pj4gY2hhbm5lbHMgcGluZy1wb25nIHRvIGVu
c3VyZSBjbG9jayBjb250aW51aXR5IGFuZCBzdXBwcmVzcyBnbGl0Y2guCj4+IFlvdSBkZXNjcmli
ZSB0aGUgc29sdXRpb24gdG8gdGhpcyBiZWxvdzoKPj4+IEFkZCBmbGFnIENMS19TRVRfUkFURV9H
QVRFIHRvIGNoYW5uZWxzIDAgYW5kIDEgdG8gaW1wbGVtZW50IFBpbmctUG9uZwo+Pj4gc3dpdGNo
b3ZlciB0byBzdXBwcmVzcyBnbGl0Y2guCj4+IEl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgdGhp
cyBjaGFuZ2UgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KPj4gVGhlIGNsb2NrcyB0byB3aGljaCB5b3Un
cmUgYWRkaW5nIENMS19TRVRfUkFURV9HQVRFIGFyZW4ndCBzd2l0Y2hlZCBhdAo+PiBydW50aW1l
IGluIG1haW5saW5lIGtlcm5lbHMgKGF0IGxlYXN0IEkgdGhpbmsgc28pLgo+Cj4KPiBPa2F5LCBJ
IHdpbGwgc2VwYXJhdGUgaXQgaW50byB0d28gcGF0Y2hlcyBhbmQgc3VibWl0IGl0IGluIHRoZSBu
ZXh0IHZlcnNpb24uCj4KPgo+Pgo+Pj4gQ2hhbm5lbCAwIG9mIGdsaXRjaCBmcmVlIG11eCBpcyBu
b3Qgb25seSB0aGUgY2xvY2sgc291cmNlIGZvciB0aGUgbXV4LAo+Pj4gYnV0IGFsc28gdGhlIHdv
cmtpbmcgY2xvY2sgZm9yIGdsaXRjaCBmcmVlIG11eC4gVGhlcmVmb3JlLCB3aGVuIGdsaXRjaAo+
Pj4gZnJlZSBtdXggc3dpdGNoZXMsIGl0IGlzIG5lY2Vzc2FyeSB0byBlbnN1cmUgdGhhdCBjaGFu
bmVsIDAgaGFzIGEgY2xvY2sKPj4+IGlucHV0LCBvdGhlcndpc2UgZ2xpdGNoIGZyZWUgbXV4IHdp
bGwgbm90IHdvcmsgYW5kIGNhbm5vdCBzd2l0Y2ggdG8gdGhlCj4+PiB0YXJnZXQgY2hhbm5lbC4K
Pj4gWy4uLl0KPj4+IGdsaXRjaCBmcmVlIG11eCBBZGQgZmxhZyBDTEtfT1BTX1BBUkVOVF9FTkFC
TEUgdG8gZW5zdXJlIHRoYXQgY2hhbm5lbCAwCj4+PiBoYXMgY2xvY2sgaW5wdXQgd2hlbiBzd2l0
Y2hpbmcgY2hhbm5lbHMuCj4+IFRoaXMgZGVzY3JpYmVzIGEgc2Vjb25kIHByb2JsZW0uIEkgdGhp
bmsgaXQncyBiZXN0IHRvIGhhdmUgdGhpcyBpbiBhCj4+IHNlcGFyYXRlIGNvbW1pdC9wYXRjaC4K
Pj4gQWxzbyB5b3UncmUgdXBkYXRpbmcgc29tZSBtYWxpIGNsb2NrcyAoZS5nLiBvbiBHMTIgYW5k
IEdYKSBidXQgbm90IGFsbAo+PiBvZiB0aGVtIChNZXNvbjhiIGZvciBleGFtcGxlIGlzIG1pc3Np
bmcpLgo+Cj4KPiBZZXMsIE04IG1pc3NlZCBpdCwgSSB3aWxsIGNvbXBsZXRlIGl0IGluIHRoZSBu
ZXh0IHZlcnNpb24uCj4KPgo+Pgo+PiBJIHN0aWxsIGhhdmUgc29tZSBxdWVzdGlvbnMgdG8gdGhl
IENMS19PUFNfUEFSRU5UX0VOQUJMRSBhcHByb2FjaCAtCj4+IHBsZWFzZSBzaGFyZSB5b3VyIGZp
bmRpbmdzIG9uIHRoaXMuCj4+Cj4+IFRoZXJlJ3MgbXVsdGlwbGUgY2xvY2tzIGludm9sdmVkIGlu
IGEgZ2xpdGNoLWZyZWUgbXV4IGhpZXJhcmNoeToKPj4gLSBhIG51bWJlciBvZiBjbG9jayBpbnB1
dHMgKGUuZy4gZmNsaywgeHRhbCwgLi4uKQo+PiAtIHR3byBtdXhlcyAob25lIGZvciBldmVyeSBj
aGFubmVsIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXgpCj4+IC0gdHdvIGRpdmlkZXJzIChvbmUgZm9y
IGV2ZXJ5IGNoYW5uZWwgb2YgdGhlIGdsaXRjaC1mcmVlIG11eCkKPj4gLSB0d28gZ2F0ZXMgKG9u
ZSBmb3IgZXZlcnkgY2hhbm5lbCBvZiB0aGUgZ2xpdGNoLWZyZWUgbXV4KQo+PiAtIHRoZSBnbGl0
Y2gtZnJlZSBtdXgKPj4KPj4gV2hlbiBzd2l0Y2hpbmcgZnJvbSBjaGFubmVsIDAgKHdoaWNoIGlz
IGFjdGl2ZSBhbmQgZW5hYmxlZCkgQ0NGCj4+IChjb21tb24gY2xvY2sgZnJhbWV3b3JrKSB3aWxs
Ogo+PiBhKSBvbiBjaGFubmVsIDE6Cj4+IC0gZmluZCB0aGUgYmVzdCBpbnB1dCBjbG9jawo+PiAt
IGNob29zZSB0aGUgYmVzdCBpbnB1dCBjbG9jayBpbiB0aGUgbXV4Cj4+IC0gc2V0IHRoZSBkaXZp
ZGVyCj4+IC0gZW5hYmxlIHRoZSBnYXRlCj4+IGIpIHN3aXRjaCB0aGUgZ2xpdGNoLWZyZWUgbXV4
Cj4+IGMpIG9uIGNoYW5uZWwgMjoKPj4gLSBkaXNhYmxlIHRoZSBnYXRlCj4+Cj4+IFRvIG1lIGl0
J3Mgbm90IGNsZWFyIGF0IHdoaWNoIGxldmVsIHRoZSBwcm9ibGVtIG9jY3VycyAoZ2xpdGNoLWZy
ZWUKPj4gbXV4LCBnYXRlLCBkaXZpZGVyLCBtdXgsIGlucHV0IGNsb2NrKS4KPj4gQWxzbyBJIGRv
bid0IHVuZGVyc3RhbmQgd2h5IGVuYWJsaW5nIHRoZSBjbG9ja3Mgd2l0aAo+PiBDTEtfT1BTX1BB
UkVOVF9FTkFCTEUgc29sdmVzIGFueSBwcm9ibGVtIHNpbmNlIENDRiBpcyBkb2luZyB0aGluZ3MK
Pj4gYXV0b21hdGljYWxseSBmb3IgdXMuCj4+IENhbiB5b3UgcGxlYXNlIGV4cGxhaW4gKHByZWZl
cmFibHkgd2l0aCBhbiBleGFtcGxlKSB3aGF0IHByb2JsZW0gaXMKPj4gc29sdmVkIHdpdGggdGhp
cyBhcHByb2FjaD8KPgo+Cj4gSWYgQ0xLX09QU19QQVJFTlRfRU5BQkxFIGlzIGNvbmZpZ3VyZWQg
aW4gbXV4LCAnbmV3X3BhcmVudCcgYW5kCj4gJ29sZF9wYXJlbnQnIHdpbGwgYmUgZW5hYmxlZCBm
aXJzdCB3aGVuIF9fY2xrX3NldF9wYXJlbnRfYmVmb3JlKCkgaXMKPiBjYWxsZWQuIEFuZCBkaXNh
YmxlIHRoZW0gYXQgX19jbGtfc2V0X3BhcmVudF9hZnRlcigpLiBPdXIgZ2xpdGNoIGZyZWUKPiBv
bmx5IGhhcyB0d28gY2xvY2sgc291cmNlcywgc28gYWRkaW5nIHRoaXMgZmxhZyBlbnN1cmVzIHRo
YXQgYm90aAo+IGNoYW5uZWxzIDAgYW5kIDEgYXJlIGVuYWJsZWQgd2hlbiBtdXggc3dpdGNoZXMu
Cj4KPiBJbiBmYWN0LCB3ZSBqdXN0IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgY2hhbm5lbCAwIGlz
IGVuYWJsZWQuIFRoZQo+IHB1cnBvc2Ugb2YgQ0xLX09QU19QQVJFTlRfRU5BQkxFIG1heSBub3Qg
YmUgdG8gc29sdmUgb3VyIHNpdHVhdGlvbiwKPiBidXQgYWRkaW5nIHRoaXMgZmxhZyBkb2VzIHNv
bHZlIG91ciBjdXJyZW50IHByb2JsZW0uCgpUaGlzIGlzIGxhc3QgcG9pbnQgaXMgaW1wb3J0YW50
LgoKSXQgaXMgT0sgdG8gdXNlIGEgc2lkZSBlZmZlY3Qgb2YgQ0xLX09QU19QQVJFTlRfRU5BQkxF
IGJ1dCBpdCBuZWVkcyB0bwpiZSBkb2N1bWVudGVkIHNvbWVob3csIHNvIHdoYXQgcmVhbGx5IG1h
dHRlcnMgaXMgc3RpbGwga25vd24gMnkgZnJvbSBub3cuCgpNYWtlIHN1cmUgdGhlIGluZm9ybWF0
aW9uIGFwcGVhcnMgaW4gdGhlIGNvZGUgY29tbWVudHMgYXQgbGVhc3Qgb25jZS4KCj4KPgo+Pgo+
PiBMYXN0IGJ1dCBub3QgbGVhc3Q6IGlmIHdlJ3JlIHJ1bm5pbmcgaW50byBidWdzIHdoZW4KPj4g
Q0xLX09QU19QQVJFTlRfRU5BQkxFIGlzIG1pc3NpbmcgdGhlbiB0aGF0IHBhdGNoIHNob3VsZCBj
YXJyeSBhIEZpeGVzCj4+IHRhZy4KPgo+Cj4gVGhhbmtzIGZvciB0aGUgaGVhZHMtdXAuIEknbGwg
a2VlcCBhbiBleWUgb24gaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPgo+Cj4+Cj4+IEJlc3QgcmVn
YXJkcywKPj4gTWFydGluCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
