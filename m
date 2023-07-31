Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1894C001DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8PJRd1i7XAnb9MTI4NDkrZpvZy8VbKJ4Ccomlsr3i4=; b=byBHx6chXamz5K
	nwUEuPk7oQFvekU20q+ne4MpQhFYckSRH3kT8/e0CXORYAK22LHbUg8OgJi19I9PcdAgN0OxvRDAv
	NzmPs1gwbXvmFfhDqy9WMQQe/rnHWavCaFwozo2ED3DgdDRaMyzdkl0mBZQpgDguU2uON78GyxnCy
	TnNBh8a81wGuBE/gjlTdA9mfx90bohqDjQFieXpIWgKcNpbV8KH9Zvet6zpgJZ0mlGPtPog4D2EOr
	0qszsThzC3nVI5+jWcuCdlEIvsKfNGNpJ/8c4hrJBD6eywEeivwrXyV4Ro/13Ocb3B+yPipYqY0wH
	Gt1juwBqCqT94PH8wQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP44-00Ekzb-1w;
	Mon, 31 Jul 2023 09:19:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP41-00EkyC-2f
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:19:43 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c10ba30afso197322166b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690795180; x=1691399980;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLlv/2g+8YJBVDyaSbIDe/tbW/4jcVh261aoxn4jYFg=;
        b=b5bGdqK85r6R18cpvUplg8qwBPV7uvlxNrCQu1TcDpI+/pX8pwx0LwFlojFPnPhDvc
         8Wo+ZAInZ2684b98m8PZHJIRIhZpuX8mEa5eimmK7qr7qjWB/9hcd0pDf2vDtVpvFyCI
         KhdRerGOQg/eCuHhdhx8qE3LP7zpJeVEd//iuJV4t0GI204Bvg4WmKj/2HMaBN7/UfKM
         Fg2wnsnNLl7uyxSoctOpkj8rnft+eZg1qF4K0UzY/CHceLeGZE8B2QDZWNf3/a8ST2ww
         RcGrqYkyO2SJ5Yr65oeun2CII7QdMYTyDDgpHtWI/WXUYSsl+QT6/dp5j+MK4V27opgF
         iqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795180; x=1691399980;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLlv/2g+8YJBVDyaSbIDe/tbW/4jcVh261aoxn4jYFg=;
        b=Z/7VcLeRxMdJGoy1TattlzkTJJuPS/3P2pKu9rj/tM7LUYAginlzptolfxzo15MWRo
         KrFyChChE2ffzPQ/EujcSodI53i8LliLxDz/8anUnWCRtl8nFbncMabXr9S7sy15jxpS
         NSs9eXVHx18IYruUywoczhH0HP+6lbl6XUwefs3OQrTdTPu+BG2Jv6In5SBzVzbLqwcZ
         J+2OINFWpVmIlCNs+uXUYPDZVsjqw2zvqgB9Wn8ylx5A4rP7CmyJ/8cNkeVMVWLC64OW
         K3gyOUHo1ssxUpweYGuwb4Q+uKXsf8Vy27bl9jzZcdx0rpQCfmMDIdEPtyGEU382k/sS
         cU2g==
X-Gm-Message-State: ABy/qLaROm1bJWQz7w4fw7+X9Tu/tqCV1oQRvsVcyNC1bt/ZBfuwW9PX
	ahpxLyjmsKCQaEFShH9loAP5Bg==
X-Google-Smtp-Source: APBJJlGlo3yNJtkZt5VqMPUJ/KLVLigOGOukwoiMhJSC7gBUFtSIr5vZ8gmsj6DC0NEk4HBVWFJCmA==
X-Received: by 2002:a17:907:7f8b:b0:98d:f2c9:a1eb with SMTP id qk11-20020a1709077f8b00b0098df2c9a1ebmr7608208ejc.24.1690795180377;
        Mon, 31 Jul 2023 02:19:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906089a00b00992ddf46e65sm5839311eje.46.2023.07.31.02.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 02:19:40 -0700 (PDT)
Message-ID: <273bd185-4aa5-510f-0f1d-1a4cab2d4a2d@linaro.org>
Date: Mon, 31 Jul 2023 11:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: drop redundant
 status=okay
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230731090442.100856-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731090442.100856-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_021942_355116_D6A38853 
X-CRM114-Status: UNSURE (   9.42  )
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

On 31/07/2023 11:04, Krzysztof Kozlowski wrote:
> status=okay is by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 -
>  1 file changed, 1 deletion(-)

I found few more...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
