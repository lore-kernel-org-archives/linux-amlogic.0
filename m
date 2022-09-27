Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03754C6FA90
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Sep 2022 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NLjfgps1Eyf8MQP6betvCQSIDqVnFx1u0o2w2DWaGw=; b=yI9apvRV/Qr9Wj
	UBECIRXsYgBKSdsPN6lkMCw+fbPkNltGD9BfT8gaIvZlzC77Kp1EHQiAazbRrZ7fwD81Mkev92ByV
	57TgVDplI0OYOOFwPxYHqdabeOLgZBSVg/y1QDzoeRlcmy4FSsclVxbceUaGteiIYoer2QnlDObDE
	RLym+1+JItG8Uovtnu7ttrKOH68IwXw3G9RTF1u1rUurEG5+rUiuoCasCp4jcnVdcGFbFL9ajU7Y5
	/zJRSup8kWyvLv6H7yHEMDB2rqWkS4s2JtstiR5tcbxvwTb8rI7gMkgq65oKnMitpq5zIfk0785hN
	qCqmhUrdKa2eJZU5AGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6vY-009YoR-DO; Tue, 27 Sep 2022 09:30:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6tL-009XlB-Vs
	for linux-amlogic@lists.infradead.org; Tue, 27 Sep 2022 09:28:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t14so14022280wrx.8
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Sep 2022 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=3X71jgPXg+1alqFPpU+/3mDimmf52ETp0ZJlAFk/E/o=;
        b=z6KgShAv0W1DLcY21kMpPukJgMWCcit/PbW4j6VHqp/qWPb+h5E343lQva1WuYrac2
         phVMC3GXswSvrpWz9+wv9VpgN2954EShNpTAtzbANmXn6KVfbIo18gR+AqgyUbc2RIZW
         bfn06/ibQ/J7VKYWCuPLT6+nrSdrifxWymf0QQnzK9igyRdFvcIiMvTHQGNfwp6RZOlW
         J321TvZPI0BKX0yxuNjZnMzkTuwT1/bpoN9F9jt1toro8Y7sJ181X94TyleVounyy/E7
         UEaqg85sNuRosNWfDdDp2dQmix+3JDgU9tdf0AMhWk9B9Vv54Lk1cC7gltyjjdIisUNi
         AwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=3X71jgPXg+1alqFPpU+/3mDimmf52ETp0ZJlAFk/E/o=;
        b=hjlQPP8nkvLzOiGPk9xEQRh/GpgXU7bXLw3ScIWa3VRN5alwWId7HdqT2dEV7MYsEz
         73JDfs2mjdgbJ1lfdB3ax4J5oiP98AkjBAeETN3o590oA8BddBntaCULKvEYkrL0uOtA
         7a379t+RQzRShkF9MpyeLtZHsRb6k5pZ2EEetBUANzpDEpwWzMJQMcOaRD1AxbrdGLhI
         pSjX/MxrnoY5ULTn4wF3vfV6qFBnTHibvcZ1YZsdZyN5NeEYh9HVfLwRVpXWMOQcYUDf
         1xPO4duZ4bsq8o+mpXfsVEVcvXRu8IFnpZWlSBCgUylyWHzqGm4L+n3g6k9DeZA+AG34
         rSow==
X-Gm-Message-State: ACrzQf0GRusxgcgkW/lQQyA7j/5pFXTM/ulOGz1C+bkYS3idtoqVz5FZ
	M5n6+QeR6vr7wAyaNlJUqg3TMQ==
X-Google-Smtp-Source: AMsMyM4W0H079weu2O9TWS4Qz8MrGzq0EJNtemPEv5s8UWQrTYaDAo6b7Bn36YZ4qCZAO8MIjyA4kw==
X-Received: by 2002:a5d:5944:0:b0:22a:c2d1:e3fe with SMTP id e4-20020a5d5944000000b0022ac2d1e3femr15788612wri.261.1664270913882;
        Tue, 27 Sep 2022 02:28:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b771:c77b:f889:9833? ([2a01:e0a:982:cbb0:b771:c77b:f889:9833])
        by smtp.gmail.com with ESMTPSA id e18-20020adffd12000000b0022878c0cc5esm1246484wrr.69.2022.09.27.02.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:28:33 -0700 (PDT)
