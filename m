Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069C0C48BD6
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A3620644
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccXcKxgj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kzRyVXO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6A3620644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JxS7ciop+JoUe1mc5n768UBRA96iAfN31V4acOlgEYg=; b=ccXcKxgj0pP+Rdz6Sh2xiy56u6
	Ma45wwE05+kELMIWJtKTR2xMz2iHTCDyxbdSboHp7+HGwZE3OUUuo/UdC2qdXqJql/SdRIyTb96hs
	KFA0508apGOiPFsY/6IcZsx5Z1DcVopAp3aWnd35uOtGncjCZnZiKSRJPOVMKdv+/RO3NdAIfCFJD
	ZhreANyM6pWWJoO1H3xmS2M+SV7E8Lnm/BOW5i8KY7MZLAATXNxOjRDlFRWKBig6Ydi0Jw0RanP9i
	TwMVH/xlSSZSohIx49QcoA8itemjHkvQ6L1FPfUnkmmJD1bUSCWBhovymnJUB9As0ODlJVNvv2qHs
	VVqFdpgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3si-0002TS-KG; Wed, 26 Jun 2019 09:06:20 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3sd-0002T4-RH
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 09:06:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id c2so1768226wrm.8
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F0/plHWRpIjD5hmrxcN6GKwnEELaggCF4StxkAxpwd8=;
 b=kzRyVXO36D1JuIt7BUBRjYHvSM4GxdBFO3jmMhJ+PPMS60JsBkI8T05TcQSc5+AUhe
 r0iM9gsKUeb+toxZvO7JdPSMwasCNuMViit7OVd10kZ7iVYSLvU2/wGee8DoLA1kwWUL
 uq8nHRTaQVYKT5Y389a8pOMgzcIBBrukLX8cqooYL4sUfTotpVpSm78UAYPFuGnAl/lB
 KgdnP+XP9ho9S58gtuOm7Eu4KcKH8JvJvHuy2FxR28cKZWLiAnd3ytuGtW7O/053VkbU
 vOu2dhaiGFHLvVYdwhGyQEinUrV6SF6C4qE6LdeOnATm/5qIvkHYXrTwp2+x/N/HfiLO
 qi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F0/plHWRpIjD5hmrxcN6GKwnEELaggCF4StxkAxpwd8=;
 b=OFy27BluoKVe+F3swskOIF8yQTSFse+scZJIk4P3QhzLBcKBNxgOirXlhE6RZYS8Wq
 ThmuZcoZ7qAxgot/33YAdtsqcKPBhFWgFOYRwLbmu70uGSrIXclDVZXlkwGPK/O5AIgD
 8lq0wQlkcrvrNhHpZchvFmfQysdeElDXCDDnwzLbzBEi+CzeY2NG44nRYskXQzgML6eX
 b/b28kfTt/+qFZ3UM7oSM2G5GXalq6s/76avgztre4UoXwdISY8xe6xu0KQZCaWCZm3H
 U2g46JLWktuoCkmXD+oXaNEaAFoPWMw9spnarPethF1bwIIUmV56jtn6chFRfeZ8h3N/
 X6UQ==
X-Gm-Message-State: APjAAAUlFN29s2oZq3Ned4VLheaQJEn/SgyRR3VmkxMDp8FFPawJXhZ3
 rVDiTJIp1w9E6LNu8kieVTPbeTWFhFE=
X-Google-Smtp-Source: APXvYqyQgSsiThi9rCdtXHpfxet3nWkouBo0DJRQJ1cITVbBvW0boVef7AKJFIkXAewPXhuigWR8OQ==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr2626441wrw.323.1561539974099; 
 Wed, 26 Jun 2019 02:06:14 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 67sm2045875wmd.38.2019.06.26.02.06.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 02:06:13 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: meson: add missing tsin pinctrl for meson
 gxbb/gxl
