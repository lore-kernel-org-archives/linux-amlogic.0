Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9E3C47258
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jan 2024 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d6Ifsa+XpCMS+7IdNLm7xmazP+7BrCIEFeywhmuufE=; b=17LdhFWUfwhVS3
	q/ahUJKJXa+W3T8BMY2TBqZLuA/KFT6WGcjl+NNL+XbjtB4xjiFHuMyigjr1zpfYV6livliq7dYN8
	9WPVzOOZ+I5DDrIBimwXZmK17F/lil7U09/VDsANjPA325g6lgAIE7gcKk+PWQFZXweLfKboN/wEo
	cfZGeX3udbYVHoG7cYLfjublWnVbT8MHJuIRCk3WgEIjazl+0cUp+/meB1uUb3KeKW7EaM4dbiSoi
	N/N6tentpKXLKLrdskVGVUeiTAVJFUzL0LRoLdJbUmoA36xWFSD8BXuSucaiZaBtC3lb3tLPdO0L2
	AVhbrHnOKZnhQDmI5b/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ9j9-000Ds7-06;
	Wed, 17 Jan 2024 17:29:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ9j5-000Dra-1q
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jan 2024 17:29:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a2821884a09so951592566b.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jan 2024 09:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705512556; x=1706117356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjQeI5HDy7qCZ+HAvFXFF1XuHvmWYHadn1nlCpN/OSI=;
        b=PJdnGC7tkqiB3Nw75/RrcQWrJlB7PAjrfhd7jcGA+SR2VV0IgR1QBuiz4yG3MwL7h2
         NK4WbnZ+VnzFYs/hRJUmNI8qRl2FRyMZICe83OM/AiAZDFjK3ko8bMfLYuu4JUbHVmxk
         6mSA5zSkCXCk78bmibqUI9qFR2TzIImvH6znyms62a6UhqMUGywfuDPQhlo4pu8EJB4s
         0SIln/xjjfSEVbWcV5njeZ/3xNaGINkwtIoyHIJY/D16chF8ZBXCYYl9OKdstQ2MLP4s
         WEMzvYHpF+2yaI44RKhvN6Ihs1+hHeL0iLPTGK6dV5qQnEnNzYwvlG5My8OA++0iK3Qa
         DPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705512556; x=1706117356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjQeI5HDy7qCZ+HAvFXFF1XuHvmWYHadn1nlCpN/OSI=;
        b=qt1csyWeHcdOsICsQ7sxSn56MFzf0Hv6ViOYQsfNxm8QkCnRBrMtS8DBWDODFI4p7N
         Y1C05r1+BYLhE/mwb1WM2KZkUnwYls73wqeq8iDi7w2GLEYwN2k4LyY8S8b/T4wRfxhv
         o+QRj04veIbQ7/EpfIDxlYd7is7EZIw9pdNVOk6igdZ0tVpvQ2QEK496iuhRWmYf8nJ+
         OHxiRT64xHyQMs1lLIIo8SO5K5i/OQYSDFVikYARjwmLQ0zXhrvqyhGUfro6ut84lW8H
         PRosK2xi65eH5TKHTWFnA9TaqLDtvxFk1HzVOxGYPDDzcpv0hptjpgF82eur3SZ3Ix0k
         0cxg==
X-Gm-Message-State: AOJu0YxsEj3nWUb92oAKnBkjQWx+w1uWi1tHEbghRFNv4LXFc3Ax/uBg
	OzXJVXMQdFNHC7sBUb9RivFeYHlC1zM/yw==
X-Google-Smtp-Source: AGHT+IGicIA17cuAU3etYgi7hLcEL25kCm5zVGa4jTcGJy61uGN0nz0syiUb5JmKR1l/yh1SzLyIdA==
X-Received: by 2002:a17:906:70cb:b0:a28:e50c:1720 with SMTP id g11-20020a17090670cb00b00a28e50c1720mr5140146ejk.63.1705512556156;
        Wed, 17 Jan 2024 09:29:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906a39400b00a2d49132dc3sm5519051ejz.197.2024.01.17.09.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 09:29:15 -0800 (PST)
Message-ID: <b4a23de5-3aa0-436b-b109-399b300fe876@linaro.org>
Date: Wed, 17 Jan 2024 18:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-3-jbrunet@baylibre.com>
 <4rdb2be2bfzak3s4uaizthcdcdwdrxnx4kr2sgn527hvsie3pb@gfqciim7yryz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4rdb2be2bfzak3s4uaizthcdcdwdrxnx4kr2sgn527hvsie3pb@gfqciim7yryz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_092919_722480_F0427514 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

T24gMTcvMDEvMjAyNCAxMDo1OCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+ICAgICAgICAt
IGl0ZW1zOgo+PiAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tZ3gtcHdtCj4+ICAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1neGJiLXB3bQo+PiArICAgICAgICBkZXBy
ZWNhdGVkOiB0cnVlCj4+ICAgICAgICAtIGl0ZW1zOgo+PiAgICAgICAgICAgIC0gY29uc3Q6IGFt
bG9naWMsbWVzb24tZ3gtYW8tcHdtCj4+ICAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNv
bi1neGJiLWFvLXB3bQo+PiArICAgICAgICBkZXByZWNhdGVkOiB0cnVlCj4+ICAgICAgICAtIGl0
ZW1zOgo+PiAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244LXB3bQo+PiAgICAgICAg
ICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb244Yi1wd20KPj4gKyAgICAgICAgZGVwcmVjYXRlZDog
dHJ1ZQo+IAo+IEkgdGhpbmsgZGVwcmVjYXRpbmcgdGhlIG9sZCBiaW5kaW5nIGFuZCBhZGRpbmcg
YSBuZXcgY29tcGF0aWJsZSBzaG91bGQKPiBiZSBkb25lIGluIHR3byBjb21taXRzLgoKTm8sIGJl
Y2F1c2UgeW91IGhhdmUgYSBzdGF0ZSB3aXRoIGRlcHJlY2F0ZWQgY29tcGF0aWJsZSBhbmQgbm8g
Y29ycmVjdApjb21wYXRpYmxlLiBJZiBkZXByZWNhdGVkIHByb3BlcnR5IGNhdXNlZCB3YXJuaW5n
cywgeW91IHdvdWxkIGhhdmUKbm9uLWJpc2VjdGFibGUgc3RhdGUuCgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
