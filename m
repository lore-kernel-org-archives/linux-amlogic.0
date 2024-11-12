Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF9DD41D6E
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFSykDnC7oSK+WnKTNHbIrlECYU2CoZpVOZDY9auW4k=; b=ric0chfjqUQCWX
	SHDNNnWx+pAz8MwjCtThQzxpEYqldieBSu8p2cVXi+0tLoC2/zWVuGN+L7SsAn7SAGaGvw+1NmG7r
	T91kZT2yGJUE3sadxpK/Yb2e4lMIkbHzXwV1tyUXdJteAZV1KrOf5E661+qHX4LL4qVa+4v7t1XoI
	3qnuZ/Ah+wcz3M+WWD7xI81qrx9eo0oKulsSUeppoTXEzhS2euuZOEscK8bE1J1+Z9Q/XpfDPgJFX
	TA/bkE7hIC6m1bagnSD2NEPzbNoundYyx9+KUHF00Xvsm//+HR/HS79UFRBdIDBZHhoaoEnJV3CdS
	5xi13fWZoX0CBy3OaoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmZu-00000002hRP-25W0;
	Tue, 12 Nov 2024 08:48:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmSk-00000002fkd-0C4y
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 08:41:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37f52925fc8so3500630f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2024 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400884; x=1732005684; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=;
        b=ZBWJzbdGDF/gHGRf/fMNZqc8sG+FzkNGZxmc09kMuCCR67EAt1MZ+Mucxt8oAvoAT8
         FoUXcyzhP2NUH+ORIgCbx5p9SKZwUn4cCmnABjrszBrChZFo/J6OsMN6QWgy2N9kJEMR
         nmo9zMRIFbf/qkWLSh014qA54rr+Se44kgvkJOEwhTbXsXJnGL/3QcEgZUQNYEXJYUua
         xNsHZ2dSmY5GfMJ5XnTt4PBW2mMBlGeH9du9Dw4IJHtrp6AaMNCTSWNvnmxewtEoIBTz
         jebrgrl/dFEnNVBu/Is4dN2G7fnCNuvGCqsXxzHayGkn+RkV0FkKdTVStvtxlkWBFCbT
         +LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400884; x=1732005684;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=;
        b=ulVl2IhbizSxMUJrcGTA3ucsMROSM6EudNGTTk+7kMrLXIz4lsgODcdTjnF/RJ3Ymp
         JW9jPGSOQ8sDDSNPPAyB1WznR4jBGRbGM6f8zgcVl1GXP7T5Jk+dR8TfHeEiXd3Wl3OG
         tyfpejI4M5UVN99429hGQvX/WK+E+8iX0M7LKmHbsdlncydVYnqZ219bsN6cbIKditw4
         tEtktEy4Mn5sNGcJksLtF8yy6bS+pn4E4iKEO3O6NTquJvfOCOHd61Hi7Ux8E7Tfuh3+
         ARygJkPBf+4FS+kYncdo3nzHTYhT1J+N7bX7Xzp14e07Lv/zLAO+8X2HBkfGLYd3RTYB
         4ZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVifdmai6QwrA/GjuCSX8RJJH+9h0a85hIF0sfOX41S5dlNu2So10aGSfcYZzjj30aC5MfhlZSK9GQD/nwR@lists.infradead.org
X-Gm-Message-State: AOJu0YzQgUqemFQnrYvbMntdkBjMcA3Lpbw/5SCYMXqPx97xILNZ+E2Y
	gbypQGRqXlnhZ4cQECjveg4MFg6tAXI5/lw2HU2S6wWSJTtJ8GxhppkOmb7pVdE=
X-Google-Smtp-Source: AGHT+IGUE8SBMbLKPxMonN/2CkAeXqXMHELhWYBo6IiWeJEKGp9mNtG5Y4mRS+LvxuwyDgdxXSaWxQ==
X-Received: by 2002:a05:6000:2aa:b0:381:eba9:fa75 with SMTP id ffacd0b85a97d-381f1866fc7mr12542783f8f.20.1731400884519;
        Tue, 12 Nov 2024 00:41:24 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8827sm15169457f8f.72.2024.11.12.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:41:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] clk: Fix the CLK_IGNORE_UNUSED failure issue
In-Reply-To: <20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:01 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:41:23 +0100
Message-ID: <1jv7ws26a4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_004126_297995_3058D604 
X-CRM114-Status: GOOD (  26.16  )
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

On Mon 11 Nov 2024 at 11:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

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
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents
> enable (part 1)")

Still don't think a storing the ignored state is necessary, same as v1.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d02451f951cf..6def76c30ce6 100644
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
> +		core->ops->disable(core->hw);
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
