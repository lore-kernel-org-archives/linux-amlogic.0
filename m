Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CA3C5321E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5nNUF9z46Gn3Qa0I6oM/GJ9q8K97eVcZ3QdRppARQk=; b=KzrtXCxuR39TqM
	nCIBqNMYoMd87ZOQuXQqbEv6p4DpCF1ylfCM8DQdI51uuq4KPSD5WMdULqfzeulaNvMUn+jxsrCyD
	83u5ooQ+AYVDNHgh9WLBRl5mR+CfQNbGDbUMl/CZuzJ5ZoPDE+gTq+Hjxh3T0zGK4mCN7PTqkRFks
	w1Wznz1c3/ha/exGCKPEAsWwKKWl6XiEoDBdgTBaKuiLnEb7LkJDIQDy6OyQSIcSy+pxiNyWHKrhn
	jdowe8mmXz6qsljzx0JTJsomeAxhQ1YTOB0lgG597QiZPz1rLXUL+k6ZZiE0QyVCQ5tdPLCWCaoqd
	g+rw7U6ZMbwCpku3jSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYkl-00000007IZB-2e4C;
	Mon, 26 Aug 2024 12:23:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siYjy-00000007INY-2mKv
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Aug 2024 12:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A9B1A427BD
	for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2024 12:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A864C5676D
	for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2024 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724674469;
	bh=fPunrM8wQmioX20CPKHx2jmPcu0ptHjNsZuRqPqcdBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bl4JKknExI0/Akf8Pn3jp1o9ioLn7g0g/I6y8kRHDH/vsIfFbvl9zkTyKrNM/cSD5
	 CN82TM87IycmdUHF/mr1n17OMtptMN+HIVNk+ORpFp0v0Kah/TWzPlCmzLCbCrtBCY
	 djaYhIDWrbgJDjsZNua0QfA3JUVnA/jkpoHm4KYTdxRlKpUue0J4igVCMvvG4LPsD+
	 NrLP8e0auODuAhko+atjos9/k+8c+GJ6L3yAvOWpuRUvPsUtgUaKbKBcMYKYlOd4Wm
	 lglFBZpXZDalLSznIb/iEMa66QSW6xABX8CPqmYrS8wPkyzbJ7GdHGfhB7GUhjN9B3
	 SSTYl5RPU9SSQ==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5af7ae388so2959252eaf.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2024 05:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/MmLCxip9qZwQTH3F/YJQ2zAT251V7kfoo++Vos796VYQePaz5ZFqFAwp8tqlg7ckHCIbxRl0fzo+ueCy@lists.infradead.org
X-Gm-Message-State: AOJu0YyRs97Wkui3DRp1tnt2saYkvFMt4i9ZSYr+9bR9b5yG5rZC4aAd
	4ImEoyZGrcLjW58Dp28t/8SowF+iFVdZXp+qV/P0tNCdkdUpZeGtix76JLKzXEiZHZcMNAdYEUt
	ZTaE1kvl6i4TnGjMZPgrALLmXTXI=
X-Google-Smtp-Source: AGHT+IHHIxz6xXD0eumhtaQ76KUnOsLvK/0jHEg0Pa8eJhhrxY2DehTK1l7SfWk+MDuetN59VRcDB1RzH8KdDg1MoWw=
X-Received: by 2002:a05:6870:a11e:b0:260:26a2:68e8 with SMTP id
 586e51a60fabf-273e44fafabmr4131563fac.4.1724674468431; Mon, 26 Aug 2024
 05:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <2205737.irdbgypaU6@rjwysocki.net> <CGME20240826113153eucas1p110e90b4cd98aa70601770fe93d7aa1e5@eucas1p1.samsung.com>
 <2236794.NgBsaNRSFp@rjwysocki.net> <ef729a47-b7f9-48b6-a14d-692565ef1d38@samsung.com>
In-Reply-To: <ef729a47-b7f9-48b6-a14d-692565ef1d38@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 26 Aug 2024 14:14:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gOqNi+-Hi8uyeEJ9dHzhwU6GyL6t_7Xjt5Knf2yJmH-w@mail.gmail.com>
Message-ID: <CAJZ5v0gOqNi+-Hi8uyeEJ9dHzhwU6GyL6t_7Xjt5Knf2yJmH-w@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] thermal/of: Use the .should_bind() thermal zone callback
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PM <linux-pm@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
	Mateusz Majewski <m.majewski2@samsung.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_052234_897949_54E9AFB3 
