Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC32C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCRq4wpVylmoGHB4pMNikxaBOv3wpxxf3Z7fy0ACigk=; b=WU9dPgD/fmXdDPINRvzuyo4hR9
	lK5QKaSypH3SZsDtHsGEGl+YILb0kuQHtcn8p1DMk2oX3Oxhd0DjbuKPOJfbiR5J+81stgkFPfl0D
	ZYqojc/92keg5gKKV2chB0tUTeHibMx7ZU3NOHYg5BXqsCxjnsdM/0iymsLqPIKZU1yXsOMsvnB/m
	RYYQMgqA3lCXiHHaQEhigoMcLfTfZd3rDDrGEJQEV4X0yKwPGxq2kBfsr1ncFfEEIlF3v7fMvYUDn
	3dh5i8/j10qfbc7owow2rHdDPI2rNr3S6MPrMFh5ZaJKmh4rO+Ivb+lXCZLWsJJ2kFkhO0vtOTT0m
	Zbu5berg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEWD-001aQP-4b; Wed, 16 Nov 2022 09:15:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovESp-001Ymp-OU
	for linux-amlogic@lists.infradead.org; Wed, 16 Nov 2022 09:12:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id t1so11432078wmi.4
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Nov 2022 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFKNffFtY5kVNiVAk/P0FpVr/0HH1RSFq3GyOsjl5tQ=;
        b=h9qTz0llQJKd8Wu07bgW3+OinYebUJT1kws3CflBy0DNuJf4Rya9Cpt1UAtMK89Amb
         Q+ClwmcMcnNa2lQPccb1DN/6HvGO/QBoTlrzx/ZRZB7x8luevj5fbpwfcKgNW1FkqsJC
         Id+p0MSsktBYab/asVWJRalJpmiXUiZfTmAVvtHIldmoMqJV9+yI9x3O/K9XJ8RTvUND
         nxMcu/HDMnQmEGu7WEnnNtxi3KCzwIoZc2IokOLO9Uvr9yVzlyvwlD295oLAiDZjBzWz
         3DYzeOGpfFCKGYT7RQooACVRgsnCizqPDC8DXfb9VkDw1JCE1ECjQPgRPdSurY2NtURj
         Mmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFKNffFtY5kVNiVAk/P0FpVr/0HH1RSFq3GyOsjl5tQ=;
        b=VKeFPpfRgi3CYGncLy+PoiYGzWszY3TqfU55UeD/NRWn4RlnLPHZcFGKGw/voTY+7m
         oWseysiympGOGRWXI780CD9ijo4ZWFfnZOXdyf0UYkRzD08a9FMR2FWCgDhu31dRDMP7
         YZi42v8Mb8WG3krONizeIBWGQQnU6WAUP0wc3TQw8znBDHNhapZjvSR4IQKAniwvKVCC
         Uqm4wD/Cn4BbKZzoFHCFB+Zlllm1Wfzz3vNVqSwMlMVnbgIXge07Xt8GaPt4CGcOFqgV
         wvYh2F1uoBa3HxVKjlcLgUdPEE+a1tXPtl7cTWDiSG2Pjf5j6rI5YvJX8nwypL+oXoT7
         jRDw==
X-Gm-Message-State: ANoB5plYvzluUOZpjw4kLTYoXnaW0ZJe6Kr7f91Y7hF0LIIO9OE47V9g
	VU8FaRgYcLReuKFYXzcht3CNoA==
X-Google-Smtp-Source: AA0mqf5t46DwNbPq/deiJj7VX2YDZydyiPZU7UHc+HERaqziYQW+JqmhZ7bXP+3FVESs9hZnwo+K8w==
X-Received: by 2002:a05:600c:5116:b0:3cf:8d52:a216 with SMTP id o22-20020a05600c511600b003cf8d52a216mr1436895wms.77.1668589926468;
        Wed, 16 Nov 2022 01:12:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71? ([2a01:e0a:982:cbb0:2a03:71a6:7a9d:9c71])
        by smtp.gmail.com with ESMTPSA id bv13-20020a0560001f0d00b0022cce7689d3sm11683820wrb.36.2022.11.16.01.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:12:06 -0800 (PST)
Message-ID: <c2d96d4d-eb0b-afaf-3a44-23e48de4d40c@linaro.org>
Date: Wed, 16 Nov 2022 10:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v10 1/2] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, John Garry <john.garry@huawei.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Chris Healy <cphealy@gmail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris Healy <healych@amzon.com>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_011211_877222_26ABFD06 
X-CRM114-Status: GOOD (  13.45  )
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

On 16/11/2022 01:31, Jiucheng Xu wrote:
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
> Tested-by: Chris Healy <healych@amzon.com>
> ---

Why did you drop the bindings patch ?
I only applied the DT patch.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
