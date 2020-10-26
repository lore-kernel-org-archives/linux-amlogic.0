Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179A9C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:28:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E65B2224A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BrEf49i/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vh9InZ7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E65B2224A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lMX4cgpAo+366biTELaNZyVvEKKbNGYDwWqkwzmlkSU=; b=BrEf49i/ZAgehzSnr/fDvwR4W
	GuWPsyjLHSUp9APbYHblSscvGF2g1Y5gc9Fc7Dzs42hmJr4Yg47iEjY1Q38I/LaI7zSOuagm8bksF
	zkyqYJvrHNx3XYiUAFjxh0KkwTNNQn4BnPUmLBj4FUxRjTuPxBjSoaA29S/weiegIbbMgdLOEUTOT
	/hhbKthJq/WP7vSmr19x+P9HYI9NzR6Io777yDpReRBNoalI4dpuM3pVrgcjgSuv+UXxayP0P8Jfi
	GVWa8lf2ULKZxoqSegrXsXlQeUWjp7ZNmvDqyHf//6Js9ydk/fF0LVSuPzNSoneyWmZVzk0mUXaYI
	0N4VBPxyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX5M7-00081B-Ds; Mon, 26 Oct 2020 16:28:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX5Lz-0007z4-HT
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 16:28:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id d78so12296893wmd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6CTY+djBZ7Pjc68qjBdXILQSLE/lkDLqxLHDu3TSN18=;
 b=vh9InZ7HhHqvJqj+dR+BDcTSnlHF+2qw+kfwVDawi+SN3M1IRBIkTlEFVxO5M+xfHA
 3ulVCiMi6XIIeLDLE+ZHA93zl/BcC31vpf1N4poVM4E+eSaOPU31K64x6Xg4dtg9YirA
 nUB6JODRM+QZLAlCQ6zLPDEzt+IURIsiVs00+n4YOHd7m3ycpmMlmWrD4Xk/yJsGZTv6
 ESqKw8oVbJl6A42yc3Weogp5rGm8Xw3XI/Pi/XLC+IeY1jXjFtNyRV7VNkEQOwTpysWx
 8PEUkhv23nW5Tx0ql5rZI7fnZkjATtJ+lvo2IRQ4ixFVYjsy9RN/b9IhisfB9AVlj1GN
 HeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6CTY+djBZ7Pjc68qjBdXILQSLE/lkDLqxLHDu3TSN18=;
 b=oo/wgY30fJMfxHlG/T4w30O+jWjLHOXh8/aklM/ASYsmZQ9rbR04ij9Cang29s3nzE
 yQ0iXeB86cEajtaQsbSCDefT+/Ns3IKK4cXsaj6G8l02IOFjXImmnfpWDGn/KZjSWZnX
 vhJk46uZmPeHfqlYa591/+stRJnthGhBpTzoFNL9yWXiXqWU7JLLWLgbe2k3amY/T5fk
 i9FnZXOeJlOMWt3lvUpH64Ow3tTVF9ne7jqtlrTFqNt3kqRoo+1MsPzAc72isMwgDMCt
 6/FoWhR5i4akbdXquMci6Tt5xssWn1gkULiZCdH5A1/JTY/+xYIiGJcae3OGR90v0GOj
 d7Gg==
X-Gm-Message-State: AOAM530p6NhSG7m6LnP0i7A0PkkQk7RlIfSnq3OQlStxVzNGiHNkAah6
 9sE8tYsWuzT/DoBR0fGM23EYAg==
X-Google-Smtp-Source: ABdhPJwFIW5gTxOtz5bFiVWQG8NnLj3Xxq/Cc6QvMHHigMrRb2yv8uyakSCH9Z0CQqnee5/WJTl7XA==
X-Received: by 2002:a7b:cf04:: with SMTP id l4mr17076833wmg.33.1603729694550; 
 Mon, 26 Oct 2020 09:28:14 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g5sm20843164wmi.4.2020.10.26.09.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 09:28:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm64: dts: amlogic: updates for v5.10 (round 2)
In-Reply-To: <7hk0w4efep.fsf@baylibre.com>
References: <7ho8lkl9fw.fsf@baylibre.com> <20201003192906.GB8203@lx2k>
 <7hk0w4efep.fsf@baylibre.com>
Date: Mon, 26 Oct 2020 09:28:10 -0700
Message-ID: <7h5z6xhrz9.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_122815_619968_18AE90B9 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-amlogic@lists.infradead.org, soc@kernel.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Olof,

Kevin Hilman <khilman@baylibre.com> writes:

> Olof Johansson <olof@lixom.net> writes:
>
>> Looks like you added a Reviewed-by, but not a signed-off when you appled them.
>> Mind respinning? Thanks!
>
> Here you go....

looks like this was missed?  I'm not seeing it in v5.10-rc1.   Since
these are platform-specific DT-only changes, could you include those as
fixes for the -rc cycle?

I'll have a handful more fixes for v5.10-rc, so let me know if I should
just include these in that PR, or you'll take this as is.

Kevin

> The following changes since commit 63fafc5a046b1e21756de691b48f0c70c25e1426:
>
>   arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2.1
>
> for you to fetch changes up to 1fdc97ae450ede2b4911d6737a57e6fca63b5f4a:
>
>   arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible (2020-10-05 10:40:34 -0700)
>
> ----------------------------------------------------------------
> arm64: dts: amlogic: updates for v5.10 (round 2)
> - add/enable USB on AXG SoCs
> - misc cleanups
>
> ----------------------------------------------------------------
> Martin Blumenstingl (1):
>       arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible
>
> Neil Armstrong (2):
>       arm64: dts: meson-axg: add USB nodes
>       arm64: dts: meson-axg-s400: enable USB OTG
>
> Scott K Logan (1):
>       arm64: dts: meson: add missing g12 rng clock
>
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts    |  6 ++++++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi |  4 +++-
>  3 files changed, 59 insertions(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
