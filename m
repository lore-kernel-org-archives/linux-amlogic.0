Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254D7EB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5qudpNKywmk9zyeh129Run0EpuB5NK6H6tiqGGPPbE=; b=STsEpsBK7UBtko
	M4ak6b5jyXSY4DQ27jiYnJBzJLa/SoTVA6JlHZKKCoCAlEeaZb4G0OXEP26X/RJHdAmbgm3cPcYXw
	zvUty/oRzIdlIzCzLcs1xvl/X8kWNznnd42ZLeWb84N/Td4EHfQq9XL27ApnYVr0dc+ETuAomtkYX
	IN337Cl0pu3N14faaFEaQ4jX6/1WAMCrSf2teAd80HkUYzhwLB+Wng6xn957BCpPdDM6mjzGwGcM3
	WcOZl+uD72ziIyK5W9uMkWnOo5P4rg0ekTCkLm0s3FdzVhJupzsodDK94r5FSh91F/F/SI/2Y6m/D
	mTHp58SamIpClHrVbcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ20-00AXxH-1v;
	Thu, 20 Jul 2023 09:33:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ1x-00AXv1-39
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Jul 2023 09:33:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so4795015e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Jul 2023 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689845583; x=1692437583;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0I/iaPEzUEhsk7qMRr53QBuJ7Bxl0Kbw3PT2/wYCuU=;
        b=2X+zhDlo5wXDWQMt5yn9fl7RnbGUecReZNoJEiI57fLEAVM+LThrgRagS36eErFlL5
         dug/3YWfk/G6c4LaPZBStvk4jMn2YlSukqK1IRNZ/dBQQPy1vsEKVHPeB9aHLEMnLyGS
         vlrEyN7gLleaIm+ErmEJMsaE7ZWYvMT635uA2detnQtc5wQ8bkpjjBcHNAuC4RA0k894
         u6LiO6aBNa3/Hqchkgm8uHN14D54G6Z7kg6bQPXa7HNJhVFbZmYIwYS+jC4dloMZLeb3
         MfXAf72x0NuznNgLsuB7VKjvrEcP/aMgfHcee6ExGTpIwN782sjk1V1OdipRLRtBRvH7
         gH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845584; x=1692437584;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0I/iaPEzUEhsk7qMRr53QBuJ7Bxl0Kbw3PT2/wYCuU=;
        b=kh1l9RE31dnldiSQCkl+2gJGjtuad0qcsS2INB88Dyo5LUyba3BLBXJwSK6CAGG+LH
         CKpriMOAYARp7Togcg3QdyL/gJIbLak+hhg5KNDYW2dh/FQTNGLwrzCubqxW24gTrQE9
         JNjLMUsvvaEQWFjcdqr3XwnUK4CH/PUGXSr85I/qo525iX2iWZ4B1zCV1JNIKtwX36TR
         q1WRX1pA83gOu/1DKPEdi/0t9eIypiwVd06NtQRSAv0C+Xh1kT+z7+9i4RA9YBJVMK97
         NrfpsJdpWVkKAN5BXgCZvBkyZHWNWo4SaiOIYinGyGnQpeZNa2pVkMZNRwwHANoubt+E
         uMLg==
X-Gm-Message-State: ABy/qLbi22LUEcyFk1LIbIK3d09391euEzhkeeo6OmaRxtnuyWexAW1S
	zUO6mAV1iLGJgk0n8epeL+M/gA==
X-Google-Smtp-Source: APBJJlGhEUTy8yPCE0oYTy5atycBVh9x5P2zg+Y+2dW9AT3Q1LxA7UePnVPV5JA6RXZ+MkhAmTBd8w==
X-Received: by 2002:a7b:c850:0:b0:3fb:c990:3b2 with SMTP id c16-20020a7bc850000000b003fbc99003b2mr1349366wml.34.1689845583604;
        Thu, 20 Jul 2023 02:33:03 -0700 (PDT)
Received: from localhost ([82.67.6.57])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bca4a000000b003fc00702f65sm3428984wml.46.2023.07.20.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:33:03 -0700 (PDT)
References: <20230704215404.11533-1-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jan Dakinevich
 <yvdakinevich@sberdevices.ru>
Subject: Re: [PATCH v2] clk: meson: change usleep_range() to udelay() for
 atomic context
Date: Thu, 20 Jul 2023 11:32:44 +0200
In-reply-to: <20230704215404.11533-1-ddrokosov@sberdevices.ru>
Message-ID: <1jsf9jnd0x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_023306_021734_5545A707 
X-CRM114-Status: GOOD (  17.84  )
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


On Wed 05 Jul 2023 at 00:54, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> The function meson_clk_pll_enable() can be invoked under the enable_lock
> spinlock from the clk core logic, which risks a kernel panic during the
> usleep_range() call:
>
>    BUG: scheduling while atomic: kworker/u4:2/36/0x00000002
>    Modules linked in: g_ffs usb_f_fs libcomposite
>    CPU: 1 PID: 36 Comm: kworker/u4:2 Not tainted 6.4.0-rc5 #273
>    Workqueue: events_unbound async_run_entry_fn
>    Call trace:
>     dump_backtrace+0x9c/0x128
>     show_stack+0x20/0x38
>     dump_stack_lvl+0x48/0x60
>     dump_stack+0x18/0x28
>     __schedule_bug+0x58/0x78
>     __schedule+0x828/0xa88
>     schedule+0x64/0xd8
>     schedule_hrtimeout_range_clock+0xd0/0x208
>     schedule_hrtimeout_range+0x1c/0x30
>     usleep_range_state+0x6c/0xa8
>     meson_clk_pll_enable+0x1f4/0x310
>     clk_core_enable+0x78/0x200
>     clk_core_enable+0x58/0x200
>     clk_core_enable+0x58/0x200
>     clk_core_enable+0x58/0x200
>     clk_enable+0x34/0x60
>
> So it is required to use the udelay() function instead of usleep_range()
> for the atomic context safety.
>
> Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
> Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Applied, Thx

> ---
> Changes v2 since v1 at [1]:
>     - remove redundant SoB from commit msg
>     - drop unuseful reference to clk_core_enable() from commit msg 
>
> Links:
>     [1] https://lore.kernel.org/all/20230703200404.20361-1-ddrokosov@sberdevices.ru/
> ---
>  drivers/clk/meson/clk-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 56ec2210f1ad..eef6f37c8d8d 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -367,9 +367,9 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	 * 3. enable the lock detect module
>  	 */
>  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -		usleep_range(10, 20);
> +		udelay(10);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
> -		usleep_range(40, 50);
> +		udelay(40);
>  	};
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
