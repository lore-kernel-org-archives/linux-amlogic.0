Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A07CE8349
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMXqGpwoGZoU4iayFjNtSC8z4oOnCQAOGSMvKr2TkRg=; b=4eP0rH47tb7dK2
	fnmM4JZWJ8w0cZ35WMXVw/f7zN6jhy45KsofrpBs+zVI/r+/XXfRjsMAJ7Gzxp00IOqzVOmnjeFQb
	e+E5bUql+zij8Snvqjt+RsC6wkNjHYYC5NYqK1jGiXKwHFwehNMm2YMMOdL4TYy0j4SihM8o4BUx+
	0x9uwDVQbQZr+DEmGnKZ123uZKO3MzByNgW5ntA/Uh15/kxm3EbvxPqFbgH57snky4hHR/iHUbvRR
	xDAGM87+2RcwkCIjUaVaN+OxSBIuBgBG/79u+9Z210lFmxR5YeDwztmmPuMMtObi1TK05y1G7FNjh
	KOaFBWbpTPkGuAilvurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHBM-0000000HTog-22NH;
	Mon, 30 Sep 2024 14:15:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFUa-0000000H2lc-03Gy
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 12:27:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso31525135e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 05:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727699226; x=1728304026; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnfvxkU+3SpvaCEsw37+aVnbvjFaWPB2+8ZOExgpE60=;
        b=cAddJfdIe69eSkMSvATFfVUwJyLQARvl0vnb/5B3Nl/e10iXIzo3D/V4c+ds16fvz9
         lvzfsfuN6nSHWPkoTKK0B8spJRn+GLbBd8CqBkbNpmjnhkiQhKN6w0eXPBzYOkrXTiLB
         WpwpvsPYqD3+aL8u9LdNlOSjlxgaNcgTrOadnDs3UaYxa5Wg+Af4CX06u2bVx8livdot
         mZGKrqlQanY/X1wgLHBQw9L6ucfqRGftpxd0g7fC6xVCHnqosfPAi6tAC7Vuqz/XIXCT
         MFiGhH29SPH53oRE3RMUjifJeR23CZjxcjpmAHl/R0fuOImeqOqoMLWTv88uzU1omQlU
         VVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699226; x=1728304026;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnfvxkU+3SpvaCEsw37+aVnbvjFaWPB2+8ZOExgpE60=;
        b=BcbqAT3d4oeDImCymmj8NNJ3F5p/5ioq3E7qZtOq3w12Jr4gSyiq9ctDzxNQFCi6QW
         R/AGjwjT0LdMVYA8qtiI3FLEAW6E7QwZT4cYqJU1rrt/TGtAnnHXMp4xxmpxrWmybapw
         md+bGV1G8HZ8yBUvSarKvSPANmEZpYfzM47fKSj+1GeDbmIGZ4L/WbebK9Ez8dIMJmGh
         pcX1t2Rn6ougwiM+0fNjFplvDgsOF2+616KGa9EVbQ90DvfnHKYGl1o+BKPrUGc2FvmK
         7da3mCKvhsNP4irWfSm9uKuuGrWWa5aY7GoCRdSVsriStpBgb4Jo85O/ZXmurOs/3EtT
         dyTA==
X-Forwarded-Encrypted: i=1; AJvYcCVA1aYRr9yiWYaCwuieCzOBiKhJjf5VB23Di/l9k8rhSNJxaSJCnrLK6OPgfNcbNNVwtZc14CdMJqak8iQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YyhX05Ib1jmykEy3S8HnhDL0L8dgBu7+1RO478bLx91hkXjLLTJ
	uOxrehyB6d9aZlacuV2VEAUtPQo6EqdfdX0eVZnv0ITHSJY/j7cr/SYH66ESS58VzswcQhW9QWX
	PFRg=
X-Google-Smtp-Source: AGHT+IE14OFcN1Aoo5OXrKzTjQCJkSgzSoOhRyTY+Vz61AiXH/EbYZGwPtPCvJZVvzG7X4TErPBjKw==
X-Received: by 2002:a5d:500f:0:b0:374:ba78:9013 with SMTP id ffacd0b85a97d-37cd568e21cmr6844128f8f.9.1727699226325;
        Mon, 30 Sep 2024 05:27:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5752a09sm8911834f8f.108.2024.09.30.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:27:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: Fix the CLK_IGNORE_UNUSED failure issue
