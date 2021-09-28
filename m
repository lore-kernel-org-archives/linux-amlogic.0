Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918D1C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 13:47:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52104611C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 13:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52104611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSiyCCQyl8x1vKeFeGXc7iH5PXh7MryCG70DjQOS4fw=; b=0X4MD83aIBExb8
	Ntcq5YaqTfEfNxC5eKoKU9b6Hlys0kdj341ZGLAK1Ig5LAhx5QBvP1Rbdrrqj+NGeD3/lzUJFdXO3
	8LUT/ICjU/qmrZrVYHPU+h5tfOZwuCNn9VSY+guEtM5bqiC7VZ8D6IMQTNym5WVhcmsNMw/bZXmZo
	qBjQpC2cc4Y1l3/zt4cZ5XtfDUsOePu7wyP0w5ukPP5aSzugHRZ9DtbhDQoXYSbvmDiaVaaeAVLjP
	WvmrGjxsLGMAyJQtU6Bu543BCqvt1tHUcCNLwA+98o1xyx2cR+22+GHITzebapiKFozwzjxZxO1tI
	lopyERszCZs00tbENxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDSE-007NDn-GG; Tue, 28 Sep 2021 13:47:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDSB-007NCN-RD
 for linux-amlogic@lists.infradead.org; Tue, 28 Sep 2021 13:47:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id b20so93349752lfv.3
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Sep 2021 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zwVENlJtRAi6Ax59HxxFqFtBJgRbm8ce1Id+5WhoWL8=;
 b=XQFP1mUhXKlHXI+xEmvDrSXbeLGnD4CLmXjgYseEqEruv9KrCC6FSc8Y5Ho4LjbDOX
 zC6snsJNUUz1wZImn8MwvqtBxmMBxpHhjrx+sD7movv4TlZPXtvtAREC+/yRiKmX0pue
 ++eKN5f+0dJcVxMLuJppLKf8ZQF/8jTKUtiroQPAE26FNLy3qV5NuZ4Mfmn9YaCTMPq7
 nzwGakmqi86S8+l5vHWVzyPlqaDPjAMTD04P50HoQaOwSxjmCvIFwGP8TkCDq/Iqin0z
 nosD+DseVrciB0VXscUsdG8/7r83wCXEdGV3qDxxotWcJfScS76Tqa9v285icJA3aBNN
 Ec1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwVENlJtRAi6Ax59HxxFqFtBJgRbm8ce1Id+5WhoWL8=;
 b=UupHuA+KWgp+zKpgLuNkAppdL3QRUhSvqsu0bKNqbG6YXJY/WAcU1mQulnGbbWhwqW
 vHiivCQygxMla5RtRQXIQwST72UJzhdIdE3MOhBzE0vMKOo87ccQ7WwBg4WWPvVE/QRA
 3uv0gnLTQZGxk/SVXxBLXoNi4gTI9r0uWDtzZ2VBeN2nvhHQ0OcXfLfCiHu5pE0BuS4h
 FtOI9cbFnwL/SigcUHOO1roJBPFuwyb4ROFPonv+2hjihBxFt0+ldaO+pGHYFhL9hYW6
 SK2YflwKdAJM6CeLuaNThV5NxhZLEtlc91LCswqQQQhekZk96pe5ZTljpTyMAxhLmHND
 P8VQ==
X-Gm-Message-State: AOAM531dk7m6V7q/OAdm6Z3mq9GfwDicAHEZdfIaikX7TXzZIOSMppS5
 X3CpWKxKq7pSztImc7+R9BAc7/gHnj3BuRM0esHdlQ==
X-Google-Smtp-Source: ABdhPJw2Fb4WlAdBMN6qf/ANOW7XfaZ4dwR3+5V+TQbap6YMXmbnt1TkRoKkuxS6/KOggTQZ6bWvGaBx1mJ0aeF2U9k=
X-Received: by 2002:a19:f249:: with SMTP id d9mr5834936lfk.229.1632836846030; 
 Tue, 28 Sep 2021 06:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210928013621.1245-1-caihuoqing@baidu.com>
In-Reply-To: <20210928013621.1245-1-caihuoqing@baidu.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 15:47:14 +0200
Message-ID: <CACRpkdZX6JkBOFX9yd-gsrzD5ObXR1VKmVNFLNbAv2Q0w1w5FQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iio: adc: ab8500-gpadc: Make use of the helper
 function dev_err_probe()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-iio <linux-iio@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 MSM <linux-arm-msm@vger.kernel.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_064727_908228_95996EA8 
X-CRM114-Status: GOOD (  10.54  )
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

On Tue, Sep 28, 2021 at 3:36 AM Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v1->v2: Remove the separate line of PTR_ERR().

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
