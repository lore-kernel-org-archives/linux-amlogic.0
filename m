Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEDFEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjWJlJQIyKRzIPt9P3Z/Z3WJTSr5syxoIt0pLwmdXMQ=; b=1fyHiM1/V+7xXq
	xVInDulYn/Ni6E44LGD6D0NhQfoWwwjzTqrH8pCP3MI9PekascWH/b95gP3jZk6LZq/EVnBU4OsJw
	XsTkEJKN5wTbm1nUZc/pc9QwGHCpKt+Igw8uvRpIf6Ja+4X8Swid1kGELAiRO5VS16TvNfjWcXyl5
	Lb6e7T7pvJ5SsRuWzq1ruTY+0KR0D4XZBP1zLyYXmG3ddk96JqjZ+vW2N+bZTTE2W04rr0ZMeCkh4
	iqmvpkIFTJzk6NvXzATz8AOJIee3a+W8Db2SBaQlqtMDmxbpcBpkox+r/FjbYyNtkJL7mkc5coC3T
	ng+ZCR6Z0TvlgUYhzsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGmC4-00E8Ok-15;
	Tue, 04 Jul 2023 20:00:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGmC0-00E8Nq-22
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jul 2023 20:00:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so58870785e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jul 2023 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688500804; x=1691092804;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=1fHzMQe/+l45AJ3P9Rbxg4rzS7GRLXVPi798OCju+Z4=;
        b=HQwGSsPcJ+uQHbqPMy98njNj6tF+eQEfyemUayPA+ZJf1lOYRUPLq+6aTVWIpacQzf
         vjhM9O7nFCAGNwkm1s+9r+cTLRansqTYdh0j3fl0rtMmAtjhYvow7V1RefZEzMFY7haR
         NpbEhCtVdafdme+quovgSGdaG6vMZmxL3qcS6lQuXfZXcOYRGLBl541S6xAwnhV4//Fd
         AyDDvLWwy7Etxx/OzT1DyIScjKRyie11qVqqvW1Vem3lLtYyRZAgU+naLKvi97z+j2UO
         Ka9I7yQnBZ/grCmv6tXVUgj0AGWg/iUzh3YeM8MsgWYWCAWI9UlFLCnC8+N+pNuJjxti
         oSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688500804; x=1691092804;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fHzMQe/+l45AJ3P9Rbxg4rzS7GRLXVPi798OCju+Z4=;
        b=aQWqtfMRLUMR8BcaTq9o7jucgIs+D3biXm3fq+d/HAZEketfS7zi/+SWT/F/RA7Mvd
         NnD67VJ+4fnaMFr00rdgfG+er+17UKyxn0C5Z/6/OacRGiPU8MDDB+CHaPIPmENrrw49
         kyn3lQVxso89yvgzw6MiiL3t+t7sC7IdMoYvFxjmr3mchvZOyX3C8wG1FLZjE7zpCU6u
         L0Ss2oMgoyirX5IwIdI050jNctouMKUTwFTl5BQucpDG4IdwWTyXgx1WvZepG7DcO5ZQ
         HnmGX869JJMtrv+mtB8/Z3QGoCtMoQpKy5GGAK5jdxWTi5demoXVz7/FbUbwGtCbAZxd
         VD/Q==
X-Gm-Message-State: AC+VfDzzFNXg32DEABHou179gcUvY33xk+S9v0URH3Tv4U9S3lxrsUxk
	/aCJ2mYxXk72xGQzBZXBxQP8og==
X-Google-Smtp-Source: ACHHUZ4qKooTw7KG7/DJ2LWDyTsusB+7bUHH6LJuNOebyrTILr8eT7yOrJujqqFlxcqRyYVsTymoUg==
X-Received: by 2002:a1c:7409:0:b0:3fb:7724:254b with SMTP id p9-20020a1c7409000000b003fb7724254bmr11950726wmc.9.1688500803967;
        Tue, 04 Jul 2023 13:00:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb0:4a33:b29e:11b3:752b])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003fbb346279dsm10194wmj.38.2023.07.04.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 13:00:03 -0700 (PDT)
