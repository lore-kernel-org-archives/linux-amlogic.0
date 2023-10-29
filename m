Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C9EC4332F
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Oct 2023 13:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mIzKkAx0jQUyo02M+TZp1/m68nAQ8NCDrkbI5sCLkI=; b=INP3xjAdvPDi1x
	BjtooNiEX3dn73HAW4eIKsgs3Eb8v3jCl3VkYg95+e/LFq9fZ3QRlYvANujcip9oZf6A8piRkeZiY
	APMCd7ETc7qxKhieIP7dlTkww8qpdRf9yjoAK1o2np6RAXj17vHvDPt25Obk9RWqc6dv/VDVmUVak
	gxXIHrkcO/Hs1NVUOQbKRAEAH6ANolbIOKeh43aQcMN87ndALzDRemvj4qAbvwzbYpibVM/3Bq+Px
	zjzX+daSeNmRub7fQWQ0ckGZhhbFh2giGxtNhBym13du/uAtXfgCEtvIF198nzmjY/7oU9A5KUFkX
	MQnVgmWgEjqckpKYPOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx5XP-001lmf-0s;
	Sun, 29 Oct 2023 13:09:07 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx5XL-001llj-08;
	Sun, 29 Oct 2023 13:09:04 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ce2c71c61fso2184563a34.1;
        Sun, 29 Oct 2023 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698584941; x=1699189741; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8rEsmHyEPkV7MBoxDxxp2oxo1YnlfdW9ufozgcxhuFE=;
        b=BuoMh91AQbfxNVORBmElPZBfdGUEPqs2FdEG8X+kTqCzbVcitc3qerzH4tHSQnGjd8
         JGaufl4jkTgsz0RJ88mJQseJPRUaCIYboZn5tvDeM4fvVF9sA+CZlE1gGi7yU5UjX52d
         mI5RazIrw1HdJcRvasiCIpzBLsUzBVBrQuDNMH1n3+j7Be+UZPmPDGuJyBG/ApBeBXQa
         c3qaA4mqXgFAsTlDmwj3jUKmatRCir9+JXZ7xW/A8fCxST4iR8NwYsAUw90exiecAeXX
         2+T0+VwCV+73jMYbZEU4f/xjJEWiTNh7jMprrgX2EIYhqd6DDQscD0rdn3iYVIgnvUpN
         J5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698584941; x=1699189741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rEsmHyEPkV7MBoxDxxp2oxo1YnlfdW9ufozgcxhuFE=;
        b=PLF1fdZQHzXFMXm6gQOWjDOgGJiDemMOynYdUgzBYuw1B8XzGh+eRnJBArDffe5FZq
         DV3wXBl5+4DJch8kDajtnu+eeiLqdzXTTsY3AXzsao2o0M+d04bteTOovEcTrCyQx+SO
         C2qyywPoo9sdg+aBDDCsJNvGnn9L6BlvN27Bs5/HWvG9oErSl2JSq217vTtCk890Ilhc
         0uezWKzQSlbyYrFzFaiszN9dxG9XlpN+xJ2WkadDTeYWPW/atL6Z+sbLQgqZul9mN0ZN
         kGHLCcq0VSVZMlK3NSrcwgDn2leHHVRwtewtct6XxN6X8cz8V/MOfc1rkQHYIl5/uiQ2
         mElg==
X-Gm-Message-State: AOJu0Yws4ta6jWc/LIZUtOrCVXesHKjC1dciBpVjOsSi/FskBlOwxw2c
	Pk6LQoCdJjT33fwLiMvwsWtMz48qxNntYklMvSM=
X-Google-Smtp-Source: AGHT+IGpgcnqNbXuqkw21XHiLu3JGl/K9IyANpWzyC0AbERHNIwUN7/8BkASMY48GhKsjW160YywNZ4xAk1mlz4h83Y=
X-Received: by 2002:a9d:6d8a:0:b0:6c6:1e39:e5c6 with SMTP id
 x10-20020a9d6d8a000000b006c61e39e5c6mr6825448otp.36.1698584940764; Sun, 29
 Oct 2023 06:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
In-Reply-To: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 29 Oct 2023 18:38:45 +0530
Message-ID: <CANAwSgTqm2-NsMjZWQwfc77CQhL_kCLnbQpm-ithOBS84UV=4w@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ziyang Huang <hzyitc@outlook.com>
Cc: ulf.hansson@linaro.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	yinxin_1989@aliyun.com, regressions@leemhuis.info, briannorris@chromium.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_060903_112557_71AB5D4A 
X-CRM114-Status: GOOD (  27.56  )
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

Hi Ziyang,

On Tue, 10 Oct 2023 at 22:15, Ziyang Huang <hzyitc@outlook.com> wrote:
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
> ---
> Changes since v1:
>   Use Phase 90 instand of value 1
>

I have tested this patch on my Odroid C1+ board.
Please add my

Tested-by: Anand Moon <linux.amoon@gmail.com>

[alarm@alarm ~]$ sudo cat /sys/kernel/debug/mmc1/ios
clock:          100000000 Hz
actual clock:   94444445 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    9 (mmc HS200)
signal voltage: 1 (1.80 V)
driver type:    0 (driver type B)
[alarm@alarm ~]$ sync && dd if=/dev/zero of=~/testfile bs=100M count=1
oflag=dsync && sync
1+0 records in
1+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 5.70235 s, 18.4 MB/s
[alarm@alarm ~]$ sync && dd if=~/testfile of=/dev/null bs=100M count=1
iflag=dsync && sync
1+0 records in
1+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 0.20267 s, 517 MB/s

Thanks
-Anand

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
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
