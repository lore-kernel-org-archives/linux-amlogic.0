Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A450DEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jun 2023 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKnFQjEO0kUf+dhqpiYoX+levOQJ2TPsrweynRrb35E=; b=fnm4HYVOyyNkZCNDtq16QS13xj
	VLNaR2hqgINF8A4QAiLBcwxVmM45KUw826IhHFvItFfWF8B2s+evRB9g4l9XkV79gdZyovLf75SBD
	RJHL11fhPxukgs41CpNt+hcl/YINI4xZgbDlAaeauNvwUc1mXTRBy2p3mqz+Z+LWnoJZUgFYi6DcF
	1fFpQmTYaUMytYQWwojKd0IF3YtTF8iYRgHjALZsx7L7mVNjL9P2m0+cFnlXAocgO7rFMsmT6ULn1
	yIgBbI2QlkXX9Rdwrq3iKOQWZGDYkXh21RZ5d9XalpoNZNizNrtf42Bym6+G2kVEJVCDO7ncAHXwk
	HUAgrHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAkI-007vUB-1E;
	Mon, 19 Jun 2023 09:00:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBAkG-007vSs-1O
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jun 2023 09:00:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f9b37cd58bso2600615e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jun 2023 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687165219; x=1689757219;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bCBr4oTjiVPYqPEUo0CydkQP5zohM2Xp0GU5zTzP8rs=;
        b=UJjm17SJlTP86cw43v7G8uuapaedwpHHlpiVfaCIAfpJDh9mcTbe6iVbg/gcMnysB+
         87IpUyo+vWUqhB0dGOigtlbttsSDoJVO5gy37LfrXMIJ6yGfdFFcwaBnX6nNbYyKglc/
         G3YyJJs/jlYA2I/lYMIolWZchurQImO9KY6Kt5BQQb18X6hvYeAVaCFnNp9kyUJ8bSQl
         yfv2iv1zRUTlSbpmjibQBuwEmaDivJ55zRuFKLsmu7jPjf1qAwie/6mDZHwEWe8L5ai0
         lduXdoSr/FLxjcHNEGwjR3WCUruJ2Ewdg4dFR1MPSC1Ngsl3SR0+oNXwTQ/0o8ZBHy5k
         sCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687165219; x=1689757219;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCBr4oTjiVPYqPEUo0CydkQP5zohM2Xp0GU5zTzP8rs=;
        b=J31hLS7/iKcgxWNruuMI+fn1wGfJ95+R62mJpzus4bW9/HRUidiL1MAi25WDE9TPQV
         xt2aww40bHvj6kJQeUoF8gOe/VsrehZBO8eL2R7WGVIxfkYZl8z12fdDDFnHJdRkyjql
         PXSV5Hx86YW4AYAzudOoh4ORHBpAraz7wqAIaR1g+Qj5gcSsIwcaeGOcJEYgAibun3Zc
         2ECZtlsuMlzCuxx4LG9YeWIyNgmvIuTP+qmy0Mtbyu95ar6Kg1+jnuABMd7zh8y7YX1v
         M5ssqJIHr3DOY8Fv3RDOYEHYX9pTaBGJ8Mkx1V991OU2fbVRs0lTQHCZzxtLii4cCbwM
         VU2w==
X-Gm-Message-State: AC+VfDxiKxsTPu4FPMdw5fyLnolOFMAX8kpJH2EwPrhd8Uj2OCabU5yA
	taqEOIhKJ/ei7vEsxjo7ZJYIUA==
X-Google-Smtp-Source: ACHHUZ4kTHBI7R/neEMBwF3PvF3KlSrrEUcjqpnITUG/q4ykuPe3Q7fTVaE+jrDwycnvmT9JU+o9uQ==
X-Received: by 2002:a7b:c045:0:b0:3f8:dac6:58ee with SMTP id u5-20020a7bc045000000b003f8dac658eemr5842223wmc.5.1687165218801;
        Mon, 19 Jun 2023 02:00:18 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id f20-20020a7bcc14000000b003f8044b3436sm9970750wmh.23.2023.06.19.02.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:00:18 -0700 (PDT)
Message-ID: <0d50047b-b30a-9c20-1754-2ee4fc4f7e18@linaro.org>
Date: Mon, 19 Jun 2023 11:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] drivers: meson: secure-pwrc: always enable DMA domain
Content-Language: en-US
To: Alexey Romanov <avromanov@sberdevices.ru>, narmstrong@baylibre.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org, kernel@sberdevices.ru,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230610090414.90529-1-avromanov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230610090414.90529-1-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_020020_477188_C7F92621 
X-CRM114-Status: GOOD (  17.00  )
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

On 10/06/2023 11:04, Alexey Romanov wrote:
> Starting from commit e45f243409db ("firmware: meson_sm:
> populate platform devices from sm device tree data") pwrc
> is probed successfully and disables unused pwr domains.
> By A1 SoC family design, any TEE requires DMA pwr domain
> always enabled.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
> I'm not entirely sure if this domain should always be enabled on or it
> should be separately enabled in dts file. Comments are welcome.
> ---
>   drivers/soc/amlogic/meson-secure-pwrc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index e93518763526..25b4b71df9b8 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -105,7 +105,7 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>   	SEC_PD(ACODEC,	0),
>   	SEC_PD(AUDIO,	0),
>   	SEC_PD(OTP,	0),
> -	SEC_PD(DMA,	0),
> +	SEC_PD(DMA,	GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
>   	SEC_PD(SD_EMMC,	0),
>   	SEC_PD(RAMA,	0),
>   	/* SRAMB is used as ATF runtime memory, and should be always on */

It's fine to keep it enabled.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
