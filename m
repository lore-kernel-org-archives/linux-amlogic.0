Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A163AC433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Oct 2022 08:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT+dDxd3jSz/XjcCCSZmkivNu1mhLKR84kYcLSxWg6Q=; b=UFYdKdt6TzP+fzgiS9rY22Mric
	gCtrvyAUB3j8kI2lqJrN4DHzEw2K2fjgCm0eR1c8ZtA/5ZQur66HSb6tMdxWz+bGV2EFm7BihDpeM
	23Q/fhaOeRDkuBYtgQ9fzRyh2f08nybbq/Z76dBnr8pQ6ehoyk5c0fiusYtBN6/YMeTj8Pvqzko5r
	z6T0MLhR9HUu5LtBkU9k/K/TyfvGH8ogWfT0Zg589DKGadpndDGoapaoAnco2mvyAZK4f3oqgePSM
	fLAT00RN8Lg3RxL62o3Am+W/zVjupfCKl209Sfvbz18+krr/IlCq7f9M7UBTdjf4E8EXYbtTBA7Xb
	P8i1rS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQky-00C8Ud-UB; Thu, 20 Oct 2022 08:18:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQkw-00C8Nk-CC
	for linux-amlogic@lists.infradead.org; Thu, 20 Oct 2022 08:18:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id n12so32914858wrp.10
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Oct 2022 01:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fsj+8WfOAZfb/OmR4M1+8IvYvMPpVpcsoTV/p/XqqZI=;
        b=qh1bsgdxEeRCQ6hZldQMcr3aLqpWdd1Clao0b8Ya5qOdGGbjkC94KnXF1WtRGghZA9
         kiCXAtUNfsM0/UJskrvFZvEjSjPHQHp8+w05atY2PKLSkHNQeqYq8rMnyIf7kp5yGD8g
         18dqXvtWAUjToox+VWRTYw2x1amBzMLfYOi20j2ybIQIU5SgiealQ0r7JKAzSpbFGSOQ
         g7MwnhfWhXcZSQVeYnUr8ynUaAfaxSvapGRddFhcinqCWnlAllOLxfCXSKSC/Y465mHt
         x2qon43dtp8zWqeV42EtzH2vZOW1Yft19khX2huV6LD49oCR6/WoDRQJNReRqi27KCAq
         +c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fsj+8WfOAZfb/OmR4M1+8IvYvMPpVpcsoTV/p/XqqZI=;
        b=ypr9dRANZ+u5f+hHeboxJMSSlFx8XL676h+vnAmt4SfI+fwr3QpuLijNWCJ7LWH4YC
         6DznFRTuE6KKEHJcgI2ixI3N1OAjzhf7Umr8dd2759L+mzqpWJ0Wr/vnF/mNlENTzdyW
         VKtalg+QsvfFyqR+w6rIqVEz32SX81Di20C8rI+krRwg1HM7nhaPZjbPPnfj0JhqPEpu
         2+SW9oraC0DZz50UP7XojWkenB2/4PAfa2yA8utrc/aKX34u5HiIexFUZY5p8oFq/q28
         gJOjvaNjUClEErmZWPQ3wjsG+5hanorN2mgPPlayplDn+0IAYxdpHK3ALOR7y8qanwHJ
         wS3Q==
X-Gm-Message-State: ACrzQf3GWETPWwD6O/uHCAE/WVijI2xkvjFx748q3j/Epo0nGs+JesUh
	XyyFfCSPz3sXAei9JC7dfMSzAQ==
X-Google-Smtp-Source: AMsMyM6UKfTDoyvlxHH9d/C28T5MXbvxRFj4MQ89o3ZziE5fhA0V9cNBU3VXeKSyrS1ckZcMeT35uA==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr7627500wrr.308.1666253899934;
        Thu, 20 Oct 2022 01:18:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef2:f28d:311f:c84b? ([2a01:e0a:982:cbb0:ef2:f28d:311f:c84b])
        by smtp.gmail.com with ESMTPSA id o13-20020adfe80d000000b0023580e7a2c4sm1462948wrm.86.2022.10.20.01.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 01:18:19 -0700 (PDT)
Message-ID: <a6942e7a-faa5-d839-aebf-0d28e7e14f06@linaro.org>
Date: Thu, 20 Oct 2022 10:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] spi: meson-spicc: Use pinctrl to drive CLK line
 when idle
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Da Xue <da@libre.computer>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
 <20221004-up-aml-fix-spi-v3-2-89de126fd163@baylibre.com>
 <CAFBinCAsCg6QQRH3VPY1OKuyfkxY0oCXLhAuMwO6=00gXKqQrQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCAsCg6QQRH3VPY1OKuyfkxY0oCXLhAuMwO6=00gXKqQrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_011822_490707_696A8115 
X-CRM114-Status: GOOD (  18.64  )
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

On 19/10/2022 22:50, Martin Blumenstingl wrote:
> Hi Amjad,
> 
> On Wed, Oct 19, 2022 at 4:03 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> [...]
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> index c3ac531c4f84..04e9d0f1bde0 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
>> @@ -429,6 +429,20 @@ mux {
>>                          };
>>                  };
>>
>> +               spi_idle_high_pins: spi-idle-high-pins {
>> +                       mux {
>> +                               groups = "spi_sclk";
>> +                               bias-pull-up;
>> +                       };
>> +               };
>> +
>> +               spi_idle_low_pins: spi-idle-low-pins {
>> +                       mux {
>> +                               groups = "spi_sclk";
>> +                               bias-pull-down;
>> +                       };
>> +               };
>> +
> We typically have the .dts{,i} changes in a separate patch. I suggest
> doing the same here.
> I also have two questions about this part:
> - why are these not referenced by the SPICC controller node?

Because it's up to the board to use or not those states, if some pull-up/downs
are already present on the lines no need to use those special states.

> - is there a particular reason why meson-gxl.dtsi is updated but
> meson-gxbb.dtsi is not? (my understanding is that GXBB is also lacking
> hardware OEN support)

Good question indeed, so indeed they should be added in meson-gxbb.dtsi in a separate patch.
> 
> 
> Best regards,
> Martin

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
