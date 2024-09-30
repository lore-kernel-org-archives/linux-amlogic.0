Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F88ACDD1D6
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 20:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHMMgytULQ16auqRMuEhdEXpkz1PH2/eE/uLzYzh5BA=; b=kLOUqvYmK92QkL
	d2xSyzFJwHPo7cqzrDsAZepcovIGNknrMgm9iPZBJTQzTi5tGgH9YmGBmnS87X4eBWEBl11P/Xl3P
	CPKO4eChCV1B8EMesxohVmtamj3G5jIE8OPdnUCFGW2gLHLpLlPE0upjuS8hRSGOlvnozZAIgKUqX
	hXZqS+iwf9pMKbItmdtmThPCdx000LiViuGfbd6Z45jPILs7fkizNfK6PLQTT7PGp26UL9+5p1/nN
	3Y1tYBkwY2dlYKy3Z5a1f/sftOVf4MPlrff60XPRQEPIYsuGG6NWvAS/QKcznVWAZugx/kHNylbRO
	4fbjX8x/o6tvkrXqudvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMhA-00000000iYF-3S1B;
	Mon, 30 Sep 2024 20:08:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMh7-00000000iXl-2fSt;
	Mon, 30 Sep 2024 20:08:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b78ee6298so11089735ad.2;
        Mon, 30 Sep 2024 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727726912; x=1728331712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT1dL8lysN8vggO0eK3mScXgfCxlzNq4RmSSqIJ9kKA=;
        b=ciDZTNOkxW8WD09lIKY9PtRaYul3c6ywXLJknr7KjKXcrlRQodCkA8L1nsPAQxm0Fd
         IOc6InkbWN+tkGHe85KOoAJw/RTsWNnYSQ+z1PdE9+IQo3vH0c2e0WpBeEmUauV+I7rZ
         my/K2/SHFY5aCNbtalj6cMlSATgIxzJ06st+Td+G9VBVOJOX6pCU5bX7Ok2yTW1HE6gK
         i+6U4Kn/iL7wmu8L6ssdadJf7ZxrKvCQ4FzjBbF3YgHRL5eibWC5O8y69fqcRKGIsUp9
         KQ4sc1BhNmZwIUS+v1k5GK4+Rs6+mGLl0SoRp+WjnTyO2XU5WQaV2kqXDEo/apO3N6Hb
         PGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727726912; x=1728331712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT1dL8lysN8vggO0eK3mScXgfCxlzNq4RmSSqIJ9kKA=;
        b=U/p5yZa1e1Sg63KymZajRDZlDGxFHlRadND09f468kWQri1s2jiHABNGnY3uwXzyR/
         I4AlgirnCJhJZK63N3gYRgjPCnhlaHEV3q9d8yKFdtVBf2/vFdetKovojE+9Zsc0rhyy
         aA/A7U/dMHQ42i+1cU2a23ukmW7LQxhJsa3PWKxu51a2D5wCVFpLbDzCG03oFTCn13qs
         dJAhpjUaIw43cCMIM5+F6mgKc2bg99rSxUM0O2xsUThudP8Ilj8QNff/8j947IBN19Jy
         bzeGHnBDP471pm0MzWdaUPvgKZgZWqrFSw/k3FVEhkxtglb+3is5z9qofLOotRLUKcWm
         L74w==
X-Forwarded-Encrypted: i=1; AJvYcCVOkfDmifNT+Ax+muQb2gSKSxsVEgrcBN1Zdho686vNevRMWncDtRd0Aa5NV+ur4TGp3NB56rRxIM0ztPvj@lists.infradead.org, AJvYcCVrOf7cpb4RRLY87VR+KDI+igMFQBT9fVeH5b8YzdPi34oUTS9N3ybEo2s2JLbN0zGu+n5Z4qBPxB9B95RSDPT9WA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuRya2Z7pkCHywqFv843AgY2+V3KjzPCKw9MznyUszetP6O1C4
	wAtvMoJFw1ekcw0SMIGRtwN58M62DcWHaV4WD+aN/sdLsDmEkdBHPp0gpO+d/qlCoMykq4EprTv
	KqCdTZ20bCaZx6a4Fng3k7gPYgv9Cb8Sl
