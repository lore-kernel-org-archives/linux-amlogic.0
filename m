Return-Path: <SRS0=R/Kg=GD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB1C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 02:48:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22240206D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Dec 2020 02:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22240206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+rB8FxLHPpzlTUUrHQHVSlBOx9VO9oCKiXssvoC4gng=; b=EmIiVfOJkknR35EkQtJs7xh6t
	RQye8rXK6zGa/jba3PeplIOsWm2mjIBS6oky2GtpT/6SnySKl8WzwZSaqp9riPicFS1yNgQLuqPRg
	c0Xu054bLZPJ+hpCFHhf6pkieZA0HyWOOc/nVYkkFIrfJNCmkQ4cvFZwZAf7NoNC2EnhnXSrLReGw
	NP1yPTxfAF0dUcmyCdckbjZaKhkDwyWktIW1OqSb+C4TNhBeCXtKzmoLVsc9v6vXHlSOslrFOLR/P
	qeBpT8QMw+U0fywH4Kqqa37e7ORWk41XV2aWocLjnhhYMo2fQLIyYAsDxf+m+TTFgbcJa1rkVw83T
	UQd3ESIUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuo0J-0002Nv-Vz; Thu, 31 Dec 2020 02:47:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuo0G-0002NO-8Q; Thu, 31 Dec 2020 02:47:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id a6so6399690wmc.2;
 Wed, 30 Dec 2020 18:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uUa8PGFvQ1Nvv0Amw2GKK2Th/K2C6f4QRsmd3CKEORY=;
 b=ey6xHkgPn+Tbwb+3sSG8iMG/XpU0ZmYxL3+LyHDbS74QzKq++QTCgb49u+3wRngW7T
 jmWkyNX80fFkddKnguVV9HRJ6FCsejW8tIl2JFEmUsBerN8DpNSYzMpn5S3YUTxaxLaL
 UDYzqzZLaXN6lgsn5jHro0U9SCbFVqLApd5b68rarc3YtIl+5q5zk7WIdoa6IbOAsNS1
 dADrXtgoeN8omD1ggMma3kUNpwE6ZlH4kcLfAwg4dE1DENw3+B67zm3CCepmepeO7xkk
 3X/Ju7T4XTqonKd45s3tatTAFm8YdIZ5ZAYv2mf1/WvGGGVSM9kctFtwP8ggzNHbuYaz
 LP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uUa8PGFvQ1Nvv0Amw2GKK2Th/K2C6f4QRsmd3CKEORY=;
 b=ZrI5TO12TCfBplHWHi+EDyETDmaFSugnAAOJihbQYeQ7WGfSVfJ++WeQkFskHd0Q3G
 rlZArpvtD6JakqPKYsA6SqGdf2kz34ST6tQA8yeAcJnod5M+TjFwQgwXkqizjwkJXyRF
 wpSYf9c/PvObRWBc+76+VCQeNli+PB+7Fa7zyUaNLOdSLb0ol2v0GUugGzwR2tulnpJ0
 U+sjW8xcxEC+634843dqU98DOXEhaun3WVkWEhfr2WuYI2D7ff2vmNAtuvvg/cm1/EyA
 UowP/KALalJSzt6UuKNrGURnC9SZY0Eltxqh8AY3WqivMIy/1e/f9K76NXoTgyZka/Ig
 I6pw==
X-Gm-Message-State: AOAM5337kTPT9LxLdlWoxvwSe8BGGvcVaVDvB48bditlDpr+JQeqTBDn
 K+bNXLQc+Wagg6j91JOlmdI=
X-Google-Smtp-Source: ABdhPJzPfV+OGIvkTCps1CXTf5mzKRTCy/Z2ALL44icJEGXDlTvkk+WIigwKnH0fS1+hlozjejxO5A==
X-Received: by 2002:a05:600c:21d1:: with SMTP id
 x17mr9849152wmj.160.1609382870942; 
 Wed, 30 Dec 2020 18:47:50 -0800 (PST)
