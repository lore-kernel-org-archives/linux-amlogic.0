Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E1CC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTPxXyAo/z6uVJkAS19Oimlosn1uvO16GzCWothwwuI=; b=UpYF7ywnslQ29q
	YWeGXkMwwv59l4XWKipjynkBKxF1QZik3h8UAqhfQhJKYTdlwfq9dYjcGKTODE7vVN7VzsQLQFM6K
	4MxLtFQGJ79Ska0/6Vi21fiAmpYvjPqRNV96o0KmbzpB4c5ZVqldKj/ifOIXIK86IlcUZI1LOucWm
	/vS+JH4NCZGZjqsXXiQNDkVDWN/IV7SOAd1Pifbh6ZB/G9eU7a48Ils4kknYMTVYJz2dETfLh+9nd
	grqk2WapaPb0F6uiQAhSJlkLl2ZojyfzONWkOSBdo1mV6wdv767EV9TGBKQPekmKjO+09XSA7LJ+F
	kDmpfUg/Z/UnLx1yWUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVJe-003gNk-WF; Fri, 25 Feb 2022 07:47:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVJZ-003gJg-MJ
 for linux-amlogic@lists.infradead.org; Fri, 25 Feb 2022 07:47:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id j22so3076686wrb.13
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Feb 2022 23:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oKlddMOdoBQpHXORVm/dprXUDfrOkRgmeBsrcJHm1bw=;
 b=m2RaanlztnHpMkrKbTVH4cK8XTyZDBISo1kMKyf9MDpdwNDKeGoIAB/DzRaX99gM2t
 O+PlMP+fcc1TawEsM38iZgp654X0Wa2mQlW6b2g78ro4Blf65NCjB5JH06cFrU9r7SwM
 IWVVC8hPd5AG6n1hqKlW6hwtFUA7dYe3bgfPVQGvPjXVg8zULslMhrZU+sJB4w3JStME
 3P/fWZD1kVJwuIhH5hEnlZtTziYi1F+xBgumtdhufVA7HdfpyhM0hPUNDDJASG+oK+vG
 Bq3GAMwG95X2fdTheyLubB65xJqysSaY+cnuqW+LTy4fePMaDUozEZ4WndiWNrP7G0av
 dGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oKlddMOdoBQpHXORVm/dprXUDfrOkRgmeBsrcJHm1bw=;
 b=iYrHx6B+oRzfiCOZALKSoVlT53q9/OkZKd1KFC01cloB2ByJhXPwTY/j4/sm7QKNii
 t3apTN7Dh78cq3vqgSt2uYQH/oFQaT8nwR3AuKAW5IV67CtCn1LSWAiqHnf3qfAXSYgT
 NOE+1QOYAxEXQX9M3h7uQpc0wVqQ67/pehldNVKf4sN2e7oyrPq7OJb+3rgKrhUIo+Ve
 /QRFC7MlC6rJuxGevuWhnweVv9KqchEKuOR0TGXCTwV37heeA9nOzRr9vFI7q3DHW97Y
 zGwkdxwyPdxPKT3ilStRDytnoWKdC8hdl3XjEgs/Ryg6GMMzvrRORv7GRP+0ilPv3m+c
 o0CQ==
X-Gm-Message-State: AOAM530JtOqERLRyxDfpqKYki8fAdfjBgi/hKNdReznIud+Ru2bvVrzv
 0fg43aBVd986RnrKPN84PHcssw==
X-Google-Smtp-Source: ABdhPJwWKlGDm8gsTQCIae+e+5zK2D2UI0JFQX/0+5DWZfLMtz1nTxwmfso/Qihyewj5DILPqcJNzQ==
X-Received: by 2002:adf:bbc4:0:b0:1ee:f2d4:2f75 with SMTP id
 z4-20020adfbbc4000000b001eef2d42f75mr3458910wrg.701.1645775210360; 
 Thu, 24 Feb 2022 23:46:50 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:5e3f:6e2c:a7c1:38f1?
 ([2001:861:44c0:66c0:5e3f:6e2c:a7c1:38f1])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c294900b00380f8be8ceesm4841753wmd.20.2022.02.24.23.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 23:46:49 -0800 (PST)
Message-ID: <905e3d32-43dc-7073-36ce-ab39bf7c6f0a@baylibre.com>
Date: Fri, 25 Feb 2022 08:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V4 1/2] dt-bindings: power: add Amlogic s4 power domains
 bindings
Content-Language: en-US
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, jianxin.pan@amlogic.com,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220225064455.1369197-1-shunzhou.jiang@amlogic.com>
 <20220225064455.1369197-2-shunzhou.jiang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220225064455.1369197-2-shunzhou.jiang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_234657_877106_BBA0B61F 
X-CRM114-Status: GOOD (  18.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 25/02/2022 07:44, Shunzhou Jiang wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic s4, in which the power domains registers
> are in secure world.
> 
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>

Please keep along revisions the Reviewed-by/Acked-by/Tested-by from previous reviews like the one from https://lore.kernel.org/r/CAFBinCBN-QoA-e9JzfUq-Wc4Chu=x6cVoP2SYf=q-GrnLdLGKg@mail.gmail.com

And please CC devicetree@vger.kernel.org to have a proper review from the Rob Herring, without a proper review from Rob I can't take it.

Neil

> ---
>   .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
>   include/dt-bindings/power/meson-s4-power.h    | 19 +++++++++++++++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/power/meson-s4-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> index 5dae04d2936c..7657721a4e96 100644
> --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -12,13 +12,14 @@ maintainers:
>     - Jianxin Pan <jianxin.pan@amlogic.com>
>   
>   description: |+
> -  Secure Power Domains used in Meson A1/C1 SoCs, and should be the child node
> +  Secure Power Domains used in Meson A1/C1/S4 SoCs, and should be the child node
>     of secure-monitor.
>   
>   properties:
>     compatible:
>       enum:
>         - amlogic,meson-a1-pwrc
> +      - amlogic,meson-s4-pwrc
>   
>     "#power-domain-cells":
>       const: 1
> diff --git a/include/dt-bindings/power/meson-s4-power.h b/include/dt-bindings/power/meson-s4-power.h
> new file mode 100644
> index 000000000000..462dd2cb938b
> --- /dev/null
> +++ b/include/dt-bindings/power/meson-s4-power.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc.
> + * Author: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_MESON_S4_POWER_H
> +#define _DT_BINDINGS_MESON_S4_POWER_H
> +
> +#define PWRC_S4_DOS_HEVC_ID	0
> +#define PWRC_S4_DOS_VDEC_ID	1
> +#define PWRC_S4_VPU_HDMI_ID	2
> +#define PWRC_S4_USB_COMB_ID	3
> +#define PWRC_S4_GE2D_ID		4
> +#define PWRC_S4_ETH_ID		5
> +#define PWRC_S4_DEMOD_ID	6
> +#define PWRC_S4_AUDIO_ID	7
> +
> +#endif


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
