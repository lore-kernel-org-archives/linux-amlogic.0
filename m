Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3D6C432BE
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0953860E09
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0953860E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShJE2T/fShty/WW7yQofPVf7AS8T1HwnqqpBHsCdQGQ=; b=xcUJIqR2wo2OZf
	DzUoQPl62vILxtWFaxVIfdRU/qIrZqNPZaDTZwJb4XDyVxMkRWmaNISHZyGODx6Lpk2casu8Dfz8n
	iafO2rj2O9cq+rCXwpBBAFHBe6DvzJUuxErh1ts2XvhorLtMHFvcB8uqyXCy0UUfFjnNb1oWJshr8
	FlYLDaoTfMi9M9ennfzJjuS9vg9vWd+VJaOOJ1YXCTzGAHGxfGx/LNWbS9dmL45GCepLicrS9HuPB
	JcJZ/gDiXXbZutEQQkC6jdLPf0EX07cRSWmpnoZFEfruBKvJfkbsW/QpbfqG/6XIXwyl4jNMO2skd
	TH0k558Yz0qefCXtnsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Kc6-007BnD-Nf; Fri, 30 Jul 2021 04:59:14 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Kbs-007Bh8-MC; Fri, 30 Jul 2021 04:59:02 +0000
Received: by mail-oi1-x22b.google.com with SMTP id o185so11479306oih.13;
 Thu, 29 Jul 2021 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=doyxz9pyxdcEmVkUksEyDPhqPmEbmwaEjeQ3i/UpGPI=;
 b=u8yeEJHRqtNqfhHFzy5a7FSNQrIHeBnRCWbXqwv0EtSfS9IHzsCS3b/pXVZqu/PFPu
 CwAZ0AbUGdVO+R26a9N4UY8UojrHUY6MWxycHkaApDR3r1Qx2N3xuej0uho+BUVSpR4Q
 WwXa2JKn5Ko0Deapa6zENPe7pPZm6TBEQbl0zTKohKqYHjWK+jmhb14PUgeb+L65pZ1p
 /7I6DqqdgvCuOFVB/1H9fj7hE/4jNvwff79qqA8UuBiTG13R39uZu6zwe8xixfmDIsrr
 WuYr72PXc9PYmxcu1a6D6lwsXZTGe2tBwIOFHDKzY3QvNE7TLor5Q1rgTGhG2nlwddOX
 KusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=doyxz9pyxdcEmVkUksEyDPhqPmEbmwaEjeQ3i/UpGPI=;
 b=GXGoJR8NO9y+or8KqLxKOvLXV6NUxy78cPHv7SsW5qkWdVinBJN8faGzYV3+qBLXrN
 MTxlM7GrSsk3xV1dE8AEyzaz6Wcp8lfHd6bzEwv6XvkHv1Hl9OkBGP39+IuTKkEQ3RX6
 lmwd0ahQxqJWp2/SpXHCsdHKyTJ2uIWtnq6aJ4pNOL32lKAIprU6zypZ1QnH9b2ly6kP
 LHaprMFQgREQnqslYW2SazbySlW+ZOfmWsGUxmF0G4YWnJGA32jUGWK4eZ+VKxvuxLVC
 9PHOAknleN1tKIDJkhHW5hVNwJum6vZr9tD9piL1MVq4no0E0upKGNRco1Q6OIGmhDtq
 zwxg==
X-Gm-Message-State: AOAM531KLJauFG6dOYNLUftf/uVAsFb0WOUic2/P/Sbm2PUXgTGaEa6q
 byNH+31dLWm8ZReyjvbyimM=
X-Google-Smtp-Source: ABdhPJycAFZT76xx9NYGJgNW85wPGAXIW4te2QuwzbyZln6VD7jIBeHMepQQ6KpVlNh5LzCklUYMtw==
X-Received: by 2002:a05:6808:6d1:: with SMTP id
 m17mr642861oih.34.1627621139603; 
 Thu, 29 Jul 2021 21:58:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m7sm120260oiw.50.2021.07.29.21.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:58:59 -0700 (PDT)
Date: Thu, 29 Jul 2021 21:58:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Lapkin <email2tema@gmail.com>
Cc: narmstrong@baylibre.com, wim@linux-watchdog.org, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Message-ID: <20210730045857.GC2110311@roeck-us.net>
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730041355.2810397-4-art@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_215900_775028_7BD811A5 
X-CRM114-Status: GOOD (  23.66  )
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

On Fri, Jul 30, 2021 at 12:13:55PM +0800, Artem Lapkin wrote:
> Remove watchdog_stop_on_reboot()
> 
> Meson platform still have some hardware drivers problems for some
> configurations which can freeze device on shutdown/reboot stage and i
> think better to have reboot warranty by default.
> 
> I feel that it is important to keep the watchdog running during the
> reboot sequence, in the event that an abnormal driver freezes the reboot
> process.
> 
> This is my personal opinion and I hope the driver authors will agree
> with my proposal, or just ignore this commit if not.
> 
> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> 

A much better description would be something like

"The Meson platform still has some hardware drivers problems for some
 configurations which can freeze devices on shutdown/reboot.
 Remove watchdog_stop_on_reboot() to catch this situation and ensure
 that the reboot happens anyway.
 Users who still want to stop the watchdog on reboot can still do so
 using the watchdog.stop_on_reboot=1 module parameter.
 "

That leaves the personal opinion out of the picture and provides both
a rationale for the change and an alternative for people who want
to stop the watchdog on reboot anyway.

> Signed-off-by: Artem Lapkin <art@khadas.com>

As mentioned, I'd still like to get an opinion from the driver
author and/or some other users of this platform. However, I'll
accept the patch with the above description change if I don't get
additional feedback.

Thanks,
Guenter

> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 945f5e65db57..d3c9e2f6e63b 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  
>  	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
>  
> -	watchdog_stop_on_reboot(&data->wdt_dev);
>  	return devm_watchdog_register_device(dev, &data->wdt_dev);
>  }
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
