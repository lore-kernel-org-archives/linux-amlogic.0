Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09775C004C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Oct 2023 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfZ34EgdYwgm+tJegMzO8/+jV/oX56l7GhmjE4p8tdc=; b=Yqz0vV+sTXobI9
	7CB375lZ7YCH+w620kol6dBY8Od3N8mMio8KIWeG1jeEY1d7Lal+slIfUF/HrlQ/hxkgEp8yFWhCK
	kHNeBNwt8+OdJniN42XmgHwONmys+yes7WMJ1/U7RZTlLE3BLmXKnvWc8FpX13erHD31TBec3R4kd
	4vTcc645lypIL34plLZMXzbgtsvf9jNjo+WlPpBivH132r4N9ZCTfBbDyXacw1sNAzZDgqvT5Uh3s
	mkMq4T4HpBU8lTmt4im5Rhlpdu9Xg8bvgu41cbu0hazpEJW6IUsPeb3LS4xtYbNFs8n4RjpKQS0kr
	NP7UWUW1wzCX0OgB6unQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qustl-007DiS-2B;
	Mon, 23 Oct 2023 11:15:05 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qustg-007DhC-2p
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Oct 2023 11:15:02 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d857c8a1d50so2673708276.3
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Oct 2023 04:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698059699; x=1698664499; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6hu9rh6KgAvsKfYXXWL8zYTarr8RBDwNjZxBfWtY8rc=;
        b=u6EBgvruJTa3A6IcKXODPWGBCBVHg8+24N+gg2rVHTylb9ymZNZcH1h/331qlOwk++
         5sZloBXANIYS+HsIY3uZJ9PizbirOevNR2fjSnR0YocztsmlA/fy2onTabp1VXJDombX
         vUUqRdi/AGVI0eB/p5C2Su2Tm0csIg0dUi4OIDJrnQpRwmiScdB4iPin/SdTqIHdcKTD
         dDuyJMYVm0+vAWTfGhg1CCdZaijo5TVFsheximoPuUBBHo/nw2SKfCZTyHlcojwT9tyV
         4p2LE1YQro0q0AIE2pzhW2b1IzSpxxTkpBMgdrcyVaMe2iIJUwhHyUaKmw4Xkp4J65su
         MYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059699; x=1698664499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hu9rh6KgAvsKfYXXWL8zYTarr8RBDwNjZxBfWtY8rc=;
        b=TUNWR4MfRsuHpJSynFbakBJC1NYoneG9gtMF5fubBl/FHAL49m8yKEsSwn67S1FozV
         g8WfT+7Yywsq7wKwbA7WlF+46FCHsWNFNYf0yUcaIy1WHjajC3t2ZKmbmsQHoZaJ/13t
         Yfz6T3k+vHr1WjJWubqOVUnLNloS0JwJi2BZgZpVex+3m4soQ4lnfCYbfRUughLTpTRL
         lpQjtV6hb1h3cusNEb31ExLtL0jNONy48eCF/qQXTr/QsGD/Jfg/WEF6JISqH6YaWxB/
         X5ZG+tBVQCjbtlALn+xdh9plDGC3gMR4Iaxp8NaMTsJpmLFiDe6tExjcJVl9hSa7kwHM
         QzOg==
X-Gm-Message-State: AOJu0Yy0voj7mKQkBF8XUTqiN6LTytfMv+DpnsX3ttFemmZYQ1fgG9px
	ZmxOG2+IK0ok//a+C6k0oCeKJSFSCblTxqfAL4AFmQ==
X-Google-Smtp-Source: AGHT+IHp30gB+Nvus0ZLdoTwDy/MryEBQA4AcnzU9gz/ai6P20jZzANHatsRweskKd+aafcJHUWnH2n5rq8Ic2Zl5eQ=
X-Received: by 2002:a5b:608:0:b0:d9a:e947:447b with SMTP id
 d8-20020a5b0608000000b00d9ae947447bmr8427971ybq.14.1698059699399; Mon, 23 Oct
 2023 04:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
In-Reply-To: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Oct 2023 13:14:23 +0200
Message-ID: <CAPDyKFrLUf+dcZbPtXFncu_KO_SgzKSN1KCW8ds4=OUGpT8+Gg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ziyang Huang <hzyitc@outlook.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, yinxin_1989@aliyun.com, 
	briannorris@chromium.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_041500_991755_56399641 
X-CRM114-Status: GOOD (  22.21  )
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

+ Thorsten

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

I have re-added Thorsten to see if he has some time to test this on his end.

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
