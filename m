Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A86C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN6oN19YL7IQt/2zAVohl3YKT3cH/ycerFxwnlAMHxA=; b=2DQ/HRC06y64hC9gSJJuSl0C6L
	AlWFaa0UCBXrtTe5iRNNBcmHKpGyfKKnfAvfh2CD0ThPVsEyIEhDq4CBj3WXLqiJNSPZ2HmaFk02a
	Sri/SNn7azZg95ZDMCZ9C/vSfSHLL8TW8IvT60cwCZKX+eEew+y/m2/DAGs4+uhWhPMs3B6AfAW01
	4ueUXbGf6G8QnxVr0fwvV8RfouDNB5ehzv/Ty3ntHPT45X1PVxtFIFZe+35OkGfsyRwsZmkMrOQnq
	X/006Mv0+LVpF4ApKfmDSzC3VuXCa3Tt+Ez6JtyoXCKrFTBISNrm0H2lF084f8bsaw+rMTm7qupia
	evI0YWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uDs-00Cpvy-05;
	Tue, 30 May 2023 07:56:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uDp-00CpuM-0s
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:56:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30af0aa4812so893139f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685433407; x=1688025407;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hOkyt++obknMAdUoR1HkZssbFe+S0uKdNsu7DgM6qoY=;
        b=btQae2D2snkJMEm8OvlA+L+ippqTpq6OaChu6XKHNcpbLgdgnOv5GiXIKGUr59NPqV
         7wI69VCyHoza8rSmc/S7RzyP/mg6jFXXt3Dhe7m4FZBB1t4846DGtyfbw3sIgccKbyQ7
         7xGIi+WC+9EqtNqsaFj22WKsmLxicg/QqxohLaYrGW8B9SwfcAx9Cowm4Yo5sL2Bq0pb
         bCLAU9sqGOr8jxBnl8Vrab/o6C35N5O6T+rWgAJaj/XtL8iklU6MZURZzYqJWXYuXHSu
         /aNQd+ROKxZzIA5Nr+ZQCbBt2kC2jx5WJDD7B3UpLpUwBQAtei493IS+z3STvT4FAvlU
         Mv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685433407; x=1688025407;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOkyt++obknMAdUoR1HkZssbFe+S0uKdNsu7DgM6qoY=;
        b=GYQn4L+Vm7kTSKBIFgAzx4vHzSH/2SJYOudfZ+/jAXAKvLTSfu7qh08+m65CSbm2Jd
         pK1MyJ13T/rJhdBT3Pnab8Uu6+UcTtciy4k4U+QU7CV36ugO+TfLO0iBhmJAp3Xuc7tL
         +3Mfwr8RDqFzEtRVtnYNm9G2QslJZ/iOGZcuyF+Sfy9G4Loz1SkKiBVWtml7etFZI/5b
         Cfovy/WDmG2a/i5gilXx6kqguWsX04o4NGa1HCf35mtOqe9vm8OK89dbiUAoPR1DHhR6
         gIbIll66CJLBUXn2gIwU4l9nuniUGYBaWu/R8plYPUFc1Dkv+sUKtzyCxeecUrZVHn4l
         9irg==
X-Gm-Message-State: AC+VfDxKgaBkWSE47Axtd7FhQySRaJlqYzXMf1Gu41zrnHgBkLYbGJzi
	SBx8+tk6JtrzcjbQ/y5iK/bUeA==
X-Google-Smtp-Source: ACHHUZ527BEd9W17BCh7+KKOflVutvSkWTXt78jWoRTvcqjTOOKk8VyjcoBT1fszno3ZhA8V7T1Fqg==
X-Received: by 2002:adf:eecc:0:b0:30a:e465:5b29 with SMTP id a12-20020adfeecc000000b0030ae4655b29mr802765wrp.57.1685433407570;
        Tue, 30 May 2023 00:56:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87? ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d54cd000000b003063db8f45bsm2369381wrv.23.2023.05.30.00.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:56:47 -0700 (PDT)
Message-ID: <fa29f85b-c837-ef84-74bd-00c7365e2fbf@linaro.org>
Date: Tue, 30 May 2023 09:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/3] media: rc: meson-ir: sort Meson IR Controller
 register macros
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230517115635.31565-1-zelong.dong@amlogic.com>
 <20230517115635.31565-2-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230517115635.31565-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_005649_313385_05846A4A 
X-CRM114-Status: GOOD (  18.68  )
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

On 17/05/2023 13:56, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> There are more registers to come in the next Meson IR Controller.
> For defining clearly, sort register macros and let address and bit
> macros as a set.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   drivers/media/rc/meson-ir.c | 35 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
> index 4b769111f78e..a32d034b33aa 100644
> --- a/drivers/media/rc/meson-ir.c
> +++ b/drivers/media/rc/meson-ir.c
> @@ -19,44 +19,43 @@
>   
>   #define DRIVER_NAME		"meson-ir"
>   
> -/* valid on all Meson platforms */
>   #define IR_DEC_LDR_ACTIVE	0x00
> +
>   #define IR_DEC_LDR_IDLE		0x04
> +
>   #define IR_DEC_LDR_REPEAT	0x08
> +

You add those blank lines here, but remove them on next patch.

>   #define IR_DEC_BIT_0		0x0c
> -#define IR_DEC_REG0		0x10
> -#define IR_DEC_FRAME		0x14
> -#define IR_DEC_STATUS		0x18
> -#define IR_DEC_REG1		0x1c
> -/* only available on Meson 8b and newer */
> -#define IR_DEC_REG2		0x20
>   
> +#define IR_DEC_REG0		0x10
>   #define REG0_RATE_MASK		GENMASK(11, 0)
>   
> -#define DECODE_MODE_NEC		0x0
> -#define DECODE_MODE_RAW		0x2
> +#define IR_DEC_FRAME		0x14
> +
> +#define IR_DEC_STATUS		0x18
> +#define STATUS_IR_DEC_IN	BIT(8)
>   
> -/* Meson 6b uses REG1 to configure the mode */
> +#define IR_DEC_REG1		0x1c
> +#define REG1_TIME_IV_MASK	GENMASK(28, 16)
> +#define REG1_ENABLE		BIT(15)
>   #define REG1_MODE_MASK		GENMASK(8, 7)
>   #define REG1_MODE_SHIFT		7
> +#define REG1_IRQSEL_MASK	GENMASK(3, 2)
> +#define REG1_RESET		BIT(0)
>   
> -/* Meson 8b / GXBB use REG2 to configure the mode */
> +/* The following regs are only available on Meson 8b and newer */
> +#define IR_DEC_REG2		0x20
>   #define REG2_MODE_MASK		GENMASK(3, 0)
>   #define REG2_MODE_SHIFT		0
>   
> -#define REG1_TIME_IV_MASK	GENMASK(28, 16)
> +#define DECODE_MODE_NEC		0x0
> +#define DECODE_MODE_RAW		0x2
>   
> -#define REG1_IRQSEL_MASK	GENMASK(3, 2)
>   #define REG1_IRQSEL_NEC_MODE	0
>   #define REG1_IRQSEL_RISE_FALL	1
>   #define REG1_IRQSEL_FALL	2
>   #define REG1_IRQSEL_RISE	3
>   
> -#define REG1_RESET		BIT(0)
> -#define REG1_ENABLE		BIT(15)
> -
> -#define STATUS_IR_DEC_IN	BIT(8)
> -
>   #define MESON_TRATE		10	/* us */
>   
>   struct meson_ir {

Without the blank lines:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
