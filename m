Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E3BC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 00:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB59n4ZDcEANihcrM+QYQUvXxw0zwruf4qY753keFyw=; b=WDtaXd1Bh8a3ni
	SfdaEuqzuPJcou0TRYT4llgQDbT/F5IjD6uiSn+OwrBYgHNKs8Lloy+GXDO6F4qJnWV2g4Jcfjq9m
	oKcjIfq9wKYJdzAWNQ7veG8XnXc4aPYUC5s8JAJjm8yAZKSDJsvtkHkgvM8DOzgRz3Te5QFiT30oR
	+dIg9SqWafHWgyudg8V/CHLNtJxyiQlzQjFSO5Xb+6WGaUc9n7RV+NOfkqSqtiJX/7yPVAqolnd8Z
	fGWCxiqv+zC7bfz+uC5Ctsiq+ZHO9fRvf28A6BJXOu96HnO6JxdC+TjhP2p4pGg6oF6KRH3smDE3e
	skHPJpbr8gdiOVbsHnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLDg3-00Fyn4-60; Sat, 19 Feb 2022 00:32:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLDfq-00Fykn-E8
 for linux-amlogic@lists.infradead.org; Sat, 19 Feb 2022 00:32:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id y16so1776154pjt.0
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Feb 2022 16:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ie7wPkZjwdzElvH96PVmNl9jOWV+pttLF9kv7yIV990=;
 b=xTfgkj43GqUJfIT66JQ/CEO0aqbzuw2HDpdXEqpu3IzOYFPcl5HSvT5OKgXRkPn4Gg
 mb4mqEFq63/xODjvuapeQkj14wfE5nq4BTa5lyi8EEDDP7I++RjBebkj8zSSkGUSmARq
 eih719ozeVgjor75YoZyUndQfWr4A5fwFWW+AOnZaQJZgcGXjc5Ydq97v0Tvl0GQ/3sW
 8gMprRWBBG9jm+Mq0rpwPDdYFaBq2y4I5G6igIkAkcXfUlbt1Yvvy9wxYJvGfFP3LDaX
 VSIbE5DUiNSRJV07cI0Ei/gsZuvVmkOS6CIBIcV+5GAWLs9VZefgy1jNamO0Sg0hNtYQ
 XuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ie7wPkZjwdzElvH96PVmNl9jOWV+pttLF9kv7yIV990=;
 b=TzB7AM7ScxgnnSNi2GgvFM+oZoQH7qqglGU8QvJGL9/zkBUsFQ57lbCyjrtaM5y83N
 GJxGuz35rxagHoZSLw2sFcsn8JZeTAyVLDDVJdaAgHvLAPQ3Ui3kzR7U2D8pGsAvRACc
 KQBJ/uANkQW+MpifOKVPAT0iVbTH8ClzCT9TWCs8UB1trtgp+mI85VSo7qWns2r/hPPC
 rL7xilHZXGKu/FsM1F6QK1y3qNBa4EXfPLFk0K5U4hWGG96txUC+RsWjRHBZHcTUja32
 Iw1K+NPhK+Pr3K7IZp1ehhI1dlzSW7UZXDwdALiziEfkWh5FXeINKYFc2QMFVMPX2X7n
 DsdA==
X-Gm-Message-State: AOAM532kxv3uMCaWKbrjwfNkgVRHcW+khPZo9VviCrJOHztxzSsDoz4s
 ftMgDfK+RX32M7mVu3iemwM4FA==
X-Google-Smtp-Source: ABdhPJzOdNwzhEWF/xjssr/bVkeFSdPFFlB16rmenkttGnh8q8q7Hd4akRL6ZYVAz/rTPSjBriVFwA==
X-Received: by 2002:a17:90a:6884:b0:1b8:c2c3:e10a with SMTP id
 a4-20020a17090a688400b001b8c2c3e10amr14993028pjd.38.1645230747811; 
 Fri, 18 Feb 2022 16:32:27 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 b13-20020a17090ae38d00b001b9dedc52d0sm420359pjz.29.2022.02.18.16.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:32:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: "shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "jianxin.pan"
 <jianxin.pan@amlogic.com>
Subject: Re: Re: [PATCH 2/2] soc: s4: Add support for power domains controller
In-Reply-To: <2022021510112070486315@amlogic.com>
References: <20220126061018.705338-1-shunzhou.jiang@amlogic.com>
 <20220126061018.705338-3-shunzhou.jiang@amlogic.com>
 <7hzgnal5yu.fsf@baylibre.com> <202202091001287547451@amlogic.com>
 <7hee4bok8w.fsf@baylibre.com> <2022021117375354230910@amlogic.com>
 <7hwni1me12.fsf@baylibre.com> <2022021510112070486315@amlogic.com>
Date: Fri, 18 Feb 2022 16:32:26 -0800
Message-ID: <7hley7itlx.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_163230_551088_DBFC57AF 
X-CRM114-Status: GOOD (  20.44  )
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

"shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com> writes:

> Hi Kevin:
> Thanks your reply
> This has been mentioned before

Yes, you mentioned what the domains are for, but you have not answered
why the domains need to remain powered on when they are not in use.
 
>> S4_VPU_HDMI:  for vpu,  this domain provide power to many moudles(osd, vpp, hdr, dv, di), if close, will cause system crash

Why does the system crash?  Most likely because a driver in this domain
is still trying to access.  This suggests that that the DT shoud be
updated so those devices are listed in the power domain, and also that
those drivers use runtime PM so that the power domain is turned off ONLY
when the devices are not in use.

>> S4_USB_COMB domain: for usb, if not always on,  all usb status will clear to 0, that's not right status for usb

Why is this not the right status for usb?

Again, my question is: why does the power domain need to stay on when
the underlying devices are NOT used.

If the underlying devices are in use, then if the power domain turns off
it is a software bug.  Devices need to be connected to the power domain
(in DT) and their drivers need to use runtime PM.  If that is done
correctly, then there is no reason for the power domain to be turned off
when the devices are in use.

In other words, your solution to always keep the power domain on has a
two main problems:

1) it just hides improperly configured, or poorly written drivers
2) it wastes power and prevents low-power usecases

Kevin

> Shunzhou Jiang
> SW Department
>  
> From: Kevin Hilman
> Date: 2022-02-12 02:52
> To: shunzhou.jiang@amlogic.com; linux-arm-kernel; linux-amlogic; linux-kernel
> CC: Neil Armstrong; jbrunet; Martin Blumenstingl; jianxin.pan
> Subject: Re: Re: [PATCH 2/2] soc: s4: Add support for power domains controller
> [ EXTERNAL EMAIL ]
>  
> Hi Shunzhou,
>  
> "shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com> writes:
>  
>> Hi Kevin:
>> Thanks your kindly reply
>  
> You're welcome.  For future reference, please avoid top-posting.  See:
> https://www.kernel.org/doc/html/latest/process/2.Process.html?highlight=top-posting#mailing-lists
>  
>> For those domains,  default is active, we hope not close when in use or not in use, in our case, 
>> only runtime PM (include suspend) control this, so set always on flag to avoid domain shutdown,
>  
> my question remains: why do want to keep these powered on even when they
> are not in use?
>  
> The goal of the power-domain framework + runtime PM is to be able to
> save power by turnin off power domains when they are not in use.
>  
>> if you also have concern, we can control this not in kernel, but this not our expect.
>  
> My strong preference is that this is controlled by the kernel.
>  
> Kevin
>  

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
