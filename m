Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C3C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1bNaVx2bN/yzgUUBvO4e5Vy9AX2YcLq68oaxmiWlmg=; b=Xy4TlTUYJlm+kqLZeiodmnF4qL
	8Jag/lSqlwIpaoJQYVCvfvW6hqn00uL03P6bHjXn8wQr2J8bCuSBk8SLYPBzO05Rabtp9FSOkpGLr
	146hSCPueEyiEEhFU5/dc0w/nAvIepCrTUNK7xV9y/GF8tIIdXRiID1I7wceQl8rfZQLSEyQDEpaJ
	3WECLc45OgrIPmODyu20Or3rG5IVy4oI3tPPb4pxcbrIXpY0vnQzJ1j75i335/SwspRwvRQIJQblT
	wQiU17AHTFVk67aGigL1ZSBkHDpe4+zNQiXOUciC0KIU6ccTwLlcl619FFWyHCu7hH9UfMohWKry8
	Gmq8wCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnfI-00BIFK-0K;
	Mon, 27 Mar 2023 14:17:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnfB-00BICT-33
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 14:17:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id m2so8966919wrh.6
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679926652;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Pz8SlfpGIqrewSlPxPa2n2k6JV2RTms17Dv7m3grr0=;
        b=CI+yLzL4DhcLMT1dJ4emqbAt5YS3YorgcrVYDBmV2xyGs5JVw5VaOprpsMKjLglzQD
         ls0hwkkTA+BH29kBz5LuoKCyriZHaOPgttAfIOEAVgLhucpThxhRKi7FJy13c4WIUi83
         hOgCCLBIj64UcFQXZFgdE4w31QRoGqKqaZalRzi2LawOI14rd+gyxOUrTq9Z8Pi45KmF
         gJPmb9MMQYEMJE5ZjmxxpTXpgpBLeJ7yFSQLlK68GIOoxz7Sa8CCAzhPzyZMb0qH/Rcf
         366gi1NUy0C0Vbc0XJz57PHKNaqLml+F5J2gpv/TGYCtLnNC0y0KTGRw4g50egI0W7J6
         xq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926652;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Pz8SlfpGIqrewSlPxPa2n2k6JV2RTms17Dv7m3grr0=;
        b=IjMILVE4NdQ9Ax9eBmDPRSd+iTFQwlYHEry9x8jE6hvNE+543cZxS0xdiAg3Kl8I4i
         4ujPe/C/HqUqmiFmW1nxYjy1jY7SzUo+0xiS/+3gcE+7KVf9xlTd5whA1td1S5KlFwV2
         6Kz52OA0WG4I+SJnKCxwDmL7wJCHWIQkfpMMyr33S3Gpv2a7g45vRpWWo5gThgR44+6K
         JOtDoyq5OARcs0xz97N2q1k8uUBGEFpMi3z0rAM8F6EDgiSqqnXydJBr3DDhLPfxTqIL
         +EFDKCkcl92zDcEHRvs90lazSCfH5/Q+AJamFwm922AQnGwL5Tnvmz8TUVVmB0EnB1P7
         d41A==
X-Gm-Message-State: AAQBX9fsytd4BmhfNYsFUOhkhgXwxd7O9p3J5tc2w8jVONdjQ9AzBMrK
	4RP0bfvuwkS5bJs4MHUHx/dCAQ==
