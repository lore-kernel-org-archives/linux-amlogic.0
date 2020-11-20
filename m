Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FFCC56201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 14:55:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F1422272
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 14:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StzKamTw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RAJ3zYkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99F1422272
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ydq1M0A4qi8PKPFoocjL/HdTZH8IlRhceCDyJdPBAQ0=; b=StzKamTwfLXtkikjeZMCB/KZ5
	8QMIyrmAeMg77QEZDWqxPeIfU8J7mbi36G6pS59iIM2c76w8Reu97tT4CVpCAc7l8DsN1bIqVEdqh
	1QFT81Id2Gsc9t/U/br+8rUNCAo9xRHMzvZX/NxXiEc4w1x3MUhPxdg6f5Zf9Cs+4SUBujXWIH7ze
	KqBLInA44OCNjgoKpnrXpPI4AOCU1Sy9YEd97nc99PSm/vpLszWySO6R4Ad7qNASnZ5IIYz5U7AFD
	4CPC3489DPlZv1M7IwXIqfFgvCqYjFAXvp2cHUIsxo1m5gzcj+AyutRc+lZYOjOEH3t1IW+Yptq3L
	P9NhgtiTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg7om-00084f-Ak; Fri, 20 Nov 2020 14:55:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg7oi-00083S-HO
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 14:55:17 +0000
Received: by mail-wm1-x343.google.com with SMTP id w24so10064147wmi.0
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jm4OkDH2nCeoYwOCMfwAPaBKvP0WLi1KuZbg+Z+VjWg=;
 b=RAJ3zYkmAdBGR+XQMSetSo2yuagBbyyEAhTIr0tqfENvJ7vcOJuNPpXZrXh5JMkXdD
 hgtEFkG7JT7Ym4FNtLlVoTD3lWBMDZHOUXNikwVZhWmaOANIwioeCrOGj04wna61msOU
 UXyUrR5yDReBQsL69HpT5GnjapIYgz1qhUXPv/swxW/YeqUx1TTpDnHKkz902GxtOwV7
 xQnMY/5f5ckHaGQMqmGPZIWMtnuYtDopopkG2WiY+AYPyEk8DAbQ1/yT6cv2lqh8LH9q
 LkX7zTlvntn92SIL4H9AAUHSEQxzEtbN4l4sVTrw3vbQy9zN2dQ8DZx4L2htXuayplKV
 9MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Jm4OkDH2nCeoYwOCMfwAPaBKvP0WLi1KuZbg+Z+VjWg=;
 b=nem1dmGCLy2s7cow1P2+24qjXtERA083HYLsSzeoW0sJzjrQ6gdqOWteOmjA7y9aHv
 IUtpPBwa6D/Grrp6uptDlnrkCvD3aOPRfNkhESMYL+1E9GSg2AouTdmongydXEjDDElG
 ft1EDypcjfeUpqCVewaKgdHm209Psp6VfUDGojwmx+/LF71TbZRXHMhiK2TmPeOHx/mh
 gWDHkmh0todjx0L+Eq2wzgFjcDwhqZJXQ2nzUutn1Qop/XSWQTjzwnyz8bqwyyom/BjL
 RchcxW9pQbGkMA44zfcQ6qBd3NB/hM2sjNPLJxGwJw4qmyDBSNu+CRduwBxW3vrt6b9b
 wjdg==
X-Gm-Message-State: AOAM531tq2j5QG0uJfbG4/f0pu33BYiy1nR1L3Cib+AIZBmpWrc5NACs
 DKeXFN80QiAG6Los+qv1kxhzHA==
X-Google-Smtp-Source: ABdhPJwZw/qXHEEH/h3m70sEmm9f4sKarSNbjD9BqgezEDCOaFYQhMHtPuAtQrSHg8rdLJrgsf8Wtw==
X-Received: by 2002:a05:600c:256:: with SMTP id
 22mr10113073wmj.120.1605884114135; 
 Fri, 20 Nov 2020 06:55:14 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7?
 ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id d134sm4661133wmd.8.2020.11.20.06.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 06:55:13 -0800 (PST)
Subject: Re: [RESEND PATCH v3 3/3] phy: amlogic:
 phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI analog
To: Vinod Koul <vkoul@kernel.org>
References: <20201116101647.73448-1-narmstrong@baylibre.com>
 <20201116101647.73448-4-narmstrong@baylibre.com>
 <20201120095825.GD2925@vkoul-mobl>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <593b8745-6cb5-b6c3-9540-07dc6bc429b0@baylibre.com>
