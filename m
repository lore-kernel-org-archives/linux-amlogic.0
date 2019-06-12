Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BDFC31E44
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 01:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0068F205ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 01:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pzufYsva";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ndufresne-ca.20150623.gappssmtp.com header.i=@ndufresne-ca.20150623.gappssmtp.com header.b="h5JueMEL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0068F205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBwkPjWVUeE/yqnuV5WPbvW6Ib4nPIsRDtDOYPv3/0g=; b=pzufYsva+5CQDy
	tu1zf+dAhVJkZYQcgNJoowtUrN5uKfu2Un+3fu6N5X0OT9wAwqt9pe/7Sqh8HEBCBq8UZpKGQwkO8
	TMejRQ6Qw+4vsu9OvtwNVJv8/HCKeH8aGKabO3tzOWi9N/KiUIFfb+zgdx2hMx+4OLeC7vL9CXAyD
	KqMq4OGaiKRIP/imYSDY2zvmV3b4XwrxdRYagvPR2whrdnkyypMhwiFhYn5BjJDYZAIn+EAaZ62yg
	ME4JfORZ6LfRBVEzG8/AtvSOULIgy6yV/LlNkbnWFeDKjmJ1UU6NF+PacG64gubld0K/sjE4ghHYB
	r2VonqbNG4bnGVKiFYbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1harcs-0005u4-A3; Wed, 12 Jun 2019 01:00:30 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1harcf-0005hr-Mk
 for linux-amlogic@lists.infradead.org; Wed, 12 Jun 2019 01:00:20 +0000
Received: by mail-qt1-x841.google.com with SMTP id m29so16926482qtu.1
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=kGCYosRguXq4elehaPFOveEwgPcblLIUUh1tydiqlv0=;
 b=h5JueMEL7krh+Lb8jEoJH4vzMieW9Ynm0WMNBzCOFjIznSTZa7pc332ziUaX7BXKJ3
 pXHzyqkatzuzJneWeW7w9rbl7kg/VRwj+ApC7uDfSQVDTMekZStH2lvgviPm+9ZBTMEq
 GdXEzbiYevwqVMZ8KpQZLdc7zGrbM8OLA7wKKtZFEwnDI0sEaF9/U9YRVe0P9ViIjz0l
 DWoeIeyBgstsX0aObxmXHDz8HDCvqyLf3IefResEwj6NIad/+82M3bmTIiT/CdFAYgHA
 mMy1WBGFRyGkbArSW8o2UvGVTGq84vm/oxhq2k7cCB21LRqAbT9pxMDOVEVxkVq6UuvM
 uUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=kGCYosRguXq4elehaPFOveEwgPcblLIUUh1tydiqlv0=;
 b=lj7Ozzv/pXtfaJx48F69BrGpaoLB3/uuBizRyvtC0t3YNhcKdaBEny6BwVX1okc6bj
 RrmFNqcg00RajCNvIcwwqOBVJyWuozBn8Y6SxfIR0cmStQzwY01wBNxYPVuMMlV9YBD1
 drdBveMg2idBZXeSAsY/slM/okDTpaihMZq3rcghhfU7NHjp+fuG8CCWmatr5udVwOBK
 lXdQ4loregtu4KzobstaNd0Htya9XaYOfji5cVxmj83033LWp4FRi/d9Z/NMyK+eDBfL
 l+VPI7ncU2wZtphA/L4lZad5Kr+9UP/uMxUpTld3lQ1yLgzqhZcaUpB1WgSg0PrvrKT0
 wHvg==
X-Gm-Message-State: APjAAAXralsaR1/4bb44YnwuoGAVE1Tt7drycElcLgTMTWWwQ6K1+Bmf
 rvb3KCyAgG/pUDcTPJ50UUHDaQ==
X-Google-Smtp-Source: APXvYqxZuRR2hJ2pElF2t/9lGshSakTd6RGMsXt59FPQH7rSPXBg4udJBQ0orZJzB6AngdKEjeJO+w==
X-Received: by 2002:ac8:2af8:: with SMTP id c53mr22206710qta.387.1560301214655; 
 Tue, 11 Jun 2019 18:00:14 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id d188sm7473200qkf.40.2019.06.11.18.00.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 18:00:14 -0700 (PDT)