References: <20230703200404.20361-1-ddrokosov@sberdevices.ru>
 <1j352378zh.fsf@starbuckisacylon.baylibre.com>
 <20230704195451.7gklbmyautuajqtq@CAB-WSD-L081021>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jan Dakinevich
 <yvdakinevich@sberdevices.ru>
Subject: Re: [PATCH v1] clk: meson: change usleep_range() to udelay() for
 atomic context
Date: Tue, 04 Jul 2023 21:58:31 +0200
In-reply-to: <20230704195451.7gklbmyautuajqtq@CAB-WSD-L081021>
Message-ID: <1jy1jv5tx8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_130008_674161_1D974D10 
X-CRM114-Status: GOOD (  27.89  )
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


On Tue 04 Jul 2023 at 22:54, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> Hello Jerome,
>
> Thank you for the review!
>
> On Tue, Jul 04, 2023 at 09:43:41PM +0200, Jerome Brunet wrote:
>> 
>> On Mon 03 Jul 2023 at 23:04, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>> 
>> > The function meson_clk_pll_enable() can be invoked under the enable_lock
>> > spinlock from the clk core logic
>> 
>> ---
>> > (please refer to
>> > drivers/clk/clk.c:clk_core_enable_lock()), which risks a kernel panic
>> > during the usleep_range() call:
>> >
>> 
>> This part of the comment is not very useful - please drop it
>> 
>
> Do you mean a stack trace or reference to clk_core_enable_lock()?

The comment about clk_core_enable_lock.
The stack trace is useful, it may help people googling the warning

>
>> >    BUG: scheduling while atomic: kworker/u4:2/36/0x00000002
>> >    Modules linked in: g_ffs usb_f_fs libcomposite
>> >    CPU: 1 PID: 36 Comm: kworker/u4:2 Not tainted 6.4.0-rc5 #273
>> >    Workqueue: events_unbound async_run_entry_fn
>> >    Call trace:
>> >     dump_backtrace+0x9c/0x128
>> >     show_stack+0x20/0x38
>> >     dump_stack_lvl+0x48/0x60
>> >     dump_stack+0x18/0x28
>> >     __schedule_bug+0x58/0x78
>> >     __schedule+0x828/0xa88
>> >     schedule+0x64/0xd8
>> >     schedule_hrtimeout_range_clock+0xd0/0x208
>> >     schedule_hrtimeout_range+0x1c/0x30
>> >     usleep_range_state+0x6c/0xa8
>> >     meson_clk_pll_enable+0x1f4/0x310
>> >     clk_core_enable+0x78/0x200
>> >     clk_core_enable+0x58/0x200
>> >     clk_core_enable+0x58/0x200
>> >     clk_core_enable+0x58/0x200
>> >     clk_enable+0x34/0x60
>> >
>> > Considering that this code is expected to be used in an atomic context,
>> > it is required to use the udelay() function instead of usleep_range()
>> > for the atomic context safety.
>> 
>> Please use an imperative form, instructing the code to change 
>> 
>
> Ack
>
>> >
>> > Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
>> > Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
>> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>> > Signed-off-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
>> 
>> The tags are confusing here
>> I suppose a 2 lines change has not be been written with 4 hands ;)
>> 
>> If Jan just reported and you made the change then drop his signed-off
>> If he did the job, then drop the reported-by and change the author
>> 
>
> No problem :) Sometimes 2 lines change is produced during 4 hands
> debugging :)
>
>> > ---
>> >  drivers/clk/meson/clk-pll.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> > index 56ec2210f1ad..eef6f37c8d8d 100644
>> > --- a/drivers/clk/meson/clk-pll.c
>> > +++ b/drivers/clk/meson/clk-pll.c
>> > @@ -367,9 +367,9 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>> >  	 * 3. enable the lock detect module
>> >  	 */
>> >  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
>> > -		usleep_range(10, 20);
>> > +		udelay(10);
>> >  		meson_parm_write(clk->map, &pll->current_en, 1);
>> > -		usleep_range(40, 50);
>> > +		udelay(40);
>> >  	};
>> >  
>> >  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
