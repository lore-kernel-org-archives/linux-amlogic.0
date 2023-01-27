Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634A3C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3h91m5OL6EfquTAwEvmbHD0ZIV8QuaJM8nQgHlo96g=; b=YPzn5DwvxiDOok
	jsHXUhoR9ml7n1D8Bpss1U1P9yImynBRAKJ6cLDhyUhqLWXO1AI9Nj9Nir7hM73ESR+J8MH2K2pcZ
	4hWp3lesTVmX/fLpJjFnv4cwRHEeO33REojnXq37imMJle0dZ6A6QzwD4Ia1QjH4rqDglOJjD0RSi
	M77lEPlypVemygQOwWH3XBmUoZqYB89rsRjmkthXjEF40Sm5kM3qAMK7I7Myv3Ly5tpgIqcwIVNDh
	Q0s3XMkOjMl8RNpykY4A7414dknsHvXivBXWQA2D22owxQ3wIYeAtZrvLF6Ri8VktfI0bUjGP1mHX
	iR1dqEkM6kIOBewRSiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOo6-00F0I8-Ac; Fri, 27 Jan 2023 13:30:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOM1-00Eovm-0b
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 13:01:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3427339wmq.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 05:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMnVq+NB+1tK09uygEs6Fm8LZUyhtPlPvBLFWoCDRCQ=;
        b=ws+0uP49Ft1pY5oydosIOFN6CHCn3TOmSNw8mQRV+iFyah1TsBAYK73U8COOY8Kd4j
         IIWKZp9ldeOxCabhO77lDQ6J94RFmgFzpvm5mI6HA1Bfx9kXXaNDvtgkDIqitpfsqJEF
         gWXOhLqslYtdk/5Any2/uNel14uBAsGkok1ew1kKA0ZoL5hdMqbERI/Mm2AxyPenpUka
         lGq0oRiKmN1liBZF4M1WlrIMDAUr6NflveUlVWF5ZL+Eu6/mLv4QENn/tg0LxbvS5r4K
         seCTSKFHGEgN2uy1SRKS1QLPs6dZiKaJ7DWLE2L50sUGTttAt8CxOabVeXGcFbtg3L68
         NErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMnVq+NB+1tK09uygEs6Fm8LZUyhtPlPvBLFWoCDRCQ=;
        b=cACdq0fm6O74I9I4wxPdt2K5mFTfcCzJIULB1DyLBneRMTTXe0evZ4IcenNgP0ToSH
         MYpA25QCdT/ZVkjHFZRuN4qHcctd9KzuBLhmWW4y/BWs1t2L8qL1+1w2v7DKxvnB+wcd
         YNBrSc5VpQpUuYdL2PF3pSReBYHP2Z9OHWke6DIQo524zLVVVP9DjHRcessoghaRa+fW
         Yzxv+oCWhUvTf6bgigBZlvu2/b4TVvHJXhvDej1yyz2hwnVuJL6zsWClDbGely+KEEmW
         CqAxdVa0vqSfHxVs6UpGnprqahJRrxYdD2pA118ZISoF803OdwSrTYbC3O3Cdkd8fRLt
         Mneg==
X-Gm-Message-State: AFqh2kqlH520nx1PJ4eaUCFHj2yf8cth1JVNM8R2NJ2ZdyCQuznDy9Gm
	JaQg19Ds+Yb54ju43JXmRzsDDQy08lhbfll/
X-Google-Smtp-Source: AMrXdXv5XJDdHjgDNxyUzjBB+zeGRqweHYFXYuwkOkmbcFnD/EPUK7PVxWlSwcu5tk3ZHJLK2Qu+NQ==
X-Received: by 2002:a05:600c:1da6:b0:3da:107e:a1e6 with SMTP id p38-20020a05600c1da600b003da107ea1e6mr39486790wms.17.1674824475303;
        Fri, 27 Jan 2023 05:01:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1321433wmo.21.2023.01.27.05.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:01:14 -0800 (PST)
Message-ID: <468aef98-2bd7-03d5-0f83-dc58bc4738e9@linaro.org>
Date: Fri, 27 Jan 2023 14:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] arm64: dts: meson: add support for BananaPi M2-Pro
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
 <20230127100236.3385154-5-christianshewitt@gmail.com>
 <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
 <356B9EBF-B9C4-4CB0-9F83-9E7A62F93F65@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <356B9EBF-B9C4-4CB0-9F83-9E7A62F93F65@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050117_111822_FA56EBDF 
X-CRM114-Status: UNSURE (   8.46  )
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

T24gMjcvMDEvMjAyMyAxMToxOSwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4gSXQncyBieSBk
ZWZhdWx0LiBEaWQgYW55IERUU0kgZGlzYWJsZSB0aGUgc291bmQgbm9kZT8KPiAKPiBOby4gSeKA
mW0gc2ltcGx5IHRyYW5zY3JpYmluZyBmcm9tIHRoZSBvcmlnaW5hbCBNNSBkdHMgKHdpdGggZWRp
dHMgdG8gb21pdAo+IHRoZSBhdWRpbyBqYWNrIGJpdHMpIGFuZCB0aGUgc291bmQgbm9kZXMgb2Yg
b3RoZXIgQW1sb2dpYyBkdHMgd2hpY2ggaGF2ZQo+IGxvbmcgaW5jbHVkZWQgdGhlIHNhbWUuIAo+
IAo+IFEuIERvIEkgbmVlZCB0byByZW1vdmUgaXQgaGVyZT8gKHNvdW5kcyBsaWtlIGEgeWVzKQoK
WWVzCgo+IFEuIERvIHdlIG5lZWQgdG8gZXhvcmNpc2UvY2xlYW51cCB0aGUgc2FtZSBmcm9tIGFs
bCBvdGhlciBtZXNvbiBkdHM/CgpZZXMsIHBsZWFzZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
