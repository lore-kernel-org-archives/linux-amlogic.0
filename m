Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669BCC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 14:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34194205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 14:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJEg5Y1l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XQwWp0dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34194205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9p9GkIM/6STkcgu7ELuNADLt41nIIdfffWnhpn3yqA=; b=TJEg5Y1l83Ex8Y
	SmulG+cLyD40f8s/hqw/VcJ16ZVCUagXX/h93TO1DMApLlkZkNHVXEWJc5ZCQECYU23JU9TuSHfGu
	QFg/vCGRAMmoik46GZOBfdv4fm3s4JqHxjuE2g7J+INAui/QLHbB6X72ZuOS/6M7XQgP70JpQxmHZ
	rHO9YMwDHI86VQt3yevC7E50AYQReq/u0MwP0BXJRKUQc+pim4VZ3r2b6JUlln31kINVUuxp3tj80
	EonZdFtJsMAhpOxkS6zxjfxU7D2gBVONwVRzAeDgia1ZoiwyEP9LIO+friJeAZY024K9l7ODZn9lY
	COg0qJdeGCrccTve/qBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk8OI-00044P-4N; Thu, 17 Jan 2019 14:11:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk8OE-00043q-LB
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 14:11:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id v13so11179495wrw.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 06:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=emDIRa/2YS9sx7y5G2UkAHMiLwvcTobKlw/j+URjeKg=;
 b=XQwWp0drdSQdtozPcsV+xc/M/mj0ir9vayjfpPyWzs8GCZwR3XYd1eXc+xtcj3xU8g
 mwLSnNrbPdQpw6Z7VLCPBMugid4iD0LSze4IN3gnJUEaYHGKp1AuiCGdwq2rwus1lKLn
 HyU0RblSHIzpAhK8NpldXMLw/UC2llBbm/4VGHNPgymEnKobbjgPkgDSrhAxyYJm1c8Q
 dE61LCK7O0tZyys9l9zcQYwoIJsQESMcnWAL4qb+kwDQG1MbyrMWsiMhAHQ1VaG6NdL3
 TqhR3vY7EisZezaMX71yeHkgS4b3zopn/rU8mBibo9MgmB8VxlxXVWL8zj6NroggXYoi
 8+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=emDIRa/2YS9sx7y5G2UkAHMiLwvcTobKlw/j+URjeKg=;
 b=Jo7JtpSdEs5UJdANCQ1LL+jDs4oZYUTk/4DdNbYzjRv1tTS3KIkkOYAdjwTe77b22R
 ZmG7/dUSOi7vGBpuIWykfL7+21QXGZRMEFaq+Ogk4e7QTM50I6Y0kZUF+pGaCirQCXdV
 //V/JdyCz4ev3c0g1lUeZl+H+zuqVqIIyjtUVlInFXtoIHNxKK7hSi8hiPi0Uccz5re9
 4JTfZcPuxXJo3IySbZ7p8kFnyx5jSt9AiNlYIlhvBzemEyAAnB38ROQiHHHlyJf6MHh5
 tffMGaj6ZeGcGpr+665FKVTwqFrxwq4fNzH3P65I91GJZ67aWVYnIlp4Mm83X7K86Dh/
 302Q==
X-Gm-Message-State: AJcUukel+1dLh6NKUXBnEw8Rb1ltPhN/ftAUG3GKFt3Zrey+PFauO5J2
 arSE04HongXQ3g85NOOM53cGSg==
X-Google-Smtp-Source: ALg8bN5nsMqnSppyXHOu9TLDGsYFE/xH5TwmqEwoeS0qHSw0rEBQNdRXq/CBw93G2qlepk/KJSHzqw==
X-Received: by 2002:adf:ab51:: with SMTP id r17mr12205694wrc.62.1547734283226; 
 Thu, 17 Jan 2019 06:11:23 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 b12sm64786998wrt.17.2019.01.17.06.11.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 06:11:22 -0800 (PST)
Message-ID: <150bb9f497ba4a2bee055f49557b4dd8216bfa22.camel@baylibre.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andreas Fenkart <afenkart@gmail.com>
Date: Thu, 17 Jan 2019 15:11:20 +0100
In-Reply-To: <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
 <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
 <820343bf1c43f4ca79fa33a1f1390375ebfb7e62.camel@baylibre.com>
 <CALtMJECrsHDHxYRHMFfOCCoymGudGiVxjtK2f2T6ZK8mfNZ6_g@mail.gmail.com>
 <CALtMJEBPVWFDYYphbOSRZ91Cg954QB33pF7=Qkum9R6-8yQqZA@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_061126_807354_F0656012 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 krzysztof.michonski@digitalstrom.com, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 14:56 +0100, Andreas Fenkart wrote:
> Am Do., 17. Jan. 2019 um 13:35 Uhr schrieb Andreas Fenkart <
> afenkart@gmail.com>:
> > Hi Jerome
> > > Here your eMMC timedout during init, so even before an attempt is made
> > > to tune
> > > which is odd. Could you try to enable signal resampling only when going
> > > forhigh speed modes ?
> 
> card is found with this patch:
> 
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -432,12 +432,17 @@ static int meson_mmc_clk_set(struct meson_host
> *host, struct mmc_ios *ios)
>         struct mmc_host *mmc = host->mmc;
>         unsigned long rate = ios->clock;
>         int ret;
> -       u32 cfg;
> +       u32 cfg = 0, adj = 0;
> 
>         /* DDR modes require higher module clock */
>         if (meson_mmc_timing_is_ddr(ios))
>                 rate <<= 1;
> 
>         /* Same request - bail-out */
>         if (host->req_rate == rate)
>                 return 0;
> @@ -475,6 +480,13 @@ static int meson_mmc_clk_set(struct meson_host
> *host, struct mmc_ios *ios)
>         if (ios->clock != mmc->actual_clock)
>                 dev_dbg(host->dev, "requested rate was %u\n", ios->clock);
> 
> +       if (rate >= 200000000) {
> +               printk("enable signal resampling");
> +               /* enable signal resampling w/o delay */
> +               adj = ADJUST_ADJ_EN;
> +               writel(adj, host->regs + host->data->adjust);
> +       }
> +

200Mhz is a bit arbitrary.
I would prefer if you enabled resampling when starting a tuning
And disable it on power up, in the set_ios() callaback.

>         /* (re)start clock */
>         meson_mmc_clk_ungate(host);
> 
> /Andi



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