X-Google-Smtp-Source: AKy350YjnRrnMZRO6+Nu8YQoSObzRMKhMioBXqD+JmX/Ot3qLy9BroLG7762nHwUDLQ1JE6W9sFfFw==
X-Received: by 2002:a5d:590d:0:b0:2d4:7e19:a7fa with SMTP id v13-20020a5d590d000000b002d47e19a7famr8656742wrd.50.1679926652222;
        Mon, 27 Mar 2023 07:17:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2? ([2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d65cb000000b002c55de1c72bsm25149264wrw.62.2023.03.27.07.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:17:31 -0700 (PDT)
Message-ID: <f0432ff5-7e73-1e7e-1745-6f3b679153fe@linaro.org>
Date: Mon, 27 Mar 2023 16:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] perf/amlogic: adjust register offsets
Content-Language: en-US
To: Will Deacon <will@kernel.org>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>, Pierre-Hugues Husson <phh@phh.me>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Rutland <mark.rutland@arm.com>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <20230327120932.2158389-4-mgonzalez@freebox.fr>
Organization: Linaro Developer Services
In-Reply-To: <20230327120932.2158389-4-mgonzalez@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_071733_983993_6CE993BB 
X-CRM114-Status: GOOD (  12.13  )
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

On 27/03/2023 14:09, Marc Gonzalez wrote:
> Commit "perf/amlogic: resolve conflict between canvas & pmu"
> changed the base address.
> 
> Fixes: 2016e2113d35 ("perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver")
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   drivers/perf/amlogic/meson_g12_ddr_pmu.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> index a78fdb15e26c2..8b643888d5036 100644
> --- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> +++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> @@ -21,23 +21,23 @@
>   #define DMC_QOS_IRQ		BIT(30)
>   
>   /* DMC bandwidth monitor register address offset */
> -#define DMC_MON_G12_CTRL0		(0x20  << 2)
> -#define DMC_MON_G12_CTRL1		(0x21  << 2)
> -#define DMC_MON_G12_CTRL2		(0x22  << 2)
> -#define DMC_MON_G12_CTRL3		(0x23  << 2)
> -#define DMC_MON_G12_CTRL4		(0x24  << 2)
> -#define DMC_MON_G12_CTRL5		(0x25  << 2)
> -#define DMC_MON_G12_CTRL6		(0x26  << 2)
> -#define DMC_MON_G12_CTRL7		(0x27  << 2)
> -#define DMC_MON_G12_CTRL8		(0x28  << 2)
> -
> -#define DMC_MON_G12_ALL_REQ_CNT		(0x29  << 2)
> -#define DMC_MON_G12_ALL_GRANT_CNT	(0x2a  << 2)
> -#define DMC_MON_G12_ONE_GRANT_CNT	(0x2b  << 2)
> -#define DMC_MON_G12_SEC_GRANT_CNT	(0x2c  << 2)
> -#define DMC_MON_G12_THD_GRANT_CNT	(0x2d  << 2)
> -#define DMC_MON_G12_FOR_GRANT_CNT	(0x2e  << 2)
> -#define DMC_MON_G12_TIMER		(0x2f  << 2)
> +#define DMC_MON_G12_CTRL0		(0x0  << 2)
> +#define DMC_MON_G12_CTRL1		(0x1  << 2)
> +#define DMC_MON_G12_CTRL2		(0x2  << 2)
> +#define DMC_MON_G12_CTRL3		(0x3  << 2)
> +#define DMC_MON_G12_CTRL4		(0x4  << 2)
> +#define DMC_MON_G12_CTRL5		(0x5  << 2)
> +#define DMC_MON_G12_CTRL6		(0x6  << 2)
> +#define DMC_MON_G12_CTRL7		(0x7  << 2)
> +#define DMC_MON_G12_CTRL8		(0x8  << 2)
> +
> +#define DMC_MON_G12_ALL_REQ_CNT		(0x9  << 2)
> +#define DMC_MON_G12_ALL_GRANT_CNT	(0xa  << 2)
> +#define DMC_MON_G12_ONE_GRANT_CNT	(0xb  << 2)
> +#define DMC_MON_G12_SEC_GRANT_CNT	(0xc  << 2)
> +#define DMC_MON_G12_THD_GRANT_CNT	(0xd  << 2)
> +#define DMC_MON_G12_FOR_GRANT_CNT	(0xe  << 2)
> +#define DMC_MON_G12_TIMER		(0xf  << 2)
>   
>   /* Each bit represent a axi line */
>   PMU_FORMAT_ATTR(event, "config:0-7");


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Will, I've applied DT patches 1 & 2, can you apply this one via your fixes tree for v6.3 ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
