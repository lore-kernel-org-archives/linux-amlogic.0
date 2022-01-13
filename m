Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736B8C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5iOPGwJujRxKeL117yOfr0KRQxG6L7kJeYv932Cdqo=; b=32L1F8ZbWCkv7E
	VwQWs23JTW6fa8W3vas+QMh79ds2vmvkD9noZ49F6N/JrwwW0t2b7KdZuWXDG9Y2b/wPJYb+vXNHk
	CANWkL4cJxO4yMaAzLdejXaXze2l2sKmNeEG4wiyu3K4OpIK15q70vNrRGQhNmGGpys80/0P27bN6
	H0Hn9Tmo/58RMwjPNvlOBYJUOmPRLxdD2SSA5wBK1GbX4IFqDseHHZ4Edgn2lEQYCC2Pp1k9eDdlL
	ClvqijgC6Au6Ex2EaHtijPmNYxz2HfbC/17z35I/aKO5Xsj47i4Dm9OxCFkYt+k96aW4ve8Qm6nCr
	1B0IzBRxtZDOl3EdEa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n87de-0078fr-0w; Thu, 13 Jan 2022 21:28:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n87db-0078fP-Io; Thu, 13 Jan 2022 21:28:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9728A61A35;
 Thu, 13 Jan 2022 21:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88BFC36AE3;
 Thu, 13 Jan 2022 21:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642109282;
 bh=Uw7sKyZezZUSGk90rWf7fiPngEeef5ZBZM1owhhATBI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ojWvA73JsanpuZXZr/R8UTiPvmoIhGTGPTQC7WDyJ7p/06CaX6gOdIWdUv0KTksi3
 Vqyu2mn3XR5z/3ORCHpc0UKKbEjZNoJToTvuULSqlEKfioDcjtFrdhAIdJEFoi66ER
 8xvdPIYwvAJjDaE52dzRiRAMj/hDiYRHaghQW60hGUDKYEtKxWw9Xi46qC2xtNOIOB
 bwXiax/r4EJicx6uaH1leAj2NOzRPsg0GLYiaq+lNPTRMAs4S2dRO2bwiyQibpPXQb
 IFYiLv3zJC4dDNeq9f0ZtNxpTkn0C/XEJAaOPVyIK9skLipGR4k7wpuaYEQnI4AMIP
 9GFORupFR4WbA==
MIME-Version: 1.0
In-Reply-To: <20220113115745.45826-2-liang.yang@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-2-liang.yang@amlogic.com>
Subject: Re: [PATCH v9 1/4] clk: meson: add one based divider support for sclk
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Thu, 13 Jan 2022 13:28:00 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113212801.E88BFC36AE3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_132803_706442_447DD9BE 
X-CRM114-Status: GOOD (  12.93  )
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

Quoting Liang Yang (2022-01-13 03:57:42)
> diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
> index 76d31c0a3342..79c9efd28115 100644
> --- a/drivers/clk/meson/sclk-div.c
> +++ b/drivers/clk/meson/sclk-div.c
> @@ -28,22 +29,39 @@ meson_sclk_div_data(struct clk_regmap *clk)
>         return (struct meson_sclk_div_data *)clk->data;
>  }
>  
> -static int sclk_div_maxval(struct meson_sclk_div_data *sclk)
> +static inline int sclk_get_reg(int val, unsigned char flag)
>  {
> -       return (1 << sclk->div.width) - 1;
> +       if ((flag & MESON_SCLK_ONE_BASED) || !val)
> +               return val;
> +       else
> +               return val - 1;

Please drop the else

> +}
> +
> +static inline int sclk_get_divider(int reg, unsigned char flag)
> +{
> +       if (flag & MESON_SCLK_ONE_BASED)
> +               return reg;
> +       else

Please drop the else

> +               return reg + 1;
>  }
>  
>  static int sclk_div_maxdiv(struct meson_sclk_div_data *sclk)
>  {
> -       return sclk_div_maxval(sclk) + 1;

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