X-Google-Smtp-Source: AGHT+IEs2DmofWhzUH0ql6mNKV1LnAfUh+w0gmpzifWQCksoK4G24DGc3LF4HeEZB6BMBG7TMZ9Aw+33F5R9xGMlPBc=
X-Received: by 2002:a17:903:2307:b0:20b:5046:35b with SMTP id
 d9443c01a7336-20b5046080bmr160097295ad.57.1727726912048; Mon, 30 Sep 2024
 13:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com> <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
In-Reply-To: <20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Sep 2024 22:08:21 +0200
Message-ID: <CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_130833_729567_7859251E 
X-CRM114-Status: GOOD (  19.48  )
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

SGVsbG8sCgpPbiBTdW4sIFNlcCAyOSwgMjAyNCBhdCA4OjEw4oCvQU0gQ2h1YW4gTGl1IHZpYSBC
NCBSZWxheQo8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4KPiBGcm9tOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPgo+IGdsaXRjaCBm
cmVlIG11eCBoYXMgdHdvIGNsb2NrIGNoYW5uZWxzIChjaGFubmVsIDAgYW5kIGNoYW5uZWwgMSkg
d2l0aAo+IHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24uIFdoZW4gdGhlIGZyZXF1ZW5jeSBuZWVkcyB0
byBiZSBjaGFuZ2VkLCB0aGUgdHdvCj4gY2hhbm5lbHMgcGluZy1wb25nIHRvIGVuc3VyZSBjbG9j
ayBjb250aW51aXR5IGFuZCBzdXBwcmVzcyBnbGl0Y2guCllvdSBkZXNjcmliZSB0aGUgc29sdXRp
b24gdG8gdGhpcyBiZWxvdzoKPiBBZGQgZmxhZyBDTEtfU0VUX1JBVEVfR0FURSB0byBjaGFubmVs
cyAwIGFuZCAxIHRvIGltcGxlbWVudCBQaW5nLVBvbmcKPiBzd2l0Y2hvdmVyIHRvIHN1cHByZXNz
IGdsaXRjaC4KSXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSB0aGlzIGNoYW5nZSBpbiBhIHNlcGFy
YXRlIHBhdGNoLgpUaGUgY2xvY2tzIHRvIHdoaWNoIHlvdSdyZSBhZGRpbmcgQ0xLX1NFVF9SQVRF
X0dBVEUgYXJlbid0IHN3aXRjaGVkIGF0CnJ1bnRpbWUgaW4gbWFpbmxpbmUga2VybmVscyAoYXQg
bGVhc3QgSSB0aGluayBzbykuCgo+IENoYW5uZWwgMCBvZiBnbGl0Y2ggZnJlZSBtdXggaXMgbm90
IG9ubHkgdGhlIGNsb2NrIHNvdXJjZSBmb3IgdGhlIG11eCwKPiBidXQgYWxzbyB0aGUgd29ya2lu
ZyBjbG9jayBmb3IgZ2xpdGNoIGZyZWUgbXV4LiBUaGVyZWZvcmUsIHdoZW4gZ2xpdGNoCj4gZnJl
ZSBtdXggc3dpdGNoZXMsIGl0IGlzIG5lY2Vzc2FyeSB0byBlbnN1cmUgdGhhdCBjaGFubmVsIDAg
aGFzIGEgY2xvY2sKPiBpbnB1dCwgb3RoZXJ3aXNlIGdsaXRjaCBmcmVlIG11eCB3aWxsIG5vdCB3
b3JrIGFuZCBjYW5ub3Qgc3dpdGNoIHRvIHRoZQo+IHRhcmdldCBjaGFubmVsLgpbLi4uXQo+IGds
aXRjaCBmcmVlIG11eCBBZGQgZmxhZyBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgdG8gZW5zdXJlIHRo
YXQgY2hhbm5lbCAwCj4gaGFzIGNsb2NrIGlucHV0IHdoZW4gc3dpdGNoaW5nIGNoYW5uZWxzLgpU
aGlzIGRlc2NyaWJlcyBhIHNlY29uZCBwcm9ibGVtLiBJIHRoaW5rIGl0J3MgYmVzdCB0byBoYXZl
IHRoaXMgaW4gYQpzZXBhcmF0ZSBjb21taXQvcGF0Y2guCkFsc28geW91J3JlIHVwZGF0aW5nIHNv
bWUgbWFsaSBjbG9ja3MgKGUuZy4gb24gRzEyIGFuZCBHWCkgYnV0IG5vdCBhbGwKb2YgdGhlbSAo
TWVzb244YiBmb3IgZXhhbXBsZSBpcyBtaXNzaW5nKS4KCkkgc3RpbGwgaGF2ZSBzb21lIHF1ZXN0
aW9ucyB0byB0aGUgQ0xLX09QU19QQVJFTlRfRU5BQkxFIGFwcHJvYWNoIC0KcGxlYXNlIHNoYXJl
IHlvdXIgZmluZGluZ3Mgb24gdGhpcy4KClRoZXJlJ3MgbXVsdGlwbGUgY2xvY2tzIGludm9sdmVk
IGluIGEgZ2xpdGNoLWZyZWUgbXV4IGhpZXJhcmNoeToKLSBhIG51bWJlciBvZiBjbG9jayBpbnB1
dHMgKGUuZy4gZmNsaywgeHRhbCwgLi4uKQotIHR3byBtdXhlcyAob25lIGZvciBldmVyeSBjaGFu
bmVsIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXgpCi0gdHdvIGRpdmlkZXJzIChvbmUgZm9yIGV2ZXJ5
IGNoYW5uZWwgb2YgdGhlIGdsaXRjaC1mcmVlIG11eCkKLSB0d28gZ2F0ZXMgKG9uZSBmb3IgZXZl
cnkgY2hhbm5lbCBvZiB0aGUgZ2xpdGNoLWZyZWUgbXV4KQotIHRoZSBnbGl0Y2gtZnJlZSBtdXgK
CldoZW4gc3dpdGNoaW5nIGZyb20gY2hhbm5lbCAwICh3aGljaCBpcyBhY3RpdmUgYW5kIGVuYWJs
ZWQpIENDRgooY29tbW9uIGNsb2NrIGZyYW1ld29yaykgd2lsbDoKYSkgb24gY2hhbm5lbCAxOgot
IGZpbmQgdGhlIGJlc3QgaW5wdXQgY2xvY2sKLSBjaG9vc2UgdGhlIGJlc3QgaW5wdXQgY2xvY2sg
aW4gdGhlIG11eAotIHNldCB0aGUgZGl2aWRlcgotIGVuYWJsZSB0aGUgZ2F0ZQpiKSBzd2l0Y2gg
dGhlIGdsaXRjaC1mcmVlIG11eApjKSBvbiBjaGFubmVsIDI6Ci0gZGlzYWJsZSB0aGUgZ2F0ZQoK
VG8gbWUgaXQncyBub3QgY2xlYXIgYXQgd2hpY2ggbGV2ZWwgdGhlIHByb2JsZW0gb2NjdXJzIChn
bGl0Y2gtZnJlZQptdXgsIGdhdGUsIGRpdmlkZXIsIG11eCwgaW5wdXQgY2xvY2spLgpBbHNvIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgZW5hYmxpbmcgdGhlIGNsb2NrcyB3aXRoCkNMS19PUFNfUEFS
RU5UX0VOQUJMRSBzb2x2ZXMgYW55IHByb2JsZW0gc2luY2UgQ0NGIGlzIGRvaW5nIHRoaW5ncwph
dXRvbWF0aWNhbGx5IGZvciB1cy4KQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiAocHJlZmVyYWJseSB3
aXRoIGFuIGV4YW1wbGUpIHdoYXQgcHJvYmxlbSBpcwpzb2x2ZWQgd2l0aCB0aGlzIGFwcHJvYWNo
PwoKTGFzdCBidXQgbm90IGxlYXN0OiBpZiB3ZSdyZSBydW5uaW5nIGludG8gYnVncyB3aGVuCkNM
S19PUFNfUEFSRU5UX0VOQUJMRSBpcyBtaXNzaW5nIHRoZW4gdGhhdCBwYXRjaCBzaG91bGQgY2Fy
cnkgYSBGaXhlcwp0YWcuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
