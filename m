Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBABCF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSme7nOvr2foeWbcONx8uaNhAUaMV58hTFb4Ve/s4Xg=; b=eYhXyEvJi/N/ef
	pzJ4kZFqHNwl6FUTHEf1wlg89ZMkiSUDOUjeSGsuOM38bgob1nAX96BAGsntYi6p+Jgn40d4uY10k
	W+lCh+XCdijVtSagjKSYKEdn39pBV5SxwfeijFFTh4js6Z7tpMepcDA49jO0hdw4BHRLWyYnNwV/h
	whhIOSQq+ORGWzjDi4Pi49uPDUw0QFJJ32yShNQMJKezxbTXom8E1zTp0t/s/P6xrNrQSQr8kLL0F
	3gTClvihZAQuycY+3W9JrqgaFdmTfL9tgMXWFTC72wXL7dZi8e9HPmnKpnxZ1R/1zPqbJHCUGacwm
	MOWyLJ+fMSYshMSTLd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1GP-00000001ffa-0BN3;
	Tue, 24 Sep 2024 08:51:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1FE-00000001fPv-2IKh
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Sep 2024 08:50:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso24675055e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2024 01:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727167803; x=1727772603; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLT/SzHIzy0JlAtGhmMyl4zLyv9ksuRCgSOREEXXts4=;
        b=N1ikPacgnB3qEAeBwXLdOD2M3Vm56ayZShozPmvh7W2jWSfbfbRr+DpSe6QiXa3kDG
         +pg4eo8Hl3KqufjELSFBE6aCkoIrWnQ2KyHOOuUrj2MBA20zFbb12QMOLXt+bYtwrudm
         J2H/4GJt9vvTd4C7tclFwQm9pJ9DdojPqZ12TXuJjr1N+rN92WVg3KjtWLf6Je3liUFo
         GtnZw+LNp15r6U6Sj8QQLYAGKxlUQ8ccvd+iaYEsYYi5lcPf/kJSG+mnPP0oWsgHYPLZ
         8vDrjxgfTxA+OLWkChxC/kjK+VvL2Dev5/E4xM9rBLdBAfAKH6j/oNl7+ez6pjOX1Fqu
         gYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167803; x=1727772603;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLT/SzHIzy0JlAtGhmMyl4zLyv9ksuRCgSOREEXXts4=;
        b=P3vZyWwjEi+EnNmgsT8i8lWgHpf0pGYSeV7xf+QzXsqOIFMSv/O2T9XNO+yYU2UR+A
         GEB1+Dv3Pta3+MowAwzP7iwrK8G4jjQPcJgaUsIX6pStoUoagTrHgz98UTi9hUi1iO0e
         8JKSJqOsiHyvFQCeS2czycVnLlOkqAGYbbdhsC0q/smu/RBMrpVrx5MnBVPn/b9g2Atb
         fbHtr9DawhzgNm66jKmebOQjdVOnTnJKUSK2wvLvQPGCcZFmOByEYo8rd5DeK4YsWyno
         TdkI1jkw4lfgrT5WQr6ZxQR6cB63rfeEGscLIM294DvoeSZp6QQcfTkFT+3QuFm98/WA
         yJig==
X-Forwarded-Encrypted: i=1; AJvYcCXB/4P8sMMJ2ucfg2/WdwuXeDqw67hUiz7NCHAedvfOEwg45HMYTjxWuexOR+W9Fu7xb9hhK+5OF2JZft2B@lists.infradead.org
X-Gm-Message-State: AOJu0YyEcO8215HkxJup1qBKu2/CJzRfydHGz7LTheFRNYqr1otL+2Lv
	VpHwtcs2oEWWsiOjT0wdfNokeZWyN5/FkmALYkp05VGVyyBKLvomDMA74jBE7sw=
X-Google-Smtp-Source: AGHT+IHYZcZN14sAyjcj8icXnMsQC74eoX/nukjCHNul7eCR0WgqA8i2UkpQG3AvK2nx7uxN33w1yg==
X-Received: by 2002:a05:600c:4fcd:b0:42c:baf9:beed with SMTP id 5b1f17b1804b1-42e7ad968d7mr87957755e9.27.1727167802666;
        Tue, 24 Sep 2024 01:50:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:885c:440c:fff5:ed00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e9029eeafsm14811755e9.25.2024.09.24.01.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:50:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: pll: Update the meson_clk_pll_init
 execution judgment logic
In-Reply-To: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com> (Chuan
	Liu via's message of "Fri, 20 Sep 2024 16:13:13 +0800")
References: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com>
Date: Tue, 24 Sep 2024 10:50:01 +0200
Message-ID: <1jy13hxwp2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_015004_885276_90180A92 
X-CRM114-Status: GOOD (  30.76  )
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

On Fri 20 Sep 2024 at 16:13, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The hardware property of PLL determines that PLL can only be enabled
> after PLL has been initialized. If PLL is not initialized, the
> corresponding lock bit will not be set to 1, resulting in
> meson_clk_pll_is_enabled() returning "false".
>
> Therefore, if PLL is already enabled, there is no need to repeat
> initialization, and the judgment "CLK_MESON_PLL_NOINIT_ENABLED" in
> meson_clk_pll_init() appears redundant.

Apparently you messed something up with b4 ...

>
> ---
> The hardware property of PLL determines that PLL can only be enabled
> after PLL has been initialized. If PLL is not initialized, the
> corresponding lock bit will not be set to 1, resulting in
> meson_clk_pll_is_enabled() returning "false".
>
> Therefore, if PLL is already enabled, there is no need to repeat
> initialization, and the judgment "CLK_MESON_PLL_NOINIT_ENABLED" in
> meson_clk_pll_init() appears redundant.

If the PLL is enabled, it has been initiallized, to some extent
yes. However we have no idea what the setting was. In general, I really
don't like inheriting settings from bootloader. It brings all sorts of
issues depending on the bootloader origin and version used by the
specific platform.

So in general a PLL should be re-initialized when possible. When it is
not possible, in most case it means the PLL should be RO and linux
should just use it.

Someone brought a specific case in between, where they needed to keep
the PLL on boot, but still be able to relock it later on. The flag
properly identify those PLLs. Much like CLK_IS_CRITICAL or
CLK_IGNORE_UNUSED, each usage shall be properly documented.

>
> In actual application scenarios, PLL configuration is determined during
> the bootloader phase. If PLL has been configured during the bootloader
> phase, you need to add a flag to the kernel to avoid PLL
> re-initialization, which will increase the coupling between the kernel
> and the bootloader.

The vast majority of those PLL should be RO then.
If you can relock it, you should be able to re-init it as well.

>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 3 +--
>  drivers/clk/meson/clk-pll.h | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 89f0f04a16ab..8df2add40b57 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -316,8 +316,7 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  	 * Keep the clock running, which was already initialized and enabled
>  	 * from the bootloader stage, to avoid any glitches.
>  	 */
> -	if ((pll->flags & CLK_MESON_PLL_NOINIT_ENABLED) &&
> -	    meson_clk_pll_is_enabled(hw))
> +	if (meson_clk_pll_is_enabled(hw))
>  		return 0;

I'm not OK with this.

>  
>  	if (pll->init_count) {
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..cccbf52808b1 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -28,7 +28,6 @@ struct pll_mult_range {
>  	}
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
> -#define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;
>
> ---
> base-commit: 0ef513560b53d499c824b77220c537eafe1df90d
> change-id: 20240918-optimize_pll_flag-678a88d23f82
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
