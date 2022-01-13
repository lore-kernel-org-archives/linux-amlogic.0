Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6CDC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUyPsB4/XNWNMcaOfuJxCz5gr1vLvrImpfZRLP46u14=; b=ked1OHvxGP95Yw
	SkayjJVo5LjLWpRW02pqzfRnQCOV3G8JlFmTNkIoVZ0qBLEggvTQIXaz3I76bQQWb6krhRrxhaoaq
	cgIslM+ErZ4TW8DahAW0F0KBoZ8XF/aZ844h7s1Q6yBzYTrHnlFcBmJGohOjXoS9G29ajNytWtsl8
	o4ZFljBVQt/d7EGF0rx6ArEO5pUe4lCc8oy+0r8XwgtlkFyMZirjhg/nNCZQDiwEyWYLkgLgqZk8G
	WoIdKvL61NAgq+JaZd1oDwWrKDJVfJkKzxBmc4dpjNLpda4IB1JO68c/b7h78lfXIb6R+rqfY01n4
	JIFBawIfjBblXT9sMY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n87f3-0078tA-5F; Thu, 13 Jan 2022 21:29:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n87f0-0078s9-NG; Thu, 13 Jan 2022 21:29:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67BC2B82380;
 Thu, 13 Jan 2022 21:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C10C36AE3;
 Thu, 13 Jan 2022 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642109368;
 bh=9/oOB+KtddzUtsBpBbqkWxiDI2s1C2hymkyNpoOLJTc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OsIKhQXyXasXp2N/sLLW7xq2ve1JZOCWXYONBZAC9Pbr2YnDa8XP00CIsmsEw2rVH
 3ohIB/eR+QbS0Ptg3jkXLYTWwYBHfk11lCSnPJHOkp6sAkQNaasknv3BWNxT0fiSIp
 /rIBrToENKK7ytyp1rtOxycWciEtY7yOWXtjSk/G/Qvk/Ca4JNOqeK4stSg1erxZ7E
 GXj/ZKGSIb1UBAB3qw9++K5IhOE/Dwrriq5hAxNGqBikjoqM2F8G5TAEdQLX3+NQsP
 P3G5FgkELvVyf/dzNgCbrkvhawHAo6I9IXgqRnIKlqxm+UhjxIOBnrZpZRbR8NKcPu
 n+kG2Du4suSvA==
MIME-Version: 1.0
In-Reply-To: <20220113115745.45826-3-liang.yang@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-3-liang.yang@amlogic.com>
Subject: Re: [PATCH v9 2/4] clk: meson: add emmc sub clock phase delay driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Thu, 13 Jan 2022 13:29:26 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113212928.28C10C36AE3@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_132930_915298_D25820A8 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

Quoting Liang Yang (2022-01-13 03:57:43)
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index b3ef5f67820f..c450f38d3801 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>  obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>  obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>  obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
> +obj-$(CONFIG_COMMON_CLK_MESON_PHASE_DELAY) += clk-phase-delay.o

Sort by Kconfig symbol?

>  
>  # Amlogic Clock controllers
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
