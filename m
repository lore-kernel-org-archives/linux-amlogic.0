Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFDEC4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgGe+DuJOX8t82l2JyOMhI3U0UG8PCElZ7LzOR9x+HE=; b=l3FEeRTSqZOyRE
	I+HlPPOcKQmyLqt6mWnl/aypyoZ9AXdEF8/HOliV2NGWR5/QfdFY5nmUJvmzf1A14ZM9PHzuA/YUb
	8GN2+irFhGZtk2bAOZUoMjrJfR2YdmkN+WqykeZzV9eCTxQYWdk80pq2mGWdzA66FbMWMOlx95D2d
	bRlZxpxTiLAA3D1VyrNiddl1IpGfHxuWbjILUYsk4jitBPbY01SUvSTrC++j8+9V69dKkG8tPpedU
	bdU/irpXYji87mEP0hLYTWFFnOdVnoL0KZb8fUBKxEYb0eSNYlp7LkQYCrPBrarUbg8XIoCU+Y6l5
	6XFYQQFP30+qPIUbQAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuun-00000002WWq-0tEh;
	Mon, 05 Feb 2024 09:05:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuuj-00000002WVY-2dYL
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 09:05:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40fccd09082so18143165e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 01:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707123915; x=1707728715; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=FrzyemCCCe25zosXOoDYB16obaNMd4rjugvPsL9t2Tc=;
        b=gFRNtObBCBwSmt28tyqjKLTxMcpS/NmlQe7jIbYYo+9LpELjqUT0oJgXMMNUPupBg0
         QWFcDPRW6OivmWVVOtk6CDLTsH0mUfACwHzqcvV14Ur7mQ8FIH8fWkZiP2asgI4+RnXE
         nuUlo8EoScQvLuPdWyhr7umF9/Lm4cjMKqJKu2MibuxsqdLQckm4h8SW8QoceMas7Bdy
         /mBa3CIFjTb05tkKpWRfiypcuk5t+AqtdR8tFBgST8AtDDnDwTUAwb9mRtht7gLh4ZQf
         dWiqg8V9sh3sjk8ggK+nrTsIoEsIlRVZtVXhlwFUVsdiF0YtKaEE/fu7byeHkmQBjvff
         8W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707123915; x=1707728715;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrzyemCCCe25zosXOoDYB16obaNMd4rjugvPsL9t2Tc=;
        b=Wl0KpnB3kH5l1bTAReHiBQunCzVhzaHAO6Nimk7HwZT191lcK7EIXH3gwXG7Ret61a
         hfTQdkE6+G1FiUigTsjlgZx8JQ9Meaui3bOYfl5qbfy1WDIMwCWFrgDqFS6GT/wXRrJT
         k20O+ykA7vAxbWol937X3jO5Kht2/tuofbAlsJjlwGutgtJaj34NUr84ot8nW6QGIf+J
         H66l1gD0iCh1Ufa/cgOCTzwcN7j6CtvxDQTfOEevVI/KuvQ8pmIWREhSUchcDmbF3984
         xjDEUDlk+hBoBCfrVGWcX/uqLwOmz23Tl86MVKc/sJyDHx1vT5k4evTNLcEQCh49Z9QA
         wm2w==
X-Gm-Message-State: AOJu0YwYpafdHsZJHZnNxeN36+32eBIt2Uif2p01T95En8id7q0rZFDZ
	qIK8EcSWoclxLCB/DzP0PEu+1MsObbLLa4MUkzTTEfO/AJdtlyQCge766XsVadU=
X-Google-Smtp-Source: AGHT+IG52hmC5Eu0sn2V0dkLHe/o74ig7s+Lp2f9Gnes0yU8mdwBjfMoRc4d5bnf/qpdhfHC23lgYg==
X-Received: by 2002:a7b:cd85:0:b0:40e:fa6b:f355 with SMTP id y5-20020a7bcd85000000b0040efa6bf355mr4202944wmj.41.1707123915229;
        Mon, 05 Feb 2024 01:05:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX7Wqy/vaUuoF/84sU2+37uNkcfW0D2VCaoFNsTSZi4e3JJEHKNwI+us6HkHjkYhwNaV5JILIKpnQrvUoG+vj+nBRSXfWhLuT1oQDOMLlTKIt77g2J8TfZ0WjBKxk9MEFPAIq4YAUGWuTJwJClAwRQTEOqLyJTmj4CZQ16p2SaLVx+ooRoppxNZO7MW9ue09hSQzl5Y1rdyaabmK0aMd5l4DdacudoB1InieW+d1kF0KxKdE5m13iR9mHcTD9SMvgpNYidAHQoxxndHA0idnQffXO8gKa/GQS5JytIIb20FZb3IK7HwewdhN2Wh/N4RexHqx0hPg6sb9fsKGZAx9/9h9SDwUvmBrMhhWmT9sY6JqVxfrJm8y7qQuN4IyAZzccwvRgL8CII3j804eaqFlCcv1HkXcmHaD0gvaGXtZt4LMt+sBzA6Bm7rAaYzeABxbhF0ZKcCaYm/iHBoKq7m3BuG
