Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4056CE8347
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duqjOSS/gcbtNTFom96oga5f8f6CSKS9DFOporrHfgE=; b=WXHXi0CP4YEOxb
	rMqK2VBNsukEKLIZzoFIhUaz7l8lEyQcQjeiQjxWB4VyjtrBwbSENmTaAgUZQpakVqpDSjtc8cUr5
	m2vaYPQBtGQKKmYNX1iFSMx3Wo8R586cTzGi5NCEMfRhiYoQ7TSAf576oUkHB6iv7++Gk4SMVT5tC
	+GPs55zuKed89IOketI5nnRttn66wDWSojbML/O9I6oe18RpoMILYHaFEixWGPhtBkEc5NsZem9lJ
	Q0QoJEyCi8BbCXrlk62XepaHDNktHzfSxKNetuYiki3sEVSVM4Pwugs9HRN3bZoTOlKbDHJWDtnpc
	234yOhgFOigADEeldX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHBN-0000000HTpC-1aHd;
	Mon, 30 Sep 2024 14:15:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFaR-0000000H3ys-2Zvp
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 12:33:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3770320574aso2858680f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727699589; x=1728304389; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wcTFAf/39stw2L9rW+QSJlImzmwdaZ5jPtnTMrK6EJE=;
        b=sM0ndOr4bX4CabkxHDery5+MHuUDhIkyGryt8Tzz5VIMuF07+pO7AR++QnOsmHr/jH
         zBcAkoLH3JYt/aEwzLt4DTwnsCRJmDiqix2JKoFZNZ5lgF1Do5IB/V4Nt/CRtn7e48t9
         TGjJciSZcfztLTVn2LYcJUeqw7l+XwpNNMBKa7P6lPJTJuelWTObMXgUH3034zQ8Vf6Z
         eejUcutbxtqpaiB+2ru8yMpM62aqcB6ifhqXS8xzDgrNy74vPEx0r2FuV2SZz3nvqk/n
         fryxgCbh+5JXo/JG806WcTKnmlf0NBXx/8md6rtVfwMDoDssO8agtMUn4GBKbv/NypZ0
         Zgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699589; x=1728304389;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcTFAf/39stw2L9rW+QSJlImzmwdaZ5jPtnTMrK6EJE=;
        b=cVzspMYzcmARMvurLDAtTnB6ll/gDWUfZW7HpLumIgRiWC4JNokJOY9G/511nbXOyE
         KDMxKiXPK/VgL2Fwb4kgfP8YjSwMXxpl4UH0hs8SKfN872aWWHojWxr10eZSB5d5whTw
         MJw6NHLJzRbdRMQ/CX4A5j4dET6KBIP2e4S3V089vHstLvMGZU2zCtBOOCGJUORU82Z3
         rlB9tL2v6ygfl0BZVqLNongW2SHP09+YNxBslszOUZvGT/GNq5csaMFAcNomtzGLoO5f
         ovIT2ePal5wmWjUgLZYtt9uC2yNWGDqF+MxYmNz09lrK2q32wmkZdsninIq2VqIUAl5O
         3gVA==
X-Forwarded-Encrypted: i=1; AJvYcCWVZMw+vRAo0Ou5+cFVxStRq/Etgl9UA46TjDDsimrMh+PX/IjoXh7whG4X3w6/3p1hKZIvwjUZJwNoM1ht@lists.infradead.org
X-Gm-Message-State: AOJu0YwAkFEudncBu1GkMJatHc/KWsMZ9kvoScfp4f2AzCYikgjhh7d/
	vVSm7zMqwcF2icfZ4AuFuo1yQbZj86SMLY3R19scUY5Jbjb2/aCpaq8gJreTsHo=
X-Google-Smtp-Source: AGHT+IHTY8puEfxRrHvmLqweSOnoM31uzsPdJHEBi2OMm0NwVB3ar3t6Omd21i9AD5kxBgtkSBpjTw==
X-Received: by 2002:adf:f1d1:0:b0:374:c621:62a6 with SMTP id ffacd0b85a97d-37cd5aed352mr5657657f8f.47.1727699589487;
        Mon, 30 Sep 2024 05:33:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fd9asm8996599f8f.75.2024.09.30.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:33:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] clk: Fix issues related to CLK_IGNORE_UNUSED
 failures and amlogic glitch free mux
