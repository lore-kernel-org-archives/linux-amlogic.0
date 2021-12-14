Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C5DC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Dec 2021 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eyzhQlVAjzrDKD7YMvmM0RApl/s82EnCwVk/JD0M80=; b=1gyxDu7tRdfrJc
	xuI0fYHSsqRVpAk8AYTR1DHO5B16Hu7n7HIk0ygFuWJBnjQ9wpdJoWQbCK4BqZ7nEljk7fGhmgJO+
	hNCm8xdN0RqhXujm1A5H6J3yZ4tMZJXPBtFqVTVGT81RNhB0kvI1XkVMhRvE9yaimTi8oA0z/CVfj
	rTHRF/5SV2WYycCMxTFwqGkb6fEFIDXhsp3x//Iex307Ssl4/LjPcyu+JpUPztyv0ZynMwcYiZlgK
	nXcoc2Tmy01PMIdF5azvcCz6PYNGtw+EDJbsOxy7yu2etD038mP1+sOGx3X7GTrsBGB/kaULXUqgc
	CgBeluddmbMTTegsk7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx88O-00EDff-NH; Tue, 14 Dec 2021 13:46:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx88M-00EDep-0B; Tue, 14 Dec 2021 13:46:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96B83B818AD;
 Tue, 14 Dec 2021 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E0EC34601;
 Tue, 14 Dec 2021 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639489579;
 bh=IPUyK9+cTg9d2YEDhc90Ub9/uzFy2tW8VkPRCEUQ3Dw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=urnGSGDpfLi3eHC8Ge0YggS1h4NDPuPnmRzrsrjOnq2Oc8POGut1BzG2LQHGVJbWN
 rI1uGalDQm4LOTdO8K4KowL00SF16QpUBr0syqGHY9Aoz5jOrRS3BkeskcKEW7Psbs
 YxvB5CCBhjmHCHuxRlY6J0tXphweVu1XMfBnqe1pEiZ4CNYn8ZRYZxegPsfowK5ZOo
 c1B+Mo8fBBwVVVj8jzU5/N3NEx2uulrUXO+7umSx10/KuNYm1GT6OvWd3GpppcTv/x
 BSs5yaydxuJjsxhzH6KFbneQoCBtm+WBS/GJVF1Vqn40gKp31s8741qw6q/ZHYH4zS
 OUHZsfGAkvvmw==
Date: Tue, 14 Dec 2021 14:46:13 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Zhou Qingyang <zhou1615@umn.edu>
Cc: kjlu@umn.edu, Neil Armstrong <narmstrong@baylibre.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Maxime Jourdan <mjourdan@baylibre.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: meson: vdec: Fix a NULL pointer dereference
 in amvdec_add_ts()
Message-ID: <20211214144613.35fec82a@coco.lan>
In-Reply-To: <20211202160357.75173-1-zhou1615@umn.edu>
References: <20211201084108.GE9522@kadam>
 <20211202160357.75173-1-zhou1615@umn.edu>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_054622_215811_7B8B45C2 
X-CRM114-Status: GOOD (  26.19  )
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

Em Fri,  3 Dec 2021 00:03:57 +0800
Zhou Qingyang <zhou1615@umn.edu> escreveu:

> In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
> to a NULL pointer dereference on failure of kzalloc().
> 
> I fix this bug by adding a NULL check of new_ts.
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> Changes in v2:
>   -  Delete dev_err() message
> 
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index b9125c295d1d..ac60514c475b 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -234,6 +234,9 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>  	unsigned long flags;
>  
>  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
> +	if (!new_ts)
> +		return;
> +
>  	new_ts->ts = ts;
>  	new_ts->tc = tc;
>  	new_ts->offset = offset;

I don't think this change is ok. Sure, it needs to check if
kzalloc() fails, but it should return -ENOMEM and the caller
should check if it returns an error. So, I would expect
that this patch would also touch the caller function at
drivers/staging/media/meson/vdec/esparser.c.

Regards,
Mauro



Thanks,
Mauro

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
