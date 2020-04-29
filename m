Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15959C83003
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 12:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B0A2072A
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 12:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFbMP+ET";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RB2S6Kbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B0A2072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9KReDthDlocambja8ee2/AThvw9T+mY1JEwIruJUG34=; b=sFbMP+ETO3mdSIJbymAOxdRvwa
	wDa+ttQipKKfAWF4vap+VgH+X04a7ShLPM/NvXnVNMBWAj5r5rMiTuw7F0jt+bs/4sOmDBm2P1yrt
	DNDlVJp4TET+acDlsj4/OOT1jN2GJCW8z9/9CfOT0qTzPSTvTKVjhkH3JE3Y3tye/I90qiz8+E35e
	poj33Kr8dUsIy/ZcygBlm/Db8LaqGWVm4LEeykgGaSdfER8DXbI3LlBYxja6vWmXGZKLnQdGr0hVl
	Td4vrE+wU00qNe7dUTk5MA+eNiSmmY2GPAyKKMRAOLxeiz4begSlI1YQithHF6nyYrxgPr60HNKMp
	P332oo2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTlxk-0002i4-1H; Wed, 29 Apr 2020 12:37:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTlxg-0002h8-Da
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 12:37:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id y24so1833654wma.4
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=NkpmzV5D80JNy4ts2YZIu3+YM84vR2UzyeLRZ8y2XUk=;
 b=RB2S6Kbc+kfXu6qf/y6WSvhN9KPpKce18ars9tpM2GQHKrokwDv6/gMX4kdak20F6j
 KXNYe2U3QdGzROWkaeE5+5esEhR6IdymhTSFRH5is6PbUfFZjdXEhNZXda8pGH9KVC2H
 wX/PkvDEyEKQ+60pRvswRIlPgDyTsEywC3MJkTI+LCDEJ//QbLAJ0qmL31Ql306LvGM6
 5o+o682PQZk5WTzs0jbP/ePdF4FvqO+2vokdsZ2rnTvaqBsOLpIvsOr3AmoToWMeieYb
 HoJxSlRteoXodvsrMnkadcgDRcAmpXv/EkkM0q4N6XjFvFN+jDEk1BF908zvESsOTGvR
 Znrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=NkpmzV5D80JNy4ts2YZIu3+YM84vR2UzyeLRZ8y2XUk=;
 b=dNF03WGDeKtumAbSYKNyZJOxOWw3QXOm9TVreirN0KrsRA0o/1RqRtV8+Ce79jIAj7
 soz09e/3abV+RqUUzkUC/FEFOQB9PeIX7W5/ijWtgzvukkKG4/HdAtLu9RJNAQ2IPJEd
 KavChK09X+zEXwFkB6poPV4DrhNxGdLwbc73K1Ly5xIMlg4tCKG4UK+fZ45AJ1urDmQ5
 OIQ6uHEspSqtJcsTY42rIPtFiUfMC9HA0HtwRdgl8ETghGUyKVXBZntb0yfYDkZMKDSL
 5MM5VbZ2IwVH37fdFvEyA+nlH3QVPiP3U3eBXRuOn5M75Yl7sWhtLXTCKZV9DtB75ev/
 MA6w==
X-Gm-Message-State: AGi0PuYjjk2UC7/5dHX/CX+HFvaYec2UCislhAldYjEds7z0GrBDWTNz
 oqsHeHeMcBzQJlfMEByad2PcTw==
X-Google-Smtp-Source: APiQypJ9Jp2lZbXV6sSejvUm+Db6rvnl5p9Dp9DKoDBbqDndVu48hMIlklKxV/5CTB1MdnSh1tZZ3A==
X-Received: by 2002:a1c:5403:: with SMTP id i3mr3302337wmb.10.1588163830921;
 Wed, 29 Apr 2020 05:37:10 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k23sm7597481wmi.46.2020.04.29.05.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:37:10 -0700 (PDT)
References: <20200429031416.3900-1-bernard@vivo.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com> ,
 Bernard Zhao <bernard@vivo.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk/meson: fixes memleak issue in init err branch
In-reply-to: <20200429031416.3900-1-bernard@vivo.com>
Date: Wed, 29 Apr 2020 14:37:09 +0200
Message-ID: <1jpnbqii2y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_053712_459190_0A3FE56F 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 29 Apr 2020 at 05:14, Bernard Zhao <bernard@vivo.com> wrote:

> In common init function, when run into err branch, we didn`t
> use kfree to release kzmalloc area, this may bring in memleak

Thx for reporting this Bernard.
I'm not a fan of adding kfree everywhere. I'd much prefer a label and
clear error exit path.

That being said, the allocation is probably not the only thing that
needs to be undone in case of error. I guess this is due to conversion
to CLK_OF_DECLARE_DRIVER() which forced to drop all the devm_
This was done because the clock controller was required early in the
boot sequence.

There is 2 paths to properly solve this:
1) Old school: manually undo everything with every error exit condition
   Doable but probably a bit messy
2) Convert back the driver to a real platform driver and use devm_.
   We would still need the controller to register early but I wonder if
   we could use the same method as drivers/clk/mediatek/clk-mt2701.c and
   use arch_initcall() ?

Martin, you did the initial conversion, what do you think of option 2 ?
Would it still answer the problem you were trying to solve back then ?

One added benefit of option 2 is we could drop CLK_OF_DECLARE_DRIVER().
We could even do the same in for the other SoCs, which I suppose would
avoid a fair amount of probe deferral.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/clk/meson/meson8b.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 34a70c4b4899..0f07d5a4cd16 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3687,6 +3687,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  	if (ret) {
>  		pr_err("%s: Failed to register clkc reset controller: %d\n",
>  		       __func__, ret);
> +		kfree(rstc);
>  		return;
>  	}
>  
> @@ -3710,8 +3711,10 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  			continue;
>  
>  		ret = of_clk_hw_register(np, clk_hw_onecell_data->hws[i]);
> -		if (ret)
> +		if (ret) {
> +			kfree(rstc);
>  			return;
> +		}
>  	}
>  
>  	meson8b_cpu_nb_data.cpu_clk = clk_hw_onecell_data->hws[CLKID_CPUCLK];
> @@ -3727,13 +3730,16 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  	if (ret) {
>  		pr_err("%s: failed to register the CPU clock notifier\n",
>  		       __func__);
> +		kfree(rstc);
>  		return;
>  	}
>  
>  	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
>  				     clk_hw_onecell_data);
> -	if (ret)
> +	if (ret) {
>  		pr_err("%s: failed to register clock provider\n", __func__);
> +		kfree(rstc);
> +	}
>  }
>  
>  static void __init meson8_clkc_init(struct device_node *np)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
