Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7946FC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Nov 2023 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySxWRqqXqfaOpvCleSE0l21EjQ4vCinWZL3uOG3e2rk=; b=Mr7AwYUQzdPYuv
	j/+DQhXBawbUcH9WzHAAFuvSgD/iUAe7IBjzXuyHp/ah+Pu1KGjuzYUPk2EhsCPVcyOQPfBd+KfnK
	mTEecTxvLTNgCK7S2hs7rjgo+7EnS/LJOtdgvM/QCNny+iLdPntVhHI81xThaVkCPMaJLeNw1/MMP
	4L7Q8zu9WP02JvAyNA+vPBGSXzaS6e6s9br6sS3ESdXmWWxDHDImljgpdHhfbX7ID+euSUv2u22CE
	HCr4bwhqKBQlcurT/b6vf/g6hHlHyi37eBKJMvoYONJnDg3abGabyZokNu8NMutv+Q6vm/g75BcZq
	THTwVBhQq5hkeCBNeWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysAH-00BJlq-1y;
	Fri, 03 Nov 2023 11:16:37 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysAC-00BJl9-1Z
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Nov 2023 11:16:36 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a82c2eb50cso23243187b3.2
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Nov 2023 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699010191; x=1699614991; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zlnj1QcdhJuExKWm5OBOLI9EIo/svVqPZVVzvpe520=;
        b=n+pmQLXXCQrLlmn06csd6qFZMrabx4EAOUI5wPD91BxDrEuboxGJBezW59W1/GIKAI
         mSITFs8Uc2Ml1XaQM/GIswO/koZxQifn56sJZvcdppcY0Fcw7QgHYN+92TS0VL83iuhB
         YcnvCPbKrCCU5fwEtPpVcrntGlHnQpYP68JJlQ67uzrzhcUIVLFqBPtyzyr8KeWcgdTY
         1ODbcesDL0q19kV7qRHAr/dYfKR2FX7eq0JdCpQ8qzg0dxBZggOwQWqD3ZzCGp0q1SVr
         Ub1/pWZfrdMIsCj3cE2pRk1FtxtCYSnwdfbKfPmQBuywJF9IhLgU+PuDY5gSdkluBpIv
         NS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699010191; x=1699614991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zlnj1QcdhJuExKWm5OBOLI9EIo/svVqPZVVzvpe520=;
        b=QpM8tuEXn7bifpTmKWVwhBtG2mmEd9L6VkTY5idiS/hvX5sN2EAwiATrZDBkH5hiMN
         m624dqUKOmc6GzLvVHAOoabTSLgT5FqWm483bk8a3vLDVxk3rOFBugD1FtEXFgNxy1Lo
         H9d5gI/JuCWtSTPnDdNP2egZEQyhRSQm7RLE/QZo5L1j0bMUorfsFLOC2WaPu17AGsqL
         vNxa0F/4epA64PwbAdSPthnBS5CWdnDxLahen7khOTSh5qnvsrmcGWI/gderGBEUBCnl
         BhzbuCI1G46eA6kW0ib//hWvZMvFgz9sFNSeitKfJXeIH6evGST78XzSQZbMboQPJmgE
         Ex6w==
X-Gm-Message-State: AOJu0Yxgid3dXW7yeBX+iXy+yVIWJGORRsMSk5ugIf2YKVQVeHx9dMH/
	wLh8ezi32zTmX9aGPaJfzIQfg6XNrSwTFJmRcsQMlQ==
X-Google-Smtp-Source: AGHT+IFQB2tqr6cHk3NEpb+OYZbDnMccJdFpi1Iu915+DK9hWrC0ZE2LOgaTVVsJiLX3xg6hLwz6VWOx0XpNveCijAs=
X-Received: by 2002:a0d:eb03:0:b0:5b3:2128:5667 with SMTP id
 u3-20020a0deb03000000b005b321285667mr2285433ywe.6.1699010190826; Fri, 03 Nov
 2023 04:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
In-Reply-To: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 Nov 2023 12:15:54 +0100
Message-ID: <CAPDyKFpqCkxD9LmFqRM_AaEie0pbgFEsLTYmoj71pEr78+OssA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ziyang Huang <hzyitc@outlook.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, yinxin_1989@aliyun.com, 
	regressions@leemhuis.info, briannorris@chromium.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_041632_543719_8EA636D8 
X-CRM114-Status: GOOD (  23.63  )
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

+ Anand

On Tue, 10 Oct 2023 at 18:44, Ziyang Huang <hzyitc@outlook.com> wrote:
>
> Commit 4bc31edebde5 ("mmc: core: Set HS clock speed before sending
> HS CMD13") set HS clock (52MHz) before switching to HS mode. For this
> freq, FCLK_DIV5 will be selected and div value is 10 (reg value is 9).
> Then we set rx_clk_phase to 11 or 15 which is out of range and make
> hardware frozen. After we send command request, no irq will be
> interrupted and the mmc driver will keep to wait for request finished,
> even durning rebooting.
>
> So let's set it to Phase 90 which should work in most cases. Then let
> meson_mx_sdhc_execute_tuning() to find the accurate value for data
> transfer.
>
> If this doesn't work, maybe need to define a factor in dts.
>
> Fixes: e4bf1b0970ef ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>

Let's give this a try! Although, rather than queuing it as a fix for
v6.7, I am picking it for v6.8 and adding a stable tag, this should
allow it to become a bit more tested first.

Kind regards
Uffe


> ---
> Changes since v1:
>   Use Phase 90 instand of value 1
>
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index 97168cdfa8e9..29698fceb89c 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -269,7 +269,7 @@ static int meson_mx_sdhc_enable_clks(struct mmc_host *mmc)
>  static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct meson_mx_sdhc_host *host = mmc_priv(mmc);
> -       u32 rx_clk_phase;
> +       u32 val, rx_clk_phase;
>         int ret;
>
>         meson_mx_sdhc_disable_clks(mmc);
> @@ -290,27 +290,11 @@ static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
>                 mmc->actual_clock = clk_get_rate(host->sd_clk);
>
>                 /*
> -                * according to Amlogic the following latching points are
> -                * selected with empirical values, there is no (known) formula
> -                * to calculate these.
> +                * Phase 90 should work in most cases. For data transmission,
> +                * meson_mx_sdhc_execute_tuning() will find a accurate value
>                  */
> -               if (mmc->actual_clock > 100000000) {
> -                       rx_clk_phase = 1;
> -               } else if (mmc->actual_clock > 45000000) {
> -                       if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
> -                               rx_clk_phase = 15;
> -                       else
> -                               rx_clk_phase = 11;
> -               } else if (mmc->actual_clock >= 25000000) {
> -                       rx_clk_phase = 15;
> -               } else if (mmc->actual_clock > 5000000) {
> -                       rx_clk_phase = 23;
> -               } else if (mmc->actual_clock > 1000000) {
> -                       rx_clk_phase = 55;
> -               } else {
> -                       rx_clk_phase = 1061;
> -               }
> -
> +               regmap_read(host->regmap, MESON_SDHC_CLKC, &val);
> +               rx_clk_phase = FIELD_GET(MESON_SDHC_CLKC_CLK_DIV, val) / 4;
>                 regmap_update_bits(host->regmap, MESON_SDHC_CLK2,
>                                    MESON_SDHC_CLK2_RX_CLK_PHASE,
>                                    FIELD_PREP(MESON_SDHC_CLK2_RX_CLK_PHASE,
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
