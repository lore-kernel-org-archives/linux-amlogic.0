Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E41EB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTZjMzytvOiIwpFYraZiXG1XNcbwgvkR/nSco4bbCwc=; b=Mp37O/0uqMsX9l
	CsmJvSRRadip+ufV79uajB4sHyW7wA028BDFgpcXQYB3qt8481aREpfB9uJ6gkLFzb0hIPXg9VsUl
	oWNFXMiKFd+oLWyfS9JThJgLQwVcuRBLpCLL5FdlUQmX0YoluncrnXJrVPVwFQ9hE9SDO2YFK3PmE
	7+s6Vx1AF2x7rjd3qg/j3sD2i7YxTPypLDN8DdZ0I5rEreOhAIb1kLWAc6lS5ydLtKf0rv0ZcFPTW
	sSpBO3Af5HsKlxvcjtico1uMRIydxqAzOkrZS3kOsLKiV6U2EKd23LafiFscF3/89Bg9HAaQsvmOK
	Q9FIOUZJ6C6fMfXTZBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJLk-00Ab73-0h;
	Mon, 03 Jul 2023 13:12:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJLi-00Ab5L-00
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 13:12:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3143b88faebso364376f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688389930; x=1690981930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3C72+69VGn6Vh4PEX3kulCzL7RyUsSJTOHMj9jDZHN8=;
        b=uKaA9p0Ox2ovUpVrrVYgiLiawXF/eJHtDmw08cPCzgZCbB60Ie8INNvKUxBIAKmL3Y
         gJjymwQdcF7raXNSF8V6wRpvvBFTtLf7turtg9TU69p5lKeXMaD3Z6AKI9UYiwJRApAI
         IwHg9pDdFL6ENpVemuwnYsQ1q7YBVDw7d2I64puqIHBLNSMNvR3bY+KieueemlUZI4Wx
         VNwKAbld7p6chbwhedWQ/HFD3cmZG4DjjGBZ1UDZ5JQMWdmeF/kgXYKIpM3ZHIQHpGNk
         JalLPDuZ1BM6md6B3Gsm+P5SO/aD6zQVkMFh25wH0/768JWkKOd5sOlYeVUH5tPTISd3
         ABLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389930; x=1690981930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3C72+69VGn6Vh4PEX3kulCzL7RyUsSJTOHMj9jDZHN8=;
        b=G8pb+lwsIPOMFAyQhy11eZF+3qexDIVDPPM3o+kXTLoke3Arlry9Yrr1xER9lPwmr0
         qJKcoMs7YrdnfU/LJanUEZaWS0TVMeGGTYdvJ2FIhs8ReGd00xTnzQsbdPzOoebfg6qn
         lP+jL7tz0c/bL2B5lTS9mUP8Oz/k1VUxanX3MLSJ0kc0QIKybCluan2Iq6UHm5Eo/cff
         cgxbOEAtCeFspSzw8vAXb/Hqkp6I18cuAM/De4+olHviTgVR4n1oxa0ZycGUrzmfZvzR
         ck0kwRcJDUyi52Wl1FpyKgVpbbR+cL/AkTVMKSXuSlouB2d8XfYbksCQeCCEelsolG4o
         u1pQ==
X-Gm-Message-State: ABy/qLaAnczmerRMbgRl+2eb7F+980ruVWyWznqmhjc6RnCXdVI//fce
	46UCiShtz5YrehHCpuNAUlrH4h38LtIXDjyisf3py/uK
X-Google-Smtp-Source: APBJJlGzI2y08jEzmUxZusXD3XCrTA4WMsvMiPknAxeFAukczBsa/LAjJj2fSLhRTg7ATBgccqwsAQ==
X-Received: by 2002:adf:ee51:0:b0:313:fd52:af37 with SMTP id w17-20020adfee51000000b00313fd52af37mr10499400wro.4.1688389930317;
        Mon, 03 Jul 2023 06:12:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m16-20020a5d6250000000b003068f5cca8csm25443464wrv.94.2023.07.03.06.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:12:09 -0700 (PDT)
Message-ID: <d1cfb1fb-d347-16d8-4446-dddcf8200638@linaro.org>
Date: Mon, 3 Jul 2023 15:12:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] dt-bindings: power: add Amlogic C3 power domains
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
 <20230703093142.2028500-2-xianwei.zhao@amlogic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703093142.2028500-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_061214_050100_7C0ABA4E 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/07/2023 11:31, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add devicetree binding document and related header file for Amlogic C3 secure power domains.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
>  include/dt-bindings/power/amlogic-c3-power.h  | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/power/amlogic-c3-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> index eab21bb2050a..d80bbedfe3aa 100644
> --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -12,7 +12,7 @@ maintainers:
>    - Jianxin Pan <jianxin.pan@amlogic.com>
>  
>  description: |+
> -  Secure Power Domains used in Meson A1/C1/S4 SoCs, and should be the child node
> +  Secure Power Domains used in Meson A1/C1/S4 & C3 SoCs, and should be the child node
>    of secure-monitor.
>  
>  properties:
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,meson-a1-pwrc
>        - amlogic,meson-s4-pwrc
> +      - amlogic,c3-pwrc
>  
>    "#power-domain-cells":
>      const: 1
> diff --git a/include/dt-bindings/power/amlogic-c3-power.h b/include/dt-bindings/power/amlogic-c3-power.h
> new file mode 100644
> index 000000000000..3403e7c0b49d
> --- /dev/null
> +++ b/include/dt-bindings/power/amlogic-c3-power.h

Filename matching compatibles, please.

> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +/*
> + * Copyright (c) 2023 Amlogic, Inc.
> + * Author: hongyu chen1 <hongyu.chen1@amlogic.com>
> + */
> +#ifndef _DT_BINDINGS_AMLOGIC_C3_POWER_H
> +#define _DT_BINDINGS_AMLOGIC_C3_POWER_H
> +
> +#define PWRC_C3_NNA_ID				0
> +#define PWRC_C3_AUDIO_ID			1
> +#define PWRC_C3_RESV_SEC_ID			2
> +#define PWRC_C3_SDIOA_ID			3
> +#define PWRC_C3_EMMC_ID				4
> +#define PWRC_C3_USB_COMB_ID			5
> +#define PWRC_C3_SDCARD_ID			6
> +#define PWRC_C3_ETH_ID				7
> +#define PWRC_C3_RESV0_ID			8
> +#define PWRC_C3_GE2D_ID				9
> +#define PWRC_C3_CVE_ID				10
> +#define PWRC_C3_GDC_WRAP_ID			11
> +#define PWRC_C3_ISP_TOP_ID			12
> +#define PWRC_C3_MIPI_ISP_WRAP_ID		13
> +#define PWRC_C3_VCODEC_ID			14
> +
> +#endif
> +

No need for stray blank line.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
