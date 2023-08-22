Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71053EE4996
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Aug 2023 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDt20x3R3P6gPkEK9spHy5ur6XpY8POwHtTv9wFL/UE=; b=XR/sUWweCLTRbr
	OHUBnYNwJTtg5c6rI9hiliY4PLk/v4sNSZ5x7RMfP8zQzXBCdXSsroNLIlooRjr6eYdne85o9tQy9
	+g8muro4speGLoIPrSn+emO/v/5nN5S8skZ6XEFWId5dEFihQlSXlCNbHM+PXlkXZd1dpHKqN6vIy
	ZVyL8T1HTnIhSCEF4+sjtKcVd2px9taoMWxvLZ09/QgW0saPXn4amk15JOBe+F1NABc5BUBLXpiPU
	2yrGAEsegnuOghz8YiAwxnmnJyjszC4kOzUJwm/lOy5BUu5LgtanS2RqcCg5BZzpnh9AexNfBjuH7
	6yOS/GMiN/k7518hpz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUJr-00GV8X-2z;
	Tue, 22 Aug 2023 16:33:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUJp-00GV7E-09
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Aug 2023 16:33:26 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so7129854e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Aug 2023 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692722001; x=1693326801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xSrhz5Us97Qf9+7A783D7YhpLpwN4x1lqakquu3VGg=;
        b=tiEBp3JL4YsbBo0QBtgI3BmQCPsYGmzCdpu19U5Nd41sv+ssgGLIFtY5a1xz0xtsP/
         BKPV24/E5/rZr1hm9Q31b6qODcKiXkchKBWAx4wxEzP+sIwra+poInZczv74sJUEnrvW
         suDXeUnVmclfMTBeErpwG3IQKd89egEpnhRv8CuJBKLaiW+YaczEgROWpPB8YPuczdGt
         Cd1gB5TRwa48+WR33V341n6aJiGfIUhWkWOCEHwSlblbZkDmMzV4ork+r5tBySfvhwbY
         kKuuBtulfExcTuvOKdTUoQgBewgcUPZUDiJ9ofZhY0gNyPk+XIYeRlet7T3VAfOD3z35
         X/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692722001; x=1693326801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xSrhz5Us97Qf9+7A783D7YhpLpwN4x1lqakquu3VGg=;
        b=TlLJhvUf6jwJr9oSUxnyl/YOj1Gzt+umi9hgRy3eEBysUidglbAMyOqPtvRUQ/2jze
         BhfudRW9527WxGjJquotXIkblq/GVjPUu1dUqQ7ZOoDbDz4hQWKwnDs7YVEYUND+uL8/
         eWdsmO67KiZhWLrh1G07xLsJ7BUI1Uq2o+ffYuwQXojiK11FPKD6FiQP5FhwO2X12l7o
         rObrgFzvpKZBH+0DaezSMl7fd1jgePqLbcbwo1TzF0Sjva3hZKQktXINmjdkR9SXcGog
         R4yCFPWxRQ0YWeoBK8SgzO6bGFqDSJbHpd8wdFg5G5VeT7fFSy0ON4zBIrMdwDEKiTlh
         0Alg==
X-Gm-Message-State: AOJu0YwD9FFsKD+2jjUDDx2GEv2WisAGSyoAVmOtj72PQxwr6sGCzv6d
	bfKnrlw55kzWZdXa8hfKjGMFAg==
X-Google-Smtp-Source: AGHT+IFS5+pN89cVqDrLU2XMxBLLm1IgGNr/2RbOgFBpign6kDrEGDdwUp0uhR5vmCE6wdyEgQI7Kw==
X-Received: by 2002:a05:6512:1584:b0:4f8:711b:18b0 with SMTP id bp4-20020a056512158400b004f8711b18b0mr8883753lfb.3.1692722000583;
        Tue, 22 Aug 2023 09:33:20 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id w17-20020aa7d291000000b0050488d1d376sm7750157edq.0.2023.08.22.09.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 09:33:20 -0700 (PDT)
Message-ID: <1c812715-731e-18fe-e431-311f18af1bb5@linaro.org>
Date: Tue, 22 Aug 2023 18:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V10 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
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
 <20230822082750.27633-3-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822082750.27633-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_093325_090263_B4BC719D 
X-CRM114-Status: UNSURE (   7.67  )
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
> Add the S4 peripherals clock controller dt-bindings in the S4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

As well ignored email from v8 and v7 and earlier versions.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
