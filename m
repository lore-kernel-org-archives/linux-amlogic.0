Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B43C636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RTOddVguqG32dJHP7XFYgy2qtYUSeVVEZ9ElO1XhS4=; b=yWQ1jJ4we0S6E4kznwNmmYaoYI
	Ob7Y2L9Vdkf64fKElpazxmlqsfbjLHPAN/L8mu6posjWDvq1tz+/0GXC1GN8RUzMhp9FVuqmcSpwK
	PbouZcmL95MXzhW8WLHdjcjduVTfFAlI20LerOu+bP+eLKToSrHlmAKIpS3JQ+6HijLRjsyfEMT3A
	6DIo70yDbf+q72ZLM8S+3sb5eD7E4If4YKzSad6uqQh4G/P19WY4IekmwV7FvuCQpmJRcMCjUL3I9
	EqEk+QUISL2AAMub77JWttpOPbgxHOOpxGyIngfIYuT9DsGg6yEsCFHdc3YnhI4KwNDXfr+9ZmfYO
	rPH9k0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJ1H-00BFNK-WE; Tue, 07 Feb 2023 08:08:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPJ1E-00BFMS-KL
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 08:08:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id k13so5266989wrh.8
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 00:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RQlDidB6Gvvp6ghBrLgv75BvvHu3m4TEuLCw4BC1C/U=;
        b=sEDJ1fu0JDTI24wHOg1lgL/WoCnjFuVGa7uzyEZNEFTIewsjrxYH8wjB5CfvF6IGwG
         4mMpnDpzmYZm6v4rR8GObnKIcJhTNFiYp4cchYRfiYLaZEs5//+6a0aEVjLP/mxpC1Rg
         fGJ/4iUKSs0FMVz+2TpqE4LIMW/ziGHtl0edQd9uNLan3a3bPlcaHeFQjcm3Vj6d/vyb
         fU4KXb3tFx2z8RVQSQ54lKBvToSP3d0CDjTEe+cmThPSxLpXC8MUS2CBvzVhCnmScFQM
         TvL+6CtWAHca6ezrDoIMvl26AEXD0SeLcEe1rPCaD8Nc3tOvNjyFJglPvPTPImZKNaML
         yo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQlDidB6Gvvp6ghBrLgv75BvvHu3m4TEuLCw4BC1C/U=;
        b=GfnpKlIekUK3sH36ksrGEUjeuqmGXI/irvunBr+B2SA1IZuI01jpEyUwmQFNT/KAiD
         9WB7yzBBOW2Uw38GVRDpNDc3707spk4ncEG5hu5xqbPZlrvELxw5G0fOiRtaPiBLUaN2
         Be00Uh3LRXjdL1SlaqhgogXYiimqunsS+G3TdcjBcIpXCzFYYT/kO8/llW7RQMCdpnYL
         54B1+COTL6lBLqcdE6pi6J0Y7DaBIJJLZKvmy+dY9cjF8N1qDU3hTC2tBKlERFNjoqFZ
         p5SNtJa3SmOv6Fyc2Yef3O8svVt3G7naqMr/UtD6m9l0MvJSeXnydRkYQ8oW2li5yAh3
         48Dg==
X-Gm-Message-State: AO0yUKWmxoqR6yDAwxCMfF0Hek5bMTnuLPFnG90sdvqe+2u95i/GRdCp
	w/BP1k6aXrD5yvtIl/Jld0QBxA==
X-Google-Smtp-Source: AK7set9MUnU8VvfsvVaIq/Or338muK8PL0UGOugI4JZSjpEDpqiycPmBpgyzKRDbCfFOS2RaJaUHew==
X-Received: by 2002:a5d:6b4f:0:b0:2bf:b68a:e122 with SMTP id x15-20020a5d6b4f000000b002bfb68ae122mr1898790wrw.33.1675757278977;
        Tue, 07 Feb 2023 00:07:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3? ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d6d06000000b002be099f78c0sm11055130wrq.69.2023.02.07.00.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 00:07:58 -0800 (PST)
Message-ID: <c65e894d-2682-9fc4-1843-1e30b2779d42@linaro.org>
Date: Tue, 7 Feb 2023 09:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
 <20230206082317.ygvixvhjqppz4nmy@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <20230206082317.ygvixvhjqppz4nmy@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_000800_707938_18804395 
X-CRM114-Status: GOOD (  12.49  )
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

SGksCgpPbiAwNi8wMi8yMDIzIDA5OjIzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxs
bywKPiAKPiBPbiBXZWQsIEZlYiAwMSwgMjAyMyBhdCAwOTowMDoyMVBNICswMTAwLCBIZWluZXIg
S2FsbHdlaXQgd3JvdGU6Cj4+IENvbnZlcnQgQW1sb2dpYyBNZXNvbiBQV00gYmluZGluZyB0byB5
YW1sLgo+Pgo+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4K
Pj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4K
PiAKPiBIb3cgaXMgc3VwcG9zZWQgdG8gcGljayB1cCB0aGlzIHBhdGNoPyBEb2VzIGl0IGdvIGlu
IHRvZ2V0aGVyIHdpdGggdGhlCj4gb3RoZXIgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyB2aWEgYW1s
b2dpYy9hcm07IG9yIGlzIHRoZXJlIGFuIGV4cGVjdGF0aW9uCj4gdGhhdCBpdCBlbnRlcnMgdmlh
IFBXTT8KCkkgZXhwZWN0IFRoaWVycnkgdG8gcGljayBpdCwgaWYgaGUgY2FuJ3QgSSBjYW4gdGFr
ZSB3aXRoIGhpcyBhY2suCgpOZWlsCgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
