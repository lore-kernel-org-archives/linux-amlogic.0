Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D668DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 16:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E9BC20643
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 16:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZgcZLDB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/TbaPIP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E9BC20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2YlOF2x4oKBqdQ8ZuFsMEXz5H7438/OKaks1l4Vghg=; b=dZgcZLDBIqbQRa
	XkZE2l/auDyVYwpRH2d3QVTaQtOBOUt9gxSxs65O/GVcwQeTuhSQ5Yt7fAZNL3AE/IThsgvEsJqm2
	6UXdUagBsOg30b9wRHIOXpRqSPp1vXxEOI0z1jOvojJO6U+RxVZg6escLcOoAQJpGd7JR5Jo4BiYe
	Dccu2k9gN7caHmK4Wse1LzI5NBYJGAu/tZIeqaNsjaTQDkUjC2EhBLvbu8VVY0dEp5ZM9capFhwh8
	70SHGkDLA+5mGwMdHE0PcI+oe6FWV0VLdiCVDeUEnUXjBW/VVENZyEUdkiL9/zGxrvFmmR1VW9F2Z
	toG54KacohQgowWyMJPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0qst-0007AH-JS; Mon, 04 Mar 2019 16:56:11 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0qsp-00079o-Ti
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 16:56:09 +0000
Received: by mail-qt1-x842.google.com with SMTP id d18so5840961qtg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p48fNnskcCikA+mU9ndEmdayWB5qOnsXSOtG9TxzN/c=;
 b=U/TbaPIPXhczUDAcPS8nGIsvVjPbJhY66r1kAWT693bF0hq91uJzLifmvGfkdjQ2cs
 b9KZ+7eVO2NKPNN3H40K+MBGTxmLeOVvnJNvRA3ykvkMPUdaa6S1igbMDbFMItEFup4U
 XsnppekCcVCI45+aq/gcYbdexpwfbd7kgxbEt+L8LrXs7q7EFdXk9wotPmqTno7fRJO5
 lDx2mgSMDV0oYU4iG5GzHLmcIS1Utxg/XXBlR409zERKsKfrXhBbnj4ue2a5zrdBV3g4
 cVOSxIpi10AH4YyBNpiA+2jOKsfuqEH41XDSnEBjVkfUVpFF9NIch3fZbnExjONNShuX
 /+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p48fNnskcCikA+mU9ndEmdayWB5qOnsXSOtG9TxzN/c=;
 b=c16cSlZRYAPZ/dhUbAlNNIUOxYlfBeQf6Z6I8gLQFGzSpELOobQkzVW2FZIQGkoefI
 71z3WGB/o6lJiOcm3oEmGMmu1B/agvq/rTL/ctqU86Z/3qGA8tFiouyamfzOq/LuAB5d
 119kY/9J7biLZ26VxKAMv8xl6MCpE7GPW9yrz1Toa9DebhnEYUV1IvGD+D0LhM1DCScV
 yV1t68VXppWN7XfPwLz414Hj58K7s7vgXhAmAPwP1w7p4IR5oUu6aG4naSJ9y3GsbLeU
 aYydyM+1QiBol/5Ntt0RETTTEK3eyeP47yZvIeuGFRWzNNGXySUzsfFP5NlA++8HiUDH
 V4dw==
X-Gm-Message-State: APjAAAUghjJ6gBTEslEtS/60CfbzG3ShVbCLJA7jZ6zBSZ5xDnPauqZX
 Et+COSkZtvIDpL8a5oE/T8rOLAPJSLBsLZh2WkRo5ZNw
X-Google-Smtp-Source: APXvYqzyjXLqMU98BWtIpINYdzgcvE8KDG56OHwresx/Tatl/09a1hqK9lx3jwT4jg3hwQ2JRAs9WzKzezC5S3FYZwM=
X-Received: by 2002:ac8:3122:: with SMTP id g31mr15733773qtb.273.1551718566521; 
 Mon, 04 Mar 2019 08:56:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJDSL=VG2YbAwuL_1SOVfWfD4gWquNG353p8LkCP+jiFpiN=9A@mail.gmail.com>
 <CAJDSL=W7X3am=iCOvafyzLuL8hzZriDWh4Zs2zfgBZDdDJtx7w@mail.gmail.com>
 <d1e057447b1c9ca832db3161242e35963bb15ba0.camel@baylibre.com>
