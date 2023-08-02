Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FCDC001DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EogNm0YPILC6STH4CbywSEOhV8r74nSGyNKrjKELWeU=; b=Cv8dN1Jl06i+xm
	VvIk3WImyIoPcECN9lAhMK+3gpdzQrOK3JVrEGXGxwbXoC+fVk+veOiaEFfOYvMw+KYOla9J2zqDu
	p/xk2YZduX76CkZnTVrucmZoSXsH1KXb0ztbEw3tpom7Ju+JAtDFvHp5LOD3JSJpNZ6u8TuyoAqQk
	QH9DA9oZhL9l6xQr+WiuvAIUwUTGj4SPVEegLV5KoKaRd7iZDz5FvUit6LnJ24ajsmDDF5Uo8vQrY
	gzTuT+jaRZ4Bs/oO1rp4GLrdgxpljEnCNT0ct1jgjrGtiJF2P0b1UprNvzNhOyDgXto3memXhunBH
	xKCR8YB7cAoV8xNYrkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6Wd-004Hm9-2z;
	Wed, 02 Aug 2023 07:44:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6WZ-004HkN-2F
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Aug 2023 07:44:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31783d02093so5978276f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Aug 2023 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690962240; x=1691567040;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zrfr8demoIbS0/fY7FGFGHUvwM9dqz7KGdFUzvSMnB4=;
        b=SQ0Jmtsd6fDkK+VaTExixKraao2PdwInKoTajuVotP1pQ1FPyv409LVbP9v/bMIqEw
         VoJcEqWxkG1QCm2ugsqmnlRX6nPvEdKEXEYtD4O4lRTI03300HRKUfQqgWvcGmOb5HyP
         wXz1F3U/RzYBlZ6JpHDdtJtpxsDMOJrhp+UWTBI0FlWZMkt6AVF5KOHBJbv8yoNOjN4A
         MIosrKok2qAQR/tvHmLn+Az/PLp2iGy8Kj/UweBlIeG48eMkxPlua3zHMNlJISEspHz1
         AwAaE+DWWHdW8WNFbFZ0JcgVfRqxmUvR1fC1nF5mpJHwOLJeJ1GyaeaEod0UoJdFT6d9
         N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690962240; x=1691567040;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrfr8demoIbS0/fY7FGFGHUvwM9dqz7KGdFUzvSMnB4=;
        b=W+Bxc9s9SnAioZNLrSgoScqSaK54eaym45bzri9FemYBPSBRu41gPDIUaiEZ4WB3Z7
         qLAUSywPcIsE03j3dWVAkLF90CAzkxSkEZx7fQK3bGJ6IleT/1x9AkdXx7IEM5nq9F4K
         SL3bbPUVUuVyzgvycyLJNudu9+7onzEjhH2o4PVPQIaKYrdUi6DTTtUEkgS3y490krJX
         r/oDj9x2HpJJNqcRfcimTYhkmCyypfZ8mmHLDJJzQ2LJFPe09R1aX/+MGIYlzgXckKNC
         kIMlapsLvOukg8N0gqlNOFFXfnNeUwiTAV/z+YL4CAtCgEmvwub2ll2T8HDrcXeqsDSd
         pE/w==
X-Gm-Message-State: ABy/qLZ4V9iPs8aQnv0sqjDMhrbtWhKtJFFGdDlTZ5tZyY7P6PDAHHTn
	WBZj1EajiHiTi5wCWbXlaPty4w==
X-Google-Smtp-Source: APBJJlHR+6nvvNO3+YmG+iuU8bYWQGf23hXA05GwI6Tl5IAu5Z/Y9z2rBt7aF/BbyZ8pIhHmTV1+5g==
X-Received: by 2002:adf:e883:0:b0:317:6e08:ed35 with SMTP id d3-20020adfe883000000b003176e08ed35mr4518025wrm.1.1690962240440;
        Wed, 02 Aug 2023 00:44:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:43ac:b106:31d5:42b7])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6212000000b003143c6e09ccsm18306002wru.16.2023.08.02.00.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 00:44:00 -0700 (PDT)
References: <CACqvRUZYH2NkOooE78SK6=Ow07y=YnE2QOSNzyb99rV4vSvxpQ@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: mdio-mux-meson-gxl: set RESERVED0 bit in REG2
Date: Wed, 02 Aug 2023 09:43:38 +0200
In-reply-to: <CACqvRUZYH2NkOooE78SK6=Ow07y=YnE2QOSNzyb99rV4vSvxpQ@mail.gmail.com>
Message-ID: <1ja5v9q474.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_004403_940495_F92807EB 
X-CRM114-Status: GOOD (  18.45  )
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


On Tue 01 Aug 2023 at 16:34, Da Xue <da@libre.computer> wrote:

> The first RESERVED register bit needs to be set in order for the PHY
> to come up. Otherwise the ethernet device stays in "No Carrier".
> There's no associated documentation for this register bit in the
> Amlogic datasheets, only the default value to set for the entire
> register.
>
> This register bit is normally set in u-boot so it is not noticed in
> Linux. During my testing with u-boot net disabled, this problem crops
> up.
>
> Signed-off-by: Da Xue <da@libre.computer>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c
> b/drivers/net/mdio/mdio-mux-meson-gxl.c
> index 76188575ca1f..210a52d98112 100644
> --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> @@ -17,6 +17,7 @@
>  #define  REG2_LEDACT           GENMASK(23, 22)
>  #define  REG2_LEDLINK          GENMASK(25, 24)
>  #define  REG2_DIV4SEL          BIT(27)
> +#define  REG2_RESERVED0                BIT(28)
>  #define  REG2_ADCBYPASS                BIT(30)
>  #define  REG2_CLKINSEL         BIT(31)
>  #define ETH_REG3               0x4
> @@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct
> gxl_mdio_mux *priv)
>          * The only constraint is that it must match the one in
>          * drivers/net/phy/meson-gxl.c to properly match the PHY.
>          */
> -       writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
> +       writel(REG2_RESERVED0 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
>                priv->regs + ETH_REG2);
>
>         /* Enable the internal phy */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