Message-ID: <6fe2be1b-faaf-86cd-8fcc-a919d30d65c6@linaro.org>
Date: Tue, 27 Sep 2022 11:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/4] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>
References: <20220916020320.2455580-1-jiucheng.xu@amlogic.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220916020320.2455580-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_022840_127467_786C5448 
X-CRM114-Status: GOOD (  19.83  )
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

Hi Will, Mark,

On 16/09/2022 04:03, Jiucheng Xu wrote:
> This patch adds support Amlogic meson G12 series SoC
> DDR bandwidth PMU driver framework and interfaces.
> 
> The PMU not only can monitor the total DDR bandwidth,
> but also the bandwidth which is from individual IP module.
> 
> Example usage:
> 
>   $ perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
> 
> - or -
> 
>   $ perf stat -a -e \
>     meson_ddr_bw/total_rw_bytes/,\
>     meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 \
>     sleep 10
> 
> g12 SoC support 4 channels to monitor DDR bandwidth
> simultaneously. Each channel can monitor up to 4 IP modules
> simultaneously.
> 
> For Instance, If you want to get the sum of DDR bandwidth
> from CPU, GPU, USB3.0 and VDEC. You can use the following
> command parameters to display.
> 
>   $ perf stat -a -e \
>     meson_ddr_bw/chan_2_rw_bytes,arm=1,gpu=1,usb3_0=1,nna=1/ -I 1000 \
>     sleep 10
> 
> Other events are supported, and advertised via perf list.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v7 -> v8:
>    - Add linux-amlogic@lists.infradead.org maillist for MAINTAINERS
>    - Change driver name from "amlogic,g12-ddr-pmu" to "meson-g12-ddr-pmu"
> 
> Changes v6 -> v7:
>    - Drop the Reported-by tag
> 
> Changes v5 -> v6:
>    - Add const for driver data
> 
> Changes v4 -> v5:
>    - Remove error message
>    - Use smp_processor_id() instead of raw_smp_processor_id()
>    - Remove EXPORT_SYMBOL()
>    - Use variant specific driver data for compatible
>    - Use module_platform_driver for modules_init/exit
>    - Change location of driver structures from .h  to .c
> 
> Changes v3 -> v4:
>    - No change
> 
> Changes v2 -> v3:
>    - Fix sh GCC 12.1.0 compiling warning
>    - Rename prefix aml to meson for files and code
> 
> Changes v1 -> v2:
>    - Remove inline to let GCC make the decisions
>    - Remove spinlock
>    - Remove ddr_cnt_accumulate()
>    - Remove the message which only indicate a bug
>    - Remove all dev_warn() message
>    - Use hweight64() helper instead of whole loop
>    - Remove setting of hwc
>    - Use for_each_set_bit() helper for bit loop
>    - Use sysfs_emit() in sysfs show
>    - Remove checking for bugs
>    - Replace irq_set_affinity_hint() to irq_set_affinity()
>    - Remove #ifdef CONFIG_OF
>    - Use devm_platform_ioremap_resource() instead of
>      platform_get_resource()&ioremap()
>    - Use platform_get_irq() instead of platform_get_resource()&ioremap()
>    - Replace IRQF_SHARED to IRQF_NOBALANCING
>    - Remove meaningless log like "init ok"
>    - Use compatible instead of creating new property to distinguish
>      different platform.
>    - Use the is_visible callback to avoid exposing unsupported fmt_attr
>    - Use module_platform_driver_probe() instead of module_init/exit

<snip>

Gentle ping, it seems all previous review comments were addressed, could you do another review round on this v8 ?

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
