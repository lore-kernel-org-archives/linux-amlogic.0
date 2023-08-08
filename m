Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39D1C001DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkFKEm6+MGYexL8Qz/DXWkuMjxnEL155+Y99eaXZP8U=; b=0eFZGRFQrngzko
	TdWG6lbbw/wGKqe77WLOyciECAB4B8TCnpI3k8rQ6PuKrkMuXJ6I8KW3CoEar3mjQKlbfs35CDcCg
	G+D/aW+hUFUEF3Yabm2pMQaYsH7kOMaPLDv7VtvEFMtjdwFMGWaQxtPGFISdPbCgrkWkf+w7X+4m3
	Tp2mSVZv746hrWOvJftY4shJWoqotgAwM0bMS0k2SmiJ7XSgUqFnTGQhzCVmgArTaTpAlkZwuFcnN
	wE/eoKwiXVCmMvGjtsqoIgxvdWF1BtDy7T2vpY3UEQXmGwB9i0zVsyRmpSMM8s0W0ZTF0vzUZ0M5I
	zBg+Ddp0Q7sS6eDOFLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMk1-002du9-1i;
	Tue, 08 Aug 2023 13:27:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMjx-002dtE-2Y
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 13:27:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so47756855e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Aug 2023 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691501231; x=1692106031;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mFOhD8TvrN3kEaAYXPGjF3oU27kR58bUIX2cHeJs6g4=;
        b=tPIFhmOdeEenRL7wYYGWm/D0K2Zg8ApnOvAu+CbGiwCup+E5Hcf9dE+y2+XmmbDV21
         XIeYIjP0+cQa5amOMaePmZXXGFCLWi7eveg6CG0IovgePORfsKsSb4WGslhfkaDjWoOg
         b2BjMZkncQv809d9b3OYRUuHWeO0t1W4o/EUQmTymRqDMtvi3U5fTKT4UZtP/anE0gN8
         AI4A4SeB/XRqLUfSMVkQL9skmNLzymrTh5+4whHGRLQZJvtBQCv3aWJEdeDes6rk0Sfo
         8amuwzgbqi2dhhooZ8+x8Yp51L8F32W30YUAp3+qlOi6XwygXyvTtSwEIS0aPKnkjLhM
         7MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691501231; x=1692106031;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFOhD8TvrN3kEaAYXPGjF3oU27kR58bUIX2cHeJs6g4=;
        b=c9XWQ8eShsGfPRo1ZdaumlhwdaW5vi5cdsjpehqXOljWLngfY4MnNku5u7zOBWLZCD
         8hl/RsjfZL0KQAKuZVAcW9PwhGc2yI3fvpZR3tdX/Jk4m12SscdY8E1L3qGTnch+oepl
         zp53qB8cF3Z5q9gkrDeRw1M19fHEifBf45k+7rjpNewwrKOC8K0zPcxvjbpK/sE0V76k
         9cbmipxiGgrAY61f472noN6lOZFOKIGZAk/ge9oAEUsJa85tc0XTooVxduiOAXMDQ59W
         QAsXRoOy96154tLNUI2HbAdrPLSsgTQCHfUj2JnBkIH4TJm3M2VRSoR1yBuUwc04z7wR
         D6Pw==
X-Gm-Message-State: AOJu0YxQT8KEPSFL8I801R7qGihBb+HrEK4ABClWbU+8DPscs2IXaVn6
	rVjr5KR9GhNKckNu54Rq/sp/mp85yck2YvFv3WA=
X-Google-Smtp-Source: AGHT+IFozB535bQ3dsOdzC8ibC2SVAdeAA6xH1Rr7AndjIWl+K+Gm3Yi/Og8fGDBzvdPVLlNGUdwCw==
X-Received: by 2002:a05:6000:1247:b0:317:f4c2:a99d with SMTP id j7-20020a056000124700b00317f4c2a99dmr2600500wrx.53.1691501231461;
        Tue, 08 Aug 2023 06:27:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.gmail.com with ESMTPSA id r2-20020a5d4942000000b003063a92bbf5sm13729592wrs.70.2023.08.08.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:27:11 -0700 (PDT)
References: <20230731042807.1322972-1-wenst@chromium.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: meson8b: Simplify notifier clock lookup
Date: Tue, 08 Aug 2023 15:21:46 +0200
In-reply-to: <20230731042807.1322972-1-wenst@chromium.org>
Message-ID: <1jpm3xoea9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_062714_018856_9C961364 
X-CRM114-Status: GOOD (  20.28  )
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


On Mon 31 Jul 2023 at 12:27, Chen-Yu Tsai <wenst@chromium.org> wrote:

> The driver registers a clock notifier by first getting the name of one
> of its clocks it just registered, then uses the name to look up the
> clock. The lookup is not needed, since each clock provider already
> has a clock attached to it. Use that instead to get rid of a
> __clk_lookup() call.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Found this could be simplified while looking through some clk core code.
>
>
>  drivers/clk/meson/meson8b.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 827e78fb16a8..c4336ac012bf 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3793,7 +3793,6 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  {
>  	struct meson8b_clk_reset *rstc;
>  	struct device_node *parent_np;
> -	const char *notifier_clk_name;
>  	struct clk *notifier_clk;
>  	struct regmap *map;
>  	int i, ret;
> @@ -3847,9 +3846,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  	 * tricky programming sequence will be handled by the forthcoming
>  	 * coordinated clock rates mechanism once that feature is released.
>  	 */
> -	notifier_clk_name = clk_hw_get_name(&meson8b_cpu_scale_out_sel.hw);
> -	notifier_clk = __clk_lookup(notifier_clk_name);
> -	ret = clk_notifier_register(notifier_clk, &meson8b_cpu_nb_data.nb);
> +	ret = clk_notifier_register(meson8b_cpu_scale_out_sel.hw.clk, &meson8b_cpu_nb_data.nb);

Hi Chen-Yu,

Your patch seems valid, as CCF stands right now.

However, I believe there is a will to drop the 'struct clk' instance that
automatically gets created with each 'struct clk_hw'. This change would
not help going in this direction

Stephen, what do you think ? 

>  	if (ret) {
>  		pr_err("%s: failed to register the CPU clock notifier\n",
>  		       __func__);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
