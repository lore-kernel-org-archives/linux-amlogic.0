Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A45EB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FfiaReB+vCeTHNmTB/0Rwl8EZfn/27wacAXPHfn/iM=; b=4dA0t89QPgYi4C
	e+10lizhzSjhHN8bDrSHY5WD/wispqtQFmv4KaZmEEJhDbJSPgu4jTd0iaGBYE5fjx4Md71ff1XBC
	1cRxKtGyN4V6kVUZ4rko9cgv0Xc1WIyVFpFJpjS8AYIQb56m0Bf6W49SZl3yXvG/O6z8yfBEHZD5j
	DrhxslVP+qKLpmTlXPUfSqgAOvoGWcxf/Tvu3cObAZ4NVMrkKqn0CAJ76zh2D4yB0TWnM60qmAmFu
	YN/CvHID6oXfk7h2BE2ul0mVzJkMXjAhRfDHcqI9oty9MyRMoYNR4ycoD34CsEwwdlpNjQP7MkdWi
	PFjImMyNUZjlhYT69rIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGm1j-00E7Mj-0J;
	Tue, 04 Jul 2023 19:49:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGm1e-00E7LU-2N
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jul 2023 19:49:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso126615e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jul 2023 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688500164; x=1691092164;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=EdjD12mLjrubd9LiIcpeNaHmVZbYmclMm7zHBZ2Fkpg=;
        b=knQVL2U22Ne7jmK0cTYZiZFPPfxEajIC3cbRgWETVex21tWHkjefFSHsQEHZRB9A/w
         XnMbQda5UyB4+q4nuBqADh6Gbae5YuY7/dtY3q3yFeo3+DXfBuksqegVrKUm2342J7Ad
         RKS0bHyxICZX+OQu4KDM1wj9YHUhAPdZir5WV/svQ8qL1Yll6DvVvlVvy+YRy706uTBW
         m0MBNfArr5cXx8G2GoTEntIsxXR7BvWVUdNx9cpW1m6Juf6W0UB4rltnSwnsKiFiHq7K
         35+3Rc5/5Apt9xtwWFA5G0XDq2/bjt4Djk8Nl1xC9rglC1YAk1n/7anXu3VgsJTXDAFD
         mZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688500164; x=1691092164;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdjD12mLjrubd9LiIcpeNaHmVZbYmclMm7zHBZ2Fkpg=;
        b=bY3nWy/CZ13AGeR2bJlmC7AqiuQ9eh9LTobZObSJJ6XZY584CCIrPMUlccTVezwSp9
         XuaB/zO7lpKQZ23kDBQJJVp4chOL6tiuqMANmVBdczuOE6wPphRlngJXlesFUM0ACKFp
         Gf6QDfZGUfjBWfZKf2RcixeTuMDzOkM7D827+O5lc0zxMNjAh9YmVzfZF+uVjdrLdPZp
         TOAEA6HSjZ6TY7UzBW+UWGIgjPymVUYZbE3y8mhzsd+Ao2KHIAICjvRdc63dUVH18L1Q
         3nHArH3pgAufhXcyHNJIJRShDBzifyWM3tU1GtVqdAjjW9s/Ldqy+tTVgPfscEoy26DM
         YQGA==
X-Gm-Message-State: ABy/qLbL+Oce86HhUxnYcjVhwwMKIXLXV8jNjeSWk7TBxpekX9MmcZ7A
	ln2lJ6wm+7xfkcYlJcSleEWvJw==
X-Google-Smtp-Source: APBJJlH7XakHreAuNvdoXv69gb3pRw0Kh/eh/RZHhqX4D22qNDPubZrMELB/eSiAzwNSqBZAMkTVNg==
X-Received: by 2002:a05:600c:519a:b0:3fb:b18a:f32d with SMTP id fa26-20020a05600c519a00b003fbb18af32dmr181814wmb.17.1688500163573;
        Tue, 04 Jul 2023 12:49:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb0:4a33:b29e:11b3:752b])
        by smtp.gmail.com with ESMTPSA id f7-20020a1c6a07000000b003fb5e3710d3sm22805015wmc.43.2023.07.04.12.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 12:49:23 -0700 (PDT)
References: <20230703200404.20361-1-ddrokosov@sberdevices.ru>
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
Subject: Re: [PATCH v1] clk: meson: change usleep_range() to udelay() for
 atomic context
Date: Tue, 04 Jul 2023 21:43:41 +0200
In-reply-to: <20230703200404.20361-1-ddrokosov@sberdevices.ru>
Message-ID: <1j352378zh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_124926_956643_EE3F43D3 
X-CRM114-Status: GOOD (  22.30  )
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


On Mon 03 Jul 2023 at 23:04, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> The function meson_clk_pll_enable() can be invoked under the enable_lock
> spinlock from the clk core logic

---
> (please refer to
> drivers/clk/clk.c:clk_core_enable_lock()), which risks a kernel panic
> during the usleep_range() call:
>

This part of the comment is not very useful - please drop it

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
> Considering that this code is expected to be used in an atomic context,
> it is required to use the udelay() function instead of usleep_range()
> for the atomic context safety.

Please use an imperative form, instructing the code to change 

>
> Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
> Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> Signed-off-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>

The tags are confusing here
I suppose a 2 lines change has not be been written with 4 hands ;)

If Jan just reported and you made the change then drop his signed-off
If he did the job, then drop the reported-by and change the author

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
