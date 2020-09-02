Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C356C433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 14:14:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE8A2078E
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 14:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p26HjlTX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OeP7jDrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE8A2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ka7vTR9cNN6AmZlIxQ6i6NFWac/Zybs+xG5T1Juu4mM=; b=p26HjlTXW4+qDw8GYu/eRFaTz
	Qz5R7uJCQz51lQ9ntRwOspseU5FAxNx+mMlqdMJv1YmMQXeB3+OZ9nnRxK6vNOY46RgYywaLUTgI6
	p82os2xuPHrz4zSfpizmaab7RMsKRPgPaHUmBBlo//fRo7RjvaDHcHFbCXIML4kZb86xb/nEAE0cQ
	6UwszOlvioc7mnih+TT5/98ZZ98YeOblt6CcVblUutqKmF/oLw+2bnSIYvsDqRqCpu3Tw6k+HZIE3
	4AUHYruuJ0VhjrLWVpbeOBkgGm/16KOsWFPP9TAIP9F9iCxuRA/zDD2m6UfgWMToePEGb/88ti9vM
	Z9mn7vSjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDTWe-0006G7-KN; Wed, 02 Sep 2020 14:14:12 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDTWb-0006FF-Gz
 for linux-amlogic@lists.infradead.org; Wed, 02 Sep 2020 14:14:10 +0000
Received: by mail-vs1-xe43.google.com with SMTP id j188so2620179vsd.2
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Sep 2020 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mf1/z4+27SMojkdEL30sqjZxKrc9OfislJ7bsFeI77o=;
 b=OeP7jDrF/mHV3l0SsimH57hpISqWllwgm2PKDBkVn2MklTzoihTMDJus1590xOMbqJ
 e/NyHYbEXv7GRVXMGm5RVd9Tha4q3pgF/mxRxUwDD+5+FYrbawSMAdls3qYEvJkgM1dp
 R38tE0CQwczRVcGD2oj7EVM4l7riphW7+iTpBj3zhcrx+fLPmPKoCgC0W2CEUscWF+fa
 0bW9Qlglh7co1HKsHEb9b8fDpKg9+lGUOcvWhoi2KfwshjKU5u8hCvCKp/ciGpfpm+Re
 nXyKpgzXsmTSr0WMaMThsdtg5vkNDNsR4aTyUM90WDEax9NG0MWM5/3GkOxXzCGUkkSy
 CfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mf1/z4+27SMojkdEL30sqjZxKrc9OfislJ7bsFeI77o=;
 b=jMZC91vwDi/K93d2RPSwqMLCPM/RJcz3/+/VYtB9akY7OhrTkAIVggPhnHlHOYYv4l
 zcuj4ZJV/VMYztwEpcTAasn4mt2VcisWUNuo7SYyouA8083/mqddV1Fy0v5yprz1sObZ
 IeDe/EoIx2+LJeqZCPTj+HV5NCWrgPr04WYpcNCrYMtUWXChCMC2BBW6Nw5btqRDOUxr
 4FvprxuQAQT3Q2KV0AClsxpl95vE9gKD+AlusI42EZW59zWt+BsQSpw61ghZrxX5fN/i
 eMf4mW4d+KMSSTow7yQ+AmhBr5Jn8aHc1C9XVeevuWhafWPQvYvw1FCCamRgJTB5PiNW
 e+fQ==
X-Gm-Message-State: AOAM532CzJqbKJB6mvYXHDEVnrpu8wC648DCGy0/6aS2El8B/P/2XnsP
 rXB8O48PTWx4r5ctwQb9dNn/6q/W/r++hmdPtFAg18+SqQheRg==
X-Google-Smtp-Source: ABdhPJwKPOcO1u+OBmHz0DOUyoQs8omJHgxLA94Bl2FgF0+6+xhKe6JFPNDlsRk7vx4cqS7LPRiUKIMG3cuAIlkL6lc=
X-Received: by 2002:a67:8ec7:: with SMTP id q190mr5511968vsd.75.1599056045758; 
 Wed, 02 Sep 2020 07:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
