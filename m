Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43A8EE4996
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Aug 2023 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEy6g+PZqzolXiKnBMxXvb2g/oHnB24zb+miFveQwog=; b=pdJ9tzKbfXzb26
	9/KxPctOMAbmH1MgatjA4EFI76SXO124jIdLXCa/iSH4o6U31Imb435hmAgWGdBx2DeUnTODQMSOa
	ebZIjpBgA3Y7Sccnx8gUxigpf9GOVOomFcu+C+NMNhnMTJp5F3TUkkRkcZa6jjYuv0whIjWX3SAYf
	bs0QuMDym+f0cSOQj969L06iReNlMRAYQdWluGmyvnRBUQX7CdiMXJborP8AovtaO2PjQzIRba+cN
	UkbaYB9V3Pk8UwbKa6QzudhbY3z2IICl83jmv9uZz8wNq+hzkB/2x9Wl0lgS4ZjAyqFQ4MP7NNsV8
	FKXH4AHMZs4r/ZZMp6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUIe-00GUlv-1i;
	Tue, 22 Aug 2023 16:32:12 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUIc-00GUjt-1W
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Aug 2023 16:32:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52a1132b685so2507716a12.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Aug 2023 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692721926; x=1693326726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3uQSylp0y7KOudR5yNt2H8UCOVpvtj04yDey4znHRLA=;
        b=e5CZu2+RpDcrjPEl8gmUFILhTTitUimNfzkLuXEk57VQEAR2kqg4fzp0GPXAj6oabp
         y/RseqyXDzppUaEiTL85pFDe1WvN3QJYyOeMFpclFRQ/AkswADsSbfon5WGJ33/DT18o
         KtT5l2KhvnfzIeAdB76PQW/Ov67hq+hLXRfBGw6HvcvdHYAYUVzlXBFPQtE3tso33cjb
         tsTACVCo49NMTag1NXI9lSVdEud/QGTchIkcgqlHbMsvvLlIAgDl/iLVO/BPrY8zjLfR
         GwEBlkmoJEdJ9K7LE4qGL/ApbUeXqvu65DKCENt2U+QuaxoILHikD32g8j3t1mGm4Btz
         eCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721926; x=1693326726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uQSylp0y7KOudR5yNt2H8UCOVpvtj04yDey4znHRLA=;
        b=Q3/lS1qNrUZ0mzIYlgx3y7wnYHhZUrGTT+KlPMbS86O1ruhfCVWsR92Jh55HDpGW00
         eB4Xr9n22iWavoENhoXeqU7hipEbo7IsVKeNUMc5cZQLilZmXJfE6uQJdmpNCP2DmXGS
         1c1CBdyqTE2dFZHVJ82/eSXqdRL4hboTjjAiLtNr4VeuOxK2m62bVdGZSWvHKw4a75ht
         wChsEzXIyFt5Nblnm/MV9QxY6ieC8zUmGPzw9Z+1Fj71eiXq379+41pJR3L1oemgWO4E
         GClNlDFt+U8cgbaOdjX+EeG01NKE2f1i9p0zojsk/OIP+axDrs/9PFHNqztJSCZx+dTY
         fyuQ==
X-Gm-Message-State: AOJu0YzWSXVpDK3BB7rAmcIJvFkt0GPID38UZnXT+WQ01USdNGbGyl2z
	EPwqGDTRleU5GoRRdUuundTWNw==
X-Google-Smtp-Source: AGHT+IHY8roXOKlErN1u6cAk1xEiMD1JJ8eVAuVfBioslGRRaPmLvzi0W/JaIoSiX7eCI6hpEj0Ksg==
X-Received: by 2002:a17:906:cc16:b0:9a1:870e:cc9d with SMTP id ml22-20020a170906cc1600b009a1870ecc9dmr6733431ejb.18.1692721926631;
        Tue, 22 Aug 2023 09:32:06 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id x5-20020a170906148500b0098e42bef736sm8505501ejc.176.2023.08.22.09.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 09:32:06 -0700 (PDT)
Message-ID: <d2a6060a-c8a0-51c7-f621-1bed2c3074b4@linaro.org>
Date: Tue, 22 Aug 2023 18:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V10 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
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
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822082750.27633-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_093210_508160_90D9A45B 
X-CRM114-Status: UNSURE (   7.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/08/2023 10:27, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the S4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>

Lovely. I sent youa  friendly reminder at v8 which turns our you
ignored. You keep ignoring, I will start ignoring as well from now on.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
