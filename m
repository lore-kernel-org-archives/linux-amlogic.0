Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0005C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Feb 2022 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EZj96jdAGDtJlYsDTjwt/DOlyNQXg7uB3y837mViqo=; b=IVps/EbSW5QDzi
	NWdWA2fxX+8E1nfCzdzObuoWuli3PaMu7mifXiij/19l4cRa0FIMTJuFlrEV8sNJUj/FBHmMohfcg
	NqfwEOtK5VtHdWZKoVuHkdJ7KJx8SrLBh612BQ7dPGb1TvUncK/ZxqaUdVG1C/yWAvYdGiSd3zoV+
	upof9EqNacQSi96Aeuo07hjFXt+7mXzNidtYVDr8V5we7X1020nfz9MgW27iDesjvoHobVDxzq5h9
	CL7FoGp/ZlNfBLrLYC/Q+4ZjTnb2qG+kljJCQHfzZdSKBDVFWEL9Sk2CkPujrWYWhm1vHC34p8gN+
	kH8cb7wBsCOsDaMkcelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGzB2-009JTs-RR; Mon, 07 Feb 2022 08:15:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGzAq-009JQ5-3V
 for linux-amlogic@lists.infradead.org; Mon, 07 Feb 2022 08:15:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so8005056wms.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Feb 2022 00:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fczIWa54IaZDc4T1CWGAuqTrmTb2eOKwrkRnh84PvKY=;
 b=7DQlnj++q+oWqpt0+suM56O/9jbGYLBVZ9uG389OK4Z14l6csp4EzWcanXR+trSHGW
 B4WZ7GlfBYkC0hu3irlq/aSadsOLk581sk427DrgitunJVRUx9upQNOsS3nFBmAWK1kH
 LRVNTpYViSIHQ7FUdCntexsSOnZPguuYS3ycpDA83CPjHHh863fgGnlFIt5Czll35dXT
 y5CA/S6q00nfwTA6cYjeNRPqS6ubRF1hOkXM/5nY+6gNdE8uxAeBYJlQ7rY5Lb0Wab2w
 81hcBoCIeiSvq5WMBaPebyRazK2K0x9Q1zI6oNCBvaJ1eXCBHZhg/GnbnpiIUTvW/JmO
 UbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fczIWa54IaZDc4T1CWGAuqTrmTb2eOKwrkRnh84PvKY=;
 b=qBjkR+nEw5nr2a60YJRn/b/Yf1Fy6uyrIKCVE+Xr9sRz0LdDY8kG6XAkgG19mL8qnQ
 ZDfW8zFZJuUmpa7GfdZ0sIf/Lb3p1YXrB93B81KqJydwUrGGJ87f+BjZ3jX384eDOzuH
 cqXsDHGKXLMI88hAMH3xLDTCJUxrF1FQW3XuUlPFVznbeliPOtkH7sRKIQYyI+DH9uge
 KmI+8rKKXZxE5MQwnujjMEHCs78lRCXI8R41MuqoyUy9HfolWs5KKskMUkTiyMqg5cM/
 YbqsPGyvh2sfy//Tel68++Wvudqn3Dw2chVQUe6DkFKZ+Yvjo691zT5NuQy2XQFav9zI
 6bpg==
X-Gm-Message-State: AOAM531xsdpsCo/AFch3YnVe2uGuDHIGY/G8aYlmB1q1KSRtbJViTpBa
 u7mE/17ev5f/0iFQaYcVwhBhJQ==
X-Google-Smtp-Source: ABdhPJyp3Dsj/2D1xPD5Qeeh8DKBvGDfrGuqnqvdGnd5qSAnPA2vA2jzi7lVA+gJhKbpWfAEfBP4Ow==
X-Received: by 2002:a05:600c:34c6:: with SMTP id
 d6mr13602354wmq.103.1644221697111; 
 Mon, 07 Feb 2022 00:14:57 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:b2bb:1b67:73da:334d?
 ([2001:861:44c0:66c0:b2bb:1b67:73da:334d])
 by smtp.gmail.com with ESMTPSA id u19sm8286068wmm.39.2022.02.07.00.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 00:14:56 -0800 (PST)
Message-ID: <42c51f9d-d122-2d09-cdcd-f733cbc60d5b@baylibre.com>
Date: Mon, 7 Feb 2022 09:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] add pmu to amlogic meson sm1
Content-Language: en-US
To: Benjamin Mordaunt <crawford.benjamin15@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
 <20220206144343.2194-1-crawford.benjamin15@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220206144343.2194-1-crawford.benjamin15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_001500_324355_B2BD6849 
X-CRM114-Status: GOOD (  15.00  )
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

On 06/02/2022 15:43, Benjamin Mordaunt wrote:
> ---
> The dts for meson sm1 appears to omit the SoC's PMU,
> which is essential for accessing perf events regarding
> e.g. cache on e.g. the Odroid C4 platform. Add it.
> 
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 3d8b1f4f2..4147eecd2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -6,6 +6,8 @@
>   
>   #include "meson-g12-common.dtsi"
>   #include <dt-bindings/clock/axg-audio-clkc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/power/meson-sm1-power.h>
>   #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>   #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> @@ -90,7 +92,16 @@ l2: l2-cache0 {
>   			compatible = "cache";
>   		};
>   	};
> -
> +	
> +	arm-pmu {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +	
>   	cpu_opp_table: opp-table {
>   		compatible = "operating-points-v2";
>   		opp-shared;

Please see Marc's comments about PMU support:
http://lore.kernel.org/r/8735pcq63o.wl-maz@kernel.org

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
