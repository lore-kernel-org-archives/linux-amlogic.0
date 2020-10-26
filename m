Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12F3C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 13:58:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 523E022400
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 13:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PSWajCxx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Khw6HtXi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 523E022400
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LaURrj8AjRwxrg+ggGffVt8wh5/Wbh1AKgPmesWko50=; b=PSWajCxxOvK+iepBKEppFQfF7
	hLtxWrPY91EZpm1wiX6XFDMqetu8zvtkcjGNT9n43oEQZ+YT6snu2vWeBJaqbx/kOBP5wLwe15eJ3
	wGesf5Kom+jKjNMuEISbJWnYgeZzd6GZm2dF3EQFpjgD8B2XWKKVnrKGnbQxtu2jTz/tcVCJMfcWb
	pwWW94g/+WpwBZ6w+X7nZ1ckRS+8mZcPbOEhRxbRlPOmpdD+tG1coDdMS5BIybyGC+xTUU+oyMkvA
	rpoxn9MXFMUGZex0B9RIbFLpEnNh6Gdvt1yWk4lIwuo2UuflgDby7Zxo09aylyc0YOvBKNge4lf4Q
	LEkYCWOUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX30S-0001Px-6c; Mon, 26 Oct 2020 13:57:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX2zL-0000uW-6M
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 13:57:02 +0000
Received: by mail-wm1-x342.google.com with SMTP id e2so12584999wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=HgyBh+16fLRmJC5zM1itgabVQdxvIj/AWtqWUQEP6yc=;
 b=Khw6HtXiUbQUTT15ZKtC1tSHL3G0pWYJkDmyqU4U9ImTpofZ96CxkjCjZ9pg8LVRRM
 CXTTsNBHXMJo78LPCvCk6A+aSvBjPwytrmKcGGtDr75MUjLL4LIagO/lam1xV4wHMLIY
 9r6xFeE65639FT8qnuT+eZs018NUkgAA9xmkkAIKpN4LBTswNYKjvsNsEAC+lyLHJpy3
 gvxB22Jl4If0+HRow+pNI+MWIWzl9PUiloLBwEKeb+66jlRkAWg5LKwNnKv2qwihc32n
 7BQna0hcFMIRKn6JexOMZAqGcD5D3+p6uHCgFsVceeNvj5TzGk0HCFXFAQb8VfK1LKEn
 I/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=HgyBh+16fLRmJC5zM1itgabVQdxvIj/AWtqWUQEP6yc=;
 b=jn8SfcjWgc+CwcdbNLaSMNLmjJsgnbyf58mIjQclldLcuvtKqqzhlXrSWEAymEqHyJ
 WJeEywwJohvjiMJN0a+vmnPIIJr5kR6+x5cp4PDV5o0QgJMyNxwqdYGVBNnvIiAjWj+c
 1L0Sg7B/ej0DjBi6B2RlS72sM6A52n2c+TWvmqnLYAdUptRxYETRrhz4MY0/XhTlVIJF
 ddAwwfmjVWgk6esiMWO3kXAOOCMe4nHRdOYn00xDsGuutcg2LqIbPgiH7bgm3HTIGmJw
 /bdvovxs/aDInBTOJt4lAK58Ar5fpLjKz7HhvswUCe3hkYRFDGsM/nmtD3Ei7haC4EJc
 9b6g==
X-Gm-Message-State: AOAM531vXideo0Gt00Xw+qfq+fOQUGLsvpKl376e780XMSe9F41squRz
 id/okkPfJEL5j/YqTtN0qt/PBw==
X-Google-Smtp-Source: ABdhPJwhFRSy34ieLn1DstuSvVzZsmJTDrXtazaPwKq5GkCIxrsVvZ2CQeyoqavPfCy8A+wgZ4FTcQ==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr16444207wmc.93.1603720600298; 
 Mon, 26 Oct 2020 06:56:40 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id u195sm23028274wmu.18.2020.10.26.06.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:56:39 -0700 (PDT)
References: <20200915124553.8056-1-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/4] clk: meson: axg: add clocks for MIPI-DSI support
In-reply-to: <20200915124553.8056-1-narmstrong@baylibre.com>
Date: Mon, 26 Oct 2020 14:56:39 +0100
Message-ID: <1jeelljdk8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_095643_411921_84517F10 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 15 Sep 2020 at 14:45, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This adds the VPU & VAPB clocks along the MIPI DSI Host clock.
>
> The clock scheme is based on the GXBB & G12A VPU clocks, with a different CTS
> clock output used for MIPI-DSI.
>
> Changes since v1 at [1]:
> - update patch 3 commit message to reflect drm driver state
> - added comments in patch 3 for clock specificities
> - removed useless parents comments in patch 2
> - fixed bad flags in patch 4
> - removed holes in axg_vdin_meas_parent_data in patch 4
>
> [1] https://lkml.kernel.org/r/20200907093810.6585-1-narmstrong@baylibre.com
>
> Neil Armstrong (4):
>   dt-bindings: clk: axg-clkc: add Video Clocks
>   dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
>   clk: meson: axg: add Video Clocks
>   clk: meson: axg: add MIPI DSI Host clock

Applied for v5.11 fixing 75 char per line patches 3 & 4 commit descriptions

>
>  drivers/clk/meson/axg.c              | 819 +++++++++++++++++++++++++++
>  drivers/clk/meson/axg.h              |  23 +-
>  include/dt-bindings/clock/axg-clkc.h |  25 +
>  3 files changed, 866 insertions(+), 1 deletion(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
