Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F58C761AF
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlBtAnM2lEvKlWZ9Sd8RQszIfRKw9afO+kgUMnsrT34=; b=GsM+dWosGWqg8Q
	Xf7EONDWmLoJ69uu65v+DhHSZBaTAe8U9sESfvdpoYyxOO8dEQc3Qj1Uv9+Cdx42qJ3rD6LACe+GB
	SjDuZ5x8/V9EvD91Jw2z4rqX76T05QN4v6+hsYK2OfpTiLykZHmgmUczORlz7pfVSEEim7ZOv4lBl
	VtF7IYvLyGN5Igx1XCPJhs+upx75nefnAdk2njLL9u2xD+PCWwsAuMR5zePFrY1cGkz7YJ4+E9btT
	S42OM8iJiTsH/C+X+rfxXuozK/4zJjUqyrsbDbWVwp6zJhfzuVma2Fz8yJHOQjD6WKJWQog+14RyX
	pFaJMthArk3s5krTnmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk823-005Plx-1f;
	Wed, 05 Apr 2023 18:38:55 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk820-005Pk6-24
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Apr 2023 18:38:54 +0000
Received: by mail-yb1-xb32.google.com with SMTP id n125so43644417ybg.7
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Apr 2023 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680719925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJfLaFzbH/2Ju5QS0EeWlC1yCII1lYGihN/Kimg+OhA=;
        b=hT4MJxMMHD7UI66WcUbX94YmXqOiXNLLU+BBZzVqCx2GtG9UdFoRkDqgDAvhnBTSid
         d3HAUQeAnrHmkkDBnqfevdvMs8cizAZLU+y8smj5leVoHQEkUQvcNfktydu2AMptZUhW
         PKWLX8n3skj3/ZtstukRPitUe9yASVqBYqI3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680719925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJfLaFzbH/2Ju5QS0EeWlC1yCII1lYGihN/Kimg+OhA=;
        b=IZAUbyYTHjOJSVJkwr9gE9PKlf5T4So/QlmmxomCtXUxl5CxvyHJ9R3GyNcgYvbwA5
         lYIysRVYtilGlGNYtFJ9syIWa/l9k5A25PfwdsyOkP7cd84htuSPvUen9Sq1GSxf8xyW
         hUaYyVOYQP7tbUIEWIX1Dime7Zo7B6DpDmNkXb2To1C6SqPkTLgAPpPrE/YdtafVl1J+
         5der0GOUwUkhtmL6R+dcSQ9CXUm2Hf1h7XvXPEE3Q+rTHp+UPIqexn7Wr6iUilEJ2Nqq
         FheY+GAQ8SRHuZrbedqosC3lbx+34uP3oFfpZ4SJT3v2F1QhmiSNMdjqe44e+sKiedSS
         9w3w==
X-Gm-Message-State: AAQBX9fMjM3/2K3M3pToBBjh97VHCRGiLx/idcC8cdp5bxvBR1uHSCaW
	eW+tX+ZoZ3kbXhcFzXK23OFBC8evePCMDDrqNsvS6Q==
X-Google-Smtp-Source: AKy350YWovP8GKeUn7T/fH3bvIy0wzCROQRWWZVBMwc20E+A4nGtcEZLRpfQhTf4CNrYuii5Lodq8YrBnYT5CUetSAE=
X-Received: by 2002:a25:7689:0:b0:b75:9519:dbcd with SMTP id
 r131-20020a257689000000b00b759519dbcdmr151815ybc.12.1680719924663; Wed, 05
 Apr 2023 11:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230401185458.2280200-1-sjg@chromium.org> <87zg7rb8dd.fsf@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0Js43JOi3xaeY8tYuELSPXWL-PCBq1-iANLs1074MzbQ@mail.gmail.com> <1973D65D-692D-4AA7-B074-942D4E9ADB4B@gmail.com>
In-Reply-To: <1973D65D-692D-4AA7-B074-942D4E9ADB4B@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 6 Apr 2023 06:38:21 +1200
Message-ID: <CAPnjgZ14t6KR5sPzaq9HbLG1ocUHtbpLrwfBPMJZXQdaq2ALRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce
 the image
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mark Kettenis <mark.kettenis@xs4all.nl>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	u-boot-amlogic@groups.io, AML <linux-amlogic@lists.infradead.org>, 
	Alper Nebi Yasak <alpernebiyasak@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_113852_682555_7CF87181 
