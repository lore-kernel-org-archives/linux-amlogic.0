Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4A9C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFPa1v8lfMUVNB7dD8yMH3O+yGxi73oUwusUQPqz+Lo=; b=ImGLZmG4+HFtVoQUME4M4Ec+Md
	WX3WdUU4wLKEXN4PMNILTx7SQdY4THbga71QGN9UvqiSULDAqpHfPlXPjBEMmJbL2XxJzz+f+6gAH
	duThTj8MQuV9o/VFWzY3wZPqGO5Fi43j7RJshGpwFRnXVTPNxRHy6/LVlDd3+aBE4k2UCepqMGI/6
	rdDrSBXIfxZy8txALHDRuVWvv7ASmjjflQWwFWN64RnB7xHxvgi8W7COhLXV2y1J7Ve0j5zn2QjR0
	YsyTFIyyMdmezWKa9hNeYdrUWFys0TIXNX8XVbWz8QqHD0F7nXPK1ard17D4NRHasipG4+1a+jafd
	8agEw6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYIg-00GYrA-Ve; Fri, 25 Nov 2022 12:59:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYIU-00GYkd-Tz
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 12:59:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso3329342wmp.5
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 04:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xAwDeLMDI7jjJICxpuML25RfdqA6Cct7LkWV25vDTYU=;
        b=Y5a6fIYD6fefsUga9jeZ6gQhDhnIy/oo5V973q+1AyvwYEVWseFjU6EI5w+ZM0ir/K
         WVD2xm0KZUHZBxq61q8bNIGvbQFNwL6fbhC91x55xttVQhG05+xteRY+qhC0yTf4QIMM
         KIwVNs5VKlWJLSVTZ/izvgt712WWZFWfKKOn1KG6btlcnGw+moEOzaUe6FjudVwWKGmN
         Bx4HZ8z+l7CNMipP50eWZrLe980kGBgfk5/7siS84hYe5CLKrXx5dn7S5ku33POGIGDA
         MwoOVKiPninQTH1DikIhfvY6xYAYLQ34lVPuzkEuPoqZF0WSQASCzu4Jn2hqkK4d3zfY
         wKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAwDeLMDI7jjJICxpuML25RfdqA6Cct7LkWV25vDTYU=;
        b=Bm5GLsESL89GcuedM9WqQCat/+2HGWCfsDkWKuw7zts0rvtQL2Bk/8vpJ/a/xsCZPC
         MSImdHIkJVODrypup70ndOmy3YjW1B/pRidMdAbSloMQ7XJbef6swfolYYjTQ/THyReI
         Mltj98Se9uyN5ljYx/BBTwTcmUEiMkPKjxovvf5C1B6EtjPNN45Xqs9ZDgU9ntuvq2iU
         Gcr2e3rMfb0l+WN1oYclChoYkwPfVd2hWAaYxZLiU1U20VxdSEP2qaebYYYhZDOJNWrU
         MX2k09gEXw2zWlE0UjtKxwbMK8GoIzG1I3gaJI7qbL9HbV75k4N/iMPPZJkVENQUMMal
         8yDA==
X-Gm-Message-State: ANoB5pkUvKtgml6o7/8oQTyOWALn3H3ts5naMbsTujn/8emmMK0Fh8zD
	p4UyXwcDKeKbi5JgH3woa8Jj3g==
X-Google-Smtp-Source: AA0mqf7mEGKLa42qccOR51NJrHfVji46zsVRrQCeKgATOV8TvhZ+PAqLLRnZL3faN6fZ6R9yxZK58A==
X-Received: by 2002:a05:600c:3b09:b0:3cf:987a:2bf with SMTP id m9-20020a05600c3b0900b003cf987a02bfmr15034111wms.157.1669381150938;
        Fri, 25 Nov 2022 04:59:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe? ([2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe])
        by smtp.gmail.com with ESMTPSA id fn9-20020a05600c688900b003cf6a55d8e8sm5100190wmb.7.2022.11.25.04.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 04:59:10 -0800 (PST)
Message-ID: <038bebc1-2999-69d0-9c3d-e25acf61e31d@linaro.org>
Date: Fri, 25 Nov 2022 13:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] soc: amlogic: meson-pwrc: Add NNA power domain for
 A311D
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
 <20221125111921.37261-4-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221125111921.37261-4-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_045914_989011_177188C7 
X-CRM114-Status: GOOD (  15.47  )
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

On 25/11/2022 12:19, Tomeu Vizoso wrote:
> Based on power initialization sequence in downstream driver.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   drivers/soc/amlogic/meson-ee-pwrc.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
> index dd5f2a13ceb5..925cfaf50d11 100644
> --- a/drivers/soc/amlogic/meson-ee-pwrc.c
> +++ b/drivers/soc/amlogic/meson-ee-pwrc.c
> @@ -46,6 +46,9 @@
>   #define HHI_NANOQ_MEM_PD_REG1		(0x47 << 2)
>   #define HHI_VPU_MEM_PD_REG2		(0x4d << 2)
>   
> +#define G12A_HHI_NANOQ_MEM_PD_REG0	(0x43 << 2)
> +#define G12A_HHI_NANOQ_MEM_PD_REG1	(0x44 << 2)
> +
>   struct meson_ee_pwrc;
>   struct meson_ee_pwrc_domain;
>   
> @@ -106,6 +109,13 @@ static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
>   static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
>   static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
>   
> +static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {	\
> +		.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0, 		\
> +		.sleep_mask = BIT(16) | BIT(17),		\
> +		.iso_reg = GX_AO_RTI_GEN_PWR_ISO0, 		\
> +		.iso_mask = BIT(16) | BIT(17), 			\
> +	};
> +
>   /* Memory PD Domains */
>   
>   #define VPU_MEMPD(__reg)					\
> @@ -217,6 +227,11 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>   	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
>   };
>   
> +static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
> +	{ G12A_HHI_NANOQ_MEM_PD_REG0, 0xffffffff },
> +	{ G12A_HHI_NANOQ_MEM_PD_REG1, 0xffffffff },

Weird it's not 0xff like on SM1, I looked at the A311D Datasheet and
HHI_NANOQ_MEM_PD_REG0 is 31:0 so 0xffffffff is correct, but
HHI_NANOQ_MEM_PD_REG1 is 23:0 so 0xFFFFFF is the correct value.

Bur please replace with GENMASK(31, 0) and GENMASK(23, 0) to align with the
rest of the code.

> +};
> +
>   #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)	\
>   	{								\
>   		.name = __name,						\
> @@ -253,6 +268,8 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>   	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
>   				     pwrc_ee_is_powered_off, 11, 2),
>   	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
> +	[PWRC_G12A_NNA_ID] = TOP_PD("NNA", &g12a_pwrc_nna, g12a_pwrc_mem_nna,
> +				    pwrc_ee_is_powered_off),
>   };
>   
>   static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {

With this fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
