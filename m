Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B39DEB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYD967O2P7a6D/lAr5g+QHCwe8eCo4HpsrXWu054wuY=; b=ywqXsubAb8VB1gu3jLVbgIYiHE
	2cyCPBSzdGZmPJA/jMjL73Sfz7iwU2TEz0iRnQ2TqqaedOOhyMGeCSS05RpTTOW1t1t6CUuNfJ+tA
	0WBmF3W/NNyREnmZ+WQu6NZOlNfQ4uGelaMdfsEyPuOizv4kueqeIDYteqRVDZOKedrHyFhw5os97
	ckti2F64/Oq87EOFnEcOaqXu0+K7Y86N2vOK/NtobbeHAwt24MsonsPgbohIRQTikUHMYOkE10BVF
	RZs/yujKnXGnlvUog1gFYQHJgj8R+mjihh6WNLwUUr9GieD3pOy47sH3qO4du/BQiYB1rnvMc3PXN
	aqoqHvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgFD-003uYK-1U;
	Fri, 07 Jul 2023 07:51:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgFA-003uWy-0q
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 07:51:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so2477025e87.0
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688716266; x=1691308266;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=exhYwOQz1Mbfg0VMEEcchmd9FhJ9ZbgKWVkcuVs8fv0=;
        b=xy9u9tHINP2OhQOYpSRS9mO1n0Fgi9RiO05e3JV8Mt+yXH56YaNxaSeN1+PXqFtZ4X
         p9dRgXW7WlB6Lkfu9dknMf0Wwy4SjzJP4Bn/y94MXR8px8Vkx/y8wn4KQfL51jHVl74T
         uIUuQckQZzFw+xqSYT/hp6RNlhEKy68GLoeLnL2CBwImMWAb56rH0oqShtkxqUdbcepm
         1zcusnJ56JuUsafQ82kiJQF3LUOLyTmcB6aMICY/sor+MzX50RYy9ps2HCDBlLdJ3Heg
         NjtytqfBbAAgsi3zBYsOvXix5Jo9WUFGoVZnSOb4GUS8pw5Ze/SHp9RJZwJYa1fzfpLe
         aRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716266; x=1691308266;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exhYwOQz1Mbfg0VMEEcchmd9FhJ9ZbgKWVkcuVs8fv0=;
        b=a3NMl4AXbuGdHSuBxS/Jwe0gAdt3ElUSS/mEPu2FHLdyicv2zSl9iW/ShT1HEqLW8L
         I/OlKtgo+b6HxoW7fPap4og9Qmh/01yxkKPqt6nDMkM3wvCPtAriAyjszjGp9kRj4nEg
         GD8wI1zrmDwqUiof78bnAgnTvnHtwpnAfP3H3Y06sITqgzsPe3O+Ky92P/VB6Upu7toM
         +L5CffXgby+4uAEKmX/zChNrlbXMe7PCy19D0JqbG/XNluMDp0dsExUONJsr0c8pt/T7
         WcKi3fzhGpVqkBCUZONo/tXDeyKWj6JRBr2GGWwdHSUiL0oltbmTFVU9GbigsB5Bq9hZ
         wqjw==
X-Gm-Message-State: ABy/qLaAqdW9UeyQ/qtQOJEnwwJoZj52O44YL/cXL5XsNfNvrLfaYJVR
	sGU4vH+aKqqOf6b+c5mmpzHqnw==
X-Google-Smtp-Source: APBJJlGK4QzQeHIwj+Zs4m17eM9Q4NVc2gwIf2/qRxJ81UC32DmjTxUkqCh29R9ASPUDnJCF6MhltA==
X-Received: by 2002:a05:6512:b8e:b0:4f9:a542:91c with SMTP id b14-20020a0565120b8e00b004f9a542091cmr4185793lfv.3.1688716265998;
        Fri, 07 Jul 2023 00:51:05 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003f819faff24sm1651460wmi.40.2023.07.07.00.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 00:51:05 -0700 (PDT)
Message-ID: <9b389977-156b-44e8-0a80-4273f7d2f178@linaro.org>
Date: Fri, 7 Jul 2023 09:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 4/4] arm64: dts: add support for C3 power domain
 controller
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
 <20230707003710.2667989-5-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230707003710.2667989-5-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_005108_301820_23C68679 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/07/2023 02:37, Xianwei Zhao wrote:
> Enable power domain controller for Amlogic C3 SoC
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: delete status,use "okay" status by default.
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 60ad4f3eef9d..f6603fd57551 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -47,6 +47,15 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,c3-pwrc";
> +			#power-domain-cells = <1>;
> +		};
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		#address-cells = <2>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
