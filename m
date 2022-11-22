Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6233EC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WZFm1AcCuDItQhWS3lRoIYDyI/yqzO5edeI1MtG0w4=; b=aqcaS6TNA1ARiu+cQUDneuLGMM
	+3BbrXn7OMRhHBrSu2DSj35sb5wtokJlvSF4AFGlmrYFr+SgMH14tN4Ap/e2R7Xh+p9UFsEbItpOV
	c1myVWhxu7GHkZO13/jDrMvNfmeF8WzVDlZ2ypoBPSaE5LX2F1OTrxOln26a6iyPdguspe1+mgacO
	WoLsudgUsSDQWr+noUv8xqMytwijd9gQtwFZ3N1dKX8xA5ovkM53HkGnFGX6DPGOFBx7dB60xcu4N
	fV6vvR9vHFpsgKmSolhvT6NlS3zqWkQ6xIjKjTpitHWMnXYW8KcvswdtpJakkk5AqBi3vov6u9qrm
	RRkRlsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOkd-006Jwr-45; Tue, 22 Nov 2022 08:35:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOkP-006Jlf-MK
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 08:35:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso14644367wme.5
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Nov 2022 00:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y2T6ZqILdZ5MYZPi+h6sgVRIvcGTKp6wSXo9ljWxKyk=;
        b=MSiG80M2llfCeWOktKzlHuNXFQ06AB58P9aLesVQR8M5tcynb4f6by+c4ff4BNntdB
         a0dfPzsa5xYaRJ6qgwqyasRXsF+Tk4sdlsSg1vxfvU2KQs3FaxOusCBcpHA5J/kiNkL+
         UibaGT7Bjx2uIohkFnsrVKk6PetSwzKMD+DmpmY62rlTZ61LMBkOT/RPQin/PKgRWW0b
         P+jftlXjK0YZZPhdy0N9Fh3j/j8tyB7AXdSIqjYWlzOyXdrdG/DURUKQ0y6FabdUtplb
         cRpLgumZwf80CUaer6BvJ0BqKIL1GRgE+EaUmOfaZ2omdJzeuOCRC855YLbOFd5fgfO+
         u4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2T6ZqILdZ5MYZPi+h6sgVRIvcGTKp6wSXo9ljWxKyk=;
        b=k4kRKoqUQ01Y718sveh5lKW1k9YpcRGjMY8JOWA+VMQEqhq5ORvR9vJ5sHoUV6HlA/
         94NUEoYJUmlnYTm6hu7Rd5ZTcoCqeEijcD12GT+nL8KDxIbE5EspsdrTdlEFbaYrX8jw
         32v/9czmNHC6Yq0GdHvMHNCGSsnhBSG4aRHntG1DbKdJ28e+qfjAO+qw3XCUm7uIobNv
         U+Wiw52P83X++sPpPEsV3THfKT4R11WeEoLq/8OR8d2M1GYQJkbSLeL42qVGZR0AebEh
         hjJN8QC1RtYQLfDOAU8fKbSWM6DtOqyOXVmKhLXLDzEUfOmnsDU9zepC1rqsJ/YNP2lQ
         abDw==
X-Gm-Message-State: ANoB5pluHxrVPEdEXC/mLqpOedccPsC0LfJ/XFpcFkDcbiz4Ct8MfDcK
	MlvW65X4CX6PfONCIrCLUGlTkg==
X-Google-Smtp-Source: AA0mqf4RrcJAMC7gMR3GiQG55GMMtRofOJUZb6IKVD4Hvsvc0IpGFrFmV0J4wgtx/7CGEzUf6kjtyA==
X-Received: by 2002:a05:600c:3583:b0:3b4:6c36:3f59 with SMTP id p3-20020a05600c358300b003b46c363f59mr6267560wmq.100.1669106115491;
        Tue, 22 Nov 2022 00:35:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0? ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c311100b003a2f2bb72d5sm26105945wmo.45.2022.11.22.00.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:35:14 -0800 (PST)
Message-ID: <8038935f-4ca4-ee13-2088-009a57b88baf@linaro.org>
Date: Tue, 22 Nov 2022 09:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] perf/amlogic: Fix build error for x86_64 allmodconfig
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>,
 Chris Healy <healych@amazon.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221122075002.4052972-1-jiucheng.xu@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20221122075002.4052972-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_003517_767246_9BD79E21 
X-CRM114-Status: GOOD (  12.42  )
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

On 22/11/2022 08:50, Jiucheng Xu wrote:
> The driver misses including <linux/io.h>. It causes
> compiling error "implicit declaration of function
> 'readl' and 'writel'" when make X86_64 allmodconfig.
> 
> Fixs: '2016e2113d35b ("perf/amlogic: Add support for
> Amlogic meson G12 SoC DDR PMU driver")'
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>   drivers/perf/amlogic/meson_g12_ddr_pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> index c07c34f03cce..932802abd18c 100644
> --- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> +++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/err.h>
> +#include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
