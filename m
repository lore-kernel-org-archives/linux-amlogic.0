Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37C6C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 23:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FFE207CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 23:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ieUk/TKw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rvy2470g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FFE207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=06zNNciwJ6FodHEX5VwsTD0qwW9J9Z7zd6eWC9SN+Zs=; b=ieUk/TKwLu9ePjCnFmZQArsO3
	V3o+kPf3wI/GyWMd9AL0g6nRfj7PRGNHKtWSYUfoDQsqowCyxNMLRSzcYxgyNuVMDDPS5EktvmHIr
	FifaUO9arGylQiuJtesvcSNWWfhdeUjM+ld1/C8aQVVs1PA70OrHx08rTQi6Rz7dKwVEa24Bczc4T
	nefpzndJVsauDgUnPDdFvSCDuE3ZIkwJmUuAIfiZ87+gHMu++mXkYaI3leyXYJza/kZgM+zn4KGYl
	P3NDIghWeI0sIg8zCEMPE0O0yp+/yurXZ+QSojUcjQIeDfRz9hSx4TlFivjsy9+xYkANE9NgLOwjr
	Hq/pc9uOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXuy1-0003Ij-De; Wed, 28 Oct 2020 23:34:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXuxz-0003IB-1v; Wed, 28 Oct 2020 23:34:55 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB478207CD;
 Wed, 28 Oct 2020 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603928092;
 bh=SkQS+kWFiHlNP9A0NCZXUnj0zgMwNgitxpz4kbLJEAU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Rvy2470gXdjhUuqsTnms1+9zn/3ltbcoGLut4tp8macFajRCZ/q11mXsb5MRbetJp
 x474Lxd6mDACqBiPmcl6Pl2Z9pr+557S2YUM1eKDOW49Qd2isIpjJEW+1NiCny6JNr
 AsHQgnPP4ZzPTqOL4kaUc4Y5a2EChaeY9L0PdUzg=
MIME-Version: 1.0
In-Reply-To: <20201026161411.3708639-1-arnd@kernel.org>
References: <20201026161411.3708639-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: define to_clk_regmap() as inline function
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Mike Turquette <mturquette@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Wed, 28 Oct 2020 16:34:50 -0700
Message-ID: <160392809056.884498.15602398724017724347@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_193455_199075_F7AC9D12 
X-CRM114-Status: GOOD (  12.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Arnd Bergmann (2020-10-26 09:13:57)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Nesting container_of() causes warnings with W=2, which is
> annoying if it happens in headers and fills the build log
> like:
> 
> In file included from drivers/clk/qcom/clk-alpha-pll.c:6:
> drivers/clk/qcom/clk-alpha-pll.c: In function 'clk_alpha_pll_hwfsm_enable':
> include/linux/kernel.h:852:8: warning: declaration of '__mptr' shadows a previous local [-Wshadow]
>   852 |  void *__mptr = (void *)(ptr);     \
>       |        ^~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:155:31: note: in expansion of macro 'container_of'
>   155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>       |                               ^~~~~~~~~~~~
> drivers/clk/qcom/clk-regmap.h:27:28: note: in expansion of macro 'container_of'
>    27 | #define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
>       |                            ^~~~~~~~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:155:44: note: in expansion of macro 'to_clk_regmap'
>   155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>       |                                            ^~~~~~~~~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:254:30: note: in expansion of macro 'to_clk_alpha_pll'
>   254 |  struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>       |                              ^~~~~~~~~~~~~~~~
> include/linux/kernel.h:852:8: note: shadowed declaration is here
>   852 |  void *__mptr = (void *)(ptr);     \
>       |        ^~~~~~
> 
> Redefine two copies of the to_clk_regmap() macro as inline functions
> to avoid a lot of these.
> 
> Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
> Fixes: 085d7a455444 ("clk: qcom: Add a regmap type clock struct")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-fixes

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