Date: Fri, 20 Nov 2020 15:55:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120095825.GD2925@vkoul-mobl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_095516_588577_EB85A1C0 
X-CRM114-Status: GOOD (  16.47  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20/11/2020 10:58, Vinod Koul wrote:
> On 16-11-20, 11:16, Neil Armstrong wrote:
>> The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
>> thus we need to have inclusive support for both interfaces at runtime.
>>
>> This fixes the regmap get from parent node, removes cell param
>> to select a mode and implement runtime configuration & power on/off
>> for both functions since they are not exclusive.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Remi Pommarel <repk@triplefau.lt>
>> ---
>>  drivers/phy/amlogic/Kconfig                   |   1 +
>>  .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
>>  2 files changed, 136 insertions(+), 69 deletions(-)
>>
>> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
>> index 99e8a4c7f1f3..db5d0cd757e3 100644
>> --- a/drivers/phy/amlogic/Kconfig
>> +++ b/drivers/phy/amlogic/Kconfig
>> @@ -66,6 +66,7 @@ config PHY_MESON_AXG_MIPI_PCIE_ANALOG
>>  	depends on OF && (ARCH_MESON || COMPILE_TEST)
>>  	select GENERIC_PHY
>>  	select REGMAP_MMIO
>> +	select GENERIC_PHY_MIPI_DPHY
>>  	help
>>  	  Enable this to support the Meson MIPI + PCIE analog PHY
>>  	  found in Meson AXG SoCs.
>> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>> index 1431cbf885e1..6eb21551bdd9 100644
>> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>> @@ -4,9 +4,13 @@
>>   *
>>   * Copyright (C) 2019 Remi Pommarel <repk@triplefau.lt>
>>   */
>> +#include <linux/bitfield.h>
>> +#include <linux/bitops.h>
>>  #include <linux/module.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/regmap.h>
>> +#include <linux/delay.h>
>> +#include <linux/mfd/syscon.h>
>>  #include <linux/platform_device.h>
>>  #include <dt-bindings/phy/phy.h>
>>  
>> @@ -14,10 +18,10 @@
>>  #define		HHI_MIPI_CNTL0_COMMON_BLOCK	GENMASK(31, 28)
>>  #define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
>>  #define		HHI_MIPI_CNTL0_BANDGAP		BIT(26)
>> -#define		HHI_MIPI_CNTL0_DECODE_TO_RTERM	GENMASK(15, 12)
>> -#define		HHI_MIPI_CNTL0_OUTPUT_EN	BIT(3)
>> +#define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(25, 16)
>> +#define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
>>  
>> -#define HHI_MIPI_CNTL1 0x01
>> +#define HHI_MIPI_CNTL1 0x04
>>  #define		HHI_MIPI_CNTL1_CH0_CML_PDR_EN	BIT(12)
>>  #define		HHI_MIPI_CNTL1_LP_ABILITY	GENMASK(5, 4)
>>  #define		HHI_MIPI_CNTL1_LP_RESISTER	BIT(3)
>> @@ -25,100 +29,170 @@
>>  #define		HHI_MIPI_CNTL1_INPUT_SEL	BIT(1)
>>  #define		HHI_MIPI_CNTL1_PRBS7_EN		BIT(0)
>>  
>> -#define HHI_MIPI_CNTL2 0x02
>> +#define HHI_MIPI_CNTL2 0x08
>>  #define		HHI_MIPI_CNTL2_CH_PU		GENMASK(31, 25)
>>  #define		HHI_MIPI_CNTL2_CH_CTL		GENMASK(24, 19)
>>  #define		HHI_MIPI_CNTL2_CH0_DIGDR_EN	BIT(18)
>>  #define		HHI_MIPI_CNTL2_CH_DIGDR_EN	BIT(17)
>>  #define		HHI_MIPI_CNTL2_LPULPS_EN	BIT(16)
>> -#define		HHI_MIPI_CNTL2_CH_EN(n)		BIT(15 - (n))
>> +#define		HHI_MIPI_CNTL2_CH_EN		GENMASK(15, 11)
>>  #define		HHI_MIPI_CNTL2_CH0_LP_CTL	GENMASK(10, 1)
>>  
>> +#define DSI_LANE_0              (1 << 4)
>> +#define DSI_LANE_1              (1 << 3)
>> +#define DSI_LANE_CLK            (1 << 2)
>> +#define DSI_LANE_2              (1 << 1)
>> +#define DSI_LANE_3              (1 << 0)
>> +#define DSI_LANE_MASK		(0x1F)
> 
> This should use BIT(), also there are interesting helpers in bitfield.h
> to help with register fields, do send follow up patches..
> 

Ok, cleanup will follow

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
