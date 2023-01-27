Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B9DC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rDyikWrWxZWd/WvIbU7uQLwfewHp27QM4Oga3Fo7N4=; b=SRs7SphXTBgd3M
	eHwvU/O6GdodF1uDikJtVrMEiKapnYGcEngyd1J1xQVzhwJerVGEimY/lnRjpXEmOJelD7MQE1pkr
	/j6mowVNETSa8rpG5uQsqqXdcDnE2kpM1czhzh9dZCbmwly0tClV9gI6XjWWpg1LIJxxXLQyPpzdP
	8/Jvf8p68JgYlS25Hu49Ea06n5w4QngnGTeeOf0+s44ohtXwnxGZD+4UVvESNcLDgeBToDwAO2fSV
	s3HsP+R8H0gcJ44UWsUs8bvFo82non6I/jWoyWuQbFjk1+buu9kKI98WxIcYXNu1HxWr2GB5x+1U7
	133VfZHpD10z2zkf7B/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLd2-00Dr6c-9D; Fri, 27 Jan 2023 10:06:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLcm-00Dr0x-0d
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 10:06:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id h16so4446585wrz.12
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrmC8WdTW0V7nfxUCBuNzCB15DsVsB4CVGrKeJr0XwI=;
        b=R6dti16XJvpVSbPkZMoJCeut3ET+cUH6XG/nCRHE70H9gugFOiATRgsfhoiUjVLRUC
         oErbVimD1f/9U2vb9k+NxxoeuF7eY3QNBSqUQUhIJDN9BJ06H+sJbZjniHU3RR7jq7Lm
         bQq6KID6+SLdPXjbqQ7bD2hwYRpyNwF08quazpWz0EA/aROGirP1TMUXa96RvKKrH+Ti
         ELZtBi9NOErlCWPJNWi72GaVKGXq4B09gfik99zhGOmvsnJRwS2cYtymbebxx9ImTr8c
         IYQGMSKpmWl2vPiST4upIboeECI9TEalBDCL4l9Z001u/rKwJVAXapPE+ewszM8P8+3U
         ZTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrmC8WdTW0V7nfxUCBuNzCB15DsVsB4CVGrKeJr0XwI=;
        b=xVezmniNe4WyB0VU5ISecPd1VUGT1Q6Z/ZC7YynjzNSqQ8A/t1m9h/b6Pzw4+BDRsA
         vq53rne5Ag0nr0FbfEOdm3TuFna1kLo11LxdKx/01ShTT+pphML+lavjr5Sa0ewtuGPl
         8ANM35rFT8QOAzedVqwJiuq39fEgBCic+J1dVtQeyGpDRBcunikq9hc060eO/kh4XPa7
         wFuLfnILFkwtMP3SRTFXBNSYE5Z12ZUNetjUB6j253pI37h9USdcxj7ouWU9WTtl3yDg
         NbvK8+mxbPpQSkKSk4D4X6I06YCSlCQ77Te0mfRUWuBoIwssgk91wumcnSS8ilS4SAPX
         YvVQ==
X-Gm-Message-State: AFqh2kq/oZSgP4mE+Wr62iXTucGMDfmQygyvDMsbbv9P5n0H7Blv3l5x
	xMfEM6OOnoHWngl7BFaw+8guAA==
X-Google-Smtp-Source: AMrXdXu3pU53VutvBKOcRJ/YqMGU7qLNIr7kC4qz8jtdJxITu14kcAIPLweC02JYVul+ed7Tc7KryQ==
X-Received: by 2002:a5d:688b:0:b0:2b3:b393:181f with SMTP id h11-20020a5d688b000000b002b3b393181fmr33752494wru.56.1674813981777;
        Fri, 27 Jan 2023 02:06:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y3-20020adff143000000b002be546f947asm3650960wro.61.2023.01.27.02.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:06:21 -0800 (PST)
Message-ID: <105ca1cf-0b86-cc2f-c73c-06c582827532@linaro.org>
Date: Fri, 27 Jan 2023 11:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: amlogic: add support for BananaPi
 M2-Pro
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
 <20230127100236.3385154-4-christianshewitt@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127100236.3385154-4-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020624_113589_F52BE0CD 
X-CRM114-Status: UNSURE (   6.53  )
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

On 27/01/2023 11:02, Christian Hewitt wrote:
> BPI-M2-PRO is based upon the BPI-M5 using the Amlogic SM1 (S905X3) chipset.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
