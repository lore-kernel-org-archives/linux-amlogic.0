Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B5CC2B9F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 16:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717776141C
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 16:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717776141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3B5AclDn2K0KnJxTPhSJK/L/r6tJAIR1boIhP2GPSjA=; b=TS3rWvbPa4SzkL
	ysB6qe39o+N8oUNK0nXQmnRkfNHMTu7PtZQRmlBTOqVbhdVXC688EMGP44QvQkkzslVJOZt2xov+/
	cVwZARIcmA4xkUSjj/k4qpajmBToBnB8ChY/9xfcza3uHH1e07qhFJnfLVzC1ECpsoa7mW5xP6Kzr
	TzyETXw7Dr3TTtxceO1e1KkmJui8aOtSz6iWX5aljvzU/6iVEEGwh1f9pyyt6iNa+8JBRad+PKpF8
	Qi9tm7/PHQ2sxAgbBZA/+LEb4/rPxF+qFNAhrxsKhrhrGtPgEurOsWA0TEGzegEHnjUJJ99Xwo/eH
	qcKzexzpoPjeXEoeBrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llaK5-006cWg-Rh; Tue, 25 May 2021 16:54:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llZwr-006Re6-Rb
 for linux-amlogic@lists.infradead.org; Tue, 25 May 2021 16:30:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id o127so17098300wmo.4
 for <linux-amlogic@lists.infradead.org>; Tue, 25 May 2021 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9nwt4Wpg0hmZ7kHGH/PciQ0lTJpG5RlqOKYlvkngWns=;
 b=V68yr1iVeGoSNSNnL4Tn+Pmqt8s71eX0caRne/9WoExjiHXAoGj69icDo54SlgjsI8
 nbt67XcFHWApel03RicpB5v/RqxlNyR4Orl+qvrLwHIAw7PoZzYB1l0zoE8861TxONAM
 AC6iItHOSzFS3KCJt6J2PmnMrTI0RKHBY+PfcXWUKGxgrQvDjS6nGVDJ+FKSnoCiQcfc
 cUOnBg6+ekCKLDSw1Acc3SUjs0CtH6ZRWSj0jMncgSNq0ddyomy7H42cj0EMl5wvLkiX
 9SnHoD674p2cGMkN+DhxdK6f/VsGX2jlwbNjsoZ84lqgt/jyyLH65f1Fi11a3iKNkL0O
 ZPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9nwt4Wpg0hmZ7kHGH/PciQ0lTJpG5RlqOKYlvkngWns=;
 b=jU+TTqXywZJOcVpJzpQMCMRcTt/uECfGgJYGxzL5wQLMJi/QN5hPR+KJfZQiaPbAN3
 lXYcd8+OqKSqNw/imxOxp6psUmZiQXMBQgo/JM5O8Dfs2e0TZT8kBr82rgpu8dwB18Wx
 C4aDoTXmxeZrURgj2XWa8wkibiRTR4wkKBfzB/NdpOvmrUGiD1lDcsRUJWfDrCKwhh6F
 xXcox9l7SzI0ahA/pxyKVyeelsGOxmSZ+qGpNtBzOIAAAZT/DZz/Oda/KLc/342B2MvR
 BizeUW0E0DXvGGsTgVLTggkQE80dDfAkzPxuNjLCfoQtwm2am1vMzm0LJN8j5d6ALZpk
 QIwQ==
X-Gm-Message-State: AOAM531a3vtyYPuJMYh/OgKa8T18MQmyMB8m44y7cFk3sd9VGn9Bfrci
 4gfnMGiYiH8fx0Io09LuvZC9ig==
X-Google-Smtp-Source: ABdhPJzZ0krWACNsjmS0+Hh2AvTmE8Bxm17Apsd2RbWDZmmWCCvsFgApYmgEVO2+2WxZdzlYFJzrtQ==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr4686030wmq.65.1621960227081; 
 Tue, 25 May 2021 09:30:27 -0700 (PDT)
