Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEFBC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2MMvnRxEnd81tS5N5Lw0yHiEeExfEzyfb41pWTTuv8=; b=O61IKtpyQ0S9Cw
	JsR9JtTUhZUAl+WFINTyNj5yZI3geRsrSzXzF+05tvmeZ8Dp5T06bLe58JDWPHmSv8I3/GDOFb1/R
	EMA8tuk877Zjh21fmYFzzayl0RGBVSMYAi15/Vh3nwbUTVHfiq/ZrBXnk/FzYsOrx9EAnDMfj/vM6
	MeppD2siP+eVFDYwz5ipnmedTb3/+4t8vHaZvPt+MI7Qihel3ZQUB7oUp4LvgLjSZChZBJOWVLCos
	Fz7LxXxieOWDfXMA8ECax7ZzI/kjBYwDycpceiY50A4KCsWcdZ8QcZNWMN+9FbNazvYc1qYuHCvJl
	ZA10i39RbJKsqcjMh99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6yae-00Cals-OB; Mon, 10 Jan 2022 17:36:16 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6yaS-00Caif-La; Mon, 10 Jan 2022 17:36:05 +0000
Received: by mail-oi1-f175.google.com with SMTP id v124so12416323oie.0;
 Mon, 10 Jan 2022 09:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Bf2rJ2DJql2aQa2+Vma/SpLlbuseiEOmq8cakFAHq8=;
 b=HCznnstjjFz1Nn6V4lhunaJ6SrfZOIXbPeftHHzGAHezrWvltflcFaLd2oDxC1kei5
 +5yuyay0uH/VaLE4L6LVXt5r3DSq8HZwVpGohqI9eG3rBmb5JnLcJ9nha/9WJSTOe+Yx
 jUqGTqfjWruG4QhldVG5hMA9Us6C1gGLtFN0JdW7Vuqne04cjlgfuOgk6F8T1IVQkkEx
 748zCEzXqCCkJGMGizkebC7wR8MfuSEs1Bi0Wx0ebqlxR5crZ9T2Nl1ExbzcqMiiQ6j8
 DTwyEd+5iAgWJm+azzGesfpE/nFY//8JafVVvY51VUEcXG5nfHFj/dxl9vHawBhLsTHY
 cJLA==
X-Gm-Message-State: AOAM530ev8/Oyp9Dzn6z2x0/ZQNX0FAJ1eQICAzglL72g9w1kwBzIzX6
 AP3cXoUcWwXFgTDE8WHk2Q==
X-Google-Smtp-Source: ABdhPJzUImWVhQdDrEhCGyspSNZ0EeJ0vMDkP3nWD4h9/ykAYPqH+VuRa1QmFsAVU6opb5zP1jUgrA==
X-Received: by 2002:aca:3046:: with SMTP id w67mr402820oiw.20.1641836163812;
 Mon, 10 Jan 2022 09:36:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f9sm1549006oto.56.2022.01.10.09.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:36:03 -0800 (PST)
Received: (nullmailer pid 1150878 invoked by uid 1000);
 Mon, 10 Jan 2022 17:36:02 -0000
Date: Mon, 10 Jan 2022 11:36:02 -0600
From: Rob Herring <robh@kernel.org>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 2/3] dt-bindings: reset: add bindings for the Meson-S4
 SoC Reset Controller
Message-ID: <YdxugtL5PsrwsT6D@robh.at.kernel.org>
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
 <20220107023931.13251-3-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107023931.13251-3-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_093604_733545_25FE7169 
X-CRM114-Status: GOOD (  11.88  )
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

On Fri, 07 Jan 2022 10:39:30 +0800, Zelong Dong wrote:
> Add DT bindings for the Meson-S4 SoC Reset Controller include file.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../reset/amlogic,meson-s4-reset.h            | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-s4-reset.h
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
