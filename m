Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A406C67872
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 08:53:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2298320672
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 08:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="twjHeZ1i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b/0V1/Iu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2298320672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZzhDWS5TScfn/RJ0gSANE3fxKpYzSWOJvyRvbc+ubA=; b=twjHeZ1ixGivWy
	48kyZAfCK6z4/YqNaLadrb+kQmr6fZ/wyNadRppOWiGZae9apBWAI0dx8jIaYxzO/9mou4FDgbIqp
	XiWqK09x76GVSHm/M6kk2uTN+Qpi5JPaCjWdDJ/kVRbNfCM9RWmc5pNgz3mbD69BOaMQ5C4CRqduu
	jAkIY/wZRTUEIJ4td+sbTgmY/MlNih9n1FcwfKylnMGEOCB6CGorWZ2iiG2upwZ/qHQwpgbHmFYAb
	EV+5vGCU8k1fCuei/X/JIHPp4bxTfXQz/0uC8C5uwnOFBPn+ciE+IH7nR02TS6osZSacfvj5KR33N
	p/PZ4Izf486cMzzejnlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXMkL-0003cC-Ur; Thu, 13 Dec 2018 08:53:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXMk6-0003Kh-Jw
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 08:53:18 +0000
Received: by mail-wr1-x442.google.com with SMTP id q18so1090335wrx.9
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 00:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6/Irh3/0npcPy69nhVVg258eNFc0df0dV7pRNRrxaCA=;
 b=b/0V1/IuASfW/tPVKQcfO7QEZz3x+TP4TRe+dvyNftip44W9Gi4+HSluesf0KoE9ds
 0NCbn3xs7lrQf5vo41JQJzh09QXXd8Io+h1or0YmuLpMbKTbaQdLWxmaPh3RAJzpkSGu
 G8pl3JBmJvxfXm0ZJaK3qa4JNlhYBgtUfvzyhNTvcuV2G2PjcIUXm3SuPraEmI8IUDxo
 vE3BFoyemj7oJYNguC8TJMAxIFrW9IUuOXvbDKw7yuDGA2khavSfIMLIc+O4yFENGIPJ
 piOp1E7idRldAtcDPn0oAenYww9R8kP/2gJkuFKAgdae9VkAt0xMoi/RoPCNKRzJpfDf
 H1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6/Irh3/0npcPy69nhVVg258eNFc0df0dV7pRNRrxaCA=;
 b=DJJNiZv/+i04NVOY6VTfqPFY4fduXZapqyx2VPs3+sUD3D4krBYzfKXIV8MBizYYbq
 E06BQenlR+0nHkcBxbh5ZtQGPKIyxsvb9M+f46yeOTXU+x+7eiDq2LkCLC7UTfc32ja+
 cL9G9wQ3S7BEdyavGtgUYTD/E6d8y6AxSZkEsQW+NTDHvbJG8/qdrMNBFxOqH4xU0xxi
 HwEo2dlHN2WnqPbp8CG3htKcPxFjYlUw64M46zwuCV1Kfj4HER0eplhy+D5VcK+5q4nC
 Da3zikVvOFW0MRrMW1BiU2eXGX5l0q+obRTDP0LLDbvg9CSzcSd9nR+9Wc+OkVLfBFjH
 ahWw==
X-Gm-Message-State: AA+aEWaGwXFZlB9vfSAcBvP/cN5rXdVu2crsnml26lbpluQuNGrr9j+t
 3aWA+YpU7fW/3GI69kg0RgSqVA==
X-Google-Smtp-Source: AFSGD/UPTkx1RJPg3Ktv6CqscyAap/dz326hOEhPKaFMyrqdhYYkBaKE7F+6qbFjcwj6MpWXAl8ZNg==
X-Received: by 2002:adf:b783:: with SMTP id s3mr21310084wre.274.1544691182605; 
 Thu, 13 Dec 2018 00:53:02 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:4ce:ea00:a5f8:3197:dbfa:c157?
 ([2a01:cb1d:4ce:ea00:a5f8:3197:dbfa:c157])
 by smtp.gmail.com with ESMTPSA id 129sm1363145wmd.18.2018.12.13.00.53.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Dec 2018 00:53:01 -0800 (PST)
Subject: Re: [PATCH v2 2/3] spi: meson-axg: enhance output enable feature
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>
References: <1544690354-16409-1-git-send-email-sunny.luo@amlogic.com>
 <1544690354-16409-3-git-send-email-sunny.luo@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6ba11b0a-3629-5378-61c7-3cc364237f5c@baylibre.com>
Date: Thu, 13 Dec 2018 09:53:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1544690354-16409-3-git-send-email-sunny.luo@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_005314_797919_6E693778 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Sunny,

On 13/12/2018 09:39, Sunny Luo wrote:
> The SPICC controller in Meson-AXG is capable of driving the CLK/MOSI/SS
> signal lines through the idle state (between two transmission operation),
> which avoid the signals floating in unexpected state.

This is welcome, because it's really missing on GX...
I tried implementing it with pinctrl at [1], but it's complex.

Can you provide more info on how we should implement in on GX to be on par ?

[1] https://github.com/superna9999/linux/commit/9c3a95659dd532d186556c1570c54d79ea5a4d45

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
> @@ -453,6 +474,8 @@ static int meson_spicc_prepare_message(struct spi_master *master,
>  
>  	writel_bits_relaxed(BIT(24), BIT(24), spicc->base + SPICC_TESTREG);
>  
> +	meson_spicc_oen_enable(spicc);
> +
>  	return 0;
>  }
>  
> @@ -610,11 +633,12 @@ static int meson_spicc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct meson_spicc_data meson_spicc_gx_data = {
> -	.max_speed_hz	= 30000000,
> +	.max_speed_hz		= 30000000,

Nitpick, but I would have kept the indentation here ...

>  };
>  
>  static const struct meson_spicc_data meson_spicc_axg_data = {
> -	.max_speed_hz	= 80000000,
> +	.max_speed_hz		= 80000000,
> +	.has_oen		= true,

same here

>  };
>  
>  static const struct of_device_id meson_spicc_of_match[] = {
> 

Anywy it's nitpick,

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
