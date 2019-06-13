Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F08AC31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4742B2147A
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eXH/jWhL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WZ9XttpS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4742B2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8qObwntsCs+TkilPgRzIenLr3Lk/9+mFmEEQ2t27y8=; b=eXH/jWhLW+NoZk
	UXeigDvN+vudOgxujpfhK+Ek6XaZAfYjNdiXsEindnMcVns00B9pnLYvlhou95H62QH6Sd6krgW0h
	3ZP1uK4N4+bPSGVp3vLPEloRcjxyq0T1xKRPH/lW97AJxSELGD9p2GDBP25uqyJe9F9Sbzfe2+3HJ
	XO7/zLI8yNZANrO5g74LSIWpLK8asIkt6c1jBQ3zY7vjhOcAvMeoyuGRwv1WdEn2vW3ddrRHeZS+4
	XlhUmqRfp1MCpsYh2qymCpQfo3Wxby8hCpAAkI+WC8Iy5/jY6+HWIdcmo592Km9u6sX8xAFP9a6iT
	ajoKMzXUKkD+CuwxHbeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbVK8-0007DS-1j; Thu, 13 Jun 2019 19:23:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbVK3-0007Cm-Pe
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 19:23:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id g135so11370624wme.4
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GVu7uy4HOQESHtxKRBBZJg2Z3NeKBj+tNRQbhobtkeo=;
 b=WZ9XttpSZeH2vrvMie0OWfUyzBtPTnLz1xp83pGt73ercn5N2xys1lvU3rV6zn/6Sx
 xdvZbO9CCbBPo18WybVpRvaKd471SCDYCOA6ZG6yYo01ii1sBcJMLNqpO1cAY0MLIWdN
 SUgv6ubhB03mXNjsZG+IQ4IiI66GlwpKBHhC4X0axBkf8iSTJde0e6l4z7VdMWWQmMPz
 +Ymz2S/qnz4CnD/H3PWZQjASR1eriZak2lRREL4bSUabsb1Bgdf3jH+r63U8aBzvx6hJ
 EITo5HeXwz4CFquv0L2kPaHT7AfHvOf9x9GVp2b12HnvjI83cwx1ool0dAluT/PPvZa8
 /wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GVu7uy4HOQESHtxKRBBZJg2Z3NeKBj+tNRQbhobtkeo=;
 b=tRQ0uJWTWayITAdvnUKkkTooMVGBM61GvA77QMcypNaG9doKsqcDMsxOG4ehSw+XYV
 AMBO3sAEkKopkoe0NrtDtojHQnisVpOq38J/k6d7w8/wH4qho5S+Og36QqPHFb16pwph
 1s1zAKlCMnuGV93x3iFGu1A88WUD+EWx1JvrhS3Nx/ksz6ftPJGcoedv+p2s1uLutNia
 UXUlVO5SnbxnNzDDwxgGWBe26mSDZhZYLtgSfQXca6PkUgEB7VNAQDrSE/w3nVpW04hU
 kU3V6acQEq3tGikCB31p530ERO5FzWJm6dApN0gO4hryYks2WmqjzU5eSXNHXlwn9LjC
 CiLg==
X-Gm-Message-State: APjAAAWwc2/XDoPBREvNK9QjuCWcuBloQeZZdt+tppo9H6pXdpPRQvz9
 kDXYjEvhS2RGLJRIyv33nvBYLRj3Yd0sgwcCxFhGcW8nCRo=
X-Google-Smtp-Source: APXvYqwrXuoZs5Qj0wUZXXcuQ8vR0veh2xdM2EtyQ5rw3qqaGDEEZqythikghE9Gnn7atQjAWtx88cU0sl7MeSF04Xw=
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr4853351wmh.102.1560453821564; 
 Thu, 13 Jun 2019 12:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175047.18176-1-afl2001@gmail.com>
