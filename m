Return-Path: <SRS0=jdKd=VX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E1EC7618B
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jul 2019 10:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7F422BE8
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jul 2019 10:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SyJjnBQZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="p+nKFgaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC7F422BE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbzwP7dYoqJ4FtKH+2UvC5q+z335cCKJaLGu3L4Ho+g=; b=SyJjnBQZWV2QPD
	x+U0PaoWbFoR8t3B/5CSDbVBTJo1nXVJ88F6wVciJe51Ljnmx4qTaR1dweJ6wqbYhg/kKhhTXd0FF
	OSsMw7At0jaYFoc2Xu8naStxIYYFBsJadrYtPCcdF0HzlIYbm0DobEejybrqSf7NjYQG3gF99ajzm
	zbhqTNWG6V/iOeYjdgAaEU9NlfPB2xkAxce3FZ4Cg3cuUO7O08vZDmGpng3fNwpjK1WJW35lC+rrG
	IcdiwOrqzh2w8Pj+otD6fjIb2TVpJ+K8benDRwODl2jin1xg3tGthXOswSkmWFrLFrOVAHGC1F4dr
	AWvou2R0/cHVyXGRbB1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqxSL-0004oj-Iv; Fri, 26 Jul 2019 10:28:09 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqxSD-0004fS-K1
 for linux-amlogic@lists.infradead.org; Fri, 26 Jul 2019 10:28:04 +0000
Received: by mail-io1-xd41.google.com with SMTP id m24so103790114ioo.2
 for <linux-amlogic@lists.infradead.org>; Fri, 26 Jul 2019 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PzjlKYE1qIEe+zKWFnMwDGXGnYev6skKpACtw6FQfYA=;
 b=p+nKFgaFf1tHT5RNgpYZWcBsVVbiRzd9FTC6bAefOmIFtOJykeCT870R0C3ufGn4vc
 PWNSHa9kupTBucYBi70mlGlMiWsQwW88AcJuMNi5mjP54uMz6VZTDvOW5gQB50uT826R
 /3jc+gCyD43CXmaYBm+H1J6xVxPIKxZljbTPKqfSqimsMLP1H/7mnErn8M/dO8XfkwBs
 Y8w+IWSRvxAAfKb+sUeug4rr67gfH28OOcUOArjUBaDPMDvrVhBHZHe4UYjco91heF+s
 t/WQTFMrSsSh695Tzti0YJ2GBXe7DRanAgzk+m0sBiPGcJrsR60z20QSPaumVw4KZ0cp
 y5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PzjlKYE1qIEe+zKWFnMwDGXGnYev6skKpACtw6FQfYA=;
 b=qrs+1P55is30losm0cm9vUJii5DCn09RjXgDNlOfBQZAdyjm312PIFQ5vzABfs8gm5
 woxgXhKW1i1oZ0xyebXD51dx5eJMHipvBPDel2qhqqdMb+ozJbC67CIDwoDPdE3NQVBZ
 gxcO/6AW3EAa288C/O1ib29FtWMT7V+U5mOM/6m27bDWluKWYXOs6hO8+ePMndwNJ9eZ
 z1G3SfQVw5pdNSvz+uP98vbgXkhkm+K6Zfdt4nszBQUHvcj4P2XbK85/cALze0C3OKVT
 sWOuRe+65muhEOF/8wF1d3hip9G8BHOSsAZDbB4hBfDzUtxSb45/Q+/fv3Un54GRSUcU
 vIKQ==
X-Gm-Message-State: APjAAAXkUfX90tTIIMKQLEQJf5qe1pBXrdxAdR+30FXDG5f85S+hls28
 fNioC1VUOGcnQoZZqgaaDXS2e6LTmHDmZMn+t99Ssg==
X-Google-Smtp-Source: APXvYqxoHOdlu6x2hPEYf3RYGZ50mSWqUgxy2lpy/ibkVJblKXu8OocARgg+QmSbMwzq0EcY+IGZEkPKkyfBWG3maHg=
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr7172969iod.139.1564136880220; 
 Fri, 26 Jul 2019 03:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190722095425.14193-1-amergnat@baylibre.com>
 <20190722095425.14193-4-amergnat@baylibre.com>
 <1j5znqxj74.fsf@starbuckisacylon.baylibre.com>
 <CAGb2v64AJFMkZQaytYMN+EsLT0sS-3VwzWUfb3g7SdL7kCfu+g@mail.gmail.com>
In-Reply-To: <CAGb2v64AJFMkZQaytYMN+EsLT0sS-3VwzWUfb3g7SdL7kCfu+g@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Jul 2019 12:27:48 +0200
Message-ID: <CAFGrd9pWdhktEjQzGTTk1zdVVXuXaZL--CFjA-BPwia6AzmRQA@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: meson: gxbb: migrate to the new parent
 description method