In-Reply-To: <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 2 Sep 2020 16:13:54 +0200
Message-ID: <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To: Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_101409_587088_A3258B85 
X-CRM114-Status: GOOD (  26.50  )
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
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgc2FtLiAyOSBhb8O7dCAyMDIwIMOgIDE3OjI1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBQaGlsaXBw
LAo+Cj4gT24gVHVlLCBBdWcgMjUsIDIwMjAgYXQgMTI6MjAgUE0gUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gWy4uLl0KPiA+ID4gcmVzZXRfY29udHJvbF9j
bGVhcigpCj4gPiA+IHdvdWxkIGJlIHRoZSB3YXkgdG8gc3RhdGUgdGhhdCB0aGUgcmVzc291cmNl
IGlzIG5vIGxvbmdlciB1c2VkIGFuZCwgdGhhdAo+ID4gPiBmcm9tIHRoZSBjYWxsZXIgcGVyc3Bl
Y3RpdmUsIHRoZSByZXNldCBjYW4gZmlyZWQgYWdhaW4gaWYgbmVjZXNzYXJ5Lgo+ID4gPgo+ID4g
PiBJZiB3ZSB0YWtlIHRoZSBwcm9iZSAvIHN1c3BlbmQgLyByZXN1bWUgZXhhbXBsZToKPiA+ID4g
KiAxc3QgZGV2aWNlIHVzaW5nIHRoZSBzaGFyZWQgd2lsbCBhY3R1YWxseSB0cmlnZ2VyIGl0IChh
cyBpdCBpcyBub3cpCj4gPiA+ICogZm9sbG93aW5nIGRldmljZSBqdXN0IGluY3JlYXNlIHRyaWdn
ZXJlZF9jb3VudAo+ID4gPgo+ID4gPiBJZiBhbGwgZGV2aWNlcyBnbyB0byBzdXNwZW5kIChjYWxs
aW5nIHJlc2V0X2NvbnRyb2xfY2xlYXIoKSkgdGhlbgo+ID4gPiB0cmlnZ2VyZWRfY291bnQgd2ls
bCByZWFjaCB6ZXJvLCBhbGxvd2luZyB0aGUgZmlyc3QgZGV2aWNlIHJlc3VtaW5nIHRvCj4gPiA+
IHRyaWdnZXIgdGhlIHJlc2V0IGFnYWluIC4uLiB0aGlzIGlzIGltcG9ydGFudCBzaW5jZSBpdCBt
aWdodCBub3QgYmUgdGhlCj4gPiA+IG9uZSB3aGljaCB3b3VsZCBoYXZlIGdvdCB0aGUgZXhjbHVz
aXZlIGNvbnRyb2wKPiA+ID4KPiA+ID4gSWYgYW55IGRldmljZSBkb24ndCBnbyB0byBzdXNwZW5k
LCBtZWFuaW5nIHRoZSByZXNzb3VyY2UgdW5kZXIgcmVzZXQKPiA+ID4ga2VlcCBvbiBiZWluZyB1
c2VkLCBubyByZXNldCB3aWxsIHBlcmZvcm1lZC4gV2l0aCBleGx1c2l2ZSBjb250cm9sLAo+ID4g
PiB0aGVyZSBpcyBhIHJpc2sgdGhhdCB0aGUgcmVzdW1pbmcgZGV2aWNlIHJlc2V0cyBzb21ldGhp
bmcgYWxyZWFkeSBpbiB1c2UuCj4gPiA+Cj4gPiA+IFJlZ2FyZGluZyB0aGUgY29uZGl0aW9uLCBv
biBzaGFyZWQgcmVzZXRzLCBjYWxsIHJlc2V0X2NvbnRyb2xfcmVzZXQoKQo+ID4gPiBzaG91bGQg
YmUgYmFsYW5jZWQgcmVzZXRfY29udHJvbF9jbGVhcigpIC0gbm8gY2xlYXIgYmVmb3JlIHJlc2V0
Lgo+ID4KPiA+IE1hcnRpbiwgaXMgdGhpcyBzb21ldGhpbmcgdGhhdCB3b3VsZCBiZSB1c2VmdWwg
Zm9yIHRoZSBjdXJyZW50IHVzZXJzIG9mCj4gPiB0aGUgc2hhcmVkIHJlc2V0IHRyaWdnZXIgZnVu
Y3Rpb25hbGl0eSAocGh5LW1lc29uLWd4bC11c2IyIGFuZCBwaHktCj4gPiBtZXNvbjhiLXVzYjIg
d2l0aCByZXNldC1tZXNvbik/Cj4gZm9yIHRoZSBzcGVjaWZpYyB1c2UtY2FzZSAoc3lzdGVtIHN1
c3BlbmQpIHRoaXMgd291bGQgY3VycmVudGx5IG5vdCBiZQo+IHVzZWZ1bCBmb3IgdGhlIHR3byBk
cml2ZXJzIHlvdSBoYXZlIG5hbWVkLiBUaGlzIGlzIGJlY2F1c2UgdGhlCj4gcGxhdGZvcm1zIG9u
IHdoaWNoIHRoZXkgYXJlIHVzZWQgY3VycmVudGx5IGRvbid0IHN1cHBvcnQgc3lzdGVtCj4gc3Vz
cGVuZC4KPiBpZiBvdGhlciBkcml2ZXJzIGFyZSBnb2luZyB0byBiZW5lZml0IGZyb20gdGhpcyBj
aGFuZ2UgdGhlbiBwbGVhc2UgZ28KPiBhaGVhZCBhbmQgYWRkIHRoZSBuZWNlc3NhcnkgQVBJLiBU
aGVuIEkgY2FuIGFsc28gdXNlIGl0IGluIHRoZXNlCj4gZHJpdmVycy4gaG93ZXZlciwgKGFzIGZh
ciBhcyBJIHVuZGVyc3RhbmQpIEkgd29uJ3QgYmUgYWJsZSB0byB2ZXJpZnkKPiB0aGUgbmV3ICJm
aXhlZCIgYmVoYXZpb3IKPgo+Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgoKSGkgUGhpbGlwcCwK
ClJlZ2FyZGluZyB0aGUgbmFtaW5nIG9mIHRoZSBuZXcgY2FsbCwgc2luY2UgcmVzZXRfY29udHJv
bF9jbGVhcigpIGlzIG5vdApyZWFsbHkgcmVwcmVzZW50YXRpdmUgb2YgdGhlIGludGVuZGVkIGJl
aGF2aW91ciwgSSBoYXZlIHRob3VnaHQgb2Ygc29tZQpvdGhlciBtZXRhcGhvcnMgc3VjaCBhczoK
CnJlc2V0X2NvbnRyb2xfcmVzZXR0YWJsZSgpICAgIChzb3VuZHMgdGhlIG1vc3QgcmVsZXZhbnQg
dG8gbWUpCnJlc2V0X2NvbnRyb2xfc3RhbmRieSgpCnJlc2V0X2NvbnRyb2xfdW5zZWFsKCkKcmVz
ZXRfY29udHJvbF91bnRpZSgpCnJlc2V0X2NvbnRyb2xfbG9vc2VuKCkvbG9vc2UoKQpyZXNldF9j
b250cm9sX3VuZmV0dGVyKCkKCldoYXQgZG8geW91IHRoaW5rPwoKUmVnYXJkcywKQW1qYWQKCgot
LSAKQW1qYWQgT3VsZWQtQW1ldXIKRW1iZWRkZWQgTGludXggRW5naW5lZXIgLSBWaWxsZW5ldXZl
IExvdWJldCwgRlIKRW5naXRAQmF5TGlicmUgLSBBdCB0aGUgSGVhcnQgb2YgRW1iZWRkZWQgTGlu
dXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
