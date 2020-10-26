Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44862C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:33:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC650205ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlOL8paT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e/I0HscW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC650205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9x5nP0uCueD26civ2HSykN1/6hDpvm8lf/iBAT6GRio=; b=qlOL8paTt/3NCodOr5/nIA6qi
	qTid3xoYG/4sjDuCI6U2cqlvlWmJZvrjQ/aMLPjFSyH24YseeL4DauW4FiJmdnp/Gnl3ju/54LTMy
	6fmkcXNjGQnVe6fduhPnrMbZoNBvlT3pKLWa4WbjMfIuX64a5JjP47Ztw8ylWHYBYcDyoSN1M4HVb
	Ac/Cgeq2bj2sV/MzV9ZRt5BPW/NBt265iID+0oQe17bW055LLyXbPx4Zl9SpnnHdK6V67VIJV4ALv
	9GPLWI+1ElSm61Bo8NbBkXUa04elzUVMozkDGwmGvf1N0vCZn4MrZx3CRdhHIryR04sRFtwX4DJV0
	pVfrnVyHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX5R4-0000nj-N6; Mon, 26 Oct 2020 16:33:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX5Qx-0000l4-LZ
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 16:33:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id e2so13160263wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=/lQRM2+EAb+jKRJafntJPMlzMeoOKfJANas/j8SJLN4=;
 b=e/I0HscW2QgWc5e2sSX9P9394/GMnjHxQzVKqbxpXS0yQNJgP5oMXIXyZELYT2JzT7
 /zH6+cn3Uvi6aBylxRweBESwO5QSHZDpYlx2Ba20Uha95pmp22BxEcmArfwiAiWCcabV
 9V63eoEtrRPg6WukH0OlQNvqmKxD5FVWjuB9oJhdkWo+z9pOv3XccJVVyEBiho+mFJDA
 94BY7C7W04ufQ39cbsIv+c/0H59wnNDwX4cXXetaFT/MbylnPG3ndSAwN8kXQr08QrIH
 P2BdAAu7NWWSYjex5WlaMWNrtgPEC4GbeMYI0GpWiyIpxEn5ZlrK9zIz7V+L7lJgnWIW
 N/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=/lQRM2+EAb+jKRJafntJPMlzMeoOKfJANas/j8SJLN4=;
 b=aD/LGaqkXoIhY1E9WrU5490+YH4OoIfFxZg+yFWOB21XI1EjaZhjaDPhbsBPn7G7FD
 iuQ3o6yuqP59xF5djYdwzRmmesL05q8UeeGgu1ono6DXI5LPQF8OHObMad/k5VBWe8gM
 Pq+R91eD1VOL7pzrP45qF1l8PsBGxsAbjOrwxEgAhWx/sVsK9T7K8NR6AiqOD7d3aLMB
 Mg4O+ftPhwOeafDyLTSYLKsSRMv96aVKsF/wa9onmWJK01PBeEzNz4+t/0m6WAf3GyPP
 3+cRBFWjOKjtkd/5KVvG79fOUl5e6vuY/9505NhyLtdufmOipyPyxvE36hFUeZIpbapS
 Lwuw==
X-Gm-Message-State: AOAM532Tv9RLtIBIXweMaUD0tLswAi7qY61j0wKDufBz0DKb5B2977aU
 kSNQ1/F+t1MEDfOJzf1nNkrtXQ==
X-Google-Smtp-Source: ABdhPJyreI18jIz7IrPx9Nt27h0Xuo9pf/2DbqlqowWOvewXDYrAULqhjkoLwyDCkT1sfcHYa7Oc4Q==
X-Received: by 2002:a1c:e354:: with SMTP id a81mr16520015wmh.101.1603730002576; 
 Mon, 26 Oct 2020 09:33:22 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id m8sm22620877wrw.17.2020.10.26.09.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 09:33:22 -0700 (PDT)
References: <20201026161411.3708639-1-arnd@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: define to_clk_regmap() as inline function
In-reply-to: <20201026161411.3708639-1-arnd@kernel.org>
Date: Mon, 26 Oct 2020 17:33:21 +0100
Message-ID: <1ja6w9j6b2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_123323_793578_17B652EB 
X-CRM114-Status: GOOD (  17.15  )
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


On Mon 26 Oct 2020 at 17:13, Arnd Bergmann <arnd@kernel.org> wrote:

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

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/clk-regmap.h | 5 ++++-
>  drivers/clk/qcom/clk-regmap.h  | 6 +++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index c4a39604cffd..e365312da54e 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h
> @@ -26,7 +26,10 @@ struct clk_regmap {
>  	void		*data;
>  };
>  
> -#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
> +static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct clk_regmap, hw);
> +}
>  
>  /**
>   * struct clk_regmap_gate_data - regmap backed gate specific data
> diff --git a/drivers/clk/qcom/clk-regmap.h b/drivers/clk/qcom/clk-regmap.h
> index 6cfc1bccb255..14ec659a3a77 100644
> --- a/drivers/clk/qcom/clk-regmap.h
> +++ b/drivers/clk/qcom/clk-regmap.h
> @@ -24,7 +24,11 @@ struct clk_regmap {
>  	unsigned int enable_mask;
>  	bool enable_is_inverted;
>  };
> -#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
> +
> +static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct clk_regmap, hw);
> +}
>  
>  int clk_is_enabled_regmap(struct clk_hw *hw);
>  int clk_enable_regmap(struct clk_hw *hw);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