To: Chen-Yu Tsai <wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_032801_677591_B207A774 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, baylibre-upstreaming@groups.io,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgamV1LiAyNSBqdWlsLiAyMDE5IMOgIDE5OjA5LCBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVs
Lm9yZz4gYSDDqWNyaXQgOgo+Cj4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTA6NTAgUE0gSmVy
b21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiAy
MiBKdWwgMjAxOSBhdCAxMTo1NCwgQWxleGFuZHJlIE1lcmduYXQgPGFtZXJnbmF0QGJheWxpYnJl
LmNvbT4gd3JvdGU6Cj4gPgo+ID4KPiA+ID4gQEAgLTE1OTIsMTMgKzE3MzcsMjkgQEAgc3RhdGlj
IHN0cnVjdCBjbGtfcmVnbWFwIGd4YmJfdmlkX3BsbF9kaXYgPSB7Cj4gPiA+ICAgICAgIC5ody5p
bml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkgewo+ID4gPiAgICAgICAgICAgICAgIC5uYW1l
ID0gInZpZF9wbGxfZGl2IiwKPiA+ID4gICAgICAgICAgICAgICAub3BzID0gJm1lc29uX3ZpZF9w
bGxfZGl2X3JvX29wcywKPiA+ID4gLSAgICAgICAgICAgICAucGFyZW50X25hbWVzID0gKGNvbnN0
IGNoYXIgKltdKXsgImhkbWlfcGxsIiB9LAo+ID4gPiArICAgICAgICAgICAgIC5wYXJlbnRfZGF0
YSA9ICYoY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSkgewo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgLyoKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqIFRoaXMgY2xvY2sgaXMg
ZGVjbGFyZWQgaGVyZSBmb3IgR1hMIGFuZCBHWEJCIFNvQywgc28KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAqIHdlIG11c3QgdXNlIHN0cmluZyBuYW1lIHRvIHNldCB0aGlzIHBhcmVudCB0
byBhdm9pZAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICogcG9pbnRlciBpc3N1ZS4KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4KPiA+IEkgZG9uJ3QgcmVhbGx5IGdldCB0
aGUgaXNzdWUgd2l0aCB0aGlzIGNvbW1lbnQuCj4gPgo+ID4gSG93IGFib3V0Ogo+ID4KPiA+IC8q
Cj4gPiAgKiBOb3RlOgo+ID4gICogZ3hsIGFuZCBneGJiIGhhdmUgZGlmZmVyZW50IGhkbWlfcGxs
cyAod2l0aCBkaWZmZXJlbnQgc3RydWN0IGNsa19odykuCj4gPiAgKiBXZSBmYWxsYmFjayB0byB0
aGUgZ2xvYmFsIG5hbWluZyBzdHJpbmcgbWVjaGFuaXNtIHNvIHZpZF9wbGxfZGl2IHBpY2tzCj4g
PiAgKiB1cCB0aGUgYXBwcm9wcmlhdGUgb25lLgo+ID4gICovCj4KPiBJZiB5b3UncmUgc3RpY2tp
bmcgdG8gZ2xvYmFsIG5hbWVzIGZvciBub3csIHlvdSBjb3VsZCBqdXN0IHNraXAgY29udmVydGlu
Zwo+IHRoaXMgY2xvY2sgYWx0b2dldGhlci4gSSBzdXNwZWN0IC5wYXJlbnRfbmFtZXMgd2lsbCBi
ZSBhcm91bmQgZm9yIHNvbWUgdGltZS4KCkkgcHJlZmVyIHRvIHBlcmZvcm0gYSBjb21wbGV0ZSBt
aWdyYXRpb24gYmVjYXVzZSBpdCBpcyBwb3NzaWJsZSB0aGF0Ci5wYXJlbnRfbmFtZXMKYmVjb21l
cyBkZXByZWNhdGVkIG9uZSBkYXkuIEkgdGhpbmsgaXQncyBjbGVhbmVyIHRvIGRvIGl0IG9uZSBz
aG90IGFuZAphdm9pZCBrZWVwaW5nCnJlZHVuZGFudCBzdHJ1Y3R1cmUgd2l0aCB0aGUgbmV3IG9u
ZS4KCj4KPiBPbiB0aGUgb3RoZXIgaGFuZCwgaWYgeW91IHJlYWxseSB3YW50IHRvIGdldCByaWQg
b2YgZ2xvYmFsIGNsb2NrIG5hbWUgYmFzZWQKPiBwYXJlbnRpbmcsIHlvdSBjb3VsZCB1c2UgY2xr
X2h3IHBvaW50ZXJzLCBhbmQgaGF2ZSB0aGUgcHJvYmUgZnVuY3Rpb24gZml4Cj4gdXAgdGhpcyBv
bmUgYmFzZWQgb24gdGhlIGNvbXBhdGlibGUgc3RyaW5nLiBUaGF0J3Mgd2hhdCBJIGRpZC4KClNv
dW5kcyBnb29kLCBtYXkgSSBoYXZlIHRoZSBjb21taXQgb3IgZmlsZSB3aGljaCBpcyBpbXBsZW1l
bnQgdGhpcyBwbGVhc2U/Ckkgd29uZGVyIGlmIGl0IHdvcnRoIHRvIGFkZCBjb21wbGV4aXR5IGlu
IHByb2JlIGluc3RlYWQgb2YgdXNpbmcgYSBkZWRpY2F0ZWQKZmllbGQgaW4gLnBhcmVudF9kYXRh
IGZvciBzdHJpbmcgbmFtZS4gSSBndWVzcyB0aGF0IGRlcGVuZCBvbiB0aGUgY29tcGxleGl0eQpk
b25lIGluIHByb2JlLgoKPgo+IEp1c3QgbXkgdHdvIGNlbnRzLgo+Cj4gQ2hlbll1Cj4KPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIC5uYW1lID0gImhkbWlfcGxsIiwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIC5pbmRleCA9IC0xLAo+ID4gPiArICAgICAgICAgICAgIH0sCj4gPiA+ICAg
ICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwKPiA+ID4gICAgICAgICAgICAgICAuZmxhZ3Mg
PSBDTEtfU0VUX1JBVEVfUEFSRU5UIHwgQ0xLX0dFVF9SQVRFX05PQ0FDSEUsCj4gPiA+ICAgICAg
IH0sCj4gPiA+ICB9Owo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+ID4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
