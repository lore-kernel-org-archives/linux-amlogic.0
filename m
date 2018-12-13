Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E24C67872
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 09:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18EAD20870
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 09:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZdqaicg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="f4l+I+Fh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18EAD20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8MbST1AxdvNrxpZz98D4XG6L/gVzwN3hvKvXgFxes4=; b=GZdqaicgoOd5Ek
	z9vzCRr/EfZkdAm57pzmNnJGvzTPqvBgHdZtlPIfge3Y7o2Scv8mGfuVPWeamrD107ngi23eKtR7/
	iYMgLg2tdHClDCYmiZFI9w8BkkIuZrlZvwqW5IFoFHu8lxviaTzQGrUkqAFVB6cAD7w+Ij2H7hO9N
	MhMAxXzT+uQHXaV3gJSurZFFqaDx6NBime67+fK8xpAdF8+5hCw49s/UQjXaN0aL5CHFsP5jp8dua
	2TOEh4hBb8vRK9TKF42p24cM4Ze63ZFWAmTxW6IsaciNzi3uluRfgvn0/fGMJm7RA/7MB99u2bDqb
	odEbHcBVzbe8+WPIk+ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXMvs-00020s-Si; Thu, 13 Dec 2018 09:05:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXMve-0000XJ-RB
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 09:05:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id r10so1124264wrs.10
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=jPsdLOhWZrFU4+GfwGe38ibFTnPqFP1yrEyPZeAAE4g=;
 b=f4l+I+Fhiqcbs2Kg5WrCHxMquiczKPhyM1m7JkTs6cZtjMCsTakSv87uP1ZfLkksuT
 NdMaXiZZQ0yXVHkjiDUbHVPr61cKGrth+lmaK/leweZcdek/S7euyustUGs3o5Ui/wP2
 EghSGc/ebTWk8ojuBv8rJqhjUiuCbZH+QYqveL+J51Sr0NJJFg6n75Qwmx4NxAMeGNnw
 +XwfQhGajCc4q5qqqTUJlp+7ZWqa/HWdxXCfQGEgcBTd0+tQThIuPncLs/vhvPAjYMk3
 VhfvQkV3kDbzWtCT9qAIyhTF0VLV1eCqc7r37NY2/ke+egjtGzlrqiy6u/mWCkQPqQfS
 eskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=jPsdLOhWZrFU4+GfwGe38ibFTnPqFP1yrEyPZeAAE4g=;
 b=Amf/i/rNJBwzf2zV5H7jMi55nKmK7pZg3BsS6QxlmhQIgU+HHpy/7Opgkn4KdkBN/m
 ZhjD7fu07qsYE77Yt3/s7/iLkDV2kPWv4Bo2S9znNzfr28J61TBrnaNbmJZUdS7XTQR9
 1EnyaM32gvmIWTJAgUvWvXBQBdOpTiePFcOWwHQUDiCq7TxZwmKv5P/wOZC5y7bG/NXc
 EiCZw/UfcNls8IIs8E2wGogIrSAs+8QRqbyyeerGxj3LrM8iRklg8MNiS64i5af8VQ6b
 8NkszmSe1hIjmNfoFZlNWfvN3xtJqCcRBmIidIinbJj2ZJdLEo5sqWHcqpxwyvimYP4z
 G5Tw==
X-Gm-Message-State: AA+aEWbtE5376RHTIaqMoo9kczdDi132c9IutBIOr8G5gwDKKpAPD+td
 ZeC/L5PC+lipf7Zj4HPonc4KLg==
X-Google-Smtp-Source: AFSGD/UqSfrsIOYqBArAnoEkSzRdOyDlCp74MmgGNAspvy0KzMVR+x5le8CZd6rUMgcWJjT5ZguViA==
X-Received: by 2002:adf:9246:: with SMTP id 64mr3728393wrj.130.1544691898882; 
 Thu, 13 Dec 2018 01:04:58 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 k128sm1547947wmd.37.2018.12.13.01.04.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 01:04:58 -0800 (PST)
