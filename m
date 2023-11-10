Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628EFC4167D
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqzbfuIiSwB71z8GS3E8pJruH4vAtKAxp/ShenTvAOE=; b=ZfOFPy8ek4PmQt
	pjnBCFLi8qoCCyhF890i5meq0HA71rOnz5QKFOOGhkN19OMAi0Kx3jFqZ1xKaRaQL5coALfyX0+nw
	KPdTNPRXFjQTYxO7U9PmJfzCRjSB5dcmJuWR+tLOnD0ZwA0BA7gb5xv4pymSENOZIQz/LSEfQe6q9
	oPBkv50eB0wd/xRget3LTGyzcGnCIoBGJTpSVdD+aXlG2uIUDBF2WYYxofsw7mOYUiTvi3JhdvbBa
	x6jHrXG8eUhI01818CE4vDpkPS1OlBgmklZlNdq/2y3pxu02wg5sQuoEpw5RgoshK2Zgj/5Zz178p
	SuFkLC4LraMOWmlQ/MmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1RR2-008pdh-1Y;
	Fri, 10 Nov 2023 13:20:32 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1RQz-008pco-2D
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Nov 2023 13:20:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9d10f94f70bso336031166b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Nov 2023 05:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699622426; x=1700227226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dFaUiMp+I2GmXiYvOF5/Uap6tJj1Fr3BKLmgZxMJlI=;
        b=QLD9YqU8FIioP64b82gSYUjAl0hb2vRBXIfMjvBSSNB/X/7/dcUR6vZLpDyu9a1Za/
         NE4GmY98ldK1gmpGRGU9354BMMYaUzJKBRZxqyHJAly0NCpdziodoit1TZvVTUwFGxDS
         2LlUi3ydgt2REJXQlobnBUWD4gt1NEcd7gBXsDtDHhryzrkIcF6q6D/+80vqPXyDH4eL
         XqwEzN/gBdStc7jd592g09dDi7pkHekS2o9OjgqD5AN8iTmlJzwfPsRXWV2Prh2dqwKf
         xlWQvyEFgoGw8e76wz+zQBnNXFkJYRCrMKcT0bC+zLnWYtUNgPPjubLhueDhKsU7lc4o
         Qdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699622426; x=1700227226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dFaUiMp+I2GmXiYvOF5/Uap6tJj1Fr3BKLmgZxMJlI=;
        b=YcjWVrk0slYGU34l1ZJGa71KpelZNFkvqaRDdsJCneCZ47SLhYsD4op0BiX3UqA3TE
         8aL2kv7LEOQulnfFf4m1q0v60iSJus7Vw9VLoNzOa9aqrPBsroHCd6enmxq/r+vJonqZ
         D5gujEWAAKdGfYShQQdoxULaj0mSXKcmT3xP9E54lEoo06tdJAmaCIZghuiMdWCJYIJL
         Mhz8zxq/hkGfWtcAN9BxkPLga6gb+Pwjf9XOSyuOimrAQx+5BBZE/1yWCE59tS5mnUfO
         ietoUobZg3O1uWdVvgQDgfJt2hzxVJlSBXxW0UnpcdVgh8yk/s01FFPJA1aQB94+jDHU
         C4jw==
X-Gm-Message-State: AOJu0YwVNzLXNNjpo+mdbsJVM+cJBs7gHUns4yN8+swpfbEOVmxbvGZA
	f/Qo3N9VtZzbVOtciDQsbpQxhw==
X-Google-Smtp-Source: AGHT+IEkxciCaeyoH6QomNaSLvPYLBZXNisIJqBG54egRPnR2BYt3umU2esj95e212mKBHZc3JGeNg==
X-Received: by 2002:a17:907:7f1e:b0:9d5:ecf9:e6a0 with SMTP id qf30-20020a1709077f1e00b009d5ecf9e6a0mr5633222ejc.0.1699622425883;
        Fri, 10 Nov 2023 05:20:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id gz11-20020a170906f2cb00b009b2d46425absm3921054ejb.85.2023.11.10.05.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 05:20:25 -0800 (PST)
Message-ID: <eab3869c-7529-484d-983f-dd85ecfbeb0b@linaro.org>
Date: Fri, 10 Nov 2023 14:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 0/4] Add C3 SoC PLLs and Peripheral clock
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
References: <20231106085554.3237511-1-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231106085554.3237511-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_052029_736470_2460C286 
X-CRM114-Status: UNSURE (   9.74  )
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

On 06/11/2023 09:55, Xianwei Zhao wrote:
> The patchset adds support for the peripheral and PLL clock controller
> found on the Amlogic C3 SoC family, such as C302X or C308L.
> 
> Changes since V5 [3]:
>  - Fix some typo and modify formart for MARCO. Suggested by Jerome.
>  - Add pad clock for peripheral input clock in bindings.
>  - Add some description for explaining why ddr_dpll_pt_clk and cts_msr_clk are out of tree.
> Changes since V4 [10]:
>  - Change some fw_name of clocks. Suggested by Jerome.
>  - Delete minItem of clocks.
>  - Add CLk_GET_RATE_NOCACHE flags for gp1_pll
>  - Fix some format. and fix width as 8 for mclk_pll_dco.
>  - exchange gate and divder for fclk_50m clock.
>  - add CLK_SET_RATE_PARENT for axi_a_divder & axi_b_divder.
>  - add CLK_IS_CRITICAL for axi_clk
>  - Optimized macro define for pwm clk.
>  - add cts_oscin_clk mux between 24M and 32k
>  - add some missing gate clock, such as ddr_pll.

Where are all these versions? Please provide links.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
