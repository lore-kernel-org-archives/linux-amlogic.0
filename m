Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E2FC00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Aug 2022 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYISPtkVSYC3W22+c/L6nVIiYlE9OyHCghhYphHE1Sk=; b=mp5gaul9KHb16n
	thZKKuoBwPm/ZHPkRnmur7fyJ46dFzVt/Tio49SCGue7Pef8IS78J8RbWE1LdDBDoy8/ZDzGSiGTN
	I+LeHnjUW+diJy+ca1QJtES/YvYCv5avbw5y125luNIXQeSp0wu2zgCThxU7QqG22YU//CBLmES1Z
	1JlmeO+7Bxy4xNRR9W73gmRpJy8uMFRZDaI+8MWf83be7mL81KksUzdnNCNpdCfek3AV0T4/mNA4D
	uZ63/q4IQIQWpQY0gIwOukv+PLpQSrrn6XIbC0T//ahkGc4s1Z/HFXf+/tpH6sBna9302S5Bjh1/e
	z1VjFjXqzUCHJoJ1RQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQts1-00EgIh-4j; Wed, 24 Aug 2022 17:08:49 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQtri-00Eg8a-OV; Wed, 24 Aug 2022 17:08:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id m5so14217190lfj.4;
        Wed, 24 Aug 2022 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc;
        bh=d+0sUP6TSKAiALBIXDZGYdNvi1F0yA0KJXnjoK2G2T8=;
        b=o3Gvvtf7KSV4tiw6VYPIJEAh479Uovr253pXVInVVaECnk6jFELDM6fxh9wl8+9FsW
         17R1qztaIRSST5xXH/PTplmH3+scKpeeAADuFYik2/15xjAz/2n3RdtU80ceqJ/sYCkr
         o7OX+zS4VJqL8EQDEgFSWpqS8tRSAK3rfe4sEEwa1m1m1ThQK4aElW43U7P1TaQIbJiB
         p2lv2+LNFuRXaqnOJbnZNRnrqXJgL66+fz6VBLS9wCEwnmuOM48+6upvyp2JhhRlI1Wr
         jjCcDSezsqKhjLcL8vsnBJkcFKCwQKpT9QQ2M9OJA6RYaN0Wz7tvgxK55ayzuGzRplq9
         KOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc;
        bh=d+0sUP6TSKAiALBIXDZGYdNvi1F0yA0KJXnjoK2G2T8=;
        b=lrAcGe/fd1/7YB0h8d6KUZ/+6KQoXq3IzzWRhyr/Y6vnWhEpPY8CnYp+ALlUTfSS0q
         k3LnTnUyX5r4JMiyVvsQcqva+O0tAGOSqlfFFWN8DYtyv7k1+kGXPPxudvmJZZvew72g
         adu1Ihiztv/uOEUo6hCs02NDZp9JLQyqdaogmbkoYE43EqWK1sMOaZjbNBAY1z/WvVw9
         11d5QxHJdUTfVBpcM8+jdlX0ddp/hXqEAaPDTif8uU0y7IQ+Pzi47Shxt0xQTCa+izfX
         VUt5hVbxIzUw/vLf86Uns/2ty4PocbZBstd8EzTqyCxQ2/3bI/qIUrD34u+fShPwnayc
         6YGA==
X-Gm-Message-State: ACgBeo3JYbR2lr5CtV1Nwaq+nk00jJMRP2oRiB8blhV/mVjp7mdsd6hP
	IyictztwJEFUTazwftfzTpk=
X-Google-Smtp-Source: AA6agR5cz1tKv0yfrrQuMBGx5Y9mKvqvHWQ2qHORxA31eXjsfhACgWXyuZD/7Wc/aX7wwd3M3XFp3w==
X-Received: by 2002:a05:6512:22d3:b0:48c:df73:d0a4 with SMTP id g19-20020a05651222d300b0048cdf73d0a4mr10044284lfu.584.1661360908835;
        Wed, 24 Aug 2022 10:08:28 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
        by smtp.googlemail.com with ESMTPSA id j24-20020ac253b8000000b00492df78f311sm13975lfh.57.2022.08.24.10.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 10:08:28 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <baee6917-dada-9ab2-9244-d6679e91033f@gmail.com>
Date: Wed, 24 Aug 2022 19:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
 <eedb1a86-c1fb-cc76-2a43-4ed349d7d826@tronnes.org>
 <20220824154543.bdtpz2evwzsjrdrz@houat>
In-Reply-To: <20220824154543.bdtpz2evwzsjrdrz@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_100830_823512_3302EA45 
X-CRM114-Status: GOOD (  17.30  )
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

