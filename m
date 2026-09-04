Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F193FC79F83
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2026 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31SnL05ahOQrFedJa+fihB9YrOdwdLov7G/UiwwrlLA=; b=f3veLNagDhjEd0
	4YqUDUE5OMy9VuCjiQ8FBVGpdZF2XsstlTgr6/PeGn9iZSrt8wPMfimOiSf7iaRJTaXjLTffoQQ8C
	3xF8+I7PA1sUWys15chTA9XsdhlfRyCHm3C7vXo/tF6FoaT8aFvBnReXPvBZ7/C5l6hIzuLw+Kwr6
	9/FJUifCOrCcPBIGIfdv8Vfjq0MdLMGC3lFmAtoFstnTUfq8rdktzzwLWL5os6MiEzdgYDH1L3CrE
	u0HVWAgcVNABOOrM8qvGHHZWtWPPV5VK4cEnTL1zcBvanAWuvyIN9ljRsL+e9e30o3ONIfId6ul1W
	juh8uAovfgG3LKWqJvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omt-00000001J3a-2S55;
	Fri, 04 Sep 2026 07:56:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omp-00000001J0b-0jgE
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Sep 2026 07:56:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so6452785e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2026 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788508593; x=1789113393; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=;
        b=bt1+JLwE06GxfOAQDsxhdrdSVPGmYeo8CB+Dc8W2wYTdMW5Jb8nKOYuv3tZvf6eMG1
         HZPY92jNVcLyFA7b1A4MHR7fypmjMPJnYv1w32tvWC6UnoOm5I2Yovw9/HYM/eQl4yVm
         Uok2AC5q7VGFlrn9wFyY6zOU+YaGszQLyH5OZE+GD/TQ+h/FDMxOey2tVMI4qON0I5IN
         cVWkYt1jKNzxOS+sGBNUq69HH9OJ42D6clZBjSv9GQ6qR4nEaCaITP0aUIIAsJNstQ7z
         UT3jCBjeBWrG6oEXGeTk2Y4kjQjbZ9v9d/jcPv3kLB96C78ULDPcD4opYrlNiHjJGYdG
         /ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508593; x=1789113393;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XJ1UH6hAE4wf/eMnhUQvleFgKZgGdJ6vWxvyx+MhAOw=;
        b=Z8ryidJN8BSC5f94lkyzVdyIZJ5XbBU2ZHEkKBee47rWU5XCD+/hrszCAICNPl91zk
         CGgZV7zd9tuJ/r8sWsm4pD7/gk02IVq97qHfkWq1g3ZoZvkxFlsylpu4yGlJ+33dpA4R
         WAtKbhYtZnMBmdRFedfAUtuYji8nTm646b1Zn+o6QfhU2Cfv7dfMnTTlx9EUEDTULdqm
         D3noxbOpJ1gxM1jAAO/D015xVASitpVgimT+BM6z/VKcWwn8juAt6u9YGdga47rpDwzN
         nlAJu+yarxANcw+LE9OgeVP/O97DarlHXEnOdLx6IKShSkz/mqr+OrJqHly86XCgDwcf
         c33g==
X-Forwarded-Encrypted: i=1; AKwUvBzoKPNpTALlJv7Ztmaaw9aL/8dfmsghOcZh2B8ekyPNps8QSfSZ0utorD9A89fCEpR2c/e67tSKxQY6xXvh@lists.infradead.org
X-Gm-Message-State: AFuF++mc0PvY9+z7QER5HYxmIY3niCZfoYwisM9I4J+VYv6T/0nXEwF4
	0udQIqeMSVfXaleNoFKh8v5Qj+EV21dLSKjQDZHpMI9+nNsE1yGONOCDOCZuxencamc=
X-Gm-Gg: AYBFou1gC+RVsSBQ0uq09buwvnMRbG+bVACwk8m0zrqSx/xwsxMUDSgcCUXjB5kgSoI
	koAVFuIbYBhI7nxDrGVkE9KucAuTPmF72Bz1Eq3hQ59czVYwBKi207xtuV9L7pa+uPJjTXOJRsp
	kQ952K5otH9HJiKYgtBWpSwnU0PyJia5U9c6bAaG6DNPsTKtYWtjyevTcySkIW4BvBLITecYWgL
	N40i9Ak7reywnjlZgWHA5LxozHXzXeX4SXO7KGkstH/hwipqcMtnpTFL8l/HRKvoicLgsDeahZW
	EM54nR2De/u9ks/A1jw9AKs5hxJF0/16h1vx8bgJH2vPZ2M3WttsO33OJ9wbZneTqRhg09f/aZs
	FVggjIoEivJanLOzpdj8vyYfcB52vJQM4Xn0o2suPdNiiUjLM2URnP6osmE0fLtKNN//EIGnXRv
	bRQQ1JjqcCwr8hgEP60fWMLbrbSrBnOJYjARcsHTy1AknrdNoInLmoN4gEFj9qf1HdotOaZ/3PH
	klUBmkqTcfLmOZAxw==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr15228165e9.26.1788508593241;
        Fri, 04 Sep 2026 00:56:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm10480125e9.3.2026.09.04.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:56:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
In-Reply-To: <20260903225921.2290441-5-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
 <20260903225921.2290441-5-tanure@linux.com>
Date: Fri, 04 Sep 2026 09:56:31 +0200
Message-ID: <1jpkytlaa8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_005635_228664_7AC225E1 
X-CRM114-Status: GOOD (  21.57  )
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

On jeu. 03 sept. 2026 at 23:59, Lucas Tanure <tanure@linux.com> wrote:

> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
>
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
>
> This depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this one, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.

This information typically goes bellow the '---' because we will not
keep it for posterity. Please resend when your dependencies have been satisfied. 

>
> Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")

Thinking of it, we probably do not want stable to pick this up since
your other change are improvements that will no be backported. You can
drop the Fixes

> Assisted-by: Claude Fable 5 <noreply@anthropic.com>

The Assisted-by should not have an email, especially a no reply one.
check https://docs.kernel.org/process/coding-assistants.html

> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/clk/meson/t7-peripherals.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
> index 55d09e78593b..2f429ea86796 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
>  static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
>  static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
>  static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
> +static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
> +static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>  /*
> - * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
> - * used for DMA between the peripherals and the DRAM. After the clocks are
> - * disabled, a device that starts a transfer cannot complete it.
> + * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
> + * the peripherals and the DRAM. After the clocks are disabled, a device that
> + * starts a transfer cannot complete it.
>   */
> -static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
> -static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>  static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
>  static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
>  static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
> -- 
> 2.55.0
>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