X-CRM114-Status: GOOD (  26.02  )
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTozMuKAr1BNIE1hcmVrIFN6eXByb3dza2kKPG0uc3p5
cHJvd3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBPbiAxOS4wOC4yMDI0IDE4OjMwLCBSYWZh
ZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IEZyb206IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwu
ai53eXNvY2tpQGludGVsLmNvbT4KPiA+Cj4gPiBNYWtlIHRoZSB0aGVybWFsX29mIGRyaXZlciB1
c2UgdGhlIC5zaG91bGRfYmluZCgpIHRoZXJtYWwgem9uZSBjYWxsYmFjawo+ID4gdG8gcHJvdmlk
ZSB0aGUgdGhlcm1hbCBjb3JlIHdpdGggdGhlIGluZm9ybWF0aW9uIG9uIHdoZXRoZXIgb3Igbm90
IHRvCj4gPiBiaW5kIHRoZSBnaXZlbiBjb29saW5nIGRldmljZSB0byB0aGUgZ2l2ZW4gdHJpcCBw
b2ludCBpbiB0aGUgZ2l2ZW4KPiA+IHRoZXJtYWwgem9uZS4gIElmIGl0IHJldHVybnMgJ3RydWUn
LCB0aGUgdGhlcm1hbCBjb3JlIHdpbGwgYmluZCB0aGUKPiA+IGNvb2xpbmcgZGV2aWNlIHRvIHRo
ZSB0cmlwIGFuZCB0aGUgY29ycmVzcG9uZGluZyB1bmJpbmRpbmcgd2lsbCBiZQo+ID4gdGFrZW4g
Y2FyZSBvZiBhdXRvbWF0aWNhbGx5IGJ5IHRoZSBjb3JlIG9uIHRoZSByZW1vdmFsIG9mIHRoZSBp
bnZvbHZlZAo+ID4gdGhlcm1hbCB6b25lIG9yIGNvb2xpbmcgZGV2aWNlLgo+ID4KPiA+IFRoaXMg
cmVwbGFjZXMgdGhlIC5iaW5kKCkgYW5kIC51bmJpbmQoKSB0aGVybWFsIHpvbmUgY2FsbGJhY2tz
IHdoaWNoCj4gPiBhc3N1bWVkIHRoZSBzYW1lIHRyaXAgcG9pbnRzIG9yZGVyaW5nIGluIHRoZSBk
cml2ZXIgYW5kIGluIHRoZSB0aGVybWFsCj4gPiBjb3JlICh0aGF0IG1heSBub3QgYmUgdHJ1ZSBh
bnkgbW9yZSBpbiB0aGUgZnV0dXJlKS4gIFRoZSAuYmluZCgpCj4gPiBjYWxsYmFjayB3b3VsZCB3
YWxrIHRoZSBnaXZlbiB0aGVybWFsIHpvbmUncyBjb29saW5nIG1hcHMgdG8gZmluZCBhbGwKPiA+
IG9mIHRoZSB2YWxpZCB0cmlwIHBvaW50IGNvbWJpbmF0aW9ucyB3aXRoIHRoZSBnaXZlbiBjb29s
aW5nIGRldmljZSBhbmQKPiA+IGl0IHdvdWxkIGNhbGwgdGhlcm1hbF96b25lX2JpbmRfY29vbGlu
Z19kZXZpY2UoKSBmb3IgYWxsIG9mIHRoZW0gdXNpbmcKPiA+IHRyaXAgcG9pbnQgaW5kaWNlcyBy
ZWZsZWN0aW5nIHRoZSBvcmRlcmluZyBvZiB0aGUgdHJpcHMgaW4gdGhlIERULgo+ID4KPiA+IFRo
ZSAuc2hvdWxkX2JpbmQoKSBjYWxsYmFjayBzdGlsbCB3YWxrcyB0aGUgdGhlcm1hbCB6b25lJ3Mg
Y29vbGluZyBtYXBzLAo+ID4gYnV0IGl0IGNhbiB1c2UgdGhlIHRyaXAgb2JqZWN0IHBhc3NlZCB0
byBpdCBieSB0aGUgdGhlcm1hbCBjb3JlIHRvIGZpbmQKPiA+IHRoZSB0cmlwIGluIHF1ZXN0aW9u
IGluIHRoZSBmaXJzdCBwbGFjZSBhbmQgdGhlbiBpdCB1c2VzIHRoZQo+ID4gY29ycmVzcG9uZGlu
ZyAnY29vbGluZy1kZXZpY2UnIGVudHJpZXMgdG8gbG9vayB1cCB0aGUgZ2l2ZW4gY29vbGluZwo+
ID4gZGV2aWNlLiAgVG8gYmUgYWJsZSB0byBtYXRjaCB0aGUgdHJpcCBvYmplY3QgcHJvdmlkZWQg
YnkgdGhlIHRoZXJtYWwKPiA+IGNvcmUgdG8gYSBzcGVjaWZpYyBkZXZpY2Ugbm9kZSwgdGhlIGRy
aXZlciBzZXRzIHRoZSAncHJpdicgZmllbGQgb2YgZWFjaAo+ID4gdHJpcCB0byB0aGUgY29ycmVz
cG9uZGluZyBkZXZpY2Ugbm9kZSBwb2ludGVyIGR1cmluZyBpbml0aWFsaXphdGlvbi4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRl
bC5jb20+Cj4KPiBUaGlzIHBhdGNoIGxhbmRlZCByZWNlbnRseSBpbiBsaW51eC1uZXh0IGFzIGNv
bW1pdCA2ZDcxZDU1YzNiMTIKPiAoInRoZXJtYWwvb2Y6IFVzZSB0aGUgLnNob3VsZF9iaW5kKCkg
dGhlcm1hbCB6b25lIGNhbGxiYWNrIikKCkl0IGhhcyBiZWVuIGZpeGVkIHNpbmNlIGFuZCBpdCBp
cyBjb21taXQgIDk0YzYxMTBiMGIxM2M2NDE2MTQ2IG5vdy4KCkJvdHRvbSBsaW5lIGlzIHRoYXQg
aXQgd2FzIGNhbGxpbmcgb2Zfbm9kZV9wdXQoKSB0b28gbWFueSB0aW1lcyBkdWUgdG8KYSBjb2Rp
bmcgbWlzdGFrZS4KCj4gSW4gbXkgdGVzdHMgSSBmb3VuZCB0aGF0IGl0IGJyZWFrcyBib290aW5n
IHNvbWUgb24gbXkgdGVzdCBib2FyczogRXh5bm9zLWJhc2VkCj4gKE9kcm9pZFhVNCB3aXRoIEFS
TTMyIGJpdCBrZXJuZWwgZnJvbSBtdWx0aV92N19kZWZjb25maWcpIGFuZCBBbWxvZ2ljCj4gTWVz
b24gYmFzZWQgYm9hcmRzIChPZHJvaWRDNCwgVklNMyB3aXRoIEFSTTY0IGRlZmNvbmZpZytzb21l
IGRlYnVnCj4gb3B0aW9ucykuIFJldmVydGluZyAkc3ViamVjdCBvbiB0b3Agb2YgbmV4dC0yMDI0
MDgyMyB0b2dldGhlciB3aXRoCj4gYzFlZTZlMWY2OGY1ICgidGhlcm1hbDogY29yZTogQ2xlYW4g
dXAgdHJpcCBiaW5kL3VuYmluZCBmdW5jdGlvbnMiKSBhbmQKPiA1MjY5NTQ5MDA0NjUgKCJ0aGVy
bWFsOiBjb3JlOiBEcm9wIHVudXNlZCBiaW5kL3VuYmluZCBmdW5jdGlvbnMgYW5kCj4gY2FsbGJh
Y2tzIikgZHVlIHRvIGNvbXBpbGUgZGVwZW5kZW5jaWVzIGZpeGVzIHRoZSBpc3N1ZS4KClRoYW5r
cyBmb3IgdGhlIHJlcG9ydCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