In-Reply-To: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com> (Chuan
	Liu via's message of "Sun, 29 Sep 2024 14:10:04 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
Date: Mon, 30 Sep 2024 14:33:07 +0200
Message-ID: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053311_685516_848CE606 
X-CRM114-Status: GOOD (  20.03  )
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

> If CLK_OPS_PARENT_ENABLE is configured for clock,
> clk_core_disable_unprepare() is called in clk_disable_unused_subtree().
> Even clocks that are configured with CLK_IGNORE_UNUSED are disabled,
> resulting in the failure of CLK_IGNORE_UNUSED.
>
> To ensure that amlogic glitch free mux can switch clock channels
> properly, add flag CLK_OPS_PARENT_ENABLE to glitch free mux. The issue
> that CLK_OPS_PARENT_ENABLE in CCF causes CLK_IGNORE_UNUSED to fail is
> also exposed.

The problem is that you are mixing problems together and it makes things
rather difficult to follow. There are 2 distinct problem, there should
have been to distinct patchset, even if you reference the CCF one in the
Amlogic change.

CLK_IGNORE_UNUSED is no guarantee that a clock will stay on, no matter
what happens in the clock tree. I explained that to you several times,
and it is the very reason why you are being asked to justify each usage
of the flag. Most of the time, using it is wrong.

That being said, there seems to be problems with CLK_OPS_PARENT_ENABLE
in clk_disable_unused_subtree(). As it is, I think
* a clock with CLK_IGNORE_UNUSED and CLK_OPS_PARENT_ENABLE, would 'leak'
  an enable, essentially making the parent subtree critical.
* All parents of a CLK_OPS_PARENT_ENABLE clock would have its
  CLK_IGNORE_UNUSED ignored as a result of the enable/disable sequence
  (note that in any other circumstance, enable/disable should indeed
  disable an CLK_IGNORE_UNUSED clock).
* Parent of ignored clocks may still get disabled.

I'll be sending a proposal to address these problems soon.

>
> glitch free mux channel switchover failure issue(Test vpu_clk on S4):
> step 1:
> $ cat /sys/kernel/debug/clk/vpu/clk_parent 
> vpu_0
> $ cat /sys/kernel/debug/clk/vpu_0/clk_rate 
> 399999994
> $ cat /sys/kernel/debug/clk/vpu_1/clk_rate 
> 666666656
> $ echo 1 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
> $ cat /sys/kernel/debug/meson-clk-msr/clks/cts_vpu_clk
> 399987500       +/-12500Hz
>
> step 2:
> $ echo 0 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
> $ echo 1 > /sys/kernel/debug/clk/vpu/clk_parent 
> $ cat /sys/kernel/debug/clk/vpu/clk_parent 
> vpu_1
> $ cat /sys/kernel/debug/clk/vpu/clk_rate 
> 666666656
> $ echo 1 > /sys/kernel/debug/clk/vpu/clk_prepare_enable 
> $ cat /sys/kernel/debug/meson-clk-msr/clks/cts_vpu_clk
> 0       +/-3125Hz
>
> In step2, vpu_0 is disabled, and the vpu is not switched to vpu_1. At
> this time, the vpu is still connected to vpu_0 and vpu_0 is disabled at
> this time, resulting in the clk-measure not measuring the clock.
>

If keep the display on and managed at all time is critical, then may you
should consider having the module managing it as built-in.

You would not need CLK_IGNORE_USED at all because device would be
present before clk_disable_unused() is executed.

Past the late init, if no device actively use the clock, disabling it is
the sane thing to do because nothing says it will ever be used.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (2):
>       clk: Fix the CLK_IGNORE_UNUSED failure issue
>       clk: meson: Fix glitch free mux related issues
>
>  drivers/clk/clk.c                  | 67 ++++++++++++++++++++++++++++++++++++--
>  drivers/clk/meson/a1-peripherals.c | 12 +++----
>  drivers/clk/meson/axg.c            | 16 +++++----
>  drivers/clk/meson/c3-peripherals.c |  6 ++--
>  drivers/clk/meson/g12a.c           | 18 ++++++----
>  drivers/clk/meson/gxbb.c           | 18 ++++++----
>  drivers/clk/meson/s4-peripherals.c | 32 +++++++++---------
>  7 files changed, 122 insertions(+), 47 deletions(-)
> ---
> base-commit: e736da1956cf0880a02ec5023f3487eea7611b5f
> change-id: 20240929-fix_glitch_free-290c88923c31
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
