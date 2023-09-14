Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14478EEAA4E
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZllBLeIguG538v4Gz9OQEVDHU4I5B6AN8XBHkbC4EA=; b=PsZn2WxTTt8Glq
	ceePsSELU3hGjQRWrS01UVtlXjU2LZrwe2jLMXm31DnVIE6nbh8UPoU34moNOmrzPUaFNhMHXwE9b
	lJWMaktqO0kZ4rAtSJgbSSJdnzg60iy2VXx23A3DaY5zad2UQDKecflVnVKzhRUM6srWpcKtOhC5k
	A6XYkyMnewytxYhY5FABUkubuDPE5JRoWf+GLf/AC4R4BND88+FLgCniV3qBLDKwWICIqo4/LOZiQ
	PBqW1JiyHs99f1VtU93a6t+MIRmGJcRH0AlcLKt6yX0o7/GWTmaBvrVq9OamgBf6npk9UZkhCqpj2
	tb6NFVyKY0S/NDxanfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnc2-008fuU-2O;
	Thu, 14 Sep 2023 14:46:34 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnbz-008fsh-1Y
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 14:46:32 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7e741729a2so1116162276.2
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 07:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694702789; x=1695307589; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4qtZmBwwjpiJ1Z7K5tiJyvsgnf0O0Obv1kjqllyr8Pc=;
        b=NklQ55RsUQr+5hb/5rPkKVORH+dYSDlzNQDg+aA8VN7naERHmZl27qt/7ZiZ5jbXG/
         H6gSni2MRXo3Z+O5ugcm9WtmKXd5sYcoPodKXzYazKlA2D6RDL8yeOPkd8rhd5acMQJE
         gYNORGWcVcZ7vVKeRxg9aXIXfRWgXZekp8ugPZ5pkBoTBRSg9RKSsAKbgoeg5MgaiXjd
         kwaF2l1jlOFAKhGxoSIcLbU6WOuV85ZTf9n4+iL1a1XR8OaVD8BX7O2teH5LENVsHlQ2
         qHahmFwPI4Zb8rOMpO1VFeE7q64ewNxPbLP9qv0fLWoGBIe7/reR7F/mRvt3MlQqzSlO
         Q4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702789; x=1695307589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qtZmBwwjpiJ1Z7K5tiJyvsgnf0O0Obv1kjqllyr8Pc=;
        b=TuU6vzrfbkiEsLo25nWCjnKysafMap0cy+knVIik8XfKNKpXupOWBtEjwn1eNT9qIp
         uXr0vj3EHc8te39m0K9JiV+QgNNLtE4w6fTmjTFayktzgXhlhQBs6Vy4QTRaaZ5+dzs9
         /sCFi+6aSXs5Cx7qk5FAeKf6lU4cq1bw7Ae4cRg7dihjVAFBOuLjY63gcXcFqBizgAbs
         eHPVZJKrbkvIlribwK/Y1mvvDRzCFfdjmKXm1ZbTG8NlKlFW7q0mNpkM9m32ME2Na7cy
         YM6t4gO5NB8DaxZzlYb4R+YbWu4VGVxNaacysQpAcynX0K8Pnc1soWm88qOzWLKsOHbB
         PYAA==
X-Gm-Message-State: AOJu0YyS7K1X+STh5lK+WbF9m3xXmPAgOzTFYk6hrVoaO343vwE0DNnh
	RKw1VPLxMMwPPOWnMnqRPp4xjC7g0UQ3TpsTyNyIQw==
X-Google-Smtp-Source: AGHT+IGf1v5b0F0uzbAyJ1jj+d9Q8GYVHSjjTlKHADrRvbsB5zOjl01k8leJ2gfqNujX8IM/MTANKn4OHcIM7UCTJvk=
X-Received: by 2002:a25:760c:0:b0:d7b:9d44:76dc with SMTP id
 r12-20020a25760c000000b00d7b9d4476dcmr5924626ybc.38.1694702789586; Thu, 14
 Sep 2023 07:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
In-Reply-To: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Sep 2023 16:45:53 +0200
Message-ID: <CAPDyKFqyi97kjdiNM60WYK+cs4pw5pW3AyfiWKnsCRXd5BXUww@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ziyang Huang <hzyitc@outlook.com>, martin.blumenstingl@googlemail.com, 
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_074631_517627_D20ADB6A 
X-CRM114-Status: GOOD (  21.80  )
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

On Mon, 19 Jun 2023 at 19:36, Ziyang Huang <hzyitc@outlook.com> wrote:
>
> Commit 4bc31edebde5 ("mmc: core: Set HS clock speed before sending
> HS CMD13") set HS clock (52MHz) before switching to HS mode. For this
> freq, FCLK_DIV5 will be selected and div value is 10 (reg value is 9).
> Then we set rx_clk_phase to 11 or 15 which is out of range and make
> hardware frozen. After we send command request, no irq will be
> interrupted and the mmc driver will keep to wait for request finished,
> even durning rebooting.
>
> So let's set a common value - 1 just for initialization. Then let
> meson_mx_sdhc_execute_tuning() to find the accurate value for data
> transfer.
>
> Fixes: e4bf1b0970ef ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>

I don't quite understand if this patch is ok for everybody for me to apply?

It seems like it solves at least some part of the problems that
Martin/Thorsten were looking at too [1], right?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com/#r

> ---
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> index da85c2f2..a01090a2 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
> @@ -269,7 +269,6 @@ static int meson_mx_sdhc_enable_clks(struct mmc_host *mmc)
>  static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct meson_mx_sdhc_host *host = mmc_priv(mmc);
> -       u32 rx_clk_phase;
>         int ret;
>
>         meson_mx_sdhc_disable_clks(mmc);
> @@ -290,31 +289,12 @@ static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
>                 mmc->actual_clock = clk_get_rate(host->sd_clk);
>
>                 /*
> -                * according to Amlogic the following latching points are
> -                * selected with empirical values, there is no (known) formula
> -                * to calculate these.
> +                * This value is just for initialization. For data transmission,
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
>                 regmap_update_bits(host->regmap, MESON_SDHC_CLK2,
>                                    MESON_SDHC_CLK2_RX_CLK_PHASE,
> -                                  FIELD_PREP(MESON_SDHC_CLK2_RX_CLK_PHASE,
> -                                             rx_clk_phase));
> +                                  FIELD_PREP(MESON_SDHC_CLK2_RX_CLK_PHASE, 1));
>         } else {
>                 mmc->actual_clock = 0;
>         }
> --
> 2.34.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
