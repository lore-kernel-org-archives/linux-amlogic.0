Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66104C4167B
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 09:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeK8CdfWvQnkYAEvoGWAxhGRgE3dW2uDnr3l+zjYxNs=; b=VkGh4wZDinf2DW
	IN8jhEBq5NjE6RSmucfGt5WR0C8smCLleU6ud7EcxvpS0v5emHcC3eHaAXxJ427jRq2ujkaXsgj+O
	Jeo2RWWPvvDBKdDNHPEFKLbnh6sSFAUnvODEEMhr2juteSS12GUdYSzQZxbeIE/sHBhn1islv5b1j
	hZmo2xhX6zOVCSFZ5mgI+PsjdNM9sIicUTt2Ec3bmiDpC88fL4Ot8lnAHc/2PMVCix0HHBkeD2TMH
	O3KpjCZHOY5OC1S0+x8ZL67AdLKhuqoeM2kGpHfrDznqfTJKcgiHvtq2uLKVBxey+EYZ7jdxokPA0
	u6X407mxY95J2ttBEXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4u0-002hjJ-0c;
	Fri, 15 Dec 2023 09:54:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4tv-002hiI-0W
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 09:54:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so4538315e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Dec 2023 01:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702634073; x=1703238873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaQhIJpC8RnPN69nCWAUDpbxZF8DURVfb/kY7Z31L0E=;
        b=MTg89TWmlrCNmivm57+sD5Ats1hWAfhhc8GK9ylTcwQ3NFdgZUnlPJUHzulTI6U6ta
         oKOLCL39VAdFGSWPLtZIgQlPhoLwRdSEuEwzrXCgNi3eeAz3/n3v/1FnkcnrQMg2xNaM
         aZ4BctBzU7jylyjaEecyWgoaRvK9J420psmJ1vodzWRTfKiPDDwfI5fi8+AjuCEGfBT3
         wUDeyCGM/qJOLD+CKj+MeOZO1LDRzba1CNZIwiRMpBly6ahDZZzW/6uc84yLCoBa8vlV
         gG6Et0uDPKH8/9M/CB4a/z6w9ewc98DfD07YVbhN9Z56COsOIhWbuuNHSqxzcHYE62lb
         CIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702634073; x=1703238873;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZaQhIJpC8RnPN69nCWAUDpbxZF8DURVfb/kY7Z31L0E=;
        b=d8TneQQ3ekTJTPvUaZkQFAoMs4zxzUcLa6ldFMQ8Ia3iR8ZxtM9o1cVqNVyfPkTkJG
         h69ApNKXI4frgZYXX/d5N/qRujccd9XF7BhJ1IjGUeo8rkzlzmz/jwWiyawGNcpcYquo
         EWTscnOEnH2cmMo1GIoaLnkOhv+Yil6BwUS4mrvVh+M72eERXva2iVkBu7NVEwEyusHW
         9K72w9eHqfh9Gtr/sfptJkRTC4lsuW451V/Wl1NTWMeq9c+gEeeCG/+tvUN5YRparUUU
         zRSZhdGfDKAp+in3mpOMSoG50BsQGXL494yHruq2UZfXSBkRrrNmz1YQTwsOUkGByT1q
         2wQQ==
X-Gm-Message-State: AOJu0Yx0HadiMPFMVSVpYbaVxMyEeERMgByPonMreq06f5oZo+FqN/5b
	6IPlxXSKJ0VbbOwRWhgQ+DX+mA==
X-Google-Smtp-Source: AGHT+IFyuXAp+tPAhav4a3ImTRzZILmdqALz+G2oA3xWOMRjoAp1+b20I3piaoNv4URjDTOgIxk8Lg==
X-Received: by 2002:a05:600c:470c:b0:40c:6bb8:17f2 with SMTP id v12-20020a05600c470c00b0040c6bb817f2mr286370wmo.59.1702634072718;
        Fri, 15 Dec 2023 01:54:32 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e16:8a51:92cc:c70e])
        by smtp.gmail.com with ESMTPSA id je5-20020a05600c1f8500b0040c6b667ce3sm1461288wmb.1.2023.12.15.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 01:54:32 -0800 (PST)
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
 <212239ae-60ab-46f3-a838-39a4d61091fe@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Rob
 Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Kevin
 Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai
 <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johan Hovold
 <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-pm@vger.kernel.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter
 <daniel@ffwll.ch>, Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Fri, 15 Dec 2023 10:46:29 +0100
