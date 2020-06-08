Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29850C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 12:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11522064C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 12:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WSN1UQ/J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0loXIBUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11522064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdVrNxD2dqBCyffoLaZ2NrOW/hNFYYQ+qs7uOb0ttwE=; b=WSN1UQ/JBG8D4q
	FBrfe0pFxeYqMUDCWdotWue+vUlMz06MXPrnPVkr0WlOBn1KJI9oGMOMKQTlbBrJqL3fdRBc9b4fa
	uYfOTaDCaXhoh+CofqoTZ8Lt1f9vJbGWIsvk8TJx9mMw9IBU5zMwLQvO4WctQZ/9sJY7u2nh0EoeE
	CYuUhQxdP+xAIOqExnbZYYiOt1UxRXkli0kl+sMV28pUBVkDNuvArR8HAdV2OIbDqMMI9mKSOVVHP
	csKEF7Pbox6BoGFoGgrPv8cHLIV3udjYwaR+Zt22jNiYz6+h2glULIQe1aKqQnl5DeQAQDfJ0xyw2
	Vui3PTdYyeAaOdt2ZP0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiH9d-0002nF-Hg; Mon, 08 Jun 2020 12:45:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiH9a-0002mR-67
 for linux-amlogic@lists.infradead.org; Mon, 08 Jun 2020 12:45:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id y17so17227837wrn.11
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Jun 2020 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kzrIHDMd1rJH0AYfztwR/dcAaSAkML42UEE2ly3amJA=;
 b=0loXIBUS7dwSHa3aONVP5pLg2sVnVA9pto08hPlYb4s+0wxBbOCXQvHxjPdJ4Si/bQ
 nQKQOjrwe1mlXB7NZcFCS93xG8qWBUxezAEqJQ7GWl47pd3102vfLxFQCFzgbLXHsAD2
 qRNCmdeiBDeExVvCdDyOkRL4mcT7acS/zeK4j7N90pSTeUKZdZzZCd+G9w5aTzE6Efsd
 tA1mENtIEHRJIle17VXFKdi2+pDV5SroXKXkOcQjkCGNqyhvxwLQSAtXfsm7OLaAVe+t
 WkaGSySy4IZS+4iR+R7UMI3f2lNgRltv0VAQpwvxrfp43w1hb06TxZ2Sdr6E57TNkcML
 SjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kzrIHDMd1rJH0AYfztwR/dcAaSAkML42UEE2ly3amJA=;
 b=KXZbcL+ygPr1nAve+3/vKV56d6KHlOEWEztFhOqcbn+AALSZaFd0yju2LG+laBOkLD
 FsVlhXPrE5WbCzVYWUzpJ39OfVLCGL6IhH+tuv7a1JHpw9jU1FZRuqSBZaCXpMHsF2J/
 UIFZ0cddpumKARcHaG45r6ljFOsPpsEqhUyD0NBzwVI9JFpPSkCcfsy5DpEqP+vZ4bfv
 122PiYtcvSqV7OMB7TvfbrwPt4vZelKyv/CYj2fEtiqfvCIoNvIaFsoi3vyU68nfGlpa
 2+3orFjJgscnj5K80yH/m5xEdIudlgeJQbD5OAGlxmRHR3HgV1HEYRqkirIPOlczNhF0
 SmXA==
X-Gm-Message-State: AOAM5327mk270oa6QGrtNBys01AWSk/CYRnzMm87bdwXB72m5z07L6/E
 O03gBv7xp9BjT98RjLnGdnSiGw==
X-Google-Smtp-Source: ABdhPJzyPn/T0BJF5ZEN9eFOSVxFBb9USHKPP+PjaW+ScH7wgedmbc08GM2FhW1bpBSpZBP7lW0/wg==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr23860485wrm.168.1591620324100; 
 Mon, 08 Jun 2020 05:45:24 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:22:5867:d2c6:75f4?
 ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id j190sm22691969wmb.33.2020.06.08.05.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 05:45:23 -0700 (PDT)
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: Fix S905X3 ID
To: Christian Hewitt <christianshewitt@gmail.com>
References: <20200604044808.30995-1-christianshewitt@gmail.com>
 <7d58e4db-2893-3675-eb93-ea14c3534b5b@baylibre.com>
 <ACA41DA3-88A4-4141-AEAD-C056C9834B6B@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f037849a-0a23-8fdf-f953-28f62c0f9c62@baylibre.com>
Date: Mon, 8 Jun 2020 14:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ACA41DA3-88A4-4141-AEAD-C056C9834B6B@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_054526_222652_DB3B76A7 
X-CRM114-Status: GOOD (  20.45  )
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

