Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3AFECAAD5
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWMcDQ/wzr2pcatdbJ/FSDx4Sy9jWCJOUQ6zdBhzhyc=; b=R2vB1c7dzog9Ct
	KC26wAZmHHT81o8yvkkpwmlo0Xs5ih0UcPrBsamjJsnBjfZdwR/ZyatapKQ9MZ1XmuycLgJqc4OdE
	hLB3/q56yJM5/CV+ZOWHrSKt0mkoTh828Q44vYo2fEuOU/rc+GUVuaQbD9il6mVzdhRGMOYk5WSq2
	cw0EGeWIkRJSRQMzsc57VTgHDiyxmJjHnaO2oVMC6QcOhEx9mqNBqG/CLU/UW0naRD6HZHROT2HuT
	xmCysRzkap/1LOVaWFlTZiLqHfi6PPJpMma/MLjk0XJRk/xCQdefKDaO9Pc5adSjHzYuKX3CNCMUR
	3gQuVsyJZ2IaXDBXb4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZPC-005kfA-9u; Mon, 29 Aug 2022 07:41:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZOh-005kLJ-AT
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 07:41:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id b16so1430061wru.7
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=5up3cUBmqLmN/N4JsoGSCpsquDZUxfx3SQvM9VcSSqw=;
        b=YuPbkZr0Ax4OGbfNlSy3XGJ1Ho31X7gBNQTXMazlCaETwKK9GDqXs3uG0+jn8EvRPP
         GlaxYOmBEY9SC8WAs82C9ADhKCmlxGkRAbKCoG0btJPCcrdmzxZHHZvRT5EnZlxDJY4s
         ic3WYpgsIDj/OS+VB3ynaAgYCvUeBZoVxXJCyHqmpXj17QPogEfJy+jXKCYh5W/U24E4
         DLvW7XMoR5/2HRuSFCbeSgaiRZsEDu6hUxwytB89remwuL6kmT8yDGetlz4b9J0MgcNp
         ZF5JMnCVdyQWwxwUELqxwh+ZM2ASzzCdSZgznsjuSxEh/oV6BQmUdV945DjSPU7D+F/O
         omoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=5up3cUBmqLmN/N4JsoGSCpsquDZUxfx3SQvM9VcSSqw=;
        b=OqEF5Fm/NAzJafm6mattue8vMm9EhPdk4+XTHyPhqCGnz0Mo4tlJCGmPVZ3sPjQ4YQ
         5DyAM0DJQ1T2JqFiyTHJJqRhrX4rGn2xn8/i1dm15w4Yfl1mgbbSn8q8j11LFzEgnK4k
         eRkN0IdcaNvKqyzbbkxYwhq0wnv7Vy0gVT/RRC0qT0gu3Z9c3gV1mVYx6rtEyY6lo7U6
         6xByM4elqFFRWcEj8mir+eqgIrL1Zsn0J5zZUxbxtp1YY8i5RAMnDqzKg72dl3BNjf+v
         DgvMacVzqhUTs+Ejms6Gctk86lLtEvcT/2kVP04xLOotzXJ9ei4nxhUNYnZQoryTI/91
         yfPw==
X-Gm-Message-State: ACgBeo1qHngwRxtclyALvDVOlQACpZGpkYYRpMTuUdnr1YeYnp2QsZui
	da1a0z4LE+JooB01GDBvNfyfeQ==
X-Google-Smtp-Source: AA6agR6NLCGeE1ZIf8UdYmeZQOwbczj92cej7w+PZTtWO71lnImArQKYk0kqLF1viANjjlBGYnQ4Ew==
X-Received: by 2002:a5d:6b46:0:b0:225:3510:a130 with SMTP id x6-20020a5d6b46000000b002253510a130mr5446784wrw.46.1661758885778;
        Mon, 29 Aug 2022 00:41:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b? ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002251639bfd0sm6230191wrr.59.2022.08.29.00.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 00:41:25 -0700 (PDT)
Message-ID: <a9072e3a-2ea5-9da0-a1ba-2be67857e1ba@baylibre.com>
Date: Mon, 29 Aug 2022 09:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: meson-s4: include meson-s4-gpio.h
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <e32a8c39-1e47-cad1-e093-2cabb2dd37a4@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <e32a8c39-1e47-cad1-e093-2cabb2dd37a4@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_004127_418164_1B9D1EA4 
X-CRM114-Status: GOOD (  12.56  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjYvMDgvMjAyMiAxMzozMiwgSHVxaWFuZyBRaW4gd3JvdGU6Cj4gSGkgS3J6eXN6dG9mLAo+
IAo+IE9uIDIwMjIvOC8yNSAyMDowMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gV2h5
PyBXZSBjYW4gc2VlIHdoYXQgeW91IGRpZCBoZXJlLCBidXQgY29tbWl0IG1zZyBzaG91bGQgZXhw
bGFpbiB3aHkgeW91Cj4+IGRvIGl0Li4uCj4gCj4gU29ycnksIEkgZGlkbid0IGRlc2NyaWJlIHRo
aXMgY29tbWl0IG1lc3NhZ2UgY2xlYXJseS4KPiAKPiBJbiB0aGUgZnV0dXJlLCBtZXNvbi1zNC5k
dHNpIHdpbGwgaGF2ZSBzb21lIG5vZGVzIHRoYXQgbmVlZAo+IHRvIHVzZSB0aGUgbWVzb24tczQt
Z3Bpby5oIGZpbGUuCj4gCj4gZS5nLgo+ICDCoMKgwqDCoCgxKSBCbHVldG9vdGggZW5hYmxlIHBp
bjoKPiAgwqDCoMKgwqDCoMKgwqAgYnRfZW4tZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfMTcgR1BJT19B
Q1RJVkVfSElHSD47Cj4gIMKgwqDCoMKgKDIpIEF1ZGlvIG11dGUgcGluOgo+ICDCoMKgwqDCoMKg
wqDCoCBzcGtfbXV0ZS1ncGlvcyA9IDwmZ3BpbyBHUElPSF84IEdQSU9fQUNUSVZFX0xPVz47Cj4g
IMKgwqDCoMKgKDMpIC4uLgo+IAo+IFNvLCB0aGlzIHBhdGNoIHdhcyBib3JuLgoKV2UgdW5kZXJz
dGFuZCwgYnV0IHNpbmNlIHRoZSBVcHN0cmVhbSBsaW51eCBjb2RlYmFzZSB3YW50IHRvIGF2b2lk
IGRlYWQgY29kZQphcyBtdWNoIGFzIHBvc3NpYmxlLCBwbGVhc2UgZGVmZXIgdGhpcyBwYXRjaCB3
aGVuIG5vZGUgd2lsbCBhY3R1YWxseSB1c2UgdGhlc2UgZ3BpbyBkZWZpbmVzLgoKTmVpbAoKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gSHVxaWFuZwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
