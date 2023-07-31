Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F03C001DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRtRct6BF5c9gsOx2s7dKiiPAS4TUjx+aMVEOWYlGHY=; b=0zF+xdF2jEctr2
	T8Jr0nwmybD923dEVSkxGBx43y8YbeKwe1GR2qndfFtb9t8QZY7+VJySMAk/etmsfmqGKg9yPXc4L
	HD641+D10TsFvx0cfXjNfQNhp1WqcDb2v48nizYWTCHgojLPkg18Xpt5kA8AbJAQRXJWYV5UVmE8p
	62bp6k4YLnxgePUNa8bGFySfywmylwytl09wmtrqT2vO0SVki16CMeQJPM0RTocN5zQMl30MIX2Jg
	E5V3DRf+DIHhyULScJR/xVPzt2TlJALIXU8TEVjGSUqa2QpAmYqUq/j5qj41vEJ7ErdtgmG4Fnowa
	S8jfSZbjK1DQVkF9irdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNyJ-00EUpx-1u;
	Mon, 31 Jul 2023 08:09:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNyG-00EUoo-2p
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:09:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe167d4a18so19722965e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690790979; x=1691395779;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Xc3jYrK1x9tkB4f+PVMDQueLv6yWIREl5+s0F3S8Y=;
        b=ZEaDHT1NaOad79uVsOnmQFfAfnNmsaK9J/EpLBHLR5GUvTr40ib9SttdBlNvncy12y
         7lFLTSSpJWmBlvBQxInq8FJjI1H9gMqt7CK9xtUHBYMhX+CXTp4ifilegX1AKCdsk99R
         mbR2GVbGF/vj4zDf6aYVBxN7EZ7sG7oH+pB//lbrQLhuw3/bqENbEQm4tdVz51/zJjVY
         Ibhjc0OvbBaZHQ1F9XWG6h3/CcbJCg2EIzxlt/9LjKRpvZPeTVVxo9XUOQcqviXpGaOn
         KAMD8vOQXY3D2+Mk7ABvnrq909R0Q1pIGf9xx7tFMLrbS1LkATVH75BMMgngxp1ictv5
         euCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690790979; x=1691395779;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6Xc3jYrK1x9tkB4f+PVMDQueLv6yWIREl5+s0F3S8Y=;
        b=K0JCA7ElhifGofVVc4eIXBHDpCUVvbthJ65U8rP0cOqoS0KB0vkP/xqTdeIGlwD0fe
         Ont1EoHSFWTV2Wgs3RolXGDZeVMS3NqUlKSF4cW1mRWQ5Q9pFHxbHGNitod1tG/iHRcP
         L82SQRLg1cyG8efBjmH9lqk+zLqQFj3Pjm3Gog7ZfM8P1CtfYjk//fdM21abuTKYpcFO
         doJqItqn150YB3X5glhzx44Xyp9lYac/GSrRsqkJYKmYAZoaABh6LyklMRUnzNJ7SVJb
         uifJusl7bF+3G6ycV9lVyNThOP6hglBOLdxUSVdKtuGipMfNNxDNzUmQzrb/S2wSDlBY
         s3ug==
X-Gm-Message-State: ABy/qLYlBy+HOM1MTEW6w0sCSQaf4jxsg6UfuRU2z6qIPHptsKgjJeG0
	wZRfH7sdVxyAq+3lkkoRtUb7eg==
X-Google-Smtp-Source: APBJJlHLZ7vCZwY1QPT0rUh5m9UgeHk+Z//Ttk3OtUPPGC+DmPqwHZsKoDBOZMaGkKjN2MWWPoHN6w==
X-Received: by 2002:a1c:6a18:0:b0:3f7:3991:e12e with SMTP id f24-20020a1c6a18000000b003f73991e12emr7342699wmc.1.1690790978724;
        Mon, 31 Jul 2023 01:09:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b003fc16ee2864sm10764258wmq.48.2023.07.31.01.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:09:38 -0700 (PDT)
Message-ID: <4ecb44a1-92d7-e669-8fbc-e1e73eb24177@linaro.org>
Date: Mon, 31 Jul 2023 10:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, zelong dong
 <zelong.dong@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
 <68b7d772-8dc4-a781-031b-ea33dae41751@linaro.org>
 <50935d75-bed6-4919-70fc-adcaba6a30a8@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <50935d75-bed6-4919-70fc-adcaba6a30a8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_010940_911759_C7BE70AF 
X-CRM114-Status: GOOD (  13.09  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMzEvMDcvMjAyMyAxMDowOCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMjgvMDcvMjAy
MyAxODo0MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjgvMDcvMjAyMyAxNzo0
OSwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPj4+PiDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxjMy1yZXNldC5o
IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLGMzLXJlc2V0LmgKPj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDkxMjc4NjNmNjAzCj4+
Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1s
b2dpYyxjMy1yZXNldC5oCj4+Pgo+Pj4gR2l2ZW4gdGhhdCB0aGlzIGlzIG9ubHkgaW5jbHVkZWQg
YnkKPj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWMzLmR0c2ksIHNob3Vs
ZCB0aGlzIGhlYWRlciBiZQo+Pj4gbW92ZWQgdG8gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
ID8KPj4KPj4gSSB0aGluayB0aGVyZSBpcyBvbmdvaW5nIHdvcmsgb3IgYXQgbGVhc3QgcGxhbiB0
byB1c2UgdGhlIElEcyBhbHNvIGluCj4+IGNsb2NrL3Jlc2V0IGRyaXZlcnMgZm9yIGFsbCBBbWxv
Z2ljIHBsYXRmb3Jtcy4gRG8gSSByZWNhbGwgdGhpcyBjb3JyZWN0bHk/Cj4gCj4gWWVzIHRoZSBo
ZWFkZXIgaXMgdXNlZCBpbiBEVCBhbmQgdGhlIGRyaXZlciwgc28gaXQncyBpbiB0aGUgcmlnaHQg
cGxhY2UuCgpGb3JnZXQgbXkgY29tbWVudCwgd3JvbmcgcGF0Y2hzZXQuLi4KCk5laWwKCj4gCj4g
TmVpbAo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlzenRvZgo+Pgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
