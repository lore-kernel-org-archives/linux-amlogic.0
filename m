Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF55C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPXcRjMbYWQDoZCdCb3IR2HTr8iyJjhy7kmNCSAOGbk=; b=MJtzPJiZN9+aAG
	nEVSmM6KeZuY4bbu7FeeP6oF4UkwqXI6b4OVkuN3jx+JQy9mxuHhFOTaZUv/f5QhhaCwtV7oKmIfd
	QyONjM5xSrVr3ib/s1fNzgXov+O4MWiI204zoPdvhsBBaesBoFvvkSpeiX75y6aSF3vh7E2JZDhW3
	81duuhmzZXsUl8bEBbxMYRfXsZSPOVMD7x5QNGcY8wpToT9x09PsGv7TeaB1sRfs1ydAVTTgTF9kN
	i6FLRNHHWyGqjy7/V0QL3bwf88KQDUNIZuvahf1Y1+aUEgt+0LfBiSqOXT7MZzWTIdUQu95cFmVN6
	u1sBy/Erc6cdyR1DUx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLhsa-00AzhH-8s; Wed, 10 Aug 2022 09:19:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLhsA-00AzYh-QF
	for linux-amlogic@lists.infradead.org; Wed, 10 Aug 2022 09:19:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id a18-20020a05600c349200b003a30de68697so1446666wmq.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Aug 2022 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=JUyNoU818egRObOa/IMHniG7D9eOIpIdC03VDFYcljo=;
        b=zPk2H2DcpAOIYrazdg5bocpCKj1TZ3T3x+hhVv9dnfP4Jx3oGOh9mHo9HsNC+03Nlq
         q1ovvctKiPUJ2e7+qAkpQIS730msh6rm5ux9rGj/XAWEIzBnCC3AZvzLJRDkcj7AY8jb
         jm96gfWZDelrWicO5yWtIn3mFno+QROX1N1iTUarMx18UQnYj/LHCrUGblCpHr0xxIY/
         pVPdYgCwUhHy4Jo5mpM5gvqVxAp9J9iOwlzoj8Jj8bbh/30gW3KRCh6rXScOIisb6EHp
         HG6/KKVxxLy07xtHVrsWwy66h2wpw0qkWBcfvb3QYaB3a5p+ayBeHcPzklZ6Shbu4csV
         fhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=JUyNoU818egRObOa/IMHniG7D9eOIpIdC03VDFYcljo=;
        b=UWac9SmsmN0nBvgJqsjWPYgRdEsCv8/f3idxc/T0xxrMB/lDxyfwc5nS+epKF5reZF
         8l9O/u2lh/U2G7nZnbTOQzI+ieqChCazVHO9/jspOFAW533zmf3cvK7DLbXBkWlrfyDB
         IYrUYHXIaLoel5IJDMzGSBtdBQzdXp59VBCDUx8rNJ43hEsAZCfXfI44bvGUVJbtUfMz
         sUmvuRzCf6yIBMyT7ha6qRbxFMIvr/mzGvga65f/05noWUnbUDctE/yq+LfmHhyPGH3t
         DYO+HN5DXinEnRgEpzlyi7aN4EGQsF397slc0edBdcEWpA0Utl8sjIc6w4cstXTkXiAm
         6WQA==
X-Gm-Message-State: ACgBeo0l8X/9WxLSCnAoefjpxHeDl6t/UShRHBlQJtaL+U5rgFE01ju0
	k+1lWJqmAKZHL7JMuU6uM7lY7Q==
X-Google-Smtp-Source: AA6agR7pdGtejWvZTPsUk04vSJYrK2KdnyxThzcDnl1Dr3dCImUqcIN6rBQFOift4AReX0i5XvuZww==
X-Received: by 2002:a1c:218b:0:b0:3a5:b5d4:9741 with SMTP id h133-20020a1c218b000000b003a5b5d49741mr908113wmh.28.1660123168886;
        Wed, 10 Aug 2022 02:19:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cb4c:4cd5:c6b6:8b12? ([2a01:e0a:982:cbb0:cb4c:4cd5:c6b6:8b12])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c274200b003a54f1d007csm1781685wmw.10.2022.08.10.02.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 02:19:28 -0700 (PDT)
Message-ID: <f5720289-6d12-24a5-82bf-f8538d348252@baylibre.com>
Date: Wed, 10 Aug 2022 11:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] spi: meson-spicc: Use pinctrl to drive CLK line when
 idle
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 Da Xue <da@libre.computer>
References: <20220809172017.215412-1-aouledameur@baylibre.com>
 <20220809172017.215412-3-aouledameur@baylibre.com>
 <1jsfm4xymu.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <1jsfm4xymu.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_021930_963603_B105DD0A 
X-CRM114-Status: GOOD (  28.10  )
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

