Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43243EB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyIz8ne6n28c4EwACMEg1Fh7WeUDfs3QdVjpiJJB2ww=; b=JIiVXtcMR6LEbz68zzGctwOR/k
	kXN8BSxBkcShSHXHvK5UHGvDtgo8AfY/qkOrCG/QcgsPaguZDq4olaGoy1oacK/pSxqWzq2RyJqza
	GB4nXOI3OKjicKIpUG311BF8fTvhwx0DWyb55k3Ew9q5cMkwTDqYChmp3r2yTsu8u8uhoN/jhcGt3
	ahqGjSl8eqrWkwJh2g+apjR/yiuD4H05UUwwAuLlkErHJtsr5EV35A7PyUBG5RSfmTr02wIauFxS/
	y6+u2EBtEEZXLEZbxUhT02nEOHv6Rqr1McUjp3EDITp9pyFAW0LKXy/vLJ8/LX1Vv+OeWDCqfBkc9
	geS+wvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgEL-003uN1-1P;
	Fri, 07 Jul 2023 07:50:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgEI-003uLR-0N
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 07:50:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so1594019f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688716212; x=1691308212;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xzJZgWFeHHGjXKAh4OaYqE3z7DeRElG2dg11xE9GqWA=;
        b=Wq7nkwenow+m00LJH3DXwOFMahQtljMEay80GmxnhXkPnM7oEDXjB+XHrOvcvOL6VC
         IIKGioCQeaAbTesF9F7eJnsPQ/4s23aH7LrJTC8fLkRsOZDlXboPDyxNIKjWBh7NgKn8
         YcgjiRf+gPoarIPP0tfnqZN0hMN3gNVe/A1BDPAU6Lxme6ofNMtWM8LYwU6FH0JiE7pa
         jo20zRz+up4lQWkYYC0acljJ6Kn6/S6LQB1ZHFh/drYq1dRA3WHjFw7MFjDxG/c9a/tt
         fElyV75oHDKkg+mls8gWZvv4nNyagJW3nP6qR3Ika4l/EXGHBMNpA6/79pVWMsGyHHWG
         z+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716212; x=1691308212;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzJZgWFeHHGjXKAh4OaYqE3z7DeRElG2dg11xE9GqWA=;
        b=D6RgNrKoJC9126VxjRDxfrTtum4auMoe9MnMLXJkwrW9yv4HSTVzfr5FEu3mBfcLpf
         uxGXIYAGkmQq7+bCzpFL+BWEb3KeSZezVlg1ZLXXAmTD6vlAnrOzYPO6AnMopnvxtKLx
         raHWnadpE1EUd54gRXNE7VvvnEhJFdFSuoQy+eY5NlNg6BfzeLyp7JplobLlZWZFcQ7p
         IDzaCLLXW7wFbP3KG8GT3aysaTJzeRW5mkfcfaQ3o8HpfZB711i+tfyJgs6ngMYyndNq
         bKi6O9NrozEtQy9pNQ3JmaOQZu8LyABsBFAMQ5w+oyAND7bHtNfUXZvhW7kLvl7qWE/G
         dXdQ==
X-Gm-Message-State: ABy/qLZPfQ+l2pOUGtj3Grr7DAZM2wHI58wTSYs2Cm3u8ZrCEgDqjBhu
	7IZg4HPO90d99RCzvsOwALscSw==
X-Google-Smtp-Source: APBJJlG5qX5zH+MbgQHt6l/RMXUjACz3YLpcUYX5x8n+MEzfvZ3cxiLnB41OwzrgRLGnyXmawFSZDQ==
X-Received: by 2002:adf:e581:0:b0:314:3587:ec72 with SMTP id l1-20020adfe581000000b003143587ec72mr3624852wrm.69.1688716211912;
        Fri, 07 Jul 2023 00:50:11 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id a5-20020adffb85000000b00313e4d02be8sm3763868wrr.55.2023.07.07.00.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 00:50:11 -0700 (PDT)
Message-ID: <b2205518-67bd-85a2-6af7-260dcf21416c@linaro.org>
Date: Fri, 7 Jul 2023 09:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 3/4] soc: c3: Add support for power domains controller
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
 <20230707003710.2667989-4-xianwei.zhao@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230707003710.2667989-4-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_005014_187061_C148B0E1 
X-CRM114-Status: GOOD (  15.03  )
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
> Add support for C3 Power controller. C3 power control
> registers are in secure domain, and should be accessed by SMC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: Fixed some formatting.
> ---
>   drivers/soc/amlogic/meson-secure-pwrc.c | 26 +++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index c11d65a3e3d9..a1ffebf70de3 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -11,6 +11,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <dt-bindings/power/meson-a1-power.h>
> +#include <dt-bindings/power/amlogic,c3-pwrc.h>
>   #include <dt-bindings/power/meson-s4-power.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/firmware/meson/meson_sm.h>
> @@ -120,6 +121,22 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>   	SEC_PD(RSA,	0),
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
> +
>   static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>   	SEC_PD(S4_DOS_HEVC,	0),
>   	SEC_PD(S4_DOS_VDEC,	0),
> @@ -202,6 +219,11 @@ static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
>   	.count = ARRAY_SIZE(a1_pwrc_domains),
>   };
>   
> +static struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
> +	.domains = c3_pwrc_domains,
> +	.count = ARRAY_SIZE(c3_pwrc_domains),
> +};
> +
>   static struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
>   	.domains = s4_pwrc_domains,
>   	.count = ARRAY_SIZE(s4_pwrc_domains),
> @@ -212,6 +234,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   		.compatible = "amlogic,meson-a1-pwrc",
>   		.data = &meson_secure_a1_pwrc_data,
>   	},
> +	{
> +		.compatible = "amlogic,c3-pwrc",
> +		.data = &amlogic_secure_c3_pwrc_data,
> +	},
>   	{
>   		.compatible = "amlogic,meson-s4-pwrc",
>   		.data = &meson_secure_s4_pwrc_data,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
