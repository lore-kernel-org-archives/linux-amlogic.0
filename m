Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B52C7EE24
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ww1BYYcMgcoX0fc0HYeeURjVarCZ8IsdEzjRJJGBDUk=; b=Qthlril6pOnSb9
	XMq7+uYSPX4nfIWXa3mqgdhlZhqHk4rnWxKfsZeeMvFR3ejPKMqNYRQSS072kGYR7ZKNUKwyhcppK
	hEEphB/VmbTFMOa32zSZa3zmDOmDik1EmUtxxgziu1X/7KzXLJeaXtyntndar32ASgpck7F/kQlkM
	nBw6pqFcKAQWPLY7cWlg4DJ365zgorKtU2ApW8g3gb+3AOXmza1Q/NnoLwvTgA4qu0+UB8jmh+ADE
	ekoHOIdxruxpV/i5bfL7b3C8rS7aofMU9ZL/MAT0ZS1Td/li3vbLMnvVjTz/cQjw5DhZ0CYCEssLn
	e7IxlDd0HO7q//ewSx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV63-001geZ-39;
	Mon, 15 May 2023 10:06:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV60-001gdk-36
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 10:06:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-965f7bdab6bso2203465966b.3
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684145182; x=1686737182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2hjpXzaWeM8OT7/yysLcClGVQFFFKoxwvBr9CBiXm0=;
        b=BGiDtiloaV0WzQ3uHy4knefdHmJU85un1qrGqD9miGs79g3shQ31A8PRnGtjJ6S4cL
         KhzcPGZoA7ABjuSOuh5At7Q39EfK63v7WaL++PrV7t59z5yHPvB/ZklYzLDFfJGnlR+R
         bpslU+v3kPne8rbftHd71wrEEOeGyDp7z+3vIvcERHc6JNQudKVKNxGA3777Fzt0J0Gg
         z3mli3vXAubfR6w8aoQyJwYRJcF3XLOuTAoe0a/piJxJttHpAJNRKj2x2wcaLpNoBAHz
         LuUQSD09m3VF9wON+XX31yp20oiqJV6ypuzQ9BxuonDZnTaOr6nqkuYqT0rmFBFQlWw7
         bLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684145182; x=1686737182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hjpXzaWeM8OT7/yysLcClGVQFFFKoxwvBr9CBiXm0=;
        b=a/i/H8yk2YjPeKKr3SjfA9FQs6d3YErbW1S3uUa1ggfc4b9a6mXug5eHqXirU8wB+R
         nrDZ6WRQwUKyiqUMnWFb6GVWooTs3jQPcb/ZLswbRWNCu53xyU9acawU3CbawSN4j+E2
         GltQ2UlJCZ6BEQqgZTeU2z+tO28t0fIH5FpA9O7/tvNoG5sfGaQu/b/q1wBroI06ydMu
         Wrl/Aawj7ExrZZR0Eug9YYqzMc+wWCZal2P+NUmxCd6y0DX5hWhL1mdXTWvpJu0lOsxt
         LWJIiElFu9zKvTuYAKREXytyZsdxlSy77aMZMLj4MP3DII7W1EghSTFnTJyFiTcGC/UE
         fGPQ==
X-Gm-Message-State: AC+VfDwrmAqdI4Zp6vlt6ysSEAsdMxn1uVga9q1MGkpv+qMKsolZPVTx
	1PzCjGfxQJt6EdpMaw7nFo3+hA==
X-Google-Smtp-Source: ACHHUZ4sgPSj3/bY/sz0i8Il1c6eLwrf8kl8HHpsjyXJB0xJi8Gxcu96OyGJ+tDfG3La5Lgd6wWFZA==
X-Received: by 2002:a17:906:4784:b0:94f:7486:85a7 with SMTP id cw4-20020a170906478400b0094f748685a7mr34326781ejc.31.1684145182522;
        Mon, 15 May 2023 03:06:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id kz23-20020a17090777d700b009659fed3612sm9193781ejc.24.2023.05.15.03.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 03:06:21 -0700 (PDT)
