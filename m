Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175ABC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 13:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0055611BD
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Sep 2021 13:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0055611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syc4/wLCarn4TGyF3+B8v6WFjCI5TyvV2s5V431S1es=; b=wipXdTrm7IH5G1
	d3eBvLnJMx53e/2SAkWHylG3kcBQ8IVveWZ9vzVRqui2z9oGRjDUVuMbImLbx0Zh40DWf6vD74xHU
	mNCuMmPlM33pNwtJwWqfaw0DGTNJJAssY7W9LOx6FbUK19BYI1edTEYKSa/4Zmk6No3PMAx0LE6x1
	IO4683MPyVXb7Ws/AHoq5KhZ9HShKu/c+cp6m/HSAjDWI+yHugchAsJqHoJzZVaDTm4O+Mqaoh5hH
	+j7eztxMuw/7/9ZzdrIpZAzvJK3Jf1uQL5/6MBHFQ9NbKznkf3Y/rZvAnXqwownjCapFJmuczlw9m
	WT5GIHfB5Pt+UwFUrV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDVf-007Oi4-OX; Tue, 28 Sep 2021 13:51:03 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDVT-007O8Z-RW
 for linux-amlogic@lists.infradead.org; Tue, 28 Sep 2021 13:50:53 +0000
Received: by mail-lf1-x136.google.com with SMTP id e15so93160429lfr.10
 for <linux-amlogic@lists.infradead.org>; Tue, 28 Sep 2021 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqwz9jzyEQV5H4SW8S/gf8kyYKDVCl9EoNAa0kvGs9E=;
 b=lK1N+HWcCfWtNCrGgY4s6GgX9CsGhnRcYX4lqPYKVXVMLm9dFqGOmTWH6W7yDgrYlP
 r5EfG2iKtNsCiPEpu2jIIZUO/prlSrOSngipvA1TaZXN//4VkeA+JwIztwUCHInTjF+X
 dIEeqXK9vl1zabQddSGCMK/1z7p7VHD0/EGwo/HlhXJ3zAduBt5JgEYfTeOMBww2Fp7C
 uuEQ+v8uMPilV3Gj8rG9xjCBY2Z3AgQB7zHz7LAOKEGK+E4GoP5y67eAshWxmcfY0b/C
 tbJ5BllnohxxoWYH9FNEsSkrxF7kZTx9LML4VnlI/nkZyyXKBdokKSpCUGceySjEP260
 j7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqwz9jzyEQV5H4SW8S/gf8kyYKDVCl9EoNAa0kvGs9E=;
 b=2tYJB2zreEstaJ5LmGl66B/r4rpt/+k1RPz7UAyXeUisdatp29HR6VDdLcDHcPwG/U
 t+V4V0VWrcFsFJI06OpLANmHKNuS80xcJ6YxR1HgIDeqf4cSymh/A4f5/2/GHC8t1S8m
 3V5IlFoEA68esBXPY4eHC6Gurs5Qg1U9rbItjTdLYyJZlUPBjFQ31im74oR8K0Dgwu+J
 lFH9PI4iQszKdOPh7HZ1z32Za57i2wwhXeddq7gRdJ7vr6Mf0SpOyQdWuckbi5we4D6r
 mrjRmSXZAxLuRqYpokiIBsI3W+rjmV3DQsaZr/teyovlzQlaKBxvly2bxPvG94ZWSkSs
 TblQ==
X-Gm-Message-State: AOAM532kqLERwM96U66uM3eQ8CBbL8JLK958QCYkR9fHqqF5ZRGwulci
 e6p5Xj9p+h0th4su0xu8Oj2019ps7YNYDpYh8y7H3Q==
X-Google-Smtp-Source: ABdhPJzKB7hvIUZRQ/aoIoW5cqtS9HhlPZ5bpsUvwPy/3OPtxA+hpK098gljBYdBI6LlYdW5gw8hagp89uPCk1TRlmw=
X-Received: by 2002:a05:651c:4ca:: with SMTP id
 e10mr43638lji.259.1632837047280; 
 Tue, 28 Sep 2021 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210928013621.1245-1-caihuoqing@baidu.com>
 <20210928013621.1245-7-caihuoqing@baidu.com>
In-Reply-To: <20210928013621.1245-7-caihuoqing@baidu.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 15:50:36 +0200
Message-ID: <CACRpkdYJjDCvzX7LL1Qv7zYM_E1+1fqCSNxz-KVK6t35xMi6LA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] iio: adc: qcom-pm8xxx-xoadc: Make use of the
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
X-CRM114-CacheID: sfid-20210928_065051_920895_156DE959 
X-CRM114-Status: GOOD (  11.25  )
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

On Tue, Sep 28, 2021 at 3:37 AM Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
(...)
> -               return -ENXIO;
> +               return -ENODEV;

Why?

I think it's the right change, but should be in the changelog.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
