Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B008C54EE9
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Sep 2022 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrX1Rip3yGy4uPVViBqTWvwEUNnrc/4e0azQp27uHaE=; b=tE6k7AB7qnXxg4
	cTB7xBm6i2Vh9r0/WyxrJ3272lbPqIWNT3CdmUvVlIhe7HWYKJ3IBA+TKW+NTsNWFK+7QYx83rf0A
	Ve1OO9O1NxwCAeWu2N/aBqPL5ok/GfCOm19YBgOjCkRRtDJAD1F6qAQFYJa62uZ8nZyXD5888La/a
	3RQE72Aq0gXc1Z7oJRzfg1RJxXE193f6jZBDEII+xNpn0fLwnKfocsqYzD8nZ8rwCKNg96SsarjAV
	7YX3x5zHKJzdsIyTXw1WklLLmOCeH2x2rCA/yHdke0ospxWEjgpUsmVw4xx2V7d61bWQchN3J7f4f
	4qpHzJICT3OnAaklyG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGiF-003INv-Ug; Thu, 08 Sep 2022 12:32:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGi2-003IDd-Ij
	for linux-amlogic@lists.infradead.org; Thu, 08 Sep 2022 12:32:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id e20so25770849wri.13
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Sep 2022 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=K4//uLRap3ZN9p7j6IwL1Ekr7qChaDLbj801Pd1B0Hw=;
        b=NFIr1Bmb5KneaaJtNCxyYxeXdSmvFf66jYK8smezhE18XhR1D34721d1lOqHal9qYa
         l00RNF/aP6+FjZ5+Jn32bpEo4Y4hKbyXk+8zSoDo7KzNVurN9SlAdKtgW4YR87PXhjD5
         2+fmnWoNEOQR3nIJvd2ygO2nmY5nmzA9Y2dtFllkQZURR+xLU6EqR8/wFvutgD9VqoTl
         6C+ZSUDd9eV5vave9/PVFAHbFuL618uzI6uyJi+Etm48YujEEKImY9w/fljQ10lk6LSJ
         c5J8avhTHfPQKjOn5u5hBX9qex9FpRzsLt9/GNr/NhCdGoV/hCdseW8Az/L9rJtD7Q13
         DCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=K4//uLRap3ZN9p7j6IwL1Ekr7qChaDLbj801Pd1B0Hw=;
        b=pcVnxkRWPnd7li943xVW2n8XUQI0FOSxTAQRn48gAXVHAlIYberzbvklJZTGJoygc+
         6Jj/Y4exJATvHgT+I22bJW6z4L/Apa60GfWR6eGkzpzaKcXFlf4MocMZBhMTtkCzpKIB
         Qt+e1Qqi0dCt/HY8cbbXvCX8OtqHlvbvdxyxbqOWzkJkcmY4k0kbHwigCfREmgOMlxn6
         4x62R3jr/hn29Sxc3tBpmDFzbh0RWpMwLuOjMa40qG2EnwTlicSUV50XGIosPbhisqan
         p3toNYMk4vlHSCwwIt5E96XadCM41HjUytidcAqS+Xkj/dyJTpq8INYuPUM4DrDyE3kb
         4Riw==
X-Gm-Message-State: ACgBeo0nqeEyJnRcsMquFM+j64/DsQpiAeZyyPJMylh7y2GPTPSuZ/8m
	shS3cY8MkQm4hiJk+Dn074XvLg==
X-Google-Smtp-Source: AA6agR57mq56aryOcq1X2FNoQzovdWnSlKJXToEnvp4OCasrnJsw1+rflMa41xYoSUr/pakjz0ZN+g==
X-Received: by 2002:adf:d1ea:0:b0:226:f421:79b5 with SMTP id g10-20020adfd1ea000000b00226f42179b5mr5001114wrd.173.1662640359519;
        Thu, 08 Sep 2022 05:32:39 -0700 (PDT)
Received: from blmsp (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d51c8000000b0022a3517d3besm886970wrv.5.2022.09.08.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 05:32:38 -0700 (PDT)
Date: Thu, 8 Sep 2022 14:32:37 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spicc: do not rely on busy flag in pow2 clk
 ops
Message-ID: <20220908123237.6hgd22o6koe5ulmm@blmsp>
References: <20220908121803.919943-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908121803.919943-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_053242_660509_D0F87C32 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Neil,

thanks for fixing.

On Thu, Sep 08, 2022 at 02:18:03PM +0200, Neil Armstrong wrote:
> Since [1], controller's busy flag isn't set anymore when the
> __spi_transfer_message_noqueue() is used instead of the
> __spi_pump_transfer_message() logic for spi_sync transfers.
> 
> Since the pow2 clock ops were limited to only be available when a
> transfer is ongoing (between prepare_transfer_hardware and
> unprepare_transfer_hardware callbacks), the only way to track this
> down is to check for the controller cur_msg.
> 
> [1] ae7d2346dc89 ("spi: Don't use the message queue if possible in spi_sync")
> 
> Fixes: 09992025dacd ("spi: meson-spicc: add local pow2 clock ops to preserve rate between messages")
> Fixes: ae7d2346dc89 ("spi: Don't use the message queue if possible in spi_sync")
> Reported-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

> ---
>  drivers/spi/spi-meson-spicc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index e4cb52e1fe26..6974a1c947aa 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -537,7 +537,7 @@ static unsigned long meson_spicc_pow2_recalc_rate(struct clk_hw *hw,
>  	struct clk_divider *divider = to_clk_divider(hw);
>  	struct meson_spicc_device *spicc = pow2_clk_to_spicc(divider);
>  
> -	if (!spicc->master->cur_msg || !spicc->master->busy)
> +	if (!spicc->master->cur_msg)
>  		return 0;
>  
>  	return clk_divider_ops.recalc_rate(hw, parent_rate);
> @@ -549,7 +549,7 @@ static int meson_spicc_pow2_determine_rate(struct clk_hw *hw,
>  	struct clk_divider *divider = to_clk_divider(hw);
>  	struct meson_spicc_device *spicc = pow2_clk_to_spicc(divider);
>  
> -	if (!spicc->master->cur_msg || !spicc->master->busy)
> +	if (!spicc->master->cur_msg)
>  		return -EINVAL;
>  
>  	return clk_divider_ops.determine_rate(hw, req);
> @@ -561,7 +561,7 @@ static int meson_spicc_pow2_set_rate(struct clk_hw *hw, unsigned long rate,
>  	struct clk_divider *divider = to_clk_divider(hw);
>  	struct meson_spicc_device *spicc = pow2_clk_to_spicc(divider);
>  
> -	if (!spicc->master->cur_msg || !spicc->master->busy)
> +	if (!spicc->master->cur_msg)
>  		return -EINVAL;
>  
>  	return clk_divider_ops.set_rate(hw, rate, parent_rate);
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