Message-ID: <09e608da8abeb4cd9c84bf9f559af2438540eb2b.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Maxime Jourdan <mjourdan@baylibre.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
Date: Tue, 11 Jun 2019 21:00:12 -0400
In-Reply-To: <1d2adae2b6d0f370f17b9bac94ae4e9207dccbad.camel@ndufresne.ca>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
 <20190531093126.26956-3-mjourdan@baylibre.com>
 <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
 <1560243127.13886.3.camel@pengutronix.de>
 <1d2adae2b6d0f370f17b9bac94ae4e9207dccbad.camel@ndufresne.ca>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_180017_739296_C5B9BA74 
X-CRM114-Status: GOOD (  21.50  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgbWFyZGkgMTEganVpbiAyMDE5IMOgIDIwOjU4IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIGEg
w6ljcml0IDoKPiBMZSBtYXJkaSAxMSBqdWluIDIwMTkgw6AgMTA6NTIgKzAyMDAsIFBoaWxpcHAg
WmFiZWwgYSDDqWNyaXQgOgo+ID4gT24gV2VkLCAyMDE5LTA2LTA1IGF0IDE1OjM5ICswMjAwLCBI
YW5zIFZlcmt1aWwgd3JvdGU6Cj4gPiA+IEhpIE1heGltZSwKPiA+ID4gCj4gPiA+IEkgYW0gd29u
ZGVyaW5nIGlmIHRoaXMgZmxhZyBzaG91bGRuJ3QgYmUgaW52ZXJ0ZWQ6IHlvdSBzZXQKPiA+ID4g
VjRMMl9GTVRfRkxBR19EWU5fUkVTT0xVVElPTiBpZiBkeW5hbWljIHJlc29sdXRpb24gaXMgc3Vw
cG9ydGVkLAo+ID4gPiBvdGhlcndpc2UgaXQgaXNuJ3QuCj4gPiA+IAo+ID4gPiBDYW4gYWxsIHRo
ZSBleGlzdGluZyBtYWlubGluZWQgY29kZWMgZHJpdmVycyBoYW5kbGUgbWlkc3RyZWFtCj4gPiA+
IHJlc29sdXRpb24gY2hhbmdlcz8KPiA+ID4gCj4gPiA+IHM1cC1tZmMsIHZlbnVzIGFuZCBtZWRp
YXRlayBjYW4sIGJ1dCBJIHNlZSBubyBTT1VSQ0VfQ0hBTkdFIGV2ZW50IGluCj4gPiA+IHRoZSBj
b2RhIGRyaXZlcnMsIHNvIEkgc3VzcGVjdCB0aGF0IHRoYXQgY2FuJ3QgaGFuZGxlIHRoaXMuCj4g
PiA+IAo+ID4gPiBQaGlsaXBwLCB3aGF0IGlzIHRoZSBzdGF0dXMgb2YgdGhlIGNvZGEgZHJpdmVy
IGZvciBkeW5hbWljIHJlc29sdXRpb24KPiA+ID4gY2hhbmdlcz8KPiA+IAo+ID4gRlRSLCB0byBt
eSBrbm93bGVkZ2UgdGhlcmUgaXMgbm8gZHluYW1pYyByZXNvbHV0aW9uIGNoYW5nZSBzdXBwb3J0
IGluCj4gPiB0aGUgZmlybXdhcmUsIGFzIHRoZXJlIGlzIG5vIHNpZ25hbCAoaW50ZXJydXB0IG5v
ciBwaWN0dXJlIHJ1biByZXR1cm4KPiA+IHZhbHVlKSB0byBpbmRpY2F0ZSB0aGF0IGRpZmZlcmVu
dCBoZWFkZXJzIHdlcmUgcGFyc2VkLgo+ID4gCj4gPiBJIGFtIHBsYW5uaW5nIHRvIGFkZCB0aGUg
aW5pdGlhbCBzb3VyY2UgY2hhbmdlIGV2ZW50IHJlcXVpcmVkIGJ5IHRoZQo+ID4gY3VycmVudCBk
ZWNvZGVyIEFQSSBkb2N1bWVudGF0aW9uLCBidXQgSSBhbSBhZnJhaWQgdGhlcmUgd2lsbCBiZSBu
bwo+ID4gc3VwcG9ydCBmb3Igc291cmNlIGNoYW5nZXMgZHVlIHRvIG1pZC1zdHJlYW0gcmVzb2x1
dGlvbiBjaGFuZ2VzIGR1ZSB0bwo+ID4gZmlybXdhcmUgbGltaXRhdGlvbnMuCj4gCj4gSSdtIGZh
ciBmcm9tIGZhbWlsaWFyIHdpdGggdGhpcyBJUCwgYnV0IGF0IGxlYXN0IG9uIENPREE5ODgsIEkg
Y2FuIHJlYWQKPiBmcm9tIHRoZSBtYW51YWwgdGhhdCB0aGUgd29ya2Zsb3cgaXMgdG8gZmlyc3Qg
Z3Vlc3MgdGhlIGFsbG9jYXRpb24sIGFuZAo+IGlmIHlvdSBndWVzcyBpdCB3cm9uZywgYW4gZXJy
b3IgaXMgcmV0dXJuZWQuIFdoYXQgc2VlbXMgdG8gbWF0Y2ggdGhlCj4gU09VUkNFX0NIQU5HRSBl
dmVudCBpbiB0aGF0IHZlcnNpb24gd291bGQgYmUgaW4gdGhlIHBpY3R1cmUgc3RhdHVzCj4gcmVn
aXN0ZXIsIHRoZSBiaXQgMjAsIHdoaWNoIGlzIGRvY3VtZW50ZWQgYXMgdHJpZ2dlcmVkIGlmIHRo
ZSBzdHJlYW0KPiByZXF1aXJlcyBiaWdnZXIgYnVmZmVycyBzaXplcywgb3IgbW9yZSBidWZmZXJz
LiBBZnRlciBmaXhpbmcgdGhhdCwgeW91Cj4gc2hvdWxkLCBpZiBJIHJlYWQgY29ycmVjdGx5LCBy
ZXRyeS4KPiAKPiBJdCBkb2VzIG5vdCBub3RpZnkgaWYgdGhlIGJ1ZmZlcnMgYXJlIHRvbyBsYXJn
ZSwgYnV0IHlvdSBjYW4gZGV0ZWN0LAo+IHNpbmNlIHRoZXJlIGlzIHJlZ2lzdGVyIHdpdGggdGhl
IG91dHB1dCBzdHJlYW0gaW5mb3JtYXRpb24uIFRoaXMKPiBiYXNpY2FsbHkgbWVhbnMgdGhhdCBm
b3IgVjRMMiByZXN0cmljdGlvbiwgeW91J2QgaGF2ZSB0byBib3VuY2UgdGhlCj4gYnVmZmVycyBv
biBmcmFtZSBzaXplIGJvdW5kYXJ5IG9yIHNvbWV0aGluZyBsaWtlIHRoaXPDqQo+IAo+IFRoaXMg
d29ya2Zsb3cgaXMgdmVyeSBzaW1pbGFyIHRvIGhvdyBPTVggd29ya3MsIGJ1dCBWNEwyIGlzIGV2
ZW4gbGVzcwo+IGZsZXhpYmxlIG9uIGFsbG9jYXRpb24gdnMgZm9ybWF0LCBmb3JjaW5nIG1vcmUg
cmUtYWxsb2NhdGlvbi4KCk9oLCBhY3R1YWxseSwgeW91IGFscmVhZHkgYm91bmNlIHRoZSBidWZm
ZXJzIHRocm91Z2ggdGhlIGNvbG9yCmNvbnZlcnRlciwgc28gSSBndWVzcyB0aGlzIGNhbiBhbGwg
YmUgaGlkZGVuIGludGVybmFsbHkuCgo+IAo+ID4gcmVnYXJkcwo+ID4gUGhpbGlwcAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
