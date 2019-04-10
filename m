Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E5EC10F14
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 08:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8B9204FD
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 08:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mdu7mzTZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WWIAzm+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8B9204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPc1m1Pq1z8R+PL1Bo4nMvdP5sQY/YtC91i0OYAJj18=; b=Mdu7mzTZnmLMop
	bTuHhh8ZOh2TG4wULtD9uYpWgaZSseFkOxq7GDZQ/92/Ci7j+DpAYAGlIPDs7JKVI1pscUmiDEfNN
	sZjSRMpwvqGUBYqiCQooe9dTIcCSFgBw57x2fFIolrcQ+dpHm+1iV92x642S2ny9KF9RL82e26cD0
	7TqDzyj78SKRuiRK4Eq8No+DVezk1NCxUVqI1YBMLREI78UMfLV6f5iC8lwl/aD0KS8PIlITCS454
	P8fur/BOeVosgrca0yHIqz03YrY1KQ+AwIgWBUu5k+cH4jtyWO9RTfJCq76hB0GWVTNMvGjMdgPNv
	9R/xMaEAzZdBDF36NpQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE8Rc-0006Pl-5q; Wed, 10 Apr 2019 08:18:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE8RX-0006O2-Ne
 for linux-amlogic@lists.infradead.org; Wed, 10 Apr 2019 08:18:53 +0000
Received: by mail-wr1-x442.google.com with SMTP id k11so1792250wro.5
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2019 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=c/t4IY/MnYrWW5FDOYJfXyPINrnL8V/TKXDd33NmmxA=;
 b=WWIAzm+IdF6YmOw3QUFk1T/4VHAVWI5FTa1EZaWCYSUFXBH000Xp0LrhU+a3qeo1ww
 GBjsulSzrYAT826leLo27rmEyZkNt8XY76cJE6TO9XQW1CJjQneKNRFarAJdjco3goxf
 UFtajIUEG5cv4V6evGEO+5eJaPnStPOlJ8+OimlrVCvYjzwZ91/6SVS6ty+y8/gKLuHp
 AgGR87E7jlpiqrO5hv58mx+fPbVhC3TK1kN+5jBQWWG48lkwv/VYlavqKe6KCf5lA/qc
 cVj/LI9drdl6/79klx16z6ebWa/M3sDzfYIZVuS/uQl9WJlhhz4dfEWJg1tJmgMlkfzL
 d23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=c/t4IY/MnYrWW5FDOYJfXyPINrnL8V/TKXDd33NmmxA=;
 b=Xy2U00akV/IoaKaQyucGzF2+5Yt5+WewKN/9plhsoaEnIbqnlMZiVXNsgHTMg2DV/K
 68gCzBUF5ZtSmYr/HMw9FbGX1ETM49Iv0YOKIjzdljYFWBqD8pgeX9s56GUK697otv4h
 dfRtdWewBnkPwN/Po4CHv1zoi3uzAACnvMM3Wb28lTJes4KwFFvCtk2EFedv1erAwgga
 LEqEMGjTrITqSC3aFAl85oa/Vs7r/TNDb3kFx0Nw+T9dxefkUVgYyqEpcTw0a6dgU2AY
 HUpTD8O1j9qa4cXmNM4v1CKNHM7dXkuPtxy0FpHijvXXs0rxx7raGu+M52ffQ6eRP6Yh
 6kOQ==
X-Gm-Message-State: APjAAAWg6KWJrsJrWaxIiCxVZ/lpoq3fPTeYjoXcdzDupBkv2vd0/jJz
 pNXDLekbJcSvFOStp0Zku7+QYw==
X-Google-Smtp-Source: APXvYqwrIvrq3m2W6jy0s7e2Dn9od77lyLi3llLhG1tE+B82TNw7l9/9YXiKXslNPUF8nNc1V3JlkQ==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr25846964wrr.230.1554884330117; 
 Wed, 10 Apr 2019 01:18:50 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 c10sm40362252wrt.65.2019.04.10.01.18.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Apr 2019 01:18:49 -0700 (PDT)
Message-ID: <ece510f7d393e4b04c920e88968e9bb41cde6b14.camel@baylibre.com>
Subject: Re: [v2 PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by
 devm_clk_get_optional()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>
Date: Wed, 10 Apr 2019 10:18:47 +0200
In-Reply-To: <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
 <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_011851_918594_6F5CDD5D 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: David Brown <david.brown@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org,
 Andy Gross <andy.gross@linaro.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-04-10 at 14:13 +0800, Chunfeng Yun wrote:
> Use devm_clk_get_optional() to get optional clock
> 
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> v2: add Acked-by Martin Blumenstingl
> ---
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> index 148ef0bdb9c1..4cbee412f2b0 100644
> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
> @@ -261,14 +261,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
>  
> -	priv->clk = devm_clk_get(dev, "phy");
> -	if (IS_ERR(priv->clk)) {
> -		ret = PTR_ERR(priv->clk);
> -		if (ret == -ENOENT)
> -			priv->clk = NULL;
> -		else
> -			return ret;
> -	}
> +	priv->clk = devm_clk_get_optional(dev, "phy");
> +	if (IS_ERR(priv->clk))
> +		return PTR_ERR(priv->clk);
>  
>  	priv->reset = devm_reset_control_get_optional_shared(dev, "phy");
>  	if (IS_ERR(priv->reset))



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
