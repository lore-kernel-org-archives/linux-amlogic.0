Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D2DC5478C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOPJRE1LlmRKaqYRcr8uAeyjkb0MTiDHJL7J0lzQXI8=; b=r02/tD2TYmmv2g
	DUERWIbPH4lzEqTI5g6bDGLDeoz2KhkHJXKzHPlgfaN/tR2aDwgQjZ1TJHWyqawbxvsx7UHrHqFg0
	cGHtw6dXMvWrF7zjZT7M5XOFUzbFNgQxDoBkKLGadnWxQUVHPIz69S33Gsh/L7pRS8g96EKZGrW2o
	bj8PCl9py+aRWR05AxZKsTVGGY0RWZ4+QyegwZcbT+xCMgVijmraLfeB/Qbu+PdZd/NR4+S9dZBke
	P79Qug4/5JEWWXEL3pXmpPmIDFCqDJhvv7zOFnFBt1QF1bPFi3MY6wZGLNx8iTlRj58ui7Jqu2ZPU
	sfWc9g50hqKT0FGKOcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZ6v-0000000APoj-2bNe;
	Fri, 23 Feb 2024 17:13:22 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV475-00000001flq-2lkW
	for linux-amlogic@lists.infradead.org;
	Wed, 31 Jan 2024 06:30:25 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-603fd31f5c2so5040277b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jan 2024 22:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706682621; x=1707287421; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
        b=nHRVg/hcT+k6PiDLUW/0zd6769/B6tZfDRJG/JG/AwjM7eGUEqLywp7Erwe0Nx7MKE
         mlUF3WcvqDYUiNJ/iHVqH2RVysCUO9NUc2OO+YgnoQEo3dbVwjCsRpk5VWUJMBzlFf4K
         zKa5V2b2njh5ujrmaVCg5obqqeqI3avRSP6gOSjX4KrqkNOKTic5YW89AyD9WwoHuU7B
         cg4RlT7wzvmU+9O+7Fc9IOriORdSbVgFNfW6jg2nyszla+Bkwvk1WfexFDUkieGXAH7u
         kW54+GyzF9ILPS4cWvuJXsI4yBYRcJ9QZPmpZBzKG4F2tv9X6Kqo+fiLb/eEtTfe5MQf
         S3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706682621; x=1707287421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
        b=Xqa2Ax+HBooPPoW7vhvkTvBZTWyWiY1a3F+39T+lZHH52eiu3b0DjUYE8baZM6cY7u
         TdS1vIoK4+V3M2/3nIgSGWsi1KhO8MSIGVZHOPQ+osFBKLhGKbDNAdeL6dZ/IK3I/Xsl
         Ouu0xb57yXABaB5qSraK1wAGhGjz+fZn8Ns5RflXKt9UCk3FaBHPPVq5jQXAHoX3feLJ
         87UUZKojnCbvAoHMQhUJluX947yEDg+n7VH0Vv/UryR1S6kYxENgdovaOldA/pf3Jg7u
         0KLi4+3ofBlD1z5rI5/DmKqB4iNNg68z8aNNucMbUIdyzmHnaEljBcGsYXB3h23Sg9am
         cDKA==
X-Gm-Message-State: AOJu0Yz7iz3NDSAFpDm9a4ZzosUnnun64uD9nRNKv0D0BTnkF1NQBR7E
	9kKiIVBzbeubXuYXZepkFqwORq8RRuHcwhWGgvYXyo0MQ+ewqnYALpBPy5bCPH6Z+9kBXnY1TXI
	douN0kPrYEhY2aHFADbMl1nU32LPHyCl+WyM1gw==
X-Google-Smtp-Source: AGHT+IFCSuHGBgOcgNRm+Jyx9Rk92WC70s7Qe1r45Ekea56q3x+YWZYnfOl+X2xsR2ea9MpX12ltkU9QLuvg4lUUs5g=
X-Received: by 2002:a81:6d16:0:b0:5ff:8152:64b with SMTP id
 i22-20020a816d16000000b005ff8152064bmr311187ywc.15.1706682621572; Tue, 30 Jan
 2024 22:30:21 -0800 (PST)
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com> <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:30:10 +0200
Message-ID: <CAA8EJpoRhS_yvJJUuC3YkWRAKT7e03k+-K=6QKfL_6TkB1XoxA@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] of: property: use unsigned int return on of_graph_get_endpoint_count()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, =?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, =?UTF-8?B?VXdlIEtsZWluZS1Lw4PCtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson <andersson@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emma Anholt <emma@anholt.net>, Eugen Hristev <eugen.hristev@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Jacopo Mondi <jacopo@jmondi.org>, James Clark <james.clark@arm.com>, Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Philippe Cornu <philippe.cornu@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, Stefan Agner <stefan@agner.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>, Leo Yan <leo.yan@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mike Leach <mike.leach@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>, coresight@lists.linaro.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_223023_811981_13304E87 
X-CRM114-Status: GOOD (  20.95  )
X-Mailman-Approved-At: Fri, 23 Feb 2024 09:11:35 -0800
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

On Wed, 31 Jan 2024 at 07:05, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> The return type and the variable of of_graph_get_endpoint_count()
> should be unsigned. Tidyup it.

'the variable'?

I'd have added a few words telling that return type can be unsigned
because there is no error reporting for this function.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 2 +-
>  include/linux/of_graph.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 4e879faa1710..25d73409aeee 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -817,7 +817,7 @@ EXPORT_SYMBOL(of_graph_get_remote_port);
>   *
>   * Return: count of endpoint of this device node
>   */
> -int of_graph_get_endpoint_count(const struct device_node *np)
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         struct device_node *endpoint;
>         int num = 0;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 4d7756087b6b..a4bea62bfa29 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -41,7 +41,7 @@ struct of_endpoint {
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>                                 struct of_endpoint *endpoint);
> -int of_graph_get_endpoint_count(const struct device_node *np);
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>                                         struct device_node *previous);
> @@ -68,7 +68,7 @@ static inline int of_graph_parse_endpoint(const struct device_node *node,
>         return -ENOSYS;
>  }
>
> -static inline int of_graph_get_endpoint_count(const struct device_node *np)
> +static inline unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         return 0;
>  }
> --
> 2.25.1
>


--
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
