Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B062C46CA1
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Sep 2023 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0ixxalFgdSOwHWN55P2n4LvM2c/ycFHH90pK8hR5Ys=; b=qGDkDXWi5bgPUr
	c8i6T/LITeqNWTgcWbLTlA3be+aeYQxFo0/2Mtl7+L48mAVfE+V8P+VGxlCSiS0zkPu05eMRfcmOb
	9RQ97pxG4KK8YZMfXA872FG+7Vck/uAByligNccwhz10h/lylHhga3nYv5Sbv3AM0roq+K09y47iB
	irknI4CEojvQFeHPHO9vduurlf3wfPt0tZ66GeaaC9SaDOe/9eW2Q7uwAi+WadeTzBnI8QBLflKIC
	dOEgQvhXPvd4IXx0eAjh0118LXVDQzhHs7Dr2vxgHnqr68rDiHBPrwLye6RPYUkuLQ3ZCS5xeYrO6
	GZyh/ktLfX5m9Vw7Qncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJfj-00G90u-2O;
	Mon, 18 Sep 2023 19:12:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJfg-00G8yA-36;
	Mon, 18 Sep 2023 19:12:38 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9338e4695so77945691fa.2;
        Mon, 18 Sep 2023 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695064341; x=1695669141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymg444KdzoYqbAJJDaXLrEYL/H+uXP42VM/AMIopDrc=;
        b=DI+/XBlD/fsiiNX2OSHNi/qpkWPXWVTIdyxOS4jX5hLSnninMrNG3/cTB7LXTSSwQr
         bq+e8conccy/8uxPD9OSY2pj6TA3NvJ9T90UbGHJ7veiuODGDt5Sze3EwRH3Awkndfub
         fR9WutElesmFDHN1GHUpV4fux+Pf9830YKjiBpfUHHzcEK111yPHqT79DjqiCgqf4tOX
         BkFjcjASCSbzdgPOeYvsUEUDSBQkjaAbMwAiSZuam7ctWv5qXlnX/8l9ZXc+e1HCUOky
         fYsQAH7Vfr209fsqzVfVimzKFnEld7CZ6IeGFhvdP02aAPtfKXhB3O0AiSiLcpqn+9Pt
         fjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695064341; x=1695669141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymg444KdzoYqbAJJDaXLrEYL/H+uXP42VM/AMIopDrc=;
        b=COclzMm8RssubckzEWno9J01ufuZLsH72oYRtCf5naZ8WXFZmBiooJyNgsmrIPxMN+
         LjEKjH6FiVGb9reCcK6EyEp0GgXdHqzjhDZTaXZ3vostGZTjzqZUBJDeRW1nfIsCPV5P
         36eUbi49q9NJeZbJktCdwHnDsFBJw85r5lwDOZU47xCHFK7zm/YrnW8FFDlO5vMzdb8Y
         CNSX3TzjJY9da2EVTBfFMWtJXfcwVBETVD1h5JN0sOSAXnLzNQhTT/q8zKOicggFjhyJ
         TXKUpZa/oNZS7mvDvaZ+0HvqtwhNUDbf6L3fl8RZz0v9XtdauKRr69DjVuWinDoIi/uV
         q1mg==
X-Gm-Message-State: AOJu0YyBTpwh8h8lP6lxzL1NUp8p94TqPDw50mj/OLaf7VTa3O7nUFaM
	e/9Zd1A4ofVl2HtcRfw+cPw=
X-Google-Smtp-Source: AGHT+IFjg/ob0U+8PEhUDzZxfqbyJQBZc1GsvUR1GE+uNr8GDm+7qXSDDyadXaGQKQJr0ryj693ksg==
X-Received: by 2002:a2e:700d:0:b0:2bf:6852:9339 with SMTP id l13-20020a2e700d000000b002bf68529339mr8798200ljc.3.1695064340742;
        Mon, 18 Sep 2023 12:12:20 -0700 (PDT)
Received: from mobilestation ([85.140.3.118])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm2221659lji.34.2023.09.18.12.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:12:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:11:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 02/23] net: stmmac: dwmac-dwc-qos-eth: use
 devm_stmmac_probe_config_dt()
Message-ID: <d3vpg5jcgfoe5qpreh2hnworsa2ly3ufrgqi4mcxx2yzfs7eoy@w2hgimsg64hp>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_121237_000003_79C36F79 
X-CRM114-Status: GOOD (  19.38  )
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

Hi Jisheng

On Sat, Sep 16, 2023 at 03:58:08PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index 61ebf36da13d..ec924c6c76c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -435,15 +435,14 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(stmmac_res.addr))
>  		return PTR_ERR(stmmac_res.addr);
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
>  
>  	ret = data->probe(pdev, plat_dat, &stmmac_res);
>  	if (ret < 0) {

>  		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
> -
> -		goto remove_config;
> +		return ret;

just "return dev_err_probe()".

-Serge(y)

>  	}
>  
>  	ret = dwc_eth_dwmac_config_dt(pdev, plat_dat);
> @@ -458,25 +457,17 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  
>  remove:
>  	data->remove(pdev);
> -remove_config:
> -	stmmac_remove_config_dt(pdev, plat_dat);
>  
>  	return ret;
>  }
>  
>  static void dwc_eth_dwmac_remove(struct platform_device *pdev)
>  {
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -	const struct dwc_eth_dwmac_data *data;
> -
> -	data = device_get_match_data(&pdev->dev);
> +	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
>  
>  	stmmac_dvr_remove(&pdev->dev);
>  
>  	data->remove(pdev);
> -
> -	stmmac_remove_config_dt(pdev, priv->plat);
>  }
>  
>  static const struct of_device_id dwc_eth_dwmac_match[] = {
> -- 
> 2.40.1
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
