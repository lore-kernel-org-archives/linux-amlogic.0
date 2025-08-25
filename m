Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C3CA0EFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHJKArBvp3Zqr2pPFtmH1pfiCN6Ek5naADNieg4Xg3Y=; b=dwoTnx9P0NNlTV
	FL2vg8KjkZh22a4gnuf6y3QwHw0YLHLv/5gXebkRHdWQWfWBA0QuBL+zU58O//8kzDry1Hs/NfxC2
	50rOQ/iVTGTE2jUugHjnHjlkx9s7Hz8+r9lxv1Von5HkeO1WrS6REA85VL1s9GZxsUct5gdXHdHzi
	Dg1x5RehEEwSpHsagJrfuCuFa3evNYU64R2cM7acnvojzzNKNg1roWmSE5Waywu504xNDVzy+fcuf
	t/Vn5zjM88XXlRibTFwBeK5RK0MCl6dChVms67KD5/1CZSWdlMbt2GTm33k2JaqJQYSdjcvaosF2i
	6+fOD+pPkSMt47eO9oqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYtK-00000008TQl-2GYc;
	Mon, 25 Aug 2025 15:13:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY7B-00000008F4p-05Yh
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:24:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b627ea5f3so3577905e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756131843; x=1756736643; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TX1MLqEO3vQC6DvB+MyawqjwGBkSm4vl1UzIKpr4u+4=;
        b=kC1k5X94tmaa+kIPPpOD1aVh9vCPpol4xKh0cqPd2ME72rDiG3hh8gxOe//MUWBDS5
         w6qbBKTWpRqKZfjAuKi9iXFSUTaA4Rls/yJ0JK+67Ohf1eRYfVyv0On2/CSlNJBfVAmq
         sm57b6Ciukl5PvKI5ADfPovnzkCpz0tOLA5oKNpz8L/0sPpVQM7chnFIpBwgrKzJaINl
         5Vz6QZEwo6UxN+6t0+ZJjXUDa2I2eSvZYb34QwMCYX8fsF/M9o2Cd0Kw8zlxx+TZmOQY
         CwuQjO+WZi1/4KYhk3Kxz+LxV8U4TxVv2kJ5m12bXuZViEtlfHEJYYt8RsTqeqVtEd36
         KJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131843; x=1756736643;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TX1MLqEO3vQC6DvB+MyawqjwGBkSm4vl1UzIKpr4u+4=;
        b=jrSu8AkN7pgK/RbvXXwlTlYsFwmkmeqNWc3phvwiljxSeiqEAW/HZgWSMnn8yHmv6d
         IKArgYN6BK19V+uBVzTo5jazfoif+a5rm2sMszdwzQIpXIxnDNYYk+PcMMCcXh9tjvFR
         JI5U8sF7wfVmOJUYGu4UhEzVm4Q9TiIMqrn8RPcSw7f/igShWcp/fQ3I3Xfjt1mGtawe
         ihMmXhCwuuUTZrdvfEhvPv9rujTuKAZMzwJvhmkHqyLkcCAR7BTY/5QAF+YSbXNbETjC
         fiKnl9RiihjHG2adE+h0GrvfGW3eXMAM42z96ywvAyQOZBHs/T4aUXWq2AXElV14orCb
         p5kw==
X-Forwarded-Encrypted: i=1; AJvYcCWGN+jouj+PN1KYJSiGZQXrUwz2wjMEH/WqA6135dcNrXsxHFD7M2Rs0mz/N5Z5wxXxR3Zuum2A9bFgPy/D@lists.infradead.org
X-Gm-Message-State: AOJu0YzPAFrCJx/xWLune+8B/O9K0H6BgER+32hMRh7ojogqr/bDTDjt
	WHiIVtEOr5C4gvC9NeabwQlo09NjYM2fuD51xh9Fpl+NG/CX3H38r8s++flC9PH++rQ=
X-Gm-Gg: ASbGncsqCvmGGXyUWcvSvB+RYJc1yLzVr5rBn4ZyVjHYKi5PhdHOeQRKtHtDGmIkVeK
	/VMZiBADmXwwP0ok6FeIAwJ+fTAq87Rox0NnT8NmIYJGSl8UIHKbZ7uwl+ao1ebfJZthzoZ/Q8L
	F5pYK1YIu8ixLtg3xYXmykXNaQrLNOJczjiu1rI+H7FjdWYVc6EVzQWL8m9FIQ8VXwMarCai4cN
	/E3ZPgE2kJMT29hF8rBeh6XRUZ8sYayeBmpD9ebxkjP72eN6rAnMsuMS02B4EmrsYSqicDL9rNL
	X3xRREXSxVhNF75Xy2nE/PFtByCeG27y5QPVj6fmgcro5qCke8UunW9nFRoLbcoVDL4rMdUkrMV
	eBqgyKgijhZ6pMz3xnBl0/g==
