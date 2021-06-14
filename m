Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88F9C4743C
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 13:17:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59E676128C
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 13:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59E676128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZpvtS/17oVV2OdGV2zLgq6LH+0PAx0fCCdYDl/B0kSc=; b=43EQ8BPWzXK1dHG4wSG5f+r8/B
	0XiUQpd5NTpyeXZZtImQowhBu8XzOM5qoJfIGtcYoVV0oMXiLrEPBvSKM1QOG8f6ndyREj+j1RpyD
	ee/3ATkK5ZaFLyEuGBOcn1cY0iwLEgG/1nJE3CIBv31o9v8ea68jBLl7nlK49934LL9anKoWSUHy/
	4qhwqJibFGVQHdA0N/7cY+Fyef8KEAs7A+H0sFvu1rU4+HldA4p4cUC9vC6j62/NR3viVyuCBo97X
	xaurTZ1xVT2SO1McN7f1VWo+q4++uiKRq8+vgYzbAR+IaeL6+5Hw8lrY0ng0eApWwBSYved3Bi1O1
	WwQnp/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmT8-00EEkT-O6; Mon, 14 Jun 2021 13:17:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmT5-00EEj6-0F
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 13:17:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id a11so14510204wrt.13
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFmTmIPfKkU5RhaamFAr4BhwN+bI45kmR+Vj5S8aLqU=;
 b=MI23UFo2gw40h05XL7Pjtm04CvcZuvV3D76vFSblYhKAqMRSwGee6QT2SOz5MWEC5p
 wPEYoGXmtBbJp25N/LLJKUBrNpgzIc0BeeTZOAABDlQ7+Kg1DvWf+hXvrhCxYFDizznS
 VyWrPvoU1K+x+qtLSBXxlAILt8Gh5ueBIqmYycf+a5XsBThzzzh+7/w6T8yxakKT5hUv
 4UfqScr2UVlMZ6xnhJmZ4gsN/GTjCTHk+V3Onk3Idn4h3ufVKvVR12QJclD+k8LHYlwb
 VeB6yNchqkFxqKmchayU8ty8HDq7xFYh4rpVSWJplvrZzJf7blR5ZAVZoJ7iLaHnpo2o
 EUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XFmTmIPfKkU5RhaamFAr4BhwN+bI45kmR+Vj5S8aLqU=;
 b=p9hpz3irYbG/9fsA9YpDgc4F+UC1J8I66lP5y65vSHDm/87FfhD69XPy0I1Qxmk8RR
 ui30jRqJYj2mUxhCrPGaAcC6s6cX4QQXRKQs1uIrLAfL7ILjD1e3vR47r5NwOYM7wYBD
 hR5GyOFszpvdG7RDtEBuLv+sNCFg7TxlR9A3Foy9vCXb/AcyQSDw1hT/VWFnqdoIin/N
 Gnpy+w7Bs3Sow5vp33wgtedYbIo6XGleQ3Is3Iy8x7xZQkZGSV/vb8A4zYtVUijcUTQn
 5fyllEkAwCtvuMA1X8U/Mhw+maboOGBSfNRmHiOxI5j9tqFx4j6UHMxZPnpZ1OuG3rqb
 O4fg==
X-Gm-Message-State: AOAM5305BX+YuRMikf0JKgkrG1Z8wEPPspFRGYYuX0v4CMHXJiH+TKDs
 L+jIfLN+t92v+GFYXuzWBqIwvg==
X-Google-Smtp-Source: ABdhPJxjXjeRZW524D+N0JUBk4ULOtEQmBImEKhaFK8PHTuHPrQ61s0G80mnJlVwIQRwoR4b6kWf8g==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr18683034wrx.102.1623676649106; 
 Mon, 14 Jun 2021 06:17:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f0d4:3c02:f06a:77bb?
 ([2a01:e0a:90c:e290:f0d4:3c02:f06a:77bb])
 by smtp.gmail.com with ESMTPSA id f13sm16372661wmg.7.2021.06.14.06.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:17:28 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim3: reduce cpu thermal fan trigger
 temperature
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Xie <xieqinick@gmail.com>
Cc: robh+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nick <nick@khadas.com>, artem@khadas.com
References: <20210609012849.797576-1-xieqinick@gmail.com>
 <11da3ae4-91d4-1e51-c652-e4ad518f13bd@baylibre.com>
 <CAP4nuTVMZV7pz8NrM2MHcZzBdueRXjS+KYsU4=cQ1CB67gr_Hg@mail.gmail.com>
 <ee3341d9-350e-a84d-6836-3401be679b2a@baylibre.com>
 <CAP4nuTUt1vQjVP=3_NYaeu+m47f78ru6-MgGBiAqLeU9fJAsNg@mail.gmail.com>
 <09c65310-9441-9b97-d9ae-4695f0dd16af@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <259e150c-f25a-86cf-1109-b7370b5d7c10@baylibre.com>
