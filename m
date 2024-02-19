Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D2BC48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxnGFT9lYD1t1DhBnYOPU/wewxsns8H0vENnMBJjD6U=; b=l6a73HlUaDpQe4
	smADPfZ0RgtAxDj8Zscd+OWZT3Qx8jxzVEauOFFnsEoNGUDwpDRliRiblhQk5EvyS3xaI9cVw5JFV
	22eCREztAlTcscMdLXeoFV2r8BGXjf6dsYAlru/bRVY6k9T/ZB5+sgO5nMn5Mzox2tCsyd683/iH0
	uyr6KvAFYMU8Xzj1bcvr11I6+sezMCFFfJSuiLe/Hj4n4AfdvYXRgeFB3UGVRdpvAJKCL8uZXyKSd
	35Wbo9MKF5aPLKUT5WP2FW9OUVhE0FqbAEm9HZNHsPJymm1c7Y2hZuKgD/3LfIHXkRvpilLnzL6Gh
	aLO0ySFBWd1S3R1CW6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbx5a-00000009EeK-3CBS;
	Mon, 19 Feb 2024 06:25:18 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbx5Y-00000009Ecu-2GRK
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 06:25:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d241ff062cso843531fa.3
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Feb 2024 22:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708323912; x=1708928712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
        b=ICrhYGWVTQrSbH+t/BQvUMJZDRMBh4Y0Vl/9XCcgRg/JmWvhpKXaNxmtJWCAoqmXaL
         psybVh5kqLENXMWRCBDTV4rLVQ50/99JG/RJJ9dfR1KGRitEpowmqEMbRxh8vF0ooJpE
         PDMT0VvSGqEDNyiU6Z5I+fDAJL0XDsiVH8bJaueKoQyQtsviwW1l+3OKGXWVbtfxYe96
         rhhv7HYlYCObHOk+Y0XLa+Cw+lggq12qxN2KtEl8vbWXBIF0GJveVWv4uUl6DEFgf0UO
         jbXslQFlVa6B9CWq5j3/gp7tLUcQTeePVcg8KrwjEPgf63boFwlAM4bwBmYXOi8GL1Hk
         AiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708323912; x=1708928712;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
        b=g2aIZiJPRUvTLteQNgcI7DO/SEQ2F51CxvShs6+Pav1hC2CJuPl/O3gEXLkZJi2fhr
         iUk/KRCXYFe0qaxyYNwF1s3fG8C4itsAAq3ZezR7Wsl45WUmBCM9xY/ObuOqH49SoQrI
         8734Pica+cl9PwrdjjytXI+eGi8EUVt7N4IOuHWQIiHnEfVdUnG9xG+v0v3ipVsRu3BP
         VLwyrPS6X/pWiIL+Dvwrz8KoN7thXgWK73OWcN2jtm4CRunrkU9f84kj8bKOpQRFOTj/
         P6L3eZSBH2aZSGGe/TVysoqOPcNgQVleVM0Q0HhHeXa4CF3/kTRMLsLaSq2OpNCJC+G8
         xuxw==
X-Forwarded-Encrypted: i=1; AJvYcCUFvJ+mvnfst6YZMKZRJh2Aphcx2hDJeUn7bkmuSTaHGkz4hHwufRjiNHv24pMYMBGKlpuiRn/QAPpdqjBWuPAKDZMhIjG3oxSp8ryyJL5KHpc=
X-Gm-Message-State: AOJu0YxDUd3Vu5t85ltvbm20n8deW5TBSRCmS9KuAhvT1y++lOZZRjrv
	3eVi6qeftjepQqgpJF00NuzWDfzP4gbgqTVOEx7DipcupkxqasSct7Ll1ptOFRQ=
X-Google-Smtp-Source: AGHT+IGP6skyrpQ+LHssyeFVL9x4R2C5PmtB+z/bDgXXtY+zd/lWWTMfb39ns1BsA6xd3vrJYLpPRQ==
X-Received: by 2002:a2e:99c3:0:b0:2d2:3b20:72ba with SMTP id l3-20020a2e99c3000000b002d23b2072bamr755168ljj.50.1708323911958;
        Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b004122fbf9253sm10177702wmb.39.2024.02.18.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Message-ID: <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
Date: Mon, 19 Feb 2024 08:25:08 +0200
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_222516_742390_06408510 
X-CRM114-Status: UNSURE (   9.13  )
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



On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/at91/pmc.c                        |  3 +-
>  drivers/clk/at91/pmc.h                        |  3 +-

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