X-CRM114-Status: GOOD (  28.32  )
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

SGkgQ2hyaXN0aWFuLAoKT24gTW9uLCAzIEFwciAyMDIzIGF0IDIwOjEwLCBDaHJpc3RpYW4gSGV3
aXR0CjxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IE9uIDIgQXByIDIw
MjMsIGF0IDY6NDEgYW0sIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+
Cj4gPiBIaSBNYXJrLAo+ID4KPiA+IE9uIFN1biwgMiBBcHIgMjAyMyBhdCAwOToyOCwgTWFyayBL
ZXR0ZW5pcyA8bWFyay5rZXR0ZW5pc0B4czRhbGwubmw+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEZy
b206IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gPiA+IERhdGU6IFN1biwgIDIg
QXByIDIwMjMgMDY6NTQ6NTcgKzEyMDAKPiA+ID4gPgo+ID4gPiA+IFRoZSBPZHJvaWQtQzIgaXMg
cXVpdGUgYSBjb21wbGljYXRlZCBpbWFnZSB3aXRoIG1hbnkgc3RlcHMuIEl0IGlzIGFuIGlkZWFs
Cj4gPiA+ID4gZXhhbXBsZSBmb3IgaG93IEJpbm1hbiBjYW4gYmUgdXNlZC4KPiA+ID4KPiA+ID4g
WW91IHNheSBPZHJvaWQtQzIsIGJ1dCB0aGUgcGF0Y2hlcyBzZWVtIHRvIGFkZHJlc3MgdGhlIE9k
cm9pZC1DNC4uLgo+ID4KPiA+IEFoLCB5ZXMuIFRoZSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJlIGFu
IEFtbG9naWMgUzkwNSBvbiB0aGUgQzIgYW5kIGFuIFM5MDJYMyBvbiB0aGUgQzQuIEkgd29uZGVy
IGlmIHRoYXQgYWZmZWN0cyB0aGUgaW1hZ2UgbWFrZXVwPwo+Cj4gVGhlcmUgYXJlIGN1cnJlbnRs
eSBmb3VyIGRpZmZlcmVudCBzaWduaW5nIHJlY2lwZXMgdGhhdCBkZXBlbmQgb24gdGhlCj4gYm9h
cmQgZmFtaWx5IHRoYXQgeW91IGFyZSBidWlsZGluZyBmb3I6Cj4KPiAtIEdYQkIKPiAtIEdYTC9H
WE0KPiAtIEcxMkEvU00xCj4gLSBHMTJCCj4KPiBUaGUgRzEyQS9TTTEgYW5kIEcxMkIgcmVjaXBl
cyBhcmUgaWRlbnRpY2FsIGV4Y2VwdCBmb3IgYSBkaWZmZXJlbnQKPiBzaWduaW5nIGJpbmFyeSB1
c2VkLiBUaGUgbGF0ZXN0IEFtbG9naWMgYm9hcmRzIChTOTA1WDQsIFQ3LCBldGMuKQo+IGFsc28g
aGF2ZSBpbmNyZW1lbnRhbCBjaGFuZ2VzLCBidXQgbm9uZSBhcmUgY3VycmVudGx5IHN1cHBvcnRl
ZCBpbgo+IExpbnV4IG9yIHUtYm9vdC4KPgo+IE9uZSBvZiB0aGUgY2hhbGxlbmdlcyBmb3IgYmlu
bWFuIHdpbGwgYmUgdGhlIHNpZ25pbmcgdG9vbHMuIEN1cnJlbnRseQo+IHRoaXMgcGF0Y2hzZXQg
ZGVwZW5kcyB1cG9uIEFtbG9naWMgYmluYXJpZXMuIEFwYXJ0IGZyb20gdGhlbSBiZWluZwo+IGNs
b3NlZC1zb3VyY2UgYW5kIHRodXMgdW5kZXNpcmFibGUsIHRoZXkgYXJlIGFsc28geDg2XzY0IG9u
bHkgYW5kCj4gdGhlcmUgYXJlIHF1aXRlIGEgZmV3IHVzZXJzIChhbmQgYXQgbGVhc3Qgb25lIG1h
am9yIGRpc3RybykgbmVlZGluZwo+IHRvIGJ1aWxkIG9uIGFybTY0IGhhcmR3YXJlLgo+Cj4gVGhl
cmUgaXMgYW4gb3Blbi1zb3VyY2UgdG9vbCBjYWxsZWQgZ3hsaW1nIHdoaWNoIHN1cHBvcnRzIEdY
TCBhbmQgbmV3ZXIKPiBib2FyZHMuIElNSE8gaXQgd291bGQgbWFrZSBhIGxvdCBvZiBzZW5zZSBm
b3IgdS1ib290IHRvIGFic29yYiB0aGUKPiBmdW5jdGlvbmFsaXR5IG9mIGd4bGltZyAoYW5kIGV4
dGVuZCBzdXBwb3J0IGJhY2t3YXJkcyB0byBHWEJCKSBhcyB0aGlzCj4gd291bGQgcmVtb3ZlIHRo
ZSBkZXBlbmRlbmN5IG9uIEFtbG9naWMgYmluYXJpZXMgYW5kIGFsbG93IHUtYm9vdCBidWlsZAo+
IGFuZCBiaW5tYW4gc2lnbmluZyB0byBiZSBkb25lIGFueXdoZXJlLgo+Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL3JlcGsvZ3hsaW1nCgpGYWlyIGVub3VnaCwgYnV0IGFub3RoZXIgb3B0aW9uIHdvdWxk
IGJlIHRvIGFsbG93ICdiaW5tYW4gdG9vbCAtZgpneGxpbWcnIHRvIHdvcmssIHdoaWNoIHNob3Vs
ZCBiZSBlYXN5LiBUaGVuIHdlIGNhbiBtYWtlIHVzZSBvZiB0aGUKZXhpc3RpbmcgQyBjb2RlLCB1
c2luZyBiaW5hcnkgdG9vbHMgZm9yIHRoZSB1bnN1cHBvcnRlZCBvbmVzLgoKPgo+ID4gVGhlIHBh
dGNoIGlzIGZvciB0ZXN0aW5nIGJ5IENocmlzdGlhbiwgd2hvIEkgaG9wZSBjYW4gaGVscCBnZXQg
dGhpcyBsYW5kZWQgZm9yIGFsbCB0aGUgQW1sb2dpYyBib2FyZHMuCj4KPiBJIHdpbGwgdHJ5IHRv
IGZpbmQgdGhlIHRpbWUgdG8gdGVzdCB0aGlzLCBidXQgaXTigJlzIG5vdCBzb21ldGhpbmcgSQo+
IGNvdWxkIGRvIG1vcmUgd2l0aCAoYXMgb25seSBzdXBwb3J0aW5nIDEvNCBvZiB0aGUgYm9hcmQg
ZmFtaWxpZXMKPiB0aGF0IEkgbmVlZCB0byBidWlsZCBmb3IsIGJ1IEkgZG8gYXBwcmVjaWF0ZSBp
dOKAmXMgYSBQT0MpLgoKWWVzLCBpdCdzIGEgc3RhcnQuCgo+Cj4gSW4gY2FzZSB5b3XigJlyZSBu
b3QgYXdhcmUsIE1ha2VmaWxlIGJhc2VkIHNpZ25pbmcgaXMgaW1wbGVtZW50ZWQgaW4KPiB0aGUg
YW1sb2dpYy1ib290LWZpcCByZXBvIHRoYXQgSeKAmW0gY3VycmVudGx5IHRvb2xlZCBhcm91bmQ6
Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vTGlicmVFTEVDL2FtbG9naWMtYm9vdC1maXAKPgo+IFRo
aXMgaXMgdGhlIOKAnGNvbXBldGl0aW9u4oCdIHNvIHRvIHNwZWFrLiBJdOKAmXMgcXVpdGUgc2lt
cGxlIGFuZCB3aWRlbHkKPiB1c2VkIGJ5IG1vc3Qgb2YgdGhlIEFtbG9naWMgc3VwcG9ydGluZyBk
aXN0cm9zIHJpZ2h0IG5vdy4KCldlbGwgYXQgbGVhc3QgdGhhdCBwcm92aWRlcyB0aGUgcmVjaXBl
cy4KClJlZ2FyZHMsClNpbW9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