T24gMDgvMDYvMjAyMCAxMzozMiwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiAKPj4gT24gOCBK
dW4gMjAyMCwgYXQgMTI6NTggcG0sIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJl
LmNvbT4gd3JvdGU6Cj4+Cj4+PiBUaGUgY3VycmVudCB2YWx1ZSBpcyB0YWtlbiBmcm9tIEFtbG9n
aWMncyA0LjkgYnNwIGtlcm5lbCB3aGljaCBhcHBlYXJzCj4+PiB0byB1c2UgdGhlIHdyb25nIElE
LiBGb3IgY29tcGFyaXNvbiwgaGVyZSdzIGJlZm9yZS9hZnRlcjoKPj4+Cj4+PiBbICAgIDAuMTUy
MjM3XSBzb2Mgc29jMDogQW1sb2dpYyBNZXNvbiBTTTEgKFVua25vd24pIFJldmlzaW9uIDJiOmMg
KDEwOjIpIERldGVjdGVkCj4+PiBbICAgIDAuMTUyNDYzXSBzb2Mgc29jMDogQW1sb2dpYyBNZXNv
biBTTTEgKFM5MDVYMykgUmV2aXNpb24gMmI6YyAoMTA6MikgRGV0ZWN0ZWQKPj4KPj4gRm9yIFNN
MSB3ZSBoYXZlIHdlaXJkIHZhbHVlcywgaGVyZSBhcmUgdGhlIG9uZSB3ZSBnZW4gb24gS2VybmVs
Q0k6Cj4+IFNFSTYxMCAoUzkwNUQzKToKPj4gQW1sb2dpYyBNZXNvbiBTTTEgKFVua25vd24pIFJl
dmlzaW9uIDJiOmMgKDUwOjIpCj4+Cj4+IFZJTTNMIChTOTA1RDMpCj4+IEFtbG9naWMgTWVzb24g
U00xIChVbmtub3duKSBSZXZpc2lvbiAyYjpjICg0OjIpCj4+Cj4+IEFuZCB5b3UgcmVwb3J0IG5v
dzoKPj4gT2Ryb2lkLUM0IChTOTA1WDQpCj4+IEFtbG9naWMgTWVzb24gU00xIChVbmtub3duKSBS
ZXZpc2lvbiAyYjpjICgxMDoyKQo+Pgo+PiBBbmQgYXQgdGhlIHRpbWUgeW91IHJlcG9ydGVkOgo+
PiBWSU0zTCAoUzkwNUQzKQo+PiBBbWxvZ2ljIE1lc29uIFNNMSAoUzkwNUQzKSBSZXZpc2lvbiAy
YjpjIChiMDoyKQo+Pgo+PiBTbyBJJ20gcXVpdGUgbG9zdCBoZXJl4oCmLgo+IAo+IEluIFsxXSB5
b3UgYWRkZWQgdGhlIFNNMSBTb0MgSUQgYW5kIFM5MDVYMyBJRCB7ICJTOTA1WDMiLCAweDJiLCAw
eDUsIDB4ZiB9Cj4gd2hpY2ggbWF0Y2hlcyB0aGUgQlNQIGtlcm5lbCBzb3VyY2UuCj4gCj4gSW4g
WzJdIEkgYWRkZWQgYSBzZWNvbmQgUzkwNVgzIElEIHsgIlM5MDVYMyIsIDB4MmIsIDB4YjAsIDB4
ZjIgfSBmb3IgVklNM0wsIGJ1dAo+IHRoaXMgd2FzIGEgbWlzdGFrZSAodGhlIGNoaXAgaXMgUzkw
NUQzKSBzbyBbM10gY29ycmVjdGVkIGl0IHRvIHsgIlM5MDVEMyIsIDB4MmIsCj4gMHhiMCwgMHhm
MCB9IHdoaWNoIG1hdGNoZXMgbXkgVklNM0wgYm9hcmQuIElmIHRoZSBWSU0zTOKAmXMgaW4gS2Vy
bmVsQ0kgbm93IHNob3cKPiAiMmI6YyAoNDoyKeKAnSBpdCBsb29rcyB0aGVyZSBoYXMgYmVlbiBh
IHBhY2thZ2UgY2hhbmdlIChzaWxpY29uIGZpeGVzPykgYW5kIHdlCj4gbmVlZCB0byBhZGQgYW5v
dGhlciBTOTA1RDMgcGFja2FnZSBJRC4KPiAKPiBJbiB0aGUgbGFzdCB3ZWVrIEkgaGVscGVkIHRo
cmVlIGRpZmZlcmVudCB1c2VycyBpbnN0YWxsIExFIG9uIFM5MDVYMyBBbmRyb2lkCj4gYm94IGRl
dmljZXMsIGFsbCBvZiB3aGljaCBkZWNsYXJlICIyYjpjICgxMDoyKeKAnSBhcyB0aGUgU29DIElE
LCB3aGljaCBtYXRjaGVzCj4gdGhlIG9ubHkgUzkwNVgzIGRldmljZSBJIG93biAoT2Ryb2lkIEM0
KS4gU28gSSBhc3N1bWVkIHRoZSBCU1AgaXMgd3JvbmcgYW5kCj4gc2VudCB0aGlzIGZpeCBwYXRj
aC4KPiAKPiBJZiBTRUk2MTAgaXMgUzkwNVgzIChpbXBsaWVkIGJ5IHRoZSBvcmlnaW5hbCBTTTEg
c3VibWlzc2lvbiBmcm9tIHlvdSkgS2VybmVsQ0kKPiBvdXRwdXQgc2hvd3MgdGhlIGN1cnJlbnQg
SUQgaXMgd3JvbmcgKOKAmFVua25vd27igJkpIHNvIHdlIHByb2JhYmx5IG5lZWQgdG8gZml4IGl0
Cj4gd2l0aCB7ICJTOTA1WDMiLCAweDJiLCAweDUwLCAweGYwIH0gdGhlbiBhZGQgbmV3IFM5MDVE
MyAoVklNM0wpIGFuZCBTOTA1WDMgKGFzCj4gcGVyIHRoaXMgcGF0Y2gpIElEcy4KPiAKPiBJZiBT
RUk2MTAgaXMgUzkwNUQzIChhcyBzdGF0ZWQgaW4gdGhpcyB0aHJlYWQpIHRoZSBmaXggaW4gdGhp
cyBwYXRjaCBpcyBzdGlsbAo+IGNvcnJlY3QsIGJ1dCB3ZSBhbHNvIG5lZWQgdG8gc2VuZCBhIHNl
Y29uZCBwYXRjaCB0byBhZGQgdHdvIG5ldyBTOTA1RDMgcGFja2FnZQo+IElEcyAoU0VJNjEwICsg
VklNM0wpLgo+IAo+IEnigJlsbCBwaW5nIHlvdSBvZmYtbGlzdCB0byBkaXNjdXNzLgoKT0ssIHdl
IGhhdmUgNSBkaWZmZXJlbnQgdmFsdWVzIDoKUzkwNVgzCTA1CTAwMDAgMDEwMQkoZmlyc3QgU0VJ
NjEwIHN1cHBvcnQsIGVhcmx5IHNhbXBsZXMpClM5MDVYMwkxMAkwMDAxIDAwMDAJKHJlY2VudCBT
OTA1WDMgYW5kcm9pZCBib3hlcywgaW5jIE9kcm9pZC1DNCkKUzkwNVgzICA1MAkwMTAxIDAwMDAJ
KFNFSTYxMCBrZXJuZWxjaSByZXBvcnQsIG5ldyBTRUk2MTAgcmV2aXNpb24pCgpTOTA1RDMgIDA0
CTAwMDAgMDEwMAkoVklNM0wgaW4ga2VybmVsY2kpClM5MDVEMyAgYjAJMTAxMSAwMDAwCShWSU0z
TCkKClNlZW1zIHRoZSBlYXJseSBTOTA1WDMvUzkwNUQzIHNhbXBsZXMgdXNlZCB0aGUgbG93IDQg
Yml0cyB0byBzZXR1cCB0aGUgcmV2aXNpb24uCkFuZCB0aGUgbWFzcy1wcm9kdWN0aW9uIG9uZXMg
dXNlcyB0aGUgaGlnaGVyIDQgYml0cy4KClNvIHdlIGNhbiBkZXRlY3QgYWxsIHRoZXNlIHdpdGgg
dGhlIGZvbGxvd2luZyBiaXRzICYgbWFzazoKCS8qIEVhcmx5IFNNMSBTYW1wbGVzICovCiAgICAg
ICAgeyAiUzkwNVgzIiwgMHgyYiwgMHg1ICAweGY1IH0sCiAgICAgICAgeyAiUzkwNUQzIiwgMHgy
YiwgMHg0ICAweGY1IH0sCgkvKiBNYXNzIHByb2R1Y3Rpb24gU00xICovCiAgICAgICAgeyAiUzkw
NVgzIiwgMHgyYiwgMHgxMCwgMHgzZiB9LAogICAgICAgIHsgIlM5MDVEMyIsIDB4MmIsIDB4MzAg
IDB4M2YgfSwKCk5laWwKCj4gCj4gQ2hyaXN0aWFuCj4gCj4gWzFdIGM5Y2M5YmVjMzZkMCAoInNv
YzogYW1sb2dpYzogbWVzb24tZ3gtc29jaW5mbzogQWRkIFNNMSBhbmQgUzkwNVgzIElE4oCdKQo+
IFsyXSAxZDdjNTQxYjhhNWIgKCJzb2M6IGFtbG9naWM6IG1lc29uLWd4LXNvY2luZm86IEFkZCBT
OTA1WDMgSUQgZm9yIFZJTTNM4oCdKQo+IFszXSBmZGZjNjk5N2JkMDggKCJzb2M6IGFtbG9naWM6
IG1lc29uLWd4LXNvY2luZm86IEZpeCBTOTA1RDMgSUQgZm9yIFZJTTNM4oCdKQo+IAo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