Date: Mon, 14 Jun 2021 15:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <09c65310-9441-9b97-d9ae-4695f0dd16af@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_061731_073665_E33DC1A8 
X-CRM114-Status: GOOD (  20.16  )
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

SGksCk9uIDExLzA2LzIwMjEgMDk6NDUsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDExLzA2
LzIwMjEgMDk6MzAsIE5pY2sgWGllIHdyb3RlOgo+PiBIZWxsbyBOZWlsLAo+Pgo+Pgo+PiBOZWls
IEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOS6jjIwMjHlubQ25pyIMTHml6Xl
kajkupQg5LiL5Y2IMzoxNeWGmemBk++8mgo+Pj4KPj4+IEhpLAo+Pj4KPj4+IE9uIDExLzA2LzIw
MjEgMDg6NTQsIE5pY2sgWGllIHdyb3RlOgo+Pj4+IEhlbGxvIE5laWwsCj4+Pj4KPj4+PiBUaGUg
TUNVIEZBTiB3b24ndCB3b3JrIHVudGlsIHRoZSB0ZW1wZXJhdHVyZSByZWFjaCB0byA4MCBkZWdy
ZWUgY2VudGlncmFkZSwKPj4+PiBEbyB5b3UgdGhpbmsgdGhlIHRlbXBlcmF0dXJlIGlzIHRvbyBo
aWdoPwo+Pj4KPj4+IEkgdGhpbmsgODAgaXMgdG9vbCBoaWdoLCBidXQgSSBmZWFyIDUwIGlzIHdh
eSB0b28gbG93LCBidXQgaWYgeW91IHRoaW5rIDUwIGlzIE9LIGFmdGVyIHlvdSByYW4gc29tZSB0
ZXN0cywganVzdCBhZGQgaXQgdG8gdGhlIGNvbW1pdCBsb2cgYW5kIGl0J3Mgb2sgZm9yIG1lLgo+
Pgo+PiBJIHRoaW5rIGl0IGlzIE9LLCB3ZSB1c2UgaXQgZm9yIGEgbG9uZyB0aW1lLgo+IAo+IDUw
wrBDIHNvdW5kcyBsaWtlIG5vcm1hbCB0ZW1wZXJhdHVyZSB3aXRoIHJlZ3VsYXIgbG9hZC4gVGhh
dCBtZWFucyB0aGUKPiBmYW4gd2lsbCBiZSBzd2l0Y2hlZCBvbiBtb3N0IG9mIHRoZSB0aW1lIHdo
ZW4gdGhlIGJvYXJkIGlzIHVzZWQuCj4gCj4gQW5kIHRoaXMgY2hhbmdlIG1heSBiZSBwdXQgaW4g
cmVnYXJkIHdpdGggdGhlIG90aGVyIHRyaXAgcG9pbnRzIGluIHRoZQo+IGNvbW1vbiBEVC4gRm9y
IGluc3RhbmNlLCBlbmFibGUgdGhlIGZhbiB3aGVuIHJlYWNoaW5nIDgwwrBDIGJ1dCBzZXQgdGhl
Cj4gcGFzc2l2ZSB0cmlwIHBvaW50IHRvIDc1wrBDIGluc3RlYWQgb2YgODXCsEMuCj4gCj4gQWxs
IHRoYXQgZGVwZW5kcyBvbiB0aGUgaGFyZHdhcmUgY2hhcmFjdGVyaXN0aWNzIGFuZCBURFAgd2hp
Y2ggYXJlIGluCj4gdGhlIFRSTSBub3JtYWxseS4KPiAKCkkgZG9uJ3QgdGhpbmsgc3VjaCBkYXRh
IGV4aXN0IGluIHRoZSBkYXRhc2hlZXQgb3Igb3RoZXIgcHVibGljIGRvY3VtZW50LCBidXQgdGhl
IHZlbmRvciBzb3VyY2UgdHJlZQpzZXRzOgotIHBhc3NpdmU6IDc1wrBDCi0gaG90IDg1wrBDCi0g
Y3JpdGljYWwgMTEwwrBDCgp3ZSBzZXQgdXBzdHJlYW06Ci0gcGFzc2l2ZTogODXCsEMKLSBob3Qg
OTXCsEMKLSBjcml0aWNhbCAxMTDCsEMKCnNvIG1heWJlIHdlIHNob3VsZCBsb3dlciB0aGUgcGFz
c2l2ZSAmIGhvdCB0cmlwIHBvaW50cywgdGhlbiB0aGUgRkFOIDgwwrBDIHRyaXAgcG9pbnQgd291
bGQgYmUgb2sgbm93IGFjY29yZGluZyB0byBEYW5pZWwncyBleHBsYW5hdGlvbi4KCk5laWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
