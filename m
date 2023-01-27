Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C673EC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iJzzaI2f8U0HCDQqwG7Tr2eHliC3WuQJlRBuCsbsBA=; b=yT1uASRFFQ7TR4
	NmAjGyA2ucPhwzAbBYiA8zkWw+rx6rpNPRS0QnAi68NBFKs/4iHdA1Yh5G03TUnJaR5Wc5IYOi0Zr
	lhYbf13uOH4mpSBzj05mR77jVq3Aed1DkEXmb61NcZdx6enPKPbJH9z8F+GotTGPJBdr8YVn5+XUp
	fMO8xswhEuLc813vCFwBKeJx+MQgWVcQ3qk3Q38ZBNF4KOn9ErnB/ZhD9bWgjgz+cD5l77tSZewNv
	tzHRMM3F7tDlfyWk0KClIFOH9FbVFefRdp7X4XhfMlr18du/CHJYBisqt2V7mWGOnowxJTeJs6zTe
	FivXeUlWi1RbOz/lIQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOof-00F0ZW-KT; Fri, 27 Jan 2023 13:30:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOMv-00Epgp-QG; Fri, 27 Jan 2023 13:02:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x10so4644205edd.10;
        Fri, 27 Jan 2023 05:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/j3oTdcUMROGDD/ah/h7YgenI5TV3ZsG0vt1xgCaRY=;
        b=IGCYBXTmDEP1M6UOYlzR25dz63moa/jJ8gke766pv+tr7M4z/uivq7nJri3F6ieVdq
         CanIx6icMQz1c/MTqJ4ZUyYk43a7tTXVp1PNZrtHk49r1OJpck7P0dZGYl8XfzRDNE97
         2ppoL9TpscOSXD2nQzlqSXcWwM4iwjhdQuFt57ezbfWfpmd4WQypm4omRmwzTgJJPLo4
         5iKbEnmsPZdYZF/9GrkxxpnJWZMNsVa5dSQhiKhLKcSRWvrZ7Lx4XqRiybjA6tpvxiYW
         NwJcQhnpQbYRBwJigtH1AZWf1uBIc5IFAQRE+CnwiPuwKVSxs7PQWv9GgxSoJRla/fv9
         S+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/j3oTdcUMROGDD/ah/h7YgenI5TV3ZsG0vt1xgCaRY=;
        b=EIEmp0EpUSX6QMJIJ7Xl0PVSJZOU9JarTEtsYmi89XYNOvaBlAxfRYfVGybgLl043J
         RtkfIfaL6KQdjPt0nQbAcKlNsW2l5U769I8G1mJ/xt6i/sujXM865N0o7wxpdn30A6Cu
         8LQB9AnXCbxDS4Dkq+qeTI8CGmOn7Nmnyrme2KBogWjlza8HX73QewA4UTbXXUFGpMlk
         dQsNpXzUjiE8LVqH5/EiL684car0bEcbQPMC4UQOyTVi5EZ35ZgT7NcgnNRTXNulldx6
         YkhmlFJdYExeuareiV2iUlCo4287KVxB6FxtKfachKU4QRZEZUKDrPUKiaBWWZGeOg7g
         jrqA==
X-Gm-Message-State: AFqh2koX6KNrmOJX0TWXJuujkMEemJhj8JAesGPOKZBYfhee/Mo2suFK
	OeGIyv3LxzN9UAOBiYRvMhI=
X-Google-Smtp-Source: AMrXdXtb+9TF3z5Dtjp4Ev4OObCliodMTQqFT1S+ns1vPNiPxF9gxXM38Xmb11a46vcVOeqbYjWVZA==
X-Received: by 2002:a05:6402:5110:b0:492:846d:e86d with SMTP id m16-20020a056402511000b00492846de86dmr52207234edd.23.1674824530472;
        Fri, 27 Jan 2023 05:02:10 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e0f:9000:d16c:754d:81c1:d196? (dynamic-2a01-0c22-6e0f-9000-d16c-754d-81c1-d196.c22.pool.telefonica.de. [2a01:c22:6e0f:9000:d16c:754d:81c1:d196])
        by smtp.googlemail.com with ESMTPSA id cm17-20020a0564020c9100b004a21263bbaasm455615edb.49.2023.01.27.05.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:02:09 -0800 (PST)
Message-ID: <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
Date: Fri, 27 Jan 2023 14:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050213_914644_2539FF16 
X-CRM114-Status: GOOD (  14.41  )
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

On 27.01.2023 08:59, Neil Armstrong wrote:
> Hi,
> 
> On 26/01/2023 15:03, Heiner Kallweit wrote:
>> The usage of edge-triggered interrupts lead to lost interrupts under load,
>> see [0]. This was confirmed to be fixed by using level-triggered
>> interrupts.
>> The report was about SDIO. However, as the host controller is the same
>> for SD and MMC, apply the change to all mmc controller instances.
> 
> Thanks, I applied it in for-next so it runs on the CI tests.
> 
>>
>> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>>
>> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> 
> I think we should find a better Fixes or perhaps split in 3 so it targets the
> right commit adding the nodes for each family.
> 
This would be the cleanest option, right. Practically it shouldn't make
much of a difference. The chosen commit is from 2019, SDIO interrupt
support has been added just recently, and regarding MMC/SD it seems no
problems caused by edge-triggered interrupts are known.

> If the test doesn't report any breakage, I'll probably ask you that.
> 
Sure.

> Neil
> 
Heiner


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