Received: from dell ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id e8sm16622464wrt.30.2021.05.25.09.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 09:30:26 -0700 (PDT)
Date: Tue, 25 May 2021 17:30:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
Message-ID: <20210525163024.GD4005783@dell>
References: <20201020072532.949137-1-narmstrong@baylibre.com>
 <20201020072532.949137-2-narmstrong@baylibre.com>
 <7hsga8kb8z.fsf@baylibre.com>
 <CAF2Aj3g6c8FEZb3e1by6sd8LpKLaeN5hsKrrQkZUvh8hosiW9A@mail.gmail.com>
 <87r1hwwier.wl-maz@kernel.org> <7hsg2au6sv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hsg2au6sv.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_093029_936230_9418BFE3 
X-CRM114-Status: GOOD (  19.41  )
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

T24gVHVlLCAyNSBNYXkgMjAyMSwgS2V2aW4gSGlsbWFuIHdyb3RlOgoKPiBNYXJjIFp5bmdpZXIg
PG1hekBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gCj4gPiBPbiBGcmksIDIxIE1heSAyMDIxIDEwOjQ3
OjQ4ICswMTAwLAo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4g
Pj4gCj4gPj4gWzEgIDx0ZXh0L3BsYWluOyBVVEYtOCAocXVvdGVkLXByaW50YWJsZSk+XQo+ID4+
IE9uIFR1ZSwgMjAgT2N0IDIwMjAgYXQgMTk6MjMsIEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+IHdyb3RlOgo+ID4+IAo+ID4+ID4gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPiB3cml0ZXM6Cj4gPj4gPgo+ID4+ID4gPiBJbiBvcmRlciB0byByZWR1Y2Ug
dGhlIGtlcm5lbCBJbWFnZSBzaXplIG9uIG11bHRpLXBsYXRmb3JtIGRpc3RyaWJ1dGlvbnMsCj4g
Pj4gPiA+IG1ha2UgaXQgcG9zc2libGUgdG8gYnVpbGQgdGhlIEFtbG9naWMgR1BJTyBJUlEgY29u
dHJvbGxlciBhcyBhIG1vZHVsZQo+ID4+ID4gPiBieSBzd2l0Y2hpbmcgaXQgdG8gYSBwbGF0Zm9y
bSBkcml2ZXIuCj4gPj4gPiA+Cj4gPj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25n
IDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiA+PiA+Cj4gPj4gPiBSZXZpZXdlZC1ieTogS2V2
aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPiA+PiA+IFRlc3RlZC1ieTogS2V2aW4g
SGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPiA+PiA+Cj4gPj4gPiBUZXN0ZWQgYXMgYSBt
b2R1bGUgb24gbWVzb24tc20xLWtoYWRhcy12aW0zbCB3aGVyZSB0aGUgd2lyZWQgbmV0d29ya2lu
Zwo+ID4+ID4gdXNlcyBHUElPIElSUXMuCj4gPj4gPgo+ID4+IAo+ID4+IEdvb2QgbW9ybmluZyBO
ZWlsLCBLZXZpbiwKPiA+PiAKPiA+PiBXaGF0IGhhcHBlbmVkIHRvIHRoaXMgc2V0IGluIHRoZSBl
bmQ/ICBJIHN0aWxsIGRvbid0IHNlZSBpdCBpbiBNYWlubGluZS4KPiA+Cj4gPiBMYXN0IHRpbWUg
SSB0cmllZCB0aGlzIHBhdGNoLCBpdCBicm9rZSBteSB0ZXN0IHNldHVwIGluIG5vbi1vYnZpb3Vz
Cj4gPiB3YXlzLiBIYXMgc29tZW9uZSBjaGVja2VkIHRoYXQgdGhlIGlzc3VlIEkgcmVwb3J0ZWQg
YmFjayB0aGVuIGhhcyBiZWVuCj4gPiByZXNvbHZlZCBub3cgdGhhdCBmd19kZXZsaW5rIGlzIG1v
cmUgdXNhYmxlPwo+IAo+IE5vdCB5ZXQsIHRoYXQncyAoc3RpbGwpIG9uIG15IFRPRE8gbGlzdC4u
LiAod2VsbCwgVEJILCBJIGZvcmdvdCBhYm91dAo+IGl0LCBidXQgSSdsbCBoYXZlIGFub3RoZXIg
bG9vay4pCgpTdXBlcnN0YXIhICBUaGFua3MgS2V2aW4uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
