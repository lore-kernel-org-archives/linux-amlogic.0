Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20078C7619A
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Apr 2023 03:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqZIQ/2KV3tJMLJXWUgp/jia9hF+MkXSsW3TzD12WP8=; b=RjQDOgEG5aWwEN
	eml71NMJxtiwZ3qvT2jUjgntg+f3Do7US5GoPzVp/Ebnvc1UE46GWtKQfN1XWsHRSInpi8mn8/cmO
	2RrbrwS+y87NKBQZ9sWiTBoSiT82dXlKJoZ3jP8BdRxumUefxz0wFMTiJl4rlm6pXM4T4IQ91euyX
	+xYfqaW7RGIxxjgWvp63umqdWEV8LdvAQQRZdHvqFvAuCG5HZUwBitMSbUzZ69xVfYmyT5+xyyNG1
	zZRUJSI1dPx7X1OBvWqBYNcfmQmToufikKz8THoJ/0onxPmF4kDv110nGcdP9uxtcX/lzQKPIlKoI
	qmYf5lFnCsd9rEA1c0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkzLy-00BeUQ-0L;
	Sat, 08 Apr 2023 03:35:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkzLv-00BeTO-0n
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Apr 2023 03:35:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id m4so255817lfj.13
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Apr 2023 20:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1680924895; x=1683516895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKbxe1/6B4Joxh4rryylmIHwiyR8Uz8YIxCtjqorSH0=;
        b=BFdF/OiyMv3Ph2UI9wA/cqSkEviiIsImtAP57ilGB38PY3cbc7fxfG0uNpce9f2Qby
         4Oh9EXciOKq3/29qqNWj7edl/2leNK7/RRLrnUw9Zd72jjDLC3EPu4v9WImD6XJTALWD
         mA2LW31FCHQkMMJ4Fzc0ATP/U8FzZWiR8d/CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680924895; x=1683516895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKbxe1/6B4Joxh4rryylmIHwiyR8Uz8YIxCtjqorSH0=;
        b=Ce5JHIWtL5v0cUI7rioyS8PHh2NGTXEw84I/I5fr0keyfNn2eVqiTr5En4nGzyVg7Z
         RkaTwjo+xqDumWSryjyR3uTlOVL8/C+LQPKlM/xqEZ58YYAq+5i/lmhUoUxbxYi438gk
         bVGWQ/fEjxAg3N9+o+WKmydeOWFYPT4mMVeMs8K/Pdp+1ZzlMZ9KTUUuAGfKVUEAmc97
         Hrc4ohuFKdvoniWPA1NO2Bf5gZxNSGG/SHFh+DEwrw4jt8yLoQvyTwRpZiyJl6bYWmCo
         YiWsrtOmo8NwFMS7zCY6F0gtlXZT3SJR/LEGb3kVmNy0wzYn/g1p2uWHk3JUchsSuUPL
         9w6g==
X-Gm-Message-State: AAQBX9e5w7blrwZYZabp6Qhv6FguHHavu3Lwd2+L8/f/3on2/rGnnZSX
	9W0J9POXXDtFbfVX96WqEc5OnCjHsZbW4zOHeJhq4A==
X-Google-Smtp-Source: AKy350aupejaO7Ym3EyZw8LP5kLHERzFLgqTn0QDq0qttcRAH80df3Ct13U3bEReh5neHwVc+61uXKhdx+6FWYMnUUI=
X-Received: by 2002:ac2:5445:0:b0:4e8:48a4:371a with SMTP id
 d5-20020ac25445000000b004e848a4371amr1106577lfn.4.1680924895375; Fri, 07 Apr
 2023 20:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230401185458.2280200-1-sjg@chromium.org> <87zg7rb8dd.fsf@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0Js43JOi3xaeY8tYuELSPXWL-PCBq1-iANLs1074MzbQ@mail.gmail.com>
 <1973D65D-692D-4AA7-B074-942D4E9ADB4B@gmail.com> <CAPnjgZ14t6KR5sPzaq9HbLG1ocUHtbpLrwfBPMJZXQdaq2ALRA@mail.gmail.com>
In-Reply-To: <CAPnjgZ14t6KR5sPzaq9HbLG1ocUHtbpLrwfBPMJZXQdaq2ALRA@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Fri, 7 Apr 2023 23:34:44 -0400
Message-ID: <CACdvmAj2L4YdOZ3ykVTN+ZfJLupA4_Hk7rDG4jC2_p=+0pJphg@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce
 the image