On 10/08/2022 10:52, Jerome Brunet wrote:
> 
> On Tue 09 Aug 2022 at 19:20, Amjad Ouled-Ameur <aouledameur@baylibre.com> wrote:
> 
>> Between SPI transactions, all SPI pins are in HiZ state. When using the SS
>> signal from the SPICC controller it's not an issue because when the
>> transaction resumes all pins come back to the right state at the same time
>> as SS.
>>
>> The problem is when we use CS as a GPIO. In fact, between the GPIO CS
>> state change and SPI pins state change from idle, you can have a missing or
>> spurious clock transition.
>>
>> Set a bias on the clock depending on the clock polarity requested before CS
>> goes active, by passing a special "idle-low" and "idle-high" pinctrl state
>> and setting the right state at a start of a message
>>
>> Reported-by: Da Xue <da@libre.computer>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 14 ++++++++
>>   drivers/spi/spi-meson-spicc.c              | 39 +++++++++++++++++++++-
> 
> These 2 changes should not be in the same patch.
> 
>>   2 files changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> index c3ac531c4f84..04e9d0f1bde0 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> 
> Does the problem applies only the gxl ? not gxbb, g12, axg ?

Only on GXL, starting from AXG the pins mode output state can be kept between bursts.

> 
>> @@ -429,6 +429,20 @@ mux {
>>   			};
>>   		};
>>   
>> +		spi_idle_high_pins: spi-idle-high-pins {
>> +			mux {
>> +				groups = "spi_sclk";
>> +				bias-pull-up;
>> +			};
>> +		};
>> +
>> +		spi_idle_low_pins: spi-idle-low-pins {
>> +			mux {
>> +				groups = "spi_sclk";
>> +				bias-pull-down;
> 
> Would it be safer to properly drive the pin in push-pull mode ?
> Like using gpio pinumux mode and output-high/output-low pinconf ?

The pins mux must be kept in the SPI function, thus only a bias can be applied.

> 
>> +			};
>> +		};
>> +
>>   		spi_ss0_pins: spi-ss0 {
>>   			mux {
>>   				groups = "spi_ss0";
>> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
>> index 0bc7daa7afc8..d42171ee1d61 100644
>> --- a/drivers/spi/spi-meson-spicc.c
>> +++ b/drivers/spi/spi-meson-spicc.c
>> @@ -21,6 +21,7 @@
>>   #include <linux/types.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/reset.h>
>> +#include <linux/pinctrl/consumer.h>
>>   
>>   /*
>>    * The Meson SPICC controller could support DMA based transfers, but is not
>> @@ -166,14 +167,31 @@ struct meson_spicc_device {
>>   	unsigned long			tx_remain;
>>   	unsigned long			rx_remain;
>>   	unsigned long			xfer_remain;
>> +	struct pinctrl			*pinctrl;
>> +	struct pinctrl_state		*pins_idle_high;
>> +	struct pinctrl_state		*pins_idle_low;
>>   };
>>   
>>   static void meson_spicc_oen_enable(struct meson_spicc_device *spicc)
>>   {
>>   	u32 conf;
>>   
>> -	if (!spicc->data->has_oen)
>> +	if (!spicc->data->has_oen) {
>> +		/* Try to get pinctrl states for idle high/low */
>> +		spicc->pins_idle_high = pinctrl_lookup_state(spicc->pinctrl,
>> +							     "idle-high");
>> +		if (IS_ERR(spicc->pins_idle_high)) {
>> +			dev_warn(&spicc->pdev->dev, "can't get idle-high pinctrl\n");
>> +			spicc->pins_idle_high = NULL;
>> +		}
>> +		spicc->pins_idle_low = pinctrl_lookup_state(spicc->pinctrl,
>> +							     "idle-low");
>> +		if (IS_ERR(spicc->pins_idle_low)) {
>> +			dev_warn(&spicc->pdev->dev, "can't get idle-low pinctrl\n");
>> +			spicc->pins_idle_low = NULL;
>> +		}
>>   		return;
>> +	}
>>   
>>   	conf = readl_relaxed(spicc->base + SPICC_ENH_CTL0) |
>>   		SPICC_ENH_MOSI_OEN | SPICC_ENH_CLK_OEN | SPICC_ENH_CS_OEN;
>> @@ -438,6 +456,16 @@ static int meson_spicc_prepare_message(struct spi_master *master,
>>   	else
>>   		conf &= ~SPICC_POL;
>>   
>> +	if (!spicc->data->has_oen) {
>> +		if (spi->mode & SPI_CPOL) {
>> +			if (spicc->pins_idle_high)
>> +				pinctrl_select_state(spicc->pinctrl, spicc->pins_idle_high);
>> +		} else {
>> +			if (spicc->pins_idle_low)
>> +				pinctrl_select_state(spicc->pinctrl, spicc->pins_idle_low);
>> +		}
>> +	}
>> +
>>   	if (spi->mode & SPI_CPHA)
>>   		conf |= SPICC_PHA;
>>   	else
>> @@ -482,6 +510,9 @@ static int meson_spicc_unprepare_transfer(struct spi_master *master)
>>   
>>   	device_reset_optional(&spicc->pdev->dev);
>>   
>> +	if (!spicc->data->has_oen)
>> +		pinctrl_select_default_state(&spicc->pdev->dev);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -733,6 +764,12 @@ static int meson_spicc_probe(struct platform_device *pdev)
>>   		goto out_core_clk;
>>   	}
>>   
>> +	spicc->pinctrl = devm_pinctrl_get(&pdev->dev);
>> +	if (IS_ERR(spicc->pinctrl)) {
>> +		ret = PTR_ERR(spicc->pinctrl);
>> +		goto out_clk;
>> +	}
>> +
>>   	device_reset_optional(&pdev->dev);
>>   
>>   	master->num_chipselect = 4;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
