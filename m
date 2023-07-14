Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD4DC001B0
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jul 2023 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhTvpLRY/6r3d4kAqQQIWThbqdTSzYeyXTGB5//XUw4=; b=kaPHAambbI2+4H
	9UjGfTXKArYj9k3XkPjYur2VvOE0CWqhtsLvOlN4/dHiqqzGJtzcCjpCLm9j7g8uE0OJq5viRa3++
	cdzEr5Kbr7pKzKa/VfbOtm7w5kDlm3LmOIdwk7mh47WP/jSQzl55RXof/rHcBXRc+osabS4Xfboq6
	QNvLt//I80xKXmxESESUEhHwMqwH+cLHokmcstbtHYuTG1TvHgdIZgTa4ZRuANLulVHMcnTC8ya5i
	2yFx8y8gAanIZzGqO7Vt1ePFH9CVVPpNJIr9yTqa46TtIn76al1qixSV8S1XkKNe7ewmcJZr7pRlo
	6RvX4XmkZsbV1kkIV9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNFy-006wBC-1W;
	Fri, 14 Jul 2023 18:11:06 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNFw-006w7J-12
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jul 2023 18:11:05 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7835c92c373so76993239f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jul 2023 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689358246; x=1691950246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElBmMm1ZevyAKtumVID4tVMI+TD8QnK9EnzezYAZC1A=;
        b=Mpdbmrnz6XIJWmlHQJGoTmuC7D53w+ptxGvR1qzM5rcUr2yuAkawf06rjkPYMTBpFq
         l6MjPg1ZjnoCWgc8pvFZw+blKr4qxg2V0sQF1H0WVPdY6+DHII+TihuXYaBMer6Ieai0
         olDYpMIpFkabUds26CFLUeHKHqIZFPDKt93i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689358246; x=1691950246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElBmMm1ZevyAKtumVID4tVMI+TD8QnK9EnzezYAZC1A=;
        b=E3qi9lIM/iSfT9komC82CxLJsj4Bn4Ht73YtqH9bFJpOKx2O3kT8YTuxsVADI2yuZm
         fBMIK0KnYclWWavTpG+s4nNDQpDUDsBiOtZLoY3XgKeWoArGX13b31JohscupdoH9lLD
         YpbqC253nbC1ifHgFE2UOUhjb4vWFs+HAyUba6z4neVuFB1Ihr2Lg5ETLK3XGNHGUny1
         cGLUUoQU5rED1pNz7hFssvF9rRQICMzFqbYMGIVp6xKN3CwavMvUALaMNAjhhjPlcqe8
         YOKf77oApXbkOcWOJSOIud7c8m2o2GsTh1SossVRr89IcZ3yUrpqpsBui2W6BZIBLNOB
         jXYA==
X-Gm-Message-State: ABy/qLYW/G+YUdlbWYY9D9d+IgaGOL8/GhwoHSaD/MI3IkGXvu7CqhWs
	iKeOQnkgMBQMWBu+dioxC1m4bw==
X-Google-Smtp-Source: APBJJlGUGWVq3dRmIhivYzT09y1C8kNKMoIaBZuLBrLyn6F4EFbPgbam3zAfvH0LyeRyezDMUEgn+A==
X-Received: by 2002:a05:6e02:221e:b0:346:bf9:76fb with SMTP id j30-20020a056e02221e00b003460bf976fbmr2505344ilf.6.1689358246007;
        Fri, 14 Jul 2023 11:10:46 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ee14-20020a056638292e00b0042ad6abe0bbsm2820039jab.20.2023.07.14.11.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 11:10:44 -0700 (PDT)
Message-ID: <2af8ba3f-566a-756e-48bf-3e723bc713da@ieee.org>
Date: Fri, 14 Jul 2023 13:10:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [greybus-dev] [PATCH] staging: Explicitly include correct DT
 includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
References: <20230714175002.4064428-1-robh@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_111104_378656_AFC94D4D 
X-CRM114-Status: GOOD (  11.48  )
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

On 7/14/23 12:50 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For drivers/staging/greybus/arche-platform.c:

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/axis-fifo/axis-fifo.c             | 6 ++----
>   drivers/staging/greybus/arche-platform.c          | 1 +

. . .


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
