Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E885AC43460
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 11:39:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B431610F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 11:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B431610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4KIR0A1dvF7GzxrqAHMvxx7AdREg8pweadIyaRZOnqc=; b=KM/TWTmjPOXeKeCW76z3zzEFW
	C2n/K93jXeA+xr4SOLg5CcuAHjyWk7aHG0z7ztPqoL9zROuiSDdvq3oK0nOROQGmJKzu737g8BRlq
	OT5cegT+EYi3AkdTl0t2UjZc+/R08DeRnfOSZWimIm/cVxyckZK8IwQbfi06UdbNW/JKv3ZCbUC6Q
	WBdIzA1/e/fcqOrjCulCp5ISNhb2F4ZzS9dwLKa4SHaXvXJueKmU/XlqeRYqolKWuFnvcPkBiz3NM
	DUtx26q9uEXHXURatBagACInb7OK2dfgKTSHFUs6LAQutbVaVb/nMAuv77jQ/ov0m/+fan4aJktgP
	m4qB3/ALw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXMp8-001xD6-72; Fri, 16 Apr 2021 11:39:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMoU-001x2t-Ah
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 11:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ch3B1QB839TpxbyTCaHh7+PjqFlJHeFp/HZU3MiGscw=; b=IAwjSCBzJycYOWf+zN8uAKs/Rt
 X/ryPthjcB+HdhVtYzJGOW4hBHJQM34UkDuIb6HKwe1PnYP7HFAmFFLtLCcKBjgFkcJrfzLdoxSjQ
 vyCvPCbyZn0+z68Thko8VnchyUAVkf1vfpGqJT086KZUeWwy29mDqQKPYNVwXVQJcHlEx6ilpyEFU
 xvdWwoSwrJlekiz/vweldj/uB913bctOknDhj+kCN4GWD4w28QS2n3huTcL520jrDAR3fFn0BbROG
 1nlK59zFFGPiUHE83QCUBnbPUFAlZIo7ibHQc6EbD2iHb1qZUyxwpjEcJO3WjllVaBrceszGik4Jy
 6oXjWHdg==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMoQ-009K8b-Ft
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 11:39:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id 12so26393578wrz.7
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 04:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ch3B1QB839TpxbyTCaHh7+PjqFlJHeFp/HZU3MiGscw=;
 b=EkzQjer0WgUEgQkZ/WCQ1qZSR+xOL8CYkmgyGZqX8M/cpDnJ3Jdq7NAUhqBGqi3yjA
 RvxLBAhdzA+iPTcZCJ9eRsGEGviRSKwt63OrvHOCS0KWJWgntOZuiNpq0t2/LzV1v7RI
 XdY+G5TuRKGbvh/bK/vA+nuoL3oWvnx81/1QcUl0hPVXiX6lne0wZcU39Dnw01eexj4/
 aAmRmD45JLqraflxN0P9n9NRW+tOLy31DVmNZNxB1sJtCQ6rBU4/vaMe3bZ/bjGdQU/c
 vNXcsAyBt2CKFWL7r7Dzm/htr5Q83g2zk0NzsSft44P0UdjSeRe0LKdJOehBAf0HNf2D
 7mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Ch3B1QB839TpxbyTCaHh7+PjqFlJHeFp/HZU3MiGscw=;
 b=l2cQRDHrc1ByaBsD+DTyRAA56gpMafsyYMF84jbzD4KYhu+J8haHv+uO1VrJtWEdKS
 VKM6ok2Eg0STM12z6TUhBpbP2/Nz/XTDEWEdObXadXJHbbPIs320ETlkae0fxnECCnvE
 55qth/ARPHcxaKMFpOUe3Ou5sQJtRXfM97ctdB16bXl1d+BqC4Qu1ADEjmUu4ziOXnl1
 jYyzOIy1vbSuxTWJu0Y21vmyVaX3V5LVfgqbexAaYYIjUJY4s7OaeVteO8UCa14OkMUj
 lRChNCl6kTNAQXsSR1yHXqwtqo+JglY873n0d+QDMU5MP7Up6Add2c1nAnnaCTAiBv4r
 Y+Jw==
X-Gm-Message-State: AOAM532LjstXywtNM8/2r5bC4dS4QMqKVdORiIvXhD5k2g04O0uN2pZz
 RmrVhRwqDXhh9rYBh2rBGxOxTg==
X-Google-Smtp-Source: ABdhPJxV3W8/JmRRJjOYH3rbQ9IP5SnGF8wi+6Gmv+4bzOiXNfk7ypsXlDfWMH46OpTJMpcWlMSOlg==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr8565355wru.3.1618573140641;
 Fri, 16 Apr 2021 04:39:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7?
 ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id n2sm9756992wmb.32.2021.04.16.04.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 04:39:00 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
Date: Fri, 16 Apr 2021 13:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_043902_538354_C871A562 
X-CRM114-Status: GOOD (  22.54  )
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

On 16/04/2021 11:58, Laurent Pinchart wrote:
> Hi Neil,
> 
> On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
>> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
>>
>> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
>> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
>> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
>> confusion when the DW-HDMI CEC controller can't communicate on the bus.
> 
> If we can't trust the CEC config bit, would it be better to not use it
> at all, and instead let each platform glue logic tell whether to enable
> CEC or not ?

Actually, the CEC config bit is right, the HW exists and should be functional, but
this bit doesn't tell if the CEC signal is connected to something.

This lies in the IP integration, like other bits under the "amlogic,meson-*-dw-hdmi"
umbrella.

The first attempt was by Hans using DT, but adding a property in DT for a vendor
specific compatible doesn't make sense. Another idea would be to describe the
CEC signal endpoint like we do for video signal, but I think this is out of scope and
this solution is much simpler and straightforward, and it's more an exception than
a general use case to solve.

Neil

> 
>> Jernej Skrabec (1):
>>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
>>     driver
>>
>> Neil Armstrong (1):
>>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
>>
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
>>  include/drm/bridge/dw_hdmi.h              | 2 ++
>>  3 files changed, 4 insertions(+), 1 deletion(-)
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
