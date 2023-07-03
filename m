Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20BAEB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 13:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B98NHkEZZqsdSKjIBwyGVdm6+R5VYhwrPFsGx1OtEcw=; b=08ySajWGcbrMRS8YqaCzOV4GsG
	fcWIKXrd43le1oukH7Hwl9sFffFL47XpNNbgZxugRhM91Ip9LcDAl0Yxj9Jp6VAai9JV+YEYP5aAb
	Qr1k3eWN7AS0wlhQ6LoBfvURRLxWOwHiBBTXEUvm1WutMCs9cSJkon4ABFiJ0TPLltNpK34TF0/BG
	V7DqpNyhLA4Hkx4deS3g9ntP1ciIbiJG80Id3EfEXfspdItD3ABqRGpUDpjchiOOqzWVriTSMFo7D
	rnLCiK5ECZUgomfHZUpwuHwPwskKpEMYD3FHUSNlDityuYzb5dKiridExdw2URCzzfLWZJSLFa4Dd
	J5Zhs0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJcY-00AdiA-0z;
	Mon, 03 Jul 2023 13:29:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJcV-00Adgw-0u
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 13:29:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-314319c0d3eso1917009f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688390973; x=1690982973;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/VhzLPQHUerf9yIXAHQ3k56ZyHp33w08cf8vUBWG7Y=;
        b=njVWohKchlcMEssQAmIF1k9K45Bbsrd0GbQfEH6owssZIqpB91tbfaZvQBAe2y6d1N
         pfYh+rKJvhufICIyrpnVitykosZoAVctBURaePVLlsfTfbkyTRZHEZHi3Cwb2R1Ef2Mb
         zPNZyr0j7/n69lqkf1LcW1BVdC45GIbm429M52QLjFBtW+HPuNBK9Brwx6z1rtL6ervi
         J18BdPRMVF+ob1T3MaG2ubOle4LHZ6bX6GWGxuqpzeXoMdxExxR5eztZ50719pVvVZXQ
         mget4xvTOK6HJHHZRrIizrB/mjd6/JRYFiY+unzHfnSkh5xQ/AICSlgjz/c67zA4qYd2
         wIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390973; x=1690982973;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/VhzLPQHUerf9yIXAHQ3k56ZyHp33w08cf8vUBWG7Y=;
        b=RRjnPs8BhI38RJJO+bXsvYedAuswbIrG7SRLgkEJqfJu0Yjx3r2LAAg1QX3rGav62I
         hftbNtOGK731lq0egAOTZsdZTEp4ueOEEYgcpguzLLL3ok90XKNBu49SseQaaXUJPFNU
         jN9AT1u1I9ZKp3C3Aj9cnKBml3VBwwvb83CYsj6CBNWiFQpZtz6ENuURToCTvuOr5fEU
         Hvvl6FbPDXfyV61y/6NiK2uCpbms9pqjqTi269fX0CTAhL2wxSAZNNzsFiBRkvJthkeU
         whFpnMnGgOxaR80uQIu4Rvb1x5vviDj4yerh2zcnIL1MGC2rcsdS7kIp6cMPDihO0MHa
         AaMw==
X-Gm-Message-State: ABy/qLZO9yxZkHzAtnojvagr0Kui2XXEMZ+Zhw2v7Y7sqOrjuDEDkz87
	DAgrFjsC2Ia/GxpIqDmU+1ylTQ==
X-Google-Smtp-Source: APBJJlGMsazVkHFxwQldk7Ee64dl++ep07uZano3iNOZM0/SiZWu6RXho/B4b8i2C1OknUXd7j1Nag==
X-Received: by 2002:a5d:6986:0:b0:314:37a9:f225 with SMTP id g6-20020a5d6986000000b0031437a9f225mr2684111wru.40.1688390973573;
        Mon, 03 Jul 2023 06:29:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f? ([2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6e85000000b003063a92bbf5sm25802354wrz.70.2023.07.03.06.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:29:33 -0700 (PDT)
Message-ID: <e85f6dee-d62c-9f2f-b1de-8c38bb5aeb14@linaro.org>
Date: Mon, 3 Jul 2023 15:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] soc: c3: Add support for power domains controller
Content-Language: en-US
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
 <20230703093142.2028500-3-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230703093142.2028500-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_062935_362776_91068FCB 
X-CRM114-Status: GOOD (  21.68  )
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

Hi,

On 03/07/2023 11:31, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add support for C3 Power controller. C3 power control
> registers are in secure domain, and should be accessed by SMC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-secure-pwrc.c | 28 ++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index 25b4b71df9b8..39ccc8f2e630 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -12,6 +12,7 @@
>   #include <linux/pm_domain.h>
>   #include <dt-bindings/power/meson-a1-power.h>
>   #include <dt-bindings/power/meson-s4-power.h>
> +#include <dt-bindings/power/amlogic-c3-power.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/firmware/meson/meson_sm.h>
>   #include <linux/module.h>
> @@ -132,6 +133,22 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>   	SEC_PD(S4_AUDIO,	0),
>   };
>   
> +static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
> +	SEC_PD(C3_NNA,	0),
> +	SEC_PD(C3_AUDIO,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_SDIOA,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_EMMC,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_USB_COMB, GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_SDCARD,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_ETH,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_GE2D,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_CVE,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_GDC_WRAP,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_ISP_TOP,		GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_MIPI_ISP_WRAP, GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_VCODEC,	0),
> +};

Please move this struct before _s4_

> +
>   static int meson_secure_pwrc_probe(struct platform_device *pdev)
>   {
>   	int i;
> @@ -179,7 +196,7 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>   	for (i = 0 ; i < match->count ; ++i) {
>   		struct meson_secure_pwrc_domain *dom = &pwrc->domains[i];
>   
> -		if (!match->domains[i].index)
> +		if (!match->domains[i].name)

Is this change necessary ? If yes please move it to another patch
and explain it's purpose. If it fixes something, add a Fixes tag so
it can be backported.

Thanks,
Neil

>   			continue;
>   
>   		dom->pwrc = pwrc;
> @@ -207,6 +224,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
>   	.count = ARRAY_SIZE(s4_pwrc_domains),
>   };
>   
> +static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
> +	.domains = c3_pwrc_domains,
> +	.count = ARRAY_SIZE(c3_pwrc_domains),
> +};

Please move this struct before _s4_

> +
>   static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   	{
>   		.compatible = "amlogic,meson-a1-pwrc",
> @@ -216,6 +238,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   		.compatible = "amlogic,meson-s4-pwrc",
>   		.data = &meson_secure_s4_pwrc_data,
>   	},
> +	{
> +		.compatible = "amlogic,c3-pwrc",
> +		.data = &amlogic_secure_c3_pwrc_data,
> +	},

Please move this entry before _s4_

>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, meson_secure_pwrc_match_table);

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