To: afl1 <afl2001@gmail.com>, linux-amlogic@lists.infradead.org
References: <20190615075902.32341-1-afl2001@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b8e467d3-16a8-519d-440e-fbb316df48a6@baylibre.com>
Date: Wed, 26 Jun 2019 11:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190615075902.32341-1-afl2001@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_020615_890478_B9527DC9 
X-CRM114-Status: GOOD (  17.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15/06/2019 09:59, afl1 wrote:
> This patch adds missing tsin pinctrl definitions
> for meson gxbb and gxl/gxm.
> 
> Signed-off-by: afl1 <afl2001@gmail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 35 ++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 27 +++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index 4edeb4cae72a..63a25b5bc4c0 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -237,10 +237,24 @@ static const unsigned int hdmi_hpd_pins[]	= { GPIOH_0 };
>  static const unsigned int hdmi_sda_pins[]	= { GPIOH_1 };
>  static const unsigned int hdmi_scl_pins[]	= { GPIOH_2 };
>  
> +static const unsigned int tsin_a_d_valid_pins[] = { GPIOY_0 };
> +static const unsigned int tsin_a_sop_pins[]	= { GPIOY_1 };
> +static const unsigned int tsin_a_clk_pins[]	= { GPIOY_2 };
> +static const unsigned int tsin_a_d0_pins[]	= { GPIOY_3 };
> +static const unsigned int tsin_a_dp_pins[]	= {
> +	GPIOY_4, GPIOY_5, GPIOY_6, GPIOY_7, GPIOY_8, GPIOY_9, GPIOY_10
> +};
> +
> +static const unsigned int tsin_a_fail_pins[]	= { GPIOY_11 };
>  static const unsigned int i2s_out_ch23_y_pins[]	= { GPIOY_8 };
>  static const unsigned int i2s_out_ch45_y_pins[]	= { GPIOY_9 };
>  static const unsigned int i2s_out_ch67_y_pins[]	= { GPIOY_10 };
>  
> +static const unsigned int tsin_b_d_valid_pins[] = { GPIOX_6 };
> +static const unsigned int tsin_b_sop_pins[]	= { GPIOX_7 };
> +static const unsigned int tsin_b_clk_pins[]	= { GPIOX_8 };
> +static const unsigned int tsin_b_d0_pins[]	= { GPIOX_9 };
> +
>  static const unsigned int spdif_out_y_pins[]	= { GPIOY_12 };
>  
>  static const unsigned int gen_clk_out_pins[]	= { GPIOY_15 };
> @@ -443,8 +457,18 @@ static struct meson_pmx_group meson_gxbb_periphs_groups[] = {
>  	GROUP(pwm_a_x,		3,	17),
>  	GROUP(pwm_e,		2,	30),
>  	GROUP(pwm_f_x,		3,	18),
> +	GROUP(tsin_b_d_valid,	3,	9),
> +	GROUP(tsin_b_sop,	3,	8),
> +	GROUP(tsin_b_clk,	3,	10),
> +	GROUP(tsin_b_d0,	3,	7),
>  
>  	/* Bank Y */
> +	GROUP(tsin_a_fail,	3,	3),
> +	GROUP(tsin_a_d_valid,	3,	2),
> +	GROUP(tsin_a_sop,	3,	1),
> +	GROUP(tsin_a_clk,	3,	0),
> +	GROUP(tsin_a_d0,	3,	4),
> +	GROUP(tsin_a_dp,	3,	5),
>  	GROUP(uart_cts_c,	1,	19),
>  	GROUP(uart_rts_c,	1,	18),
>  	GROUP(uart_tx_c,	1,	17),
> @@ -607,6 +631,15 @@ static const char * const gpio_periphs_groups[] = {
>  	"GPIOX_20", "GPIOX_21", "GPIOX_22",
>  };
>  
> +static const char * const tsin_a_groups[] = {
> +	"tsin_a_clk", "tsin_a_sop", "tsin_a_d_valid", "tsin_a_d0",
> +	"tsin_a_dp", "tsin_a_fail",
> +};
> +
> +static const char * const tsin_b_groups[] = {
> +	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
> +};
> +
>  static const char * const emmc_groups[] = {
>  	"emmc_nand_d07", "emmc_clk", "emmc_cmd", "emmc_ds",
>  };
> @@ -798,6 +831,8 @@ static struct meson_pmx_func meson_gxbb_periphs_functions[] = {
>  	FUNCTION(i2s_out),
>  	FUNCTION(spdif_out),
>  	FUNCTION(gen_clk_out),
> +	FUNCTION(tsin_a),
> +	FUNCTION(tsin_b),
>  };
>  
>  static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 0c0a5018102b..984d0e2086a5 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -247,6 +247,17 @@ static const unsigned int tsin_a_dp_pins[] = {
>  	GPIODV_1, GPIODV_2, GPIODV_3, GPIODV_4, GPIODV_5, GPIODV_6, GPIODV_7,
>  };
>  
> +static const unsigned int tsin_b_clk_pins[]	= { GPIOH_6 };
> +static const unsigned int tsin_b_d0_pins[]	= { GPIOH_7 };
> +static const unsigned int tsin_b_sop_pins[]	= { GPIOH_8 };
> +static const unsigned int tsin_b_d_valid_pins[] = { GPIOH_9 };
> +
> +static const unsigned int tsin_b_fail_z4_pins[] = { GPIOZ_4 };
> +static const unsigned int tsin_b_clk_z3_pins[]	= { GPIOZ_3 };
> +static const unsigned int tsin_b_d0_z2_pins[]	= { GPIOZ_2 };
> +static const unsigned int tsin_b_sop_z1_pins[]	= { GPIOZ_1 };
> +static const unsigned int tsin_b_d_valid_z0_pins[] = { GPIOZ_0 };
> +
>  static const struct pinctrl_pin_desc meson_gxl_aobus_pins[] = {
>  	MESON_PIN(GPIOAO_0),
>  	MESON_PIN(GPIOAO_1),
> @@ -444,6 +455,11 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GROUP(eth_txd1,		4,	12),
>  	GROUP(eth_txd2,		4,	11),
>  	GROUP(eth_txd3,		4,	10),
> +	GROUP(tsin_b_fail_z4,	3,	15),
> +	GROUP(tsin_b_clk_z3,	3,	16),
> +	GROUP(tsin_b_d0_z2,	3,	17),
> +	GROUP(tsin_b_sop_z1,	3,	18),
> +	GROUP(tsin_b_d_valid_z0, 3,	19),
>  	GROUP(pwm_c,		3,	20),
>  	GROUP(i2s_out_ch23_z,	3,	26),
>  	GROUP(i2s_out_ch45_z,	3,	25),
> @@ -460,6 +476,10 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
>  	GROUP(i2s_out_lr_clk,	6,	24),
>  	GROUP(i2s_out_ch01,	6,	23),
>  	GROUP(spdif_out_h,	6,	28),
> +	GROUP(tsin_b_d0,	6,	17),
> +	GROUP(tsin_b_sop,	6,	18),
> +	GROUP(tsin_b_d_valid,	6,	19),
> +	GROUP(tsin_b_clk,	6,	20),
>  
>  	/* Bank DV */
>  	GROUP(uart_tx_b,	2,	16),
> @@ -695,6 +715,12 @@ static const char * const tsin_a_groups[] = {
>  	"tsin_a_dp", "tsin_a_fail",
>  };
>  
> +static const char * const tsin_b_groups[] = {
> +	"tsin_b_clk", "tsin_b_sop", "tsin_b_d_valid", "tsin_b_d0",
> +	"tsin_b_clk_z3", "tsin_b_sop_z1", "tsin_b_d_valid_z0", "tsin_b_d0_z2",
> +	"tsin_b_fail_z4",
> +};
> +
>  static const char * const gpio_aobus_groups[] = {
>  	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
>  	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
> @@ -770,6 +796,7 @@ static struct meson_pmx_func meson_gxl_periphs_functions[] = {
>  	FUNCTION(spdif_out),
>  	FUNCTION(eth_led),
>  	FUNCTION(tsin_a),
> +	FUNCTION(tsin_b),
>  };
>  
>  static struct meson_pmx_func meson_gxl_aobus_functions[] = {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Please keep this in resends, and resend to linux-gpio@vger.kernel.org and other lists reported by get-maintainer.pl

And in future resends, please add a number "PATCH v3" to identify them, and add a changelog
under the --- line of the patch.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