Received: from [10.127.0.11] ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id b83sm10526090wmd.48.2020.12.30.18.47.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Dec 2020 18:47:50 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add initial Beelink GS-King-X
 device-tree
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCCUV4piTy7n83GsV9Tny+JYA9_AXS0uiv5FeNPYejNR-Q@mail.gmail.com>
Date: Thu, 31 Dec 2020 06:47:46 +0400
Message-Id: <7D798BA5-B2C4-4F9E-BFAE-658C982741D6@gmail.com>
References: <20201230103729.2272-1-christianshewitt@gmail.com>
 <20201230103729.2272-3-christianshewitt@gmail.com>
 <CAFBinCCUV4piTy7n83GsV9Tny+JYA9_AXS0uiv5FeNPYejNR-Q@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3445.104.17)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_214752_436549_F345522D 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMzEgRGVjIDIwMjAsIGF0IDQ6MjMgYW0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+IAo+IE9uIFdlZCwgRGVjIDMw
LCAyMDIwIGF0IDExOjM4IEFNIENocmlzdGlhbiBIZXdpdHQKPiA8Y2hyaXN0aWFuc2hld2l0dEBn
bWFpbC5jb20+IHdyb3RlOgo+PiAKPj4gVGhlIFNoZW56ZW4gQVpXIChCZWVsaW5rKSBHUy1LaW5n
LVggaXMgYmFzZWQgb24gdGhlIEFtbG9naWMgVzQwMCByZWZlcmVuY2UKPj4gYm9hcmQgd2l0aCBh
biBTOTIyWC1IIGNoaXAuCj4+IAo+PiAtIDRHQiBMUEREUjQgUkFNCj4+IC0gNjRHQiBlTU1DIHN0
b3JhZ2UKPj4gLSAxMC8xMDAvMTAwMCBCYXNlLVQgRXRoZXJuZXQKPj4gLSBBUDYzNTZTIFdpcmVs
ZXNzICg4MDIuMTEgYS9iL2cvbi9hYywgQlQgNC4xKQo+PiAtIEhETUkgMi4xIHZpZGVvCj4+IC0g
Uy9QRElGIG9wdGljYWwgb3V0cHV0Cj4gYXJlIHlvdSBwbGFubmluZyB0byBlbmFibGUgdGhpcyBh
bHNvPwoKSSBwbGFuIHRvIGFkZCB0aGlzIGxhdGVyIChhZnRlciB2MSBjb21tZW50cykuCgo+PiAt
IDJ4IEVTUzkwMTggYXVkaW8gREFDcwo+PiAtIDR4IFJpY29yIFJUNjg2MiBhdWRpbyBhbXBzCj4+
IC0gQW5hbG9ndWUgaGVhZHBob25lIG91dHB1dAo+IHRoZXJlJ3Mgbm8gZHJpdmVyIGZvciB0aGF0
IERBQyBzbyBJIHRoaW5rIHRoYXQncyB3aHkgeW91IGFyZSBub3QgZW5hYmxpbmcgdGhlbQoKRVNT
OTAxOCBpcyB1c2VkIHdpdGggc29tZSBSYXNwYmVycnkgUGkgREFDIGJvYXJkcyBzbyB0aGVyZSBt
YXkgYmUgc29tZSBwcmlvcgphcnQgdG8gYnVpbGQgdXBvbi4gSG93ZXZlciBpdOKAmXMgbm90IGNs
ZWFyIChldmVuIHdpdGggc2NoZW1hdGljcykgaG93IHRoZSBEQUMKYW5kIEFNUCBhcmUgY29udHJv
bGxlZCAodGhleSBsb29rIGxpa2UgZHVtYiBpbnB1dC9vdXRwdXQgZGV2aWNlcykgc28gdGhpcyBp
cwpzdGlsbCB0byBiZSBleHBsb3JlZC4KCj4+IC0gMXggVVNCIDIuMCBPVEcgcG9ydAo+PiAtIDN4
IFVTQiAzLjAgcG9ydHMKPj4gLSBJUiByZWNlaXZlcgo+PiAtIDF4IG1pY3JvIFNEIGNhcmQgc2xv
dCAoaW50ZXJuYWwpCj4+IC0gVVNCIFNBVEEgY29udHJvbGxlciB3aXRoIDJ4IDMuNSIgZHJpdmUg
YmF5cwo+PiAtIDF4IFBvd2VyIG9uL29mZiBidXR0b24KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+IEkgZG9uJ3Qga25v
dy9oYXZlIHRoaXMgYm9hcmQgYnV0IGFsc28gSSBkb24ndCBzZWUgYW55dGhpbmcgcHJvYmxlbWF0
aWMgc286Cj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+CgpUaHghCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
