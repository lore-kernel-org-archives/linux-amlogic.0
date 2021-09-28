Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94C3C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 14:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AEA861206
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 14:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AEA861206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RIWMLJqDwbBo2vbc9YXKHwifXD9tJhdggMJID9Gms8=; b=UoA11cOyU6Cyyj
	uUCSvISnKmODYX3uoG1W0D0EeuXF3UyxzUSDq+QKu0IwpaVDYEtTFK0yrY1kDjfnqZick2Y2IPAfD
	g3yGT5zlVWxAxr8pcaJQqI7u4FyCV/CsZIiBONz0dWW53qJX3m0HvNqtAC28nqmCepWXgGgR95pkx
	55DmOcy3CYGM2eIDnAk6ONiD2CozbgEcjW1TNZZ3nEIR48GHu2BAlKq+FfO/mkfQ0F8Re80/BvbQk
	QDXMs5CXAzyZdKJk/b+AncFIHVzPXgyCO4XiHDprOgEiOf7srrHcAqeVt5+8LdajAke2UKrtZxvbT
	X1gipKChMmcBC+s5NbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVE7z-007bTA-66; Tue, 28 Sep 2021 14:30:39 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVE7n-007bPj-Ta
 for linux-amlogic@lists.infradead.org; Tue, 28 Sep 2021 14:30:29 +0000
Received: by mail-lf1-x12c.google.com with SMTP id i25so93828838lfg.6
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Sep 2021 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uh1B6XTocg/PuNZlNsHJ5qn3ywJ0pfLGKGnm5l1sB1s=;
 b=bt1vQ9mFtLWbSomTDSPbF5QE3RLYCRSGiCjPdnKP0BYNmZ22nN/5dQreFOHtJlZP9A
 w1Ju27SQF3MMrUPKopIdjsdV0fU69078TLg3O6fDK6EtaBVBFxWWwokt6QgWln5o8xT/
 0FE64IiWO7MHsJ9hCkLWJ0A73tKdDUIHDA2H6cYZe3v+aaEsZvFVbmFcynWdoX4JFqyW
 VHhtrRCMq587NZq3jdj7pcF+xc6daSurloZBhgz178YbCvxjCtZ9KIVs5/G/eVu3cZz0
 O2DoTHqZJqv61DW3iDhIzQkvY9RLrrmCkYy5YJEATVCpeoiBUANGdDnTN7VJiWwB9a31
 i2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uh1B6XTocg/PuNZlNsHJ5qn3ywJ0pfLGKGnm5l1sB1s=;
 b=VenkAZwiST98XLxvCatnChSdhkWIUsoMqqTB6O4NJxZRxRlRWHy4nYl/IYx+L7Zbdt
 Q/qSmngLl2o6S2XSXyMbmu+GZ3z+l7L6mR86TO+eItoKwwHfDCjLN5WAVKsEdeV9sPq4
 pfZSBhtzv+hrWBrYdXmu4n1mzbl3wvBHAEv/j5lgssp2JrETgTHFrBJ5uXUsWMzCfuS6
 h6T7ZDeKRVG8T4wCBPVkHHDErnTWaOyM/p1n4AlJ2eX+i+QXe5O74ot6d4zt1BQlBaQb
 8StxoOPOCQeD78B2Lb3YsnGBOS6reEiA0JP78eeFqgX+J6D6UchaZUSL3nLAyhVV7pYA
 Z7JA==
X-Gm-Message-State: AOAM532V6TPEiiR/lySB6lxnMzm0Wr4zX7CqvUbQw/cWTJGFx0LZ7sAv
 l9qFhzB0OPInBvv+IcO2CIzGcc8D9zRnbyDQm8D1XQ==
X-Google-Smtp-Source: ABdhPJxrQ91FcoG1j8MqOj19A8jz0Mbb51yvmE4ezgOpcY+fkN/eVADQarawxS3wzP2LfC8q5vYwAWJL1ZqFFqpb/1o=
X-Received: by 2002:a05:651c:1124:: with SMTP id
 e4mr253677ljo.261.1632839421344; 
 Tue, 28 Sep 2021 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210928141956.2148-1-caihuoqing@baidu.com>
 <20210928141956.2148-7-caihuoqing@baidu.com>
In-Reply-To: <20210928141956.2148-7-caihuoqing@baidu.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 16:30:09 +0200
Message-ID: <CACRpkdYSKnk0v2FEPg5h4p_ODtepXoH9=a=8hiTa7BP3goaPKA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] iio: adc: qcom-pm8xxx-xoadc: Make use of the
 helper function dev_err_probe()
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
X-CRM114-CacheID: sfid-20210928_073027_976595_A891E1FE 
X-CRM114-Status: GOOD (  11.26  )
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

On Tue, Sep 28, 2021 at 4:20 PM Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> BTW, change the return value from 'ENXIO' to 'ENODEV',
> perfer ENODEV which means no such device.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v2->v3: Update the changelog.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
