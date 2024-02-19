Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB9C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVBOSe5V7utdAOsDNJ1bf+nR1GkK/7UjQ0J034UDuqU=; b=jgfzNemXGneb8A
	ESj+eK00ghCXFCpSdlw9EvHx5nhtIqnXYfIpK8617eaeRtlrjxf5UomMON8tUO6knvVahrlQ2OCgL
	LXmVQGEbIKfP7ggxpMbd0DBClJ9dO13yTl/HLratQM1p8mngi1OL0VPvokkPR4/1WrYM3W3KfnrVh
	NyEV9S66I8EUsRRDxeJVy5S7fsf3KMj9+0uL9jUN4yFbxGZNbZdReJuc/YgLDTrhBPtLZkWJT+J4m
	7A+CZoA/AmPKIikyx1LYXhhAmwte2xr90/c1uRlqrMN9/JHwnZi7pagjP+0aAJ/uwXYjtPZ5qq75C
	mEqaquEw/JwYk120hZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyA8-00000009No7-3V9K;
	Mon, 19 Feb 2024 07:34:04 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyA4-00000009NmI-2TqC
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 07:34:03 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-511ac32fe38so5938810e87.1
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Feb 2024 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328037; x=1708932837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=fmaYGCZ6n453cIfAFACjPDsAKAHccBiqt4aJLZAIVHTigLLHJztz+JWfSrbQitohcR
         BQ1gNP+y1oMqYN63jGRWx3VXDZrQJCH21CWaSZyvhk5i/QdQcgdOsGSzdG3Jm79pvu1c
         zXcSW75tWA8smCjnM22Qy6ldUddnZ3vhxeNWS54W850lE/QYp2Xpux3gYJSVTHbwLN5A
         gYwsuUDtEf7JL1/Kk0D81YvT6EomerOZq7EYYISbAWblZx7CzH4crCQZBZlCjQtjqXJY
         Pvfw2x/YTNgTvSmbjAKzt0KGddfZQhAtnXUXh+++MspABv63is7Ki/B5hhFCRjR/0sJN
         CtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328037; x=1708932837;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=DbEzEVJ0dZCjWoa260TN5nmOXkqtieCoVPTKqTHTMqmzgkh7fKSPWialWE7QHk7Pf3
         TsV6r/iHxiqc+cLYN7WPd5fZOFHjxy4Y1vbko8aJrURUDxulqpHVIgJD4lHPxD3WAyAz
         TEps/U6T9hNqlZxMzvZQZ7XOiK9s9jWpFHb9/SfYQSCvlwltxOZH5ZXigcOCQBMpemHO
         O2pKyeurm7qubFEw2IildDBG0MQjzCAcDspDlql1Chi7bRk8jN1cY8DBHhqEJ4aHBYJp
         AmhUbKSr6OV5eyAHlNoSgKWCQaLvtXrpRzqJm7AIZ8X+ay+70CbrAt1d94AwP9MEss44
         /d9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLG01ju4bn7/KoCypK5yGHeoYkRSueZgxhy7ZFyiwAI6cNo1vT40GJ/EuU7m3DASLF+3Oe4xbeMD6LvhqFwzPLM3Erz+ytd79jDYKw8UwVvcA=
X-Gm-Message-State: AOJu0Yw0/YFUuX4swXwQv1pkIdzn8P+Igj83aepg+6pGRPOMG73XNymr
	lhVJCWjbj1iH0V+v3ZdtLKECTRrHYQQbbTKHn5w0y8tKwyBrAS9zXbGkrxtgmxw=
X-Google-Smtp-Source: AGHT+IH7t2S3UJLlE+g5RosWguA6ACJo1jYaUo0HRFcgzCtXQeK6rSIGLys7KhAWV1PTPsrhu0txhw==
X-Received: by 2002:a05:6512:3144:b0:511:84fe:8dcd with SMTP id s4-20020a056512314400b0051184fe8dcdmr7786108lfi.1.1708328036943;
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm7611582wms.26.2024.02.18.23.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Message-ID: <e6c6e825-42dd-4f2d-8329-f7b3e09bb8a9@tuxon.dev>
Date: Mon, 19 Feb 2024 09:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
 <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
 <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_233400_798857_6B53FAD1 
X-CRM114-Status: UNSURE (   9.62  )
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



On 19.02.2024 08:59, Krzysztof Kozlowski wrote:
> On 19/02/2024 07:25, claudiu beznea wrote:
>>
>>
>> On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
>>> None of the implementations of the get() and get_hw() callbacks of
>>> "struct of_clk_provider" modify the contents of received of_phandle_args
>>> pointer.  They treat it as read-only variable used to find the clock to
>>> return.  Make obvious that implementations are not supposed to modify
>>> the of_phandle_args, by making it a pointer to const.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/clk/at91/pmc.c                        |  3 +-
>>>  drivers/clk/at91/pmc.h                        |  3 +-
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> You understand there is no review for "part of patch"? You probably
> meant Acked-by.

Sure... Here it is:
Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> 
> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/process/submitting-patches.rst#L544
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