To: Simon Glass <sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_203459_311403_4FC9572A 
X-CRM114-Status: GOOD (  36.36  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io, U-Boot Mailing List <u-boot@lists.denx.de>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, AML <linux-amlogic@lists.infradead.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgNSwgMjAyMyBhdCAyOjM54oCvUE0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1
bS5vcmc+IHdyb3RlOgo+Cj4gSGkgQ2hyaXN0aWFuLAo+Cj4gT24gTW9uLCAzIEFwciAyMDIzIGF0
IDIwOjEwLCBDaHJpc3RpYW4gSGV3aXR0Cj4gPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiA+IE9uIDIgQXByIDIwMjMsIGF0IDY6NDEgYW0sIFNpbW9uIEdsYXNzIDxz
amdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgTWFyaywKPiA+ID4KPiA+ID4g
T24gU3VuLCAyIEFwciAyMDIzIGF0IDA5OjI4LCBNYXJrIEtldHRlbmlzIDxtYXJrLmtldHRlbmlz
QHhzNGFsbC5ubD4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IEZyb206IFNpbW9uIEdsYXNzIDxz
amdAY2hyb21pdW0ub3JnPgo+ID4gPiA+ID4gRGF0ZTogU3VuLCAgMiBBcHIgMjAyMyAwNjo1NDo1
NyArMTIwMAo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBPZHJvaWQtQzIgaXMgcXVpdGUgYSBjb21w
bGljYXRlZCBpbWFnZSB3aXRoIG1hbnkgc3RlcHMuIEl0IGlzIGFuIGlkZWFsCj4gPiA+ID4gPiBl
eGFtcGxlIGZvciBob3cgQmlubWFuIGNhbiBiZSB1c2VkLgo+ID4gPiA+Cj4gPiA+ID4gWW91IHNh
eSBPZHJvaWQtQzIsIGJ1dCB0aGUgcGF0Y2hlcyBzZWVtIHRvIGFkZHJlc3MgdGhlIE9kcm9pZC1D
NC4uLgo+ID4gPgo+ID4gPiBBaCwgeWVzLiBUaGUgZGlmZmVyZW5jZSBzZWVtcyB0byBiZSBhbiBB
bWxvZ2ljIFM5MDUgb24gdGhlIEMyIGFuZCBhbiBTOTAyWDMgb24gdGhlIEM0LiBJIHdvbmRlciBp
ZiB0aGF0IGFmZmVjdHMgdGhlIGltYWdlIG1ha2V1cD8KPiA+Cj4gPiBUaGVyZSBhcmUgY3VycmVu
dGx5IGZvdXIgZGlmZmVyZW50IHNpZ25pbmcgcmVjaXBlcyB0aGF0IGRlcGVuZCBvbiB0aGUKPiA+
IGJvYXJkIGZhbWlseSB0aGF0IHlvdSBhcmUgYnVpbGRpbmcgZm9yOgo+ID4KPiA+IC0gR1hCQgo+
ID4gLSBHWEwvR1hNCj4gPiAtIEcxMkEvU00xCj4gPiAtIEcxMkIKPiA+Cj4gPiBUaGUgRzEyQS9T
TTEgYW5kIEcxMkIgcmVjaXBlcyBhcmUgaWRlbnRpY2FsIGV4Y2VwdCBmb3IgYSBkaWZmZXJlbnQK
PiA+IHNpZ25pbmcgYmluYXJ5IHVzZWQuIFRoZSBsYXRlc3QgQW1sb2dpYyBib2FyZHMgKFM5MDVY
NCwgVDcsIGV0Yy4pCj4gPiBhbHNvIGhhdmUgaW5jcmVtZW50YWwgY2hhbmdlcywgYnV0IG5vbmUg
YXJlIGN1cnJlbnRseSBzdXBwb3J0ZWQgaW4KPiA+IExpbnV4IG9yIHUtYm9vdC4KPiA+Cj4gPiBP
bmUgb2YgdGhlIGNoYWxsZW5nZXMgZm9yIGJpbm1hbiB3aWxsIGJlIHRoZSBzaWduaW5nIHRvb2xz
LiBDdXJyZW50bHkKPiA+IHRoaXMgcGF0Y2hzZXQgZGVwZW5kcyB1cG9uIEFtbG9naWMgYmluYXJp
ZXMuIEFwYXJ0IGZyb20gdGhlbSBiZWluZwo+ID4gY2xvc2VkLXNvdXJjZSBhbmQgdGh1cyB1bmRl
c2lyYWJsZSwgdGhleSBhcmUgYWxzbyB4ODZfNjQgb25seSBhbmQKPiA+IHRoZXJlIGFyZSBxdWl0
ZSBhIGZldyB1c2VycyAoYW5kIGF0IGxlYXN0IG9uZSBtYWpvciBkaXN0cm8pIG5lZWRpbmcKPiA+
IHRvIGJ1aWxkIG9uIGFybTY0IGhhcmR3YXJlLgo+ID4KPiA+IFRoZXJlIGlzIGFuIG9wZW4tc291
cmNlIHRvb2wgY2FsbGVkIGd4bGltZyB3aGljaCBzdXBwb3J0cyBHWEwgYW5kIG5ld2VyCj4gPiBi
b2FyZHMuIElNSE8gaXQgd291bGQgbWFrZSBhIGxvdCBvZiBzZW5zZSBmb3IgdS1ib290IHRvIGFi
c29yYiB0aGUKPiA+IGZ1bmN0aW9uYWxpdHkgb2YgZ3hsaW1nIChhbmQgZXh0ZW5kIHN1cHBvcnQg
YmFja3dhcmRzIHRvIEdYQkIpIGFzIHRoaXMKPiA+IHdvdWxkIHJlbW92ZSB0aGUgZGVwZW5kZW5j
eSBvbiBBbWxvZ2ljIGJpbmFyaWVzIGFuZCBhbGxvdyB1LWJvb3QgYnVpbGQKPiA+IGFuZCBiaW5t
YW4gc2lnbmluZyB0byBiZSBkb25lIGFueXdoZXJlLgo+ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yZXBrL2d4bGltZwoKZ3hsaW1nIGFsc28gZG9lcyBub3QgaGF2ZSB0aGUgZnVsbCBmZWF0dXJl
c2V0IG9mIHRoZSBBbWxvZ2ljIHNpZ25lci4KVGhlIG1vc3QgaW1wb3J0YW50IHRvIG1lIGJlaW5n
IGx6NCBjb21wcmVzc2lvbi4KSSdtIHN0aWxsIHRyeWluZyB0byBnZXQgc3VwcG9ydCBmcm9tIEFt
bG9naWMgZm9yIG9wZW4gc291cmNlIEFURiBhdApsZWFzdCBmb3IgR1hYIGJ1dCB0aGF0IGhhcyBu
dW1lcm91cyBodXJkbGVzIHRvIG92ZXJjb21lIGFuZCBtb3JlCmh1cmRsZXMgZm9yIGZ1dHVyZSBk
ZXNpZ25zLgoKPgo+IEZhaXIgZW5vdWdoLCBidXQgYW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8g
YWxsb3cgJ2Jpbm1hbiB0b29sIC1mCj4gZ3hsaW1nJyB0byB3b3JrLCB3aGljaCBzaG91bGQgYmUg
ZWFzeS4gVGhlbiB3ZSBjYW4gbWFrZSB1c2Ugb2YgdGhlCj4gZXhpc3RpbmcgQyBjb2RlLCB1c2lu
ZyBiaW5hcnkgdG9vbHMgZm9yIHRoZSB1bnN1cHBvcnRlZCBvbmVzLgo+Cj4gPgo+ID4gPiBUaGUg
cGF0Y2ggaXMgZm9yIHRlc3RpbmcgYnkgQ2hyaXN0aWFuLCB3aG8gSSBob3BlIGNhbiBoZWxwIGdl
dCB0aGlzIGxhbmRlZCBmb3IgYWxsIHRoZSBBbWxvZ2ljIGJvYXJkcy4KPiA+Cj4gPiBJIHdpbGwg
dHJ5IHRvIGZpbmQgdGhlIHRpbWUgdG8gdGVzdCB0aGlzLCBidXQgaXTigJlzIG5vdCBzb21ldGhp
bmcgSQo+ID4gY291bGQgZG8gbW9yZSB3aXRoIChhcyBvbmx5IHN1cHBvcnRpbmcgMS80IG9mIHRo
ZSBib2FyZCBmYW1pbGllcwo+ID4gdGhhdCBJIG5lZWQgdG8gYnVpbGQgZm9yLCBidSBJIGRvIGFw
cHJlY2lhdGUgaXTigJlzIGEgUE9DKS4KPgo+IFllcywgaXQncyBhIHN0YXJ0Lgo+Cj4gPgo+ID4g
SW4gY2FzZSB5b3XigJlyZSBub3QgYXdhcmUsIE1ha2VmaWxlIGJhc2VkIHNpZ25pbmcgaXMgaW1w
bGVtZW50ZWQgaW4KPiA+IHRoZSBhbWxvZ2ljLWJvb3QtZmlwIHJlcG8gdGhhdCBJ4oCZbSBjdXJy
ZW50bHkgdG9vbGVkIGFyb3VuZDoKPiA+Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vTGlicmVFTEVD
L2FtbG9naWMtYm9vdC1maXAKClRoZSBpc3N1ZSB3aXRoIHRoZSBib290IGZpcHMgaXMgdGhhdCB0
aGV5IGNvbnRyb2wgdG9vIG1hbnkgdGhpbmdzIChDUFUKZnJlcSwgRERSIGZyZXEsIE0zIGNvbnRy
b2wgY29kZSwgYW5kIG1vcmUpIHRvIG1ha2UgaXQgdW5pdmVyc2FsLgoKPiA+Cj4gPiBUaGlzIGlz
IHRoZSDigJxjb21wZXRpdGlvbuKAnSBzbyB0byBzcGVhay4gSXTigJlzIHF1aXRlIHNpbXBsZSBh
bmQgd2lkZWx5Cj4gPiB1c2VkIGJ5IG1vc3Qgb2YgdGhlIEFtbG9naWMgc3VwcG9ydGluZyBkaXN0
cm9zIHJpZ2h0IG5vdy4KPgo+IFdlbGwgYXQgbGVhc3QgdGhhdCBwcm92aWRlcyB0aGUgcmVjaXBl
cy4KPgo+IFJlZ2FyZHMsCj4gU2ltb24KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