X-Google-Smtp-Source: AGHT+IG665adddV7h7nRXLf9qXuGymCKsQp6Ggi3wDBYyM1BI7uUJAuXYAK8KhQ26MMLhlt0ERVkaA==
X-Received: by 2002:a05:600c:c87:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45b5179f338mr103267265e9.4.1756131843347;
        Mon, 25 Aug 2025 07:24:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7116e1478sm11805438f8f.46.2025.08.25.07.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:24:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	(Jerome Brunet's message of "Wed, 02 Jul 2025 17:25:58 +0200")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 25 Aug 2025 16:24:02 +0200
Message-ID: <1j4itv5vjx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072405_299706_14F90D05 
X-CRM114-Status: GOOD (  29.29  )
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

On Wed 02 Jul 2025 at 17:25, Jerome Brunet <jbrunet@baylibre.com> wrote:

> The work on this patchset started with the submission of the Amlogic t7
> peripheral clock controller [1]. This controller is fairly similar to
> existing controllers. Once again, it redefines the peripheral clock macro,
> the probe function and composite clock helpers, even if it is almost the
> same as in other controllers. This code duplication trend has been going on
> for too long and now is the time to properly address the problem.
>
> There is clearly 4 parts in this patchset. These are sent together for v1
> to show why what the ugly first part is useful. If more versions are
> needed, the patchset will be split in 4.
>
> While all controllers are doing more or less the same things, tiny and
> often pointless differences have emerged between the controllers. This
> makes it harder to exploit SoC commonalities.
>
> The first part of this series deals with that problem and realign things
> up. There is nothing complicated going on there beside renaming. It is the
> ugly stuff, yet necessary, we have to go through to get to the interesting
> stuff afterwards. There is one change per controller for the review, with
> the intent to squash this into a single change on application.
>
> Second is the factorisation of the probe functions so those stop being
> copy/pasted in each clock controller drivers.
>
> Then the clean-up and factorisation for the PCLK macros, again to stop
> copy/paste but also the silent use CLK_IGNORE_UNUSED.
>
> Finally the introduction of macros for composite clock definitions. The
> same pattern as the for the PCLKs started to appear on s4, c3 and t7. Done
> properly, this could also help reduce the verbosity of the older
> controllers.
>
> With this, the c3-peripherals controller may be used as an example of what
> future similar controllers should look like.
>
> After this, there is still some house keeping to be done in the amlogic
> clock drivers:
> - Moving remaining reset drivers to the reset subsystem
> - Proper decoupling of clk-regmap from the clock controllers
> - Reduce verbosity of older controllers with the composite macros, where it
>   makes sense.
>
> [1]: https://lore.kernel.org/linux-clk/20250108094025.2664201-6-jian.hu@amlogic.com/
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (26):
>       clk: amlogic: a1-peripherals: naming consistency alignment
>       clk: amlogic: a1-pll: naming consistency alignment
>       clk: amlogic: axg-ao: naming consistency alignment
>       clk: amlogic: axg: naming consistency alignment
>       clk: amlogic: c3-peripherals: naming consistency alignment
>       clk: amlogic: c3-pll: naming consistency alignment
>       clk: amlogic: g12a-ao: naming consistency alignment
>       clk: amlogic: g12a: naming consistency alignment
>       clk: amlogic: gxbb-ao: naming consistency alignment
>       clk: amlogic: gxbb: naming consistency alignment
>       clk: amlogic: meson8b: naming consistency alignment
>       clk: amlogic: s4-peripherals: naming consistency alignment
>       clk: amlogic: s4-pll: naming consistency alignment
>       clk: amlogic: meson8-ddr: naming consistency alignment

Applied and squashed the 14 changes above.

>       clk: amlogic: drop meson-clkcee
>       clk: amlogic: add probe helper for mmio based controllers
>       clk: amlogic: use probe helper in mmio based controllers
>       clk: amlogic: aoclk: use clkc-utils syscon probe
>       clk: amlogic: move PCLK definition to clkc-utils
>       clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
>       clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
>       clk: amlogic: introduce a common pclk definition
>       clk: amlogic: use the common pclk definition
>       clk: amlogic: add composite clock helpers
>       clk: amlogic: align s4 and c3 pwm clock descriptions
>       clk: amlogic: c3-peripherals: use helper for basic composite clocks
>
>  drivers/clk/meson/Kconfig            |   13 +-
>  drivers/clk/meson/Makefile           |    1 -
>  drivers/clk/meson/a1-peripherals.c   |  995 +++++-----
>  drivers/clk/meson/a1-pll.c           |  124 +-
>  drivers/clk/meson/axg-aoclk.c        |  153 +-
>  drivers/clk/meson/axg.c              |  237 +--
>  drivers/clk/meson/c3-peripherals.c   | 2055 ++++++---------------
>  drivers/clk/meson/c3-pll.c           |  245 ++-
>  drivers/clk/meson/clk-regmap.h       |   20 -
>  drivers/clk/meson/g12a-aoclk.c       |  238 +--
>  drivers/clk/meson/g12a.c             | 3316 +++++++++++++++++-----------------
>  drivers/clk/meson/gxbb-aoclk.c       |  123 +-
>  drivers/clk/meson/gxbb.c             |  611 ++++---
>  drivers/clk/meson/meson-aoclk.c      |   32 +-
>  drivers/clk/meson/meson-aoclk.h      |    2 +-
>  drivers/clk/meson/meson-clkc-utils.c |   89 +-
>  drivers/clk/meson/meson-clkc-utils.h |   89 +
>  drivers/clk/meson/meson-eeclk.c      |   60 -
>  drivers/clk/meson/meson-eeclk.h      |   24 -
>  drivers/clk/meson/meson8-ddr.c       |   62 +-
>  drivers/clk/meson/meson8b.c          |  746 ++++----
>  drivers/clk/meson/s4-peripherals.c   | 1160 ++++--------
>  drivers/clk/meson/s4-pll.c           |   82 +-
>  23 files changed, 4437 insertions(+), 6040 deletions(-)
> ---
> base-commit: 2c37e1c671428002519e7615d786b9b692261052
> change-id: 20241211-meson-clk-cleanup-24-41cbe1924619
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