Received: from localhost ([2a01:e0a:3c5:5fb1:455:1a2b:40a2:1766])
        by smtp.gmail.com with ESMTPSA id fm24-20020a05600c0c1800b0040ee8765901sm8029761wmb.43.2024.02.05.01.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:05:14 -0800 (PST)
References: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Igor Prusov <ivprusov@salutedevices.com>
Cc: jbrunet@baylibre.com, neil.armstrong@linaro.org,
 kernel@salutedevices.com, prusovigor@gmail.com, Kevin Hilman
 <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: Add missing clocks to axg_clk_regmaps
Date: Mon, 05 Feb 2024 10:02:01 +0100
In-reply-to: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
Message-ID: <1j7cjji8mu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_010517_899251_4714FF74 
X-CRM114-Status: GOOD (  12.57  )
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


On Fri 02 Feb 2024 at 17:25, Igor Prusov <ivprusov@salutedevices.com> wrote:

> Some clocks were missing from axg_clk_regmaps, which caused kernel panic
> during cat /sys/kernel/debug/clk/clk_summary
>
> [   57.349402] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001fc
> ...
> [   57.430002] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   57.436900] pc : regmap_read+0x1c/0x88
> [   57.440608] lr : clk_regmap_gate_is_enabled+0x3c/0xb0
> [   57.445611] sp : ffff800082f1b690
> [   57.448888] x29: ffff800082f1b690 x28: 0000000000000000 x27: ffff800080eb9a70
> [   57.455961] x26: 0000000000000007 x25: 0000000000000016 x24: 0000000000000000
> [   57.463033] x23: ffff800080e8b488 x22: 0000000000000015 x21: ffff00000e7e7000
> [   57.470106] x20: ffff00000400ec00 x19: 0000000000000000 x18: ffffffffffffffff
> [   57.477178] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000042a3000
> [   57.484251] x14: 0000000000000000 x13: ffff0000042a2fec x12: 0000000005f5e100
> [   57.491323] x11: abcc77118461cefd x10: 0000000000000020 x9 : ffff8000805e4b24
> [   57.498396] x8 : ffff0000028063c0 x7 : ffff800082f1b710 x6 : ffff800082f1b710
> [   57.505468] x5 : 00000000ffffffd0 x4 : ffff800082f1b6e0 x3 : 0000000000001000
> [   57.512541] x2 : ffff800082f1b6e4 x1 : 000000000000012c x0 : 0000000000000000
> [   57.519615] Call trace:
> [   57.522030]  regmap_read+0x1c/0x88
> [   57.525393]  clk_regmap_gate_is_enabled+0x3c/0xb0
> [   57.530050]  clk_core_is_enabled+0x44/0x120
> [   57.534190]  clk_summary_show_subtree+0x154/0x2f0
> [   57.538847]  clk_summary_show_subtree+0x220/0x2f0
> [   57.543505]  clk_summary_show_subtree+0x220/0x2f0
> [   57.548162]  clk_summary_show_subtree+0x220/0x2f0
> [   57.552820]  clk_summary_show_subtree+0x220/0x2f0
> [   57.557477]  clk_summary_show_subtree+0x220/0x2f0
> [   57.562135]  clk_summary_show_subtree+0x220/0x2f0
> [   57.566792]  clk_summary_show_subtree+0x220/0x2f0
> [   57.571450]  clk_summary_show+0x84/0xb8
> [   57.575245]  seq_read_iter+0x1bc/0x4b8
> [   57.578954]  seq_read+0x8c/0xd0
> [   57.582059]  full_proxy_read+0x68/0xc8
> [   57.585767]  vfs_read+0xb0/0x268
> [   57.588959]  ksys_read+0x70/0x108
> [   57.592236]  __arm64_sys_read+0x24/0x38
> [   57.596031]  invoke_syscall+0x50/0x128
> [   57.599740]  el0_svc_common.constprop.0+0x48/0xf8
> [   57.604397]  do_el0_svc+0x28/0x40
> [   57.607675]  el0_svc+0x34/0xb8
> [   57.610694]  el0t_64_sync_handler+0x13c/0x158
> [   57.615006]  el0t_64_sync+0x190/0x198
> [   57.618635] Code: a9bd7bfd 910003fd a90153f3 aa0003f3 (b941fc00)
> [   57.624668] ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Igor Prusov <ivprusov@salutedevices.com>

This has gone un-noticed for a while :/
Thanks Igor.

Please remember to add an appropriate Fixes tag for patches like this.
It is important to help stable releases.

Fixes: 14ebb3154b8f ("clk: meson: axg: add Video Clocks")

> ---
>
>  drivers/clk/meson/axg.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index c12f81dfa674..5f60f2bcca59 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -2142,7 +2142,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
>  	&axg_vclk_input,
>  	&axg_vclk2_input,
>  	&axg_vclk_div,
> +	&axg_vclk_div1,
>  	&axg_vclk2_div,
> +	&axg_vclk2_div1,
>  	&axg_vclk_div2_en,
>  	&axg_vclk_div4_en,
>  	&axg_vclk_div6_en,


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