In-reply-to: <212239ae-60ab-46f3-a838-39a4d61091fe@linaro.org>
Message-ID: <1ja5qbpz8o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_015435_550016_847A659E 
X-CRM114-Status: GOOD (  45.89  )
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

Ck9uIFdlZCAxMyBEZWMgMjAyMyBhdCAxNzo0NCwgTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBIaSBNYXhpbWUsCj4KPiBMZSAxMy8xMi8yMDIzIMOg
IDA5OjM2LCBNYXhpbWUgUmlwYXJkIGEgw6ljcml0wqA6Cj4+IEhpLAo+PiBPbiBXZWQsIERlYyAx
MywgMjAyMyBhdCAwODo0MzowMEFNICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4+
IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDA4OjE2OjA0QU0gKzAxMDAsIE1heGltZSBSaXBhcmQg
d3JvdGU6Cj4+Pj4gT24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMDY6MjY6MzdQTSArMDEwMCwgVXdl
IEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+Pj4+IGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSByZXR1
cm5zIHplcm8gdW5jb25kaXRpb25hbGx5LiBNb3N0IHVzZXJzICJrbm93Igo+Pj4+PiB0aGF0IGFu
ZCBkb24ndCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlLiBUaGlzIHNlcmllcyBmaXhlcyB0aGUgZm91
ciB1c2Vycwo+Pj4+PiB0aGF0IGRvIGVycm9yIGNoZWNraW5nIG9uIHRoZSByZXR1cm5lZCB2YWx1
ZSBhbmQgdGhlbiBtYWtlcyBmdW5jdGlvbgo+Pj4+PiByZXR1cm4gdm9pZC4KPj4+Pj4KPj4+Pj4g
R2l2ZW4gdGhhdCB0aGUgY2hhbmdlcyB0byB0aGUgZHJpdmVycyBhcmUgc2ltcGxlIGFuZCBzbyBt
ZXJnZSBjb25mbGljdHMKPj4+Pj4gKGlmIGFueSkgc2hvdWxkIGJlIGVhc3kgdG8gaGFuZGxlLCBJ
IHN1Z2dlc3QgdG8gbWVyZ2UgdGhpcyBjb21wbGV0ZQo+Pj4+PiBzZXJpZXMgdmlhIHRoZSBjbGsg
dHJlZS4KPj4+Pgo+Pj4+IEkgZG9uJ3QgdGhpbmsgaXQncyB0aGUgcmlnaHQgd2F5IHRvIGdvIGFi
b3V0IGl0Lgo+Pj4+Cj4+Pj4gY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpIHNob3VsZCBiZSBleHBl
Y3RlZCB0byBmYWlsLiBGb3IgZXhhbXBsZSBpZgo+Pj4+IHRoZXJlJ3MgYW5vdGhlciB1c2VyIGdl
dHRpbmcgYW4gZXhjbHVzaXZlIHJhdGUgb24gdGhlIHNhbWUgY2xvY2suCj4+Pj4KPj4+PiBJZiB3
ZSdyZSBub3QgY2hlY2tpbmcgZm9yIGl0IHJpZ2h0IG5vdywgdGhlbiBpdCBzaG91bGQgcHJvYmFi
bHkgYmUKPj4+PiBmaXhlZCwgYnV0IHRoZSBjYWxsZXJzIGNoZWNraW5nIGZvciB0aGUgZXJyb3Ig
YXJlIHJpZ2h0IHRvIGRvIHNvIGlmIHRoZXkKPj4+PiByZWx5IG9uIGFuIGV4Y2x1c2l2ZSByYXRl
LiBJdCdzIHRoZSBvbmVzIHRoYXQgZG9uJ3QgdGhhdCBzaG91bGQgYmUKPj4+PiBtb2RpZmllZC4K
Pj4+Cj4+PiBJZiBzb21lIG90aGVyIGNvbnN1bWVyIGhhcyBhbHJlYWR5ICJsb2NrZWQiIGEgY2xv
Y2sgdGhhdCBJIGNhbGwKPj4+IGNsa19yYXRlX2V4Y2x1c2l2ZV9nZXQoKSBmb3IsIHRoaXMgaXNu
J3QgYW4gZXJyb3IuIEluIG15IGJ1YmJsZSBJIGNhbGwKPj4+IHRoaXMgZnVuY3Rpb24gYmVjYXVz
ZSBJIGRvbid0IHdhbnQgdGhlIHJhdGUgdG8gY2hhbmdlIGUuZy4gYmVjYXVzZSBJCj4+PiBzZXR1
cCBzb21lIHJlZ2lzdGVycyBpbiB0aGUgY29uc3VtaW5nIGRldmljZSB0byBwcm92aWRlIGEgZml4
ZWQgVUFSVAo+Pj4gYmF1ZCByYXRlIG9yIGkyYyBidXMgZnJlcXVlbmN5IChhbmQgdGhhdCB3b3Jr
cyBhcyBleHBlY3RlZCkuCj4+IEkgZ3Vlc3MgaXQncyBhIGxhcmdlciBjb252ZXJzYXRpb24sIGJ1
dCBJIGRvbid0IHNlZSBob3cgdGhhdCBjYW4KPj4gcG9zc2libHkgd29yay4KPj4gVGhlIHdheSB0
aGUgQVBJIGlzIGRlc2lnbmVkLCB5b3UgaGF2ZSBubyBndWFyYW50ZWUgKG91dHNpZGUgb2YKPj4g
Y2xrX3JhdGVfZXhjbHVzaXZlXyopIHRoYXQgdGhlIHJhdGUgaXMgZ29pbmcgdG8gY2hhbmdlLgo+
PiBBbmQgY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpIGRvZXNuJ3QgYWxsb3cgdGhlIHJhdGUgdG8g
Y2hhbmdlIHdoaWxlIGluCj4+IHRoZSAiY3JpdGljYWwgc2VjdGlvbiIuCj4+IFNvIHRoZSBvbmx5
IHBvc3NpYmxlIHRoaW5nIHRvIGRvIGlzIGNsa19zZXRfcmF0ZSgpICsKPj4gY2xrX3JhdGVfZXhj
bHVzaXZlX2dldCgpLgo+Cj4gVGhlcmUncyBjbGtfc2V0X3JhdGVfZXhjbHVzaXZlKCkgZm9yIHRo
aXMgcHVycG9zZS4KPgo+PiBTbyB0aGVyZSdzIGEgd2luZG93IHdoZXJlIHRoZSBjbG9jayBjYW4g
aW5kZWVkIGJlIGNoYW5nZWQsIGFuZCB0aGUKPj4gY29uc3VtZXIgdGhhdCBpcyBhYm91dCB0byBs
b2NrIGl0cyByYXRlIHdvdWxkbid0IGJlIGF3YXJlIG9mIGl0Lgo+PiBJIGd1ZXNzIGl0IHdvdWxk
IHdvcmsgaWYgeW91IGRvbid0IGNhcmUgYWJvdXQgdGhlIHJhdGUgYXQgYWxsLCB5b3UganVzdAo+
PiB3YW50IHRvIG1ha2Ugc3VyZSBpdCBkb2Vzbid0IGNoYW5nZS4KPj4gT3V0IG9mIHRoZSA3IHVz
ZXJzIG9mIHRoYXQgZnVuY3Rpb24sIDMgYXJlIGluIHRoYXQgc2l0dWF0aW9uLCBzbyBJIGd1ZXNz
Cj4+IGl0J3MgZmFpci4KPj4gMyBhcmUgb3BlbiB0byB0aGF0IHJhY2UgY29uZGl0aW9uIEkgbWVu
dGlvbmVkIGFib3ZlLgo+PiAxIGlzIGNhbGxpbmcgY2xrX3NldF9yYXRlIHdoaWxlIGluIHRoZSBj
cml0aWNhbCBzZWN0aW9uLCB3aGljaCB3b3JrcyBpZgo+PiB0aGVyZSdzIGEgc2luZ2xlIHVzZXIg
YnV0IG5vdCBpZiB0aGVyZSdzIG11bHRpcGxlLCBzbyBpdCBzaG91bGQgYmUKPj4gZGlzY291cmFn
ZWQuCj4+IAo+Pj4gSW4gdGhpcyBjYXNlIEkgd29uJ3QgYmUgYWJsZSB0byBjaGFuZ2UgdGhlIHJh
dGUgb2YgdGhlIGNsb2NrLCBidXQgdGhhdAo+Pj4gaXMgc2lnbmFsbGVkIGJ5IGNsa19zZXRfcmF0
ZSgpIGZhaWxpbmcgKGlmZiBhbmQgd2hlbiBJIG5lZWQgYXdvdGhlcgo+Pj4gcmF0ZSkgd2hpY2gg
YWxzbyBzZWVtcyB0aGUgcmlnaHQgcGxhY2UgdG8gZmFpbCB0byBtZS4KPj4gV2hpY2ggaXMgaWdu
b3JlZCBieSBsaWtlIGhhbGYgdGhlIGNhbGxlcnMsIGluY2x1ZGluZyB0aGUgb25lIG9kZCBjYXNl
IEkKPj4gbWVudGlvbmVkIGFib3ZlLgo+PiBBbmQgdGhhdCdzIHN1cGVyIGNvbmZ1c2luZyBzdGls
bDogeW91IGNhbiAqYWx3YXlzKiBnZXQgZXhjbHVzaXZpdHksIGJ1dAo+PiBub3QgYWx3YXlzIGRv
IHdoYXRldmVyIHlvdSB3YW50IHdpdGggdGhlIHJhdGUgd2hlbiB5b3UgaGF2ZSBpdD8gSG93IGFy
ZQo+PiBkcml2ZXJzIHN1cHBvc2VkIHRvIHJlY292ZXIgZnJvbSB0aGF0PyBZb3UgY2FuIGhhbmRs
ZSBmYWlsaW5nIHRvIGdldAo+PiBleGNsdXNpdml0eSwgYnV0IGNlcnRhaW5seSBub3Qgd29ya2lu
ZyBhcm91bmQgdmFyaWFibGUgZ3VhcmFudGVlcy4KPj4gCj4+PiBJdCdzIGxpa2UgdGhhdCBzaW5j
ZSBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkgd2FzIGludHJvZHVjZWQgaW4gMjAxNwo+Pj4gKGNv
bW1pdCA1NWU5YjhiN2I4MDZlYzNmOWE4ODE3ZTEzNTk2NjgyYTU5ODFjMTljKS4KPj4gUmlnaHQs
IGJ1dCAiaXQncyBhbHdheXMgYmVlbiB0aGF0IHdheSIgc3VyZWx5IGNhbid0IGJlIGFuIGFyZ3Vt
ZW50LAo+PiBvdGhlcndpc2UgeW91IHdvdWxkbid0IGhhdmUgZG9uZSB0aGF0IHNlcmllcyBpbiB0
aGUgZmlyc3QgcGxhY2UuCj4+IAo+Pj4gQlRXLCBJIGp1c3Qgbm90aWNlZCB0aGF0IG15IGFzc2Vy
dGlvbiAiTW9zdCB1c2VycyBcImtub3dcIiB0aGF0Cj4+PiBbY2xrX3JhdGVfZXhjbHVzaXZlX2dl
dCgpIHJldHVybnMgemVybyB1bmNvbmRpdGlvbmFsbHldIiBpcyB3cm9uZy4gQXMgb2YKPj4+IG5l
eHQtMjAyMzEyMTMgdGhlcmUgYXJlIDMgY2FsbGVycyBpZ25vcmluZyB0aGUgcmV0dXJuIHZhbHVl
IG9mCj4+PiBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KCkgYW5kIDQgdGhhdCBoYW5kbGUgKGltYWdp
bmFyeSkgcmV0dXJuZWQgZXJyb3JzLgo+Pj4gSSBleHBlY3RlZCB0aGlzIGZ1bmN0aW9uIHRvIGJl
IHVzZWQgbW9yZSBleHRlbnNpdmVseS4gKEluIGZhY3QgSSB0aGluawo+Pj4gaXQgc2hvdWxkIGJl
IHVzZWQgbW9yZSBhcyBzZXZlcmFsIGRyaXZlcnMgcmVseSBvbiB0aGUgY2xrIHJhdGUgbm90Cj4+
PiBjaGFuZ2luZy4pCj4+IFllcywgYnV0IGFsc28gaXQncyBzdXBlciBkaWZmaWN1bHQgdG8gdXNl
IGluIHByYWN0aWNlLCBhbmQgbW9zdCBkZXZpY2VzCj4+IGRvbid0IGNhcmUuCj4+IFRoZSBjdXJy
ZW50IHNpdHVhdGlvbiBpcyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+PiAgICAqIE9ubHkgYSBoYW5k
ZnVsIG9mIGRldmljZXMgcmVhbGx5IGNhcmUgYWJvdXQgdGhlaXIgY2xvY2sgcmF0ZSwgYW5kCj4+
ICAgICAgb2Z0ZW4gb25seSBmb3Igb25lIG9mIHRoZWlyIGNsb2NrIGlmIHRoZXkgaGF2ZSBzZXZl
cmFsLiBZb3Ugd291bGQKPj4gICAgICBwcm9iYWJseSBnZXQgYWxsIHRoZSBkZXZpY2VzIHRoYXQg
Y3JlYXRlIGFuIGFuYWxvZyBzaWduYWwgc29tZWhvdwo+PiAgICAgIHRoZXJlLCBzbyBhdWRpbywg
ZGlzcGxheSwgaTJjLCBzcGksIHVhcnRzLCBldGMuIFBsdXMgdGhlIG9uZXMgZG9pbmcKPj4gICAg
ICBmcmVxdWVuY3kgc2NhbGluZyBzbyBDUFUgYW5kIEdQVXMuCj4+ICAgICogQ1BVcyBhbmQgR1BV
cyBhcmUgdmVyeSBsaWtlbHkgdG8gaGF2ZSBhIGRlZGljYXRlZCBjbG9jaywgc28gd2UgY2FuCj4+
ICAgICAgcnVsZSB0aGUgImFub3RoZXIgdXNlciBpcyBnb2luZyB0byBtZXNzIHdpdGggbXkgY2xv
Y2siIGNhc2UuCj4+ICAgICogVUFSVHMvaTJjL2V0Yy4gYXJlIHVzdWFsbHkgdGFraW5nIHRoZWly
IGNsb2NrIGZyb20gdGhlIGJ1cyBpbnRlcmZhY2UKPj4gICAgICBkaXJlY3RseSB3aGljaCBpcyBw
cmV0dHkgbXVjaCBuZXZlciBnb2luZyB0byBjaGFuZ2UgKGZvciBnb29kCj4+ICAgICAgcmVhc29u
KS4gQW5kIHRoZSByYXRlIG9mIHRoZSBidXMgaXMgbm90IHJlYWxseSBsaWtlbHkgdG8gY2hhbmdl
Lgo+PiAgICAqIFNQSS9OQU5EL01NQyB1c3VhbGx5IGhhdmUgdGhlaXIgZGVkaWNhdGVkIGNsb2Nr
IHRvbywgYW5kIHRoZSBidXMKPj4gICAgICByYXRlIGlzIG5vdCBsaWtlbHkgdG8gY2hhbmdlIGFm
dGVyIHRoZSBpbml0aWFsIHNldHVwIGVpdGhlci4KPj4gU28sIHRoZSBvbmx5IGFmZmVjdGVkIGRl
dmljZXMgYXJlIHRoZSBvbmVzIGdlbmVyYXRpbmcgZXh0ZXJuYWwgc2lnbmFscywKPj4gd2l0aCB0
aGUgcmF0ZSBjaGFuZ2luZyBkdXJpbmcgdGhlIGxpZmUgb2YgdGhlIHN5c3RlbS4gRXZlbiBmb3Ig
YXVkaW8gb3IKPj4gdmlkZW8gZGV2aWNlcywgdGhhdCdzIGZhaXJseSB1bmxpa2VseSB0byBoYXBw
ZW4uIEFuZCB5b3UgbmVlZCB0byBoYXZlCj4+IG11bHRpcGxlIGRldmljZXMgc2hhcmluZyB0aGUg
c2FtZSBjbG9jayB0cmVlIGZvciB0aGF0IGlzc3VlIHRvIG9jY3VyLAo+PiB3aGljaCBpcyBmdXJ0
aGVyIHJlZHVjaW5nIHRoZSBjaGFuY2VzIGl0IGhhcHBlbnMuCj4KPiBXZWxsLCB0aGFua3MgZm9y
IEhXIGRlc2lnbmVycywgdGhpcyBleGlzdHMgYW5kIHNvbWUgU29DcyBoYXMgbGVzcyBQTExzIHRo
YW4KPiBuZWVkZWQsIGFuZCB0aGV5IGNhbid0IGJlIGRlZGljYXRlZCBmb3Igc29tZSBodyBibG9j
a3MuCgpJbmRlZWQuIEV2ZW4gaWYgdGhlcmUgYXJlIGVub3VnaCBQTExzLCB0aGUgZXhjbHVzaXZl
IEFQSSBtaWdodCBoZWxwLgpUaGUgaWRlYSBpcyB0byBmb3JjZSB0aGUgc2Vjb25kIGNvbnN1bWVy
IHRvIHBpY2sgYW5vdGhlciAiZnJlZSIgUExMIGlmCml0IG5lZWRzIGFub3RoZXIgcmF0ZS4KCklm
IGl0IGNhbiB3b3JrIHdpdGggdGhlIHJhdGUgY3VycmVudGx5IGxvY2tlZCBieSB0aGUgZmlyc3Qg
Y29uc3VtZXIsCnRoZW4gQ0NGIG1heSBqdXN0IHBpY2sgdGhhdCBvbmUsIHNhdmluZyBhIFBMTCBm
b3IgZnV0dXJlIHVzZS4gSWYgaXQgY2FudCwKdGhlIHByb3RlY3Rpb24gd2lsbCBmb3JjZSB0aGUg
dXNlIG9mIGFub3RoZXIgUExMLgoKV2l0aG91dCB0aGUgZXhjbHVzaXZlIEFQSSwgdGhlIHNlY29u
ZCBjb25zdW1tZXIgbWF5IGp1c3Qgd3JlY2sgdGhlIFBMTCBvZgp0aGUgZmlyc3QgY29uc3VtbWVy
LCByZWdhcmRsZXNzIG9mIHRoZSBvdGhlciBQTEwgYXZhaWxhYmxlLgoKT2YgY291cnNlLCBpZiB0
aGVyZSBpcyBlbm91Z2ggUExMLCB0aGUgb3RoZXIgc29sdXRpb24gaXMgbWFudWFsCmFsbG9jYXRp
b24sIHVzaW5nIGFzc2lnbmVkLXBhcmVudCBhbmQgQ0xLX05PX1JFUEFSRU5ULgoKPgo+PiBSZWFs
aXN0aWNhbGx5IHNwZWFraW5nLCB0aGlzIG9ubHkgb2NjdXJzIHdpdGggbXVsdGktaGVhZCBkaXNw
bGF5IG91dHB1dHMKPj4gd2hlcmUgaXQncyBzb21ld2hhdCBsaWtlbHkgdG8gaGF2ZSBhbGwgdGhl
IGRpc3BsYXkgY29udHJvbGxlcnMgZmVlZGluZwo+PiBmcm9tIHRoZSBzYW1lIGNsb2NrLCBhbmQg
dGhlIHBvd2VyIHVwIG9mIHRoZSB2YXJpb3VzIG91dHB1dCBpcyBkb25lIGluCj4+IHNlcXVlbmNl
IHdoaWNoIGNyZWF0ZXMgdGhhdCBzaXR1YXRpb24uCj4+IEFuZCBldmVuIHRoZW4sIHRoZSBjbGtf
cmF0ZV9leGNsdXNpdmVfKiBpbnRlcmZhY2UgZWZmZWN0aXZlbHkgbG9ja3MgdGhlCj4+IGVudGly
ZSBjbG9jayBzdWJ0cmVlIHRvIGl0cyBjdXJyZW50IHJhdGUsIHNvIHRoZSBlZmZlY3Qgb24gdGhl
IHJlc3Qgb2YKPj4gdGhlIGRldmljZXMgY2FuIGJlIHNpZ25pZmljYW50Lgo+PiBTby4uLiB5ZWFo
LiBFdmVuIHRob3VnaCB5b3UncmUgcmlnaHQsIGl0J3MgdHJ5aW5nIHRvIGFkZHJlc3MgYSBwcm9i
bGVtCj4+IHRoYXQgaXMgc3VwZXIgdW5saWtlbHkgdG8gaGFwcGVuIHdpdGggYSBwcmV0dHkgYmln
IGhhbW1lciB0aGF0IG1pZ2h0IGJlCj4+IHRvbyBtdWNoIGZvciBtb3N0LiBTbyBpdCdzIG5vdCBy
ZWFsbHkgc3VycHJpc2luZyBpdCdzIG5vdCB1c2VkIG1vcmUuCj4KPiBIb25lc3RseSBJIHRyaWVk
IG15IGJlc3QgdG8gZmluZCBhIHNtYXJ0IHdheSB0byBzZXQgdGhlIERTSSBjbG9jayB0cmVlCj4g
d2l0aCBvbmx5IDIgZW5kcG9pbnRzIG9mIHRoZSB0cmVlLCBidXQgQ0NGIHdpbGwgZXhwbG9yZSBh
bGwgcG9zc2liaWxpdGllcwo+IGFuZCBzaW5jZSB5b3UgY2Fubm90IHNldCBjb25zdHJhaW50cywg
bG9ja2luZyBhIHN1Yi10cmVlIGlzIHRoZSBzbWFydGVzdAo+IHdheSBJIGZvdW5kLgo+IEluIHRo
aXMgY2FzZSwgdGhlIFBMTCBpcyBjb21tb24gYmV0d2VlbiB0aGUgRFNJIGNvbnRyb2xsZXIgYW5k
IHZpZGVvIGdlbmVyYXRvciwKPiBzbyB0byBrZWVwIHRoZSBleHBlY3RlZCBjbG9jayByYXRpbywg
dGhlIHNtYXJ0IHdheSBpcyB0byBzZXQgdGhlIGZyZXEgb24KPiBvbmUgc2lkZSwgbG9jayB0aGUg
c3VidHJlZSBhbmQgc2V0IHRoZSByYXRlIG9uIHRoZSBvdGhlciBzaWRlLgo+IEFuIEFQSSBwZXJt
aXR0aW5nIHRvIHNldCBtdWx0aXBsZSByYXRlcyB0byBtdWx0aXBsZSBjbG9ja3MgaW4gYSBzaW5n
bGUgY2FsbAo+IHdvdWxkIGJlIHRoZSBzb2x1dGlvbiwgYnV0IG5vdCBzdXJlIGlmIHdlIGNvdWxk
IHBvc3NpYmx5IHdyaXRlIHN1Y2ggYWxnb3JpdGhtLgo+Cj4+IE1heGltZQo+Cj4gTmVpbAoKCi0t
IApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
