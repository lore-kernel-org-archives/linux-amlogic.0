Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE168C47089
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZKPVeDT4WGnD6Bak10wPoORpv3DrO+RdxBgsh52Oro=; b=S491s6RkPWXGNZor4YvbqPtSc1
	r36wa7w0HtaZP0rAp6cqTcpvO61JsPI+pYKvG5tbQ4LncbSvILA+cLr6WCHCBaNxXChU6PoQWeijL
	pdCiuF15PpjuiPWxEWRTrlNoE7FJEWGC+03PUwvsetfF/qYScYJ8V7BTpiE9JKf/9SUZBo2pnpp5q
	mryL0fxAc+0ip92Tkk4S/K7iOoRVgBZU5oWtqiyb3Mp+S15lMEApuvmmGm5/OG1SdzQ4SGwPo+fSX
	3/L/1uXFMgWgYqMUjpsLTInYNy1OXVNquD5V2JSfc7Jowqq5GUWVIb7d3oQgo5Rof2A8suZ06d2IE
	e0C+TdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p271d-00GQ6I-Do; Mon, 05 Dec 2022 08:40:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p271R-00GPvU-93
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 08:40:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so5455874wmb.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 00:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OcD3CaGFzs1PLkrODWghhljl7q5gdf6UquBrIlu96c8=;
        b=fomgni0P+Kvz4zbYfBoYDXmTuwlwU0ixPV9zc2axslY/d3jzwxQh+dMWD/1qEnnnDL
         GOnQOnW9csawE/QeXDaXZdgQsfHVgXYS9ZrhrNS0q9U6NJEV+H4EGJ9ve3hhMDD7sFmL
         7Wl3U5Ccme74YPkR2qPy7wlOmEy4EJacZd3RBFPwvpyZWERlOiMX3vqIBPoTallXMSak
         qbOJsU3adQBBtGRBwSmY2FBbyClZ3xEMzQzQ89FRj+icQaZ/umrCRzU+vrExLVPG/7YD
         3NdH0e+qfQ8CcOMyDwFFqt8PcKe8ms8ct1puaClTg6rXPCFwNBalHAailEbC38Eb4KI2
         EA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcD3CaGFzs1PLkrODWghhljl7q5gdf6UquBrIlu96c8=;
        b=YiLI1t2H6kEtLpBQHUgcnz0glf4lo03VUGu8DVVmsdvbnWdwevcnWPtUy1256oSqo+
         9ynVWSP7t5KzlFM/k5spSQNEPjfi+CdqqywJ7ua85WHtip+s96fJ4G+FMp5myrzPhQzc
         uEoP7wn4ToRxX1Ry25WUUaHArvO+dB1f+mRunWHbVkQ0shDg8xeCoZOWVRCFLP7F4dI0
         F1OC3KyJjyR5IARIAs++PSLZhIPFCMI+TkhuR4XSJYr8JdiaA1Q16ktVF46SQV2G8MHC
         zg+rSTi7aOBZ+0T1TdKucsodX2TqyJTCp6sLYi4kd4pHhMbhTSQJ4sWjCNANpxIO32hn
         ioKg==
X-Gm-Message-State: ANoB5pnINCLgNvEWIcJ/r3lWbJvHHB778vUHhLEqOYhxLX7m6S/zsus5
	imdyCz2GTO3oAdTK8bkDrDeltg==
X-Google-Smtp-Source: AA0mqf6by0jvDO+tidzDyqYI7lQOw3jHImDUmuwrlf9PDMqGT6N+VCFo+1Uc7Sj1Kqj8tGslwUYr9g==
X-Received: by 2002:a05:600c:511b:b0:3d0:128a:6d1e with SMTP id o27-20020a05600c511b00b003d0128a6d1emr14608390wms.108.1670229617859;
        Mon, 05 Dec 2022 00:40:17 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id v6-20020adfe286000000b00241f467f888sm13601383wri.74.2022.12.05.00.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:40:17 -0800 (PST)
Message-ID: <6e0dcfa8-6855-cc80-5e23-443d44cae07b@linaro.org>
Date: Mon, 5 Dec 2022 09:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Add Meson DDR PMU as module
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>,
 Chris Healy <healych@amazon.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <20221204043530.1673752-1-jiucheng.xu@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20221204043530.1673752-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_004021_433666_9E98B4C3 
X-CRM114-Status: UNSURE (   9.95  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

+CC linux-amlogic@lists.infradead.org

On 04/12/2022 05:35, Jiucheng Xu wrote:
> Add Meson DDR PMU to defconfig so that build errors are caught.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 0b6af3348e79..f2324b54a6ba 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1265,6 +1265,7 @@ CONFIG_ARM_DMC620_PMU=m
>   CONFIG_QCOM_L2_PMU=y
>   CONFIG_QCOM_L3_PMU=y
>   CONFIG_HISI_PMU=y
> +CONFIG_MESON_DDR_PMU=m
>   CONFIG_NVMEM_IMX_OCOTP=y
>   CONFIG_NVMEM_IMX_OCOTP_SCU=y
>   CONFIG_NVMEM_MTK_EFUSE=y


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
