Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47ABC32792
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 13:13:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C4D20842
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 13:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpGqU83r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC3y8N+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96C4D20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4szMdtduyweeMluAbqgN8TvIWTpjDLT4Xq1OkkQZYKY=; b=fpGqU83r9TxGnP6F07bgRIZcH
	GG98YJCH11CYwTiWecCBFN4NAxAbjzMTUv5M+D1W/xS5zoHZm4LM3Fe1ncHbBJfRasQR3BhAwg5KZ
	IKBT85C0W4FmBS94dXVbsGJgVqmYTEhJdl6fbiyHEsNevHBCDXYWW6JH9/lwNo+mbpVKXcYJvzPLv
	x8P277qJhKqPlzC4C6XGQiZxpS4Z1CiAf7KIi41aAfK89ltfVkql+zLgAOJtzBws0ia6LCmy9TLwI
	+elwh3kIgtJDV1Ddqrf7+b+EqjEW1RPUBpoXCWstxqUnU//XS3Yr2pEc4jPf6avh71PDBkW0XCRSg
	EMcE0/5Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEvUB-0006Dt-R3; Mon, 30 Sep 2019 13:13:07 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEvU0-00064S-82; Mon, 30 Sep 2019 13:12:57 +0000
Received: by mail-pf1-x442.google.com with SMTP id q12so5589444pff.9;
 Mon, 30 Sep 2019 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FaFmGKrNxd9v1HavpyQ+K8DRicz4HO/nLLTmLpS4H/4=;
 b=dC3y8N+1mXAuru6Y7UPSIGS8R6/VwIKIpmGCelirODQGRZ+RUPCF4Mu7vOlrpIg8vg
 2NoWxqvY/Dy62pNz8CuzpjYeMVTRr00oTFykazjoNnjbJGwp/w2u4x8ChSz2OBbeZ8I2
 NqQMgilrDgO68KGnkuAEkSC4ei1qR+M0azgmrmmKuXMD/QA+oR91W/JLOGZV3MX3gu3i
 2dVvXIExzrGArJc7CjLOIASm65VLHAaTz0z1u5MQkfhlNgFD1hg88yOZSBPngSEcMrWF
 ce0eHEk+waH/GG7RERph9lkAJ9h/rlV30ENivlYSgMS8DSom4ysIyHcxQPTRAu18xD4n
 E/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FaFmGKrNxd9v1HavpyQ+K8DRicz4HO/nLLTmLpS4H/4=;
 b=YT+lR9wmWe4fZ4Khfa/mtfWJ/7QRncsJy3Sg4YI3DM/kkQd125Swqd4gnUjhgwVwwg
 ctpJC6XnUy3iSoA8NRc8nAdaIXFCB4KnzlQcQyFU7hPaPvn0jSkqDuqALgxGd//QLmyy
 3PcVC1H0RH1quhFpvC+akMLRJkoQbznMoaRwdSBQ35xuCpXsQz+1nTh80iooGuQfTDnd
 rLRgPBfl2AFdAz7zzbNlko2n9M0IRFz8TOQbG4P88esSQ03VPDvMNJ3ZrWW1FE4H/WVa
 5lI7pOlTgI0Z3DCg4tLY2wUjJsGaPfqwlf9/Q7qDnF7z2rkcs9rNj5qSi8B8okifPXCX
 PXPg==
X-Gm-Message-State: APjAAAW4C86PY4ZCdXCoY6duDDlFY24KHLcLj3bycsk1R/Ze8q/qy3zM
 /MVwm7tSspWQBGnVVu/8CLY=
X-Google-Smtp-Source: APXvYqxPCJQaSlD8tvpwexKP7Vny6q6AkehhbKvjtfBpyahKcJFUkAysjZ0I+oWKDziZ3JCkzYmqMA==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
 q63mr26614556pja.106.1569849175310; 
 Mon, 30 Sep 2019 06:12:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y15sm15404983pfp.111.2019.09.30.06.12.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 06:12:53 -0700 (PDT)
Subject: Re: [PATCH] watchdog: meson: Fix the wrong value of left time
To: Xingyu Chen <xingyu.chen@amlogic.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ee3ea7d5-1adf-c718-4533-70b04bb23ecc@roeck-us.net>
Date: Mon, 30 Sep 2019 06:12:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_061256_285310_CA802624 
X-CRM114-Status: GOOD (  19.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Qianggui Song <qianggui.song@amlogic.com>, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/29/19 3:53 AM, Xingyu Chen wrote:
> The left time value is wrong when we get it by sysfs. The left time value
> should be equal to preset timeout value minus elapsed time value. According
> to the Meson-GXB/GXL datasheets which can be found at [0], the timeout value
> is saved to BIT[0-15] of the WATCHDOG_TCNT, and elapsed time value is saved
> to BIT[16-31] of the WATCHDOG_TCNT.
> 
> [0]: http://linux-meson.com
> 
> Fixes: 683fa50f0e18 ("watchdog: Add Meson GXBB Watchdog Driver")
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index d17c1a6..5a9ca10 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -89,8 +89,8 @@ static unsigned int meson_gxbb_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>   
>   	reg = readl(data->reg_base + GXBB_WDT_TCNT_REG);
>   
> -	return ((reg >> GXBB_WDT_TCNT_CNT_SHIFT) -
> -		(reg & GXBB_WDT_TCNT_SETUP_MASK)) / 1000;
> +	return ((reg & GXBB_WDT_TCNT_SETUP_MASK) -
> +		(reg >> GXBB_WDT_TCNT_CNT_SHIFT)) / 1000;
>   }
>   
>   static const struct watchdog_ops meson_gxbb_wdt_ops = {
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