In-Reply-To: <d1e057447b1c9ca832db3161242e35963bb15ba0.camel@baylibre.com>
From: =?UTF-8?B?QW5kcsOpIEJhbHNh?= <andrebalsa@gmail.com>
Date: Mon, 4 Mar 2019 17:55:54 +0100
Message-ID: <CAJDSL=X09A5KCT5BLSpMwBRUW_7rb2skJiS99qzTWr+cYcLhtA@mail.gmail.com>
Subject: Re: Possible regression in driver meson-gx-mmc in kernel 5.0.0
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_085608_064363_6753B2A7 
X-CRM114-Status: GOOD (  18.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSmVyb21lLApUaGFua3MgZm9yIHRoZSBhbnN3ZXIuCgo+IFlvdSByZXZlcnRlZCBtb3JlIHRo
YW4gb25lIHBhdGNoIGhlcmUuIgoKWWVzLCBJIGRpZG4ndCBrbm93IHdoaWNoIHBhdGNoIGV4YWN0
bHkgd2FzIGNhdXNpbmcgdGhlIHByb2JsZW0uCklmIHlvdSB3YW50IG1lIHRvIHRlc3QgdGhlIGRy
aXZlciB3aXRoIHRoZSBzcGlubG9jayByZW1vdmFsIHBhdGNoKGVzKQphcHBsaWVkIGJ1dCB3aXRo
b3V0IHRoZSBkZWxheSAvIHBoYXNlIHNldHRpbmcgcGF0Y2goZXMpLCBqdXN0IHNheS4KClJlZ2Fy
ZHMsCkFuZHJldwoKT24gTW9uLCBNYXIgNCwgMjAxOSBhdCA0OjM0IFBNIEplcm9tZSBCcnVuZXQg
PGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjAxOS0wMy0wNCBhdCAx
NDo0NiArMDEwMCwgQW5kcsOpIEJhbHNhIHdyb3RlOgo+ID4gSGVsbG8sIG15IGZpcnN0IHBvc3Qg
dG8gdGhlIGxpc3QsIG5pY2UgdG8gbWVldCBldmVyeWJvZHkuCj4gPgo+ID4gSSBjYW5ub3QgYm9v
dCBrZXJuZWwgNS4wLjAgb24gbXkgUzkwNSBUViBib3ggKHVzaW5nCj4gPiBtZXNvbi1neGJiLXAy
MDEuZHRiKSBmcm9tIGFuIFNEIGNhcmQsIHNlZSB0aGUgZXJyb3JzIGJlbG93IChjYXB0dXJlZAo+
ID4gZnJvbSBzZXJpYWwgb3V0cHV0KS4KPgo+IEFzIEkgYWxyZWFkeSBwb2ludGVkIG91dCB0byBz
b21lYm9keSBlbHNlLCBpdCBpcyBkaWZmaWN1bHQgdG8gZ2l2ZSBhbnkgZm9ybSBvZgo+IHN1cHBv
cnQgZm9yIGJvYXJkcyB3ZSBrbm93IG5vdGhpbmcgYWJvdXQsIGVzcGVjaWFsbHkgdGhlIG9uZSB0
aGF0IGFyZQo+ICdjb252ZW5pZW50bHknIHVzaW5nIHRoZSBEVCBvZiB0aGUgcmVmIGRlc2lnbgo+
Cj4gPgo+ID4gSWYgSSByZXZlcnQgb25seSBtZXNvbi1neC1tbWMuYyB0byB0aGUgdmVyc2lvbiBp
biBrZXJuZWwgNC4yMC4xMywKPiA+IGtlcm5lbCA1LjAuMCBib290cyB3aXRob3V0IGFueSBwcm9i
bGVtcy4KPgo+IFlvdSByZXZlcnRlZCBtb3JlIHRoYW4gb25lIHBhdGNoIGhlcmUuCj4KPiA+Cj4g
PiBJdCBzZWVtcyB0aGUgcHJvYmxlbXMgb2NjdXIgYmVjYXVzZSBvZiBwYXRjaGVzIGludHJvZHVj
ZWQgYnkgSmVyb21lCj4gPiBCcnVuZXQgaW4gRGVjZW1iZXIsIHNlZQo+ID4gaHR0cHM6Ly9sa21s
Lm9yZy9sa21sLzIwMTgvMTIvNi83NDUKPiA+Cj4gPiBNeSBndWVzcyBpcyB0aGUgcmVtb3ZhbCBv
ZiB0aGUgc3BpbmxvY2sgYWxsb3dzIGZvciByYWNlIGNvbmRpdGlvbnMKPiA+IHRoYXQgY2F1c2Ug
dGhlIG1tYyBkcml2ZXIgdG8gZmFpbCB3aGVuIHdyaXRpbmcgdG8gYW4gU0QgY2FyZC4KPgo+IDEp
IEFzIHBvaW50ZWQgb3V0IGluIHRoZSByZWxhdGVkIGNvbW1pdCBtZXNzYWdlIHRoaXMgc3Bpbmxv
Y2sgd2FzIHVzZWxlc3MuCj4gQW55b25lIGxvb2tpbmcgYXQgdGhlIGNvZGUgc2hvdWxkIGJlIGFi
bGUgdG8gc2VlIHRoYXQuIFdoYXQgeW91IGFyZSBzZWVpbmcgaXMKPiB0aGUgcmVzdWx0IG9mIENS
QyBlcnJvcnMuCj4KPiAyKSBUaGUgbGFzdCAyIHBhdGNoZXMgb2YgcmVsYXRlZCBzZXJpZXMgaGFk
IGJlZW4gc2VudCBhcyBSRlQsIGJ1dCBub2JvYnkKPiByZXBsaWVkLgo+Cj4gVGhlc2UgMiBjaGFu
Z2VzIGhlbHBlZCBzZXZlcmFsIGRlc2lnbnMgd29yayBhbmQgSSBjb3VsZCBub3Qgc2VlIGFueSBy
ZWdyZXNzaW9uCj4gb24gdGhlIGRlc2lnbnMgSSBoYWQgYXQgdGhlIHRpbWUsIGluY2x1ZGluZyB0
aGUgcDIwMAo+Cj4gTm93IHdlIGdvdCBzZXZlcmFsIHJlcG9ydHMgb2YgcmVncmVzc2lvbi4KPgo+
IEl0IGlzIHZlcnkgZGlmZmljdWx0IHRvIGZpbmQgc2V0dGluZ3MgdGhhdCB3aWxsIHdvcmsgZm9y
IHRoZSBhbGwgdGhlIGRlc2lnbnMuCj4gVGhlIGRvY3VtZW50YXRpb24gaXMgbm90IHZlcmJvc2Ug
cmVnYXJkaW5nIHRoaXMuIFlvdSBjYW4ndCBldmVuIHRha2UgdGhlCj4gdmVuZG9yIGtlcm5lbCBh
cyByZWZlcmVuY2UsIHRoZSBjb2RlIGlzIGV4dHJlbWVseSAnZmFuY3knIGFuZCBwaGFzZSBzZXR0
aW5ncwo+IGFyZSBwZXJwZXR1YWxseSBjeWNsaW5nIHdpdGhpbiB0aGUgaXJxIGhhbmRsZXIsIHdo
aWNoIGlzIHVuYWNjZXB0YWJsZS4KPgo+IFdlIGFyZSBhY3RpdmVseSB3b3JraW5nIHRvIHNvbHZl
IHRoaXMgYW5kIGhvcGVmdWxseSB3ZSB3aWxsIGJlIGFibGUgdG8gc2hhcmUKPiBzb21ldGhpbmcg
c29vbgo+Cj4gPgo+ID4gSSBhbSBhdmFpbGFibGUgdG8gdGVzdCB0aGUgZHJpdmVyIGZ1cnRoZXIg
d2l0aCBhbnkgcHJvcG9zZWQgc29sdXRpb24uCj4gPgo+ID4gUmVnYXJkcywKPiA+IEFuZHJldwo+
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
