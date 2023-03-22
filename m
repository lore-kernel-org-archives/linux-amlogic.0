Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F59C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAWPFIqFV5/CYyRoc2Zws4V+KLXBXS63U20JKLI4tNE=; b=n0dtWYD7aTycgYPDmm1YbNR+Hu
	5RFbFWAR4BQGubwIiDPPYuZ1tR6f69leBOL2etasTfjAayGpynVoacymXqv8wMiSllql+StZWUvpt
	uSGhQKQ1aouJTJrS/u5RCwDQd5MZblTC1o9ZZI62i9Z8x9Ty/VUiKHl7mzMmFuKksghAgE/mbg5h9
	v5bVa5SqKRC9YGk/6Ag4bGFlLPnwl5bNxM+SuMFz/90S8vkmMPsjY4G1+WYCidcp53h4QlE4WP8Oc
	YM1qCc710gMhx7+Efm3XdW+zLPZo+w4kFjrw8NkHpifQmmtgu7vFBX7adVr+VKn3ZHsz43J8y5Dom
	hZkK7aRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevjQ-00FdzN-0g;
	Wed, 22 Mar 2023 10:30:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevjN-00FdyW-0v
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 10:30:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id y14so16462963wrq.4
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679481008;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L8nyYvjllegQ+DezE/uQIrYh8wB3PPI7la+fSHq0FZA=;
        b=XVV5EVXqcrnvNsEigJhYfwIrfCx1Apk5YPNrsuNTduVDscLlvD1hwUeZNhCCBD/aVh
         BrSRJC729AEKd1jR8RcHozkjSap3DV6WKBTctNl/MJldJTmZHpn7p31DzfTj8op51ffD
         OqkHr2v4yKM3k5Gf7nJxvbEaDwz8tGpts7iMvyyhC30hwBiQRqJctIYQv87HbqU5fyC0
         pgI+EO3NmhX0uZR10Gq0g22WslrBGNjVe6osv2hFT+glvZhDiv7a+bDGg8P+JJs/qz1N
         3+gwfrsR5gpV0W5reD04ZhsgqTQdbEPJoPGvZjN8mZCIKB1tD8g+XSsUByYEkSEFbG7X
         o1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679481008;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8nyYvjllegQ+DezE/uQIrYh8wB3PPI7la+fSHq0FZA=;
        b=oqt5wwqHLe5vKTeSlo1wGRX9qVBEzfelsJut2i0EZjJpHdbbtOUftaAuSxiHUjqKpT
         qrlTNazw+bxL8IrhqjBTHYtjVIGGFMgeXXOPsy2sogfuEfereR2A9sioStYBgXSyLOdC
         rk0BRvUwkU0Wio+KBiYvIqMm2lfTbeOdKFJ2UPIdkgu5yamFV9f0e2znFAZtumw5wo/i
         cO+F2piCTEuT+JzoMkVJ61k9KsaBLyTFovUED+f6BeI5HqxAIBuz0z8qprqp9iq/3Q9w
         rSkZexnghqRLsxxo+h5yfDDEh5PiGM2vn8cd6v5SXSGj5fPzpJkFANslLJusH0hgLuAh
         Z1wg==
X-Gm-Message-State: AO0yUKXHwIdI1kSybudGh4OnhnNmD/uh/UyncoJhfwtBxSteo7kdBRj6
	8lja/uqVAYkNN6eGZc6s3Sqy2w==
X-Google-Smtp-Source: AK7set9K2BHyceKy3BXDDciMyj3suNB4W1OwN6Z2mJKcaD0YTnGqO5egtSXp2F7nHq2zgOPEtHpTCw==
X-Received: by 2002:adf:dc44:0:b0:2ce:ab0a:81fe with SMTP id m4-20020adfdc44000000b002ceab0a81femr4458299wrj.62.1679481008025;
        Wed, 22 Mar 2023 03:30:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3606:a601:f273:994a? ([2a01:e0a:982:cbb0:3606:a601:f273:994a])
        by smtp.gmail.com with ESMTPSA id b13-20020a056000054d00b002da1261aa44sm1864649wrf.48.2023.03.22.03.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:30:07 -0700 (PDT)
Message-ID: <35f8dcde-4817-e5c4-2556-a61572841209@linaro.org>
Date: Wed, 22 Mar 2023 11:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/3] ARM: dts: meson8: add the SDXC_A pins
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
 <20230321171213.2808460-3-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230321171213.2808460-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_033009_327753_51574192 
X-CRM114-Status: GOOD (  13.68  )
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

On 21/03/2023 18:12, Martin Blumenstingl wrote:
> Add the pins for the SDHC MMC controller which connect to the SDIO wifi
> on some boards.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/meson8.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 4d18bb4e3c33..4f22ab451aae 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -506,6 +506,15 @@ mux {
>   			};
>   		};
>   
> +		sdxc_a_pins: sdxc-a {
> +			mux {
> +				groups = "sdxc_d0_a", "sdxc_d13_a",
> +					 "sdxc_clk_a", "sdxc_cmd_a";
> +				function = "sdxc_a";
> +				bias-pull-up;
> +			};
> +		};
> +
>   		sdxc_b_pins: sdxc-b {
>   			mux {
>   				groups = "sdxc_d0_b", "sdxc_d13_b",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