Message-ID: <af721e7a752ca468046de0a4ad1ac4a0c220360c.camel@baylibre.com>
Subject: Re: [PATCH v2 2/3] spi: meson-axg: enhance output enable feature
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>
Date: Thu, 13 Dec 2018 10:04:56 +0100
In-Reply-To: <1544690354-16409-3-git-send-email-sunny.luo@amlogic.com>
References: <1544690354-16409-1-git-send-email-sunny.luo@amlogic.com>
 <1544690354-16409-3-git-send-email-sunny.luo@amlogic.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_010511_013305_617C413F 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2018-12-13 at 16:39 +0800, Sunny Luo wrote:
> The SPICC controller in Meson-AXG is capable of driving the CLK/MOSI/SS
> signal lines through the idle state (between two transmission operation),
> which avoid the signals floating in unexpected state.
> 
> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  drivers/spi/spi-meson-spicc.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index b56249d..0384c28 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -115,6 +115,13 @@
>  
>  #define SPICC_DWADDR	0x24	/* Write Address of DMA */
>  
> +#define SPICC_ENH_CTL0	0x38	/* Enhanced Feature */
> +#define SPICC_ENH_MOSI_OEN		BIT(25)
> +#define SPICC_ENH_CLK_OEN		BIT(26)
> +#define SPICC_ENH_CS_OEN		BIT(27)
> +#define SPICC_ENH_CLK_CS_DELAY_EN	BIT(28)
> +#define SPICC_ENH_MAIN_CLK_AO		BIT(29)
> +
>  #define writel_bits_relaxed(mask, val, addr) \
>  	writel_relaxed((readl_relaxed(addr) & ~(mask)) | (val), addr)
>  
> @@ -123,6 +130,7 @@
>  
>  struct meson_spicc_data {
>  	unsigned int			max_speed_hz;
> +	bool				has_oen;
>  };
>  
>  struct meson_spicc_device {
> @@ -145,6 +153,19 @@ struct meson_spicc_device {
>  	bool				is_last_burst;
>  };
>  
> +static void meson_spicc_oen_enable(struct meson_spicc_device *spicc)
> +{
> +	u32 conf;
> +
> +	if (!spicc->data->has_oen)
> +		return;
> +
> +	conf = readl_relaxed(spicc->base + SPICC_ENH_CTL0) |
> +		SPICC_ENH_MOSI_OEN | SPICC_ENH_CLK_OEN | SPICC_ENH_CS_OEN;
> +
> +	writel_relaxed(conf, spicc->base + SPICC_ENH_CTL0);
> +}
> +
>  static inline bool meson_spicc_txfull(struct meson_spicc_device *spicc)
>  {
>  	return !!FIELD_GET(SPICC_TF,
> @@ -453,6 +474,8 @@ static int meson_spicc_prepare_message(struct spi_master
> *master,
>  
>  	writel_bits_relaxed(BIT(24), BIT(24), spicc->base + SPICC_TESTREG);
>  
> +	meson_spicc_oen_enable(spicc);
> +

Any specific reason for doing this in prepare_message() ? It looks like
something that could/should be done during the probe ?

>  	return 0;
>  }
>  
> @@ -610,11 +633,12 @@ static int meson_spicc_remove(struct platform_device
> *pdev)
>  }
>  
>  static const struct meson_spicc_data meson_spicc_gx_data = {
> -	.max_speed_hz	= 30000000,
> +	.max_speed_hz		= 30000000,
>  };
>  
>  static const struct meson_spicc_data meson_spicc_axg_data = {
> -	.max_speed_hz	= 80000000,
> +	.max_speed_hz		= 80000000,
> +	.has_oen		= true,
>  };
>  
>  static const struct of_device_id meson_spicc_of_match[] = {



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