Message-ID: <4a04ef11-d87d-4464-a907-badc920d595d@linaro.org>
Date: Mon, 15 May 2023 12:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230515031557.31143-1-yu.tu@amlogic.com>
 <20230515031557.31143-2-yu.tu@amlogic.com>
 <590560c9-4da6-bbd4-6aac-de57ab5403ba@linaro.org>
 <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
 <33f5ff59-db7b-7576-64cb-972c0dfb0f7b@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <33f5ff59-db7b-7576-64cb-972c0dfb0f7b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_030625_019939_D3AAB1DB 
X-CRM114-Status: GOOD (  16.56  )
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

T24gMTUvMDUvMjAyMyAwOTo1NywgWXUgVHUgd3JvdGU6Cj4gCj4gCj4gT24gMjAyMy81LzE1IDE1
OjM1LCBZdSBUdSB3cm90ZToKPj4gSGkgS3J6eXN6dG9mLAo+PiAgwqDCoMKgwqBUaGFuayB5b3Ug
Zm9yIHlvdXIgcHJvbXB0IHJlcGx5Lgo+Pgo+PiBPbiAyMDIzLzUvMTUgMTQ6MzIsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBPbiAxNS8wNS8yMDIzIDA1OjE1LCBZdSBUdSB3cm90ZToK
Pj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9jayBjb250cm9sbGVyIGR0LWJpbmRpbmdzIGluIHRoZSBz
NCBTb0MgZmFtaWx5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9n
aWMuY29tPgo+Pj4KPj4+IFRoaXMgaXMgYSBmcmllbmRseSByZW1pbmRlciBkdXJpbmcgdGhlIHJl
dmlldyBwcm9jZXNzLgo+Pj4KPj4+IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFu
ZCBmb3Jnb3QgdG8gYWRkIGl0Lgo+Pj4KPj4+IElmIHlvdSBkbyBub3Qga25vdyB0aGUgcHJvY2Vz
cywgaGVyZSBpcyBhIHNob3J0IGV4cGxhbmF0aW9uOgo+Pj4gUGxlYXNlIGFkZCBBY2tlZC1ieS9S
ZXZpZXdlZC1ieS9UZXN0ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3Cj4+PiB2ZXJzaW9ucy4g
SG93ZXZlciwgdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQg
dGhlCj4+PiB0YWdzLiBUaGUgdXBzdHJlYW0gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9yIGFj
a3MgcmVjZWl2ZWQgb24gdGhlCj4+PiB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4+Pgo+Pj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTcvc291cmNlL0RvY3VtZW50YXRpb24vcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w1NDAKPj4+Cj4+PiBJZiBhIHRhZyB3YXMgbm90
IGFkZGVkIG9uIHB1cnBvc2UsIHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hhbmdlZC4KPj4K
Pj4gWWVzLiBJIGRvbid0IGtub3cgdGhlIHByb2Nlc3MuIFNvIEkgbmVlZCB0byBhZGQgUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIAo+PiA8cm9iaEBrZXJuZWwub3JnPi4gQW5kIHJlc2VuZCBWOD8K
Pj4KPiAKPiBJIHdvdWxkIGxpa2UgdG8gYXNrIHlvdSBhZ2FpbiBieSB0aGUgd2F5LiBJJ20gbm90
IHN1cmUgaWYgSSBjYW4ganVzdCBhZGQgCj4gdGhlIFRBRy4gQmVjYXVzZSBJIGFjdHVhbGx5IGNo
YW5nZWQgdGhlIFY4LgoKWW91ciBjaGFuZ2Vsb2cgaW4gY292ZXIgbGV0dGVyIGRvZXMgbm90IGRl
c2NyaWJlIGl0LiBJdCBvbmx5IG1lbnRpb25zCnZhZ3VlbHkgImNoYW5nZSBwYXRjaCBzZXJpZXMi
LiBEZXNjcmliZSBleGFjdGx5IHdoYXQgY2hhbmdlZC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