In-Reply-To: <20240929-fix_glitch_free-v1-1-22f9c36b7edf@amlogic.com> (Chuan
	Liu via's message of "Sun, 29 Sep 2024 14:10:05 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-1-22f9c36b7edf@amlogic.com>
Date: Mon, 30 Sep 2024 14:27:04 +0200
Message-ID: <1jed51tjhj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_052708_274633_67A53D30 
X-CRM114-Status: GOOD (  28.44  )
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

On Sun 29 Sep 2024 at 14:10, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> When the clk_disable_unused_subtree() function disables an unused clock,
> if CLK_OPS_PARENT_ENABLE is configured on the clock,
> clk_core_prepare_enable() and clk_core_disable_unprepare() are called
> directly, and these two functions do not determine CLK_IGNORE_UNUSED,
> This causes the clock to be disabled even if CLK_IGNORE_UNUSED is
> configured when clk_core_disable_unprepare() is called.
>
> Two new functions clk_disable_unprepare_unused() and
> clk_prepare_enable_unused() are added to resolve the preceding
> situation. The CLK_IGNORE_UNUSED judgment logic is added to these two
> functions. To prevent clock configuration CLK_IGNORE_UNUSED from
> possible failure.
>
> Change-Id: I56943e17b86436254f07d9b8cdbc35599328d519
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 285ed1ad8a37..5d3316699b57 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -94,6 +94,7 @@ struct clk_core {
>  	struct hlist_node	debug_node;
>  #endif
>  	struct kref		ref;
> +	bool			ignore_enabled;
>  };
>  
>  #define CREATE_TRACE_POINTS
> @@ -1479,6 +1480,68 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>  	}
>  }
>  
> +static void __init clk_disable_unprepare_unused(struct clk_core *core)
> +{
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return;
> +
> +	if ((core->enable_count == 0) && core->ops->disable &&
> +	    !core->ignore_enabled) {
> +		flags = clk_enable_lock();

Used core->enable_count without taking the lock

> +		core->ops->disable(core->hw);

If the there is any CLK_IS_CRITICAL in the path, it is game over.
You've basically disregarded all the other CCF flags which are equally
important to the ones you are dealing with.

> +		clk_enable_unlock(flags);
> +	}
> +
> +	if ((core->prepare_count == 0) && core->ops->unprepare &&
> +	    !core->ignore_enabled)
> +		core->ops->unprepare(core->hw);
> +
> +	core->ignore_enabled = false;
> +
> +	clk_disable_unprepare_unused(core->parent);

Here you are disabling the parent of any CLK_IGNORE_UNUSED clock.
IMO, the problem is not solved. It just shifted.

> +}
> +
> +static int __init clk_prepare_enable_unused(struct clk_core *core)
> +{
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return 0;
> +
> +	ret = clk_prepare_enable_unused(core->parent);
> +	if (ret)
> +		return ret;

That's adding another recursion in CCF, something Stephen would like to remove

> +
> +	if ((core->flags & CLK_IGNORE_UNUSED) && clk_core_is_enabled(core))
> +		core->ignore_enabled = true;
> +
> +	if ((core->prepare_count == 0) && core->ops->prepare) {
> +		ret = core->ops->prepare(core->hw);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	if ((core->enable_count == 0) && core->ops->enable) {
> +		flags = clk_enable_lock();
> +		ret = core->ops->enable(core->hw);
> +		clk_enable_unlock(flags);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	return 0;
> +disable_unprepare:
> +	clk_disable_unprepare_unused(core->parent);
> +	return ret;
> +}
> +
>  static void __init clk_disable_unused_subtree(struct clk_core *core)
>  {
>  	struct clk_core *child;
> @@ -1490,7 +1553,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  		clk_disable_unused_subtree(child);
>  
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_prepare_enable(core->parent);
> +		clk_prepare_enable_unused(core->parent);
>  
>  	flags = clk_enable_lock();
>  
> @@ -1517,7 +1580,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  unlock_out:
>  	clk_enable_unlock(flags);
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_disable_unprepare(core->parent);
> +		clk_disable_unprepare_unused(core->parent);
>  }
>  
>  static bool clk_ignore_unused __initdata;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