In-Reply-To: <20190613175047.18176-1-afl2001@gmail.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Thu, 13 Jun 2019 21:23:30 +0200
Message-ID: <CAMO6naw_PvmiXpNNnF-9ASrP1DmkxqnBCKhB1UBn0m4cb_LunQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add tsin pins for meson-gxbb/gxl/gxm
To: afl1 <afl2001@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_122344_063995_47942D3F 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi afl1,
On Thu, Jun 13, 2019 at 7:51 PM afl1 <afl2001@gmail.com> wrote:
>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 31 ++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 13 +++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index 4edeb4cae72a..6de3d58277a1 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -237,10 +237,21 @@ static const unsigned int hdmi_hpd_pins[] = { GPIOH_0 };
>  static const unsigned int hdmi_sda_pins[]      = { GPIOH_1 };
>  static const unsigned int hdmi_scl_pins[]      = { GPIOH_2 };
>
> +static const unsigned int tsin_a_d_valid_pins[] = { GPIOY_0 };
> +static const unsigned int tsin_a_sop_pins[]    = { GPIOY_1 };
> +static const unsigned int tsin_a_clk_pins[]    = { GPIOY_2 };
> +static const unsigned int tsin_a_d0_pins[]     = { GPIOY_3 };
> +static const unsigned int tsin_a_dp_pins[]     = { GPIOY_4, GPIOY_5, GPIOY_6, GPIOY_7, GPIOY_8, GPIOY_9, GPIOY_10 };
> +static const unsigned int tsin_a_fail_pins[]   = { GPIOY_11 };
>  static const unsigned int i2s_out_ch23_y_pins[]        = { GPIOY_8 };
>  static const unsigned int i2s_out_ch45_y_pins[]        = { GPIOY_9 };
>  static const unsigned int i2s_out_ch67_y_pins[]        = { GPIOY_10 };
>
> +static const unsigned int tsin_b_d_valid_pins[] = { GPIOX_6 };
> +static const unsigned int tsin_b_sop_pins[]    = { GPIOX_7 };
> +static const unsigned int tsin_b_clk_pins[]    = { GPIOX_8 };
> +static const unsigned int tsin_b_d0_pins[]     = { GPIOX_9 };
> +
>  static const unsigned int spdif_out_y_pins[]   = { GPIOY_12 };
>
>  static const unsigned int gen_clk_out_pins[]   = { GPIOY_15 };
> @@ -443,8 +454,18 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
>         GROUP(pwm_a_x,          3,      17),
>         GROUP(pwm_e,            2,      30),
>         GROUP(pwm_f_x,          3,      18),
> +       GROUP(tsin_b_d_valid,   3,      9),
> +       GROUP(tsin_b_sop,       3,      8),
> +       GROUP(tsin_b_clk,       3,      10),
> +       GROUP(tsin_b_d0,        3,      7),
>
>         /* Bank Y */
> +       GROUP(tsin_a_fail,      3,      3),
> +       GROUP(tsin_a_d_valid,   3,      2),
> +       GROUP(tsin_a_sop,       3,      1),
> +       GROUP(tsin_a_clk,       3,      0),
> +       GROUP(tsin_a_d0,        3,      4),
> +       GROUP(tsin_a_dp,        3,      5),
>         GROUP(uart_cts_c,       1,      19),
>         GROUP(uart_rts_c,       1,      18),
>         GROUP(uart_tx_c,        1,      17),
> @@ -607,6 +628,14 @@ static const char * const gpio_periphs_groups[] = {
>         "GPIOX_20", "GPIOX_21", "GPIOX_22",
>  };
>
> +static const char * const tsin_a_groups[] = {
> +       "tsin_a_clk", "tsin_a_sop", "tsin_a_d_valid", "tsin_a_d0",
> +       "tsin_a_dp", "tsin_a_fail",
> +};
> +static const char * const tsin_b_groups[] = {
> +       "tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
> +};
> +
>  static const char * const emmc_groups[] = {
>         "emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
>  };
> @@ -798,6 +827,8 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
>         FUNCTION(i2s_out),
>         FUNCTION(spdif_out),
>         FUNCTION(gen_clk_out),
> +       FUNCTION(tsin_a),
> +       FUNCTION(tsin_b),
>  };
>
>  static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 0c0a5018102b..c14090a56b61 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -246,6 +246,10 @@ static const unsigned int tsin_a_fail_pins[]       = { GPIODV_11 };
>  static const unsigned int tsin_a_dp_pins[] = {
>         GPIODV_1, GPIODV_2, GPIODV_3, GPIODV_4, GPIODV_5, GPIODV_6, GPIODV_7,
>  };
> +static const unsigned int tsin_b_clk_pins[]    = { GPIOH_6 };
> +static const unsigned int tsin_b_d0_pins[]     = { GPIOH_7 };
> +static const unsigned int tsin_b_sop_pins[]    = { GPIOH_8 };
> +static const unsigned int tsin_b_d_valid_pins[] = { GPIOH_9 };
>
>  static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
>         MESON_PIN(GPIOAO_0),
> @@ -460,6 +464,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>         GROUP(i2s_out_lr_clk,   6,      24),
>         GROUP(i2s_out_ch01,     6,      23),
>         GROUP(spdif_out_h,      6,      28),
> +       GROUP(tsin_b_d0,        6,      17),
> +       GROUP(tsin_b_sop,       6,      18),
> +       GROUP(tsin_b_d_valid,   6,      19),
> +       GROUP(tsin_b_clk,       6,      20),
>
>         /* Bank DV */
>         GROUP(uart_tx_b,        2,      16),
> @@ -694,6 +702,10 @@ static const char * const tsin_a_groups[] = {
>         "tsin_a_d_valid", "tsin_a_d0",
>         "tsin_a_dp", "tsin_a_fail",
>  };
> +static const char * const tsin_b_groups[] = {
> +       "tsin_b_clk", "tsin_b_sop",
> +       "tsin_b_d_valid", "tsin_b_d0",
> +};
>
>  static const char * const gpio_aobus_groups[] = {
>         "GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
> @@ -770,6 +782,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
>         FUNCTION(spdif_out),
>         FUNCTION(eth_led),
>         FUNCTION(tsin_a),
> +       FUNCTION(tsin_b),
>  };
>
>  static struct meson_pmx_func meson_gxl_aobus_functions[] = {
> --
> 2.17.1
>

Thank you for working on the meson pinctrl.

When sending a patch, please always make sure that:
 - You are sending a full commit, including a commit message that
explains your changes. Commit your changes locally, and then you can
use something like 'git send-email'
 - You are rebased on a recent iteration of the kernel (e.g latest
-rc, or even better, the amlogic arch integ tree:
https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git).
Your patch applies so maybe you already did that.
 - You send it to the correct people / lists. You can get this
information by running './scripts/get_maintainer.pl
drivers/pinctrl/meson/'
 - You sign-off the commit, by adding "Signed-off-by: afl1
<afl2001@gmail.com>" at the end of the commit description. If you have
a real name, feel free to use it :P .
 - You run your patch through checkpatch, e.g './scripts/checkpatch.pl
--strict -g HEAD'

Cheers,
Maxime


>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