SGkgTWF4aW1lICYgTm9yYWxmLAoKVyBkbml1IDI0LjA4LjIwMjIgbyAxNzo0NSwgTWF4aW1lIFJp
cGFyZCBwaXN6ZToKPiBIaSBOb3JhbGYsCj4KPiBPbiBTYXQsIEF1ZyAyMCwgMjAyMiBhdCAxMDox
ODo0N1BNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+IERlbiAyOS4wNy4yMDIyIDE4
LjM1LCBza3JldiBNYXhpbWUgUmlwYXJkOgo+Pj4gT3VyIG5ldyB0diBtb2RlIG9wdGlvbiBhbGxv
d3MgdG8gc3BlY2lmeSB0aGUgVFYgbW9kZSBmcm9tIGEgcHJvcGVydHkuCj4+PiBIb3dldmVyLCBp
dCBjYW4gc3RpbGwgYmUgdXNlZnVsLCBmb3IgZXhhbXBsZSB0byBhdm9pZCBhbnkgYm9vdCB0aW1l
Cj4+PiBhcnRpZmFjdCwgdG8gc2V0IHRoYXQgcHJvcGVydHkgZGlyZWN0bHkgZnJvbSB0aGUga2Vy
bmVsIGNvbW1hbmQgbGluZS4KPj4+Cj4+PiBMZXQncyBhZGQgc29tZSBjb2RlIHRvIGFsbG93IGl0
LCBhbmQgc29tZSB1bml0IHRlc3RzIHRvIGV4ZXJjaXNlIHRoYXQgY29kZS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4KPj4+Cj4+Cj4+IElu
IHRoZSBzdWJqZWN0IGl0IHNheXMgInR2X21vZGUgcHJvcGVydHkiLCBidXQgdGhlIHByb3BlcnR5
IGlzIGNhbGxlZAo+PiAidHYgbm9ybSIsIHNvIHRoZSBvcHRpb24gc2hvdWxkIGJlIHR2X25vcm0/
Cj4KPiBZZWFoLi4uIEkgZG9uJ3Qga25vdy4gbW9kZSBpcyB0YWtlbiBidXQgaXQncyBvYnZpb3Vz
bHkgdGhlIGJlc3QgbmFtZS4gU28KPiBJIHdlbnQgd2l0aCBub3JtIHRvIGF2b2lkIHRoZSAoaW50
ZXJuYWwpIGNvbmZsaWN0IGJ1dCBJIGxlZnQgbW9kZSBmb3IKPiB0aGUgdXNlciBmYWNpbmcgcHJv
cGVydHkuCj4KPiBJJ20gbm90IHN1cmUgd2hhdCdzIGJlc3QgaGVyZSwgb3IgbWF5YmUgd2UgY2Fu
IHBpY2sgYW5vdGhlciBuYW1lIGVudGlyZWx5PwoKSSB0aGluayAic3RhbmRhcmQiIGFuZCAic3lz
dGVtIiBhcmUgYWxzbyBmYWlybHkgY29tbW9uIG5hbWVzIGZvciB0aGlzIHByb3BlcnR5LgoKSSBv
bmNlIGhhZCBhbiBvbGQgbXVsdGktc3RhbmRhcmQgU2hhcnAgQ1JUIFRWIHRoYXQgYWxsb3dlZCBt
YW51YWxseSBzZWxlY3RpbmcKdGhlIGV4cGVjdGVkIGNvbG9yIGVuY29kaW5nIChQQUwvU0VDQU0v
TlRTQy9OVFNDLTQ0MyksIGFuZCB0aGUgcmVsZXZhbnQgYnV0dG9uCm9uIHRoZSByZW1vdGUgd2Fz
IGxhYmVsZWQgIlNZU1RFTSIuCgpWNEwyIGNhbGxzIHRoaXMgInN0YW5kYXJkIiwgc2VlIGluY2x1
ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCwgY29tcGFyZSB3aXRoCnY0bDJfc3RkX2lkLCBWNEwy
X1NURF8qIGV0Yy4KCkJUVywgbWF5YmUgcmV1c2luZyB0aG9zZSBWNEwyIGNvbnN0YW50cywgb3Ig
YWxpZ25pbmcgdGhlIG51bWVyaWNhbCB2YWx1ZXMsCndvdWxkIG1ha2Ugc29tZSBzZW5zZT8KCj4K
PiBNYXhpbWUKCkJlc3QgcmVnYXJkcywKTWF0ZXVzeiBLd2lhdGtvd3NraQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
