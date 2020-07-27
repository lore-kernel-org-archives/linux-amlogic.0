Return-Path: <SRS0=KqJO=BG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FD8C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 13:18:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94A77206D8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 13:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBnnuGJ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nM/46P4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94A77206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XsYyWldIRHxZ9V+WGg5bu7IUFfIbonTmJjABGs2mdrw=; b=LBnnuGJ7uF+mVevJTnf5ZyR0e
	Sg/RrFAAXphiG9Fu2yn6p5f9RQYLUtb6SapsAfvx4fWCa+9gVNwFo8U9ReyGHJVVtXL3xnebSNQkE
	kiG5K8IlalnHi3C8d0aBAbLEnrT6SsW7Zl4qRNuxlmtF7W3V6LLslWUBO10xVp9PI8OjZLy2ZWySV
	YuVKgHHhFq/bPXEMH4SvMhQPv7yZC3bTgf4OhaoDzH1Wx8Pn8d6GzkWA8YAueOuK1iyt+FeFqhKkZ
	tcvxj2Pet1heF3Rydu2M8Vgwvz+myL+Ijp0Ufo1EaNh78wqPkDy7kwtd3UQNofTyf1e+qnaLFiuWJ
	Kk+INJnLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k030t-00048r-J1; Mon, 27 Jul 2020 13:17:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k030p-00047e-KF
 for linux-amlogic@lists.infradead.org; Mon, 27 Jul 2020 13:17:52 +0000
Received: by mail-wm1-x342.google.com with SMTP id k8so4411377wma.2
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2020 06:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=cnUJR2EXbaVfxPnWw5DJPFyuRg94sqPAzMZQHxWuJrQ=;
 b=nM/46P4ahYRwQyrFIdZSs5KvPknuU5TL6rQlMvvcICWdlF/tLWEVopdslq7SgoXdiz
 VsDD4UZzVARe/k4k0SSedNpBhwsrCq0VN+3DtsnNj3ZDw697/6btiRy3FbeO7eOpPPSP
 r18OFhd5SwbOuuPliESX1It4HXJTrqQP3nlDeGb0t9seWa26IsmKXUidGOrYdNwykBiS
 Rp4XR6ndBMKZhNfB1ntj8DmsmeNbtf5ShU1EzdsCpKL12hUx8Ssr54ych2jexD4QZhb/
 lyIYx4zjAoRWagZPU+9thxm/oQ/HZ1Qbd3qSWLug52QQJkQwiRLx9Zq1yIrq6XgH5jLO
 FCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=cnUJR2EXbaVfxPnWw5DJPFyuRg94sqPAzMZQHxWuJrQ=;
 b=HvjlrSODJpXHxYhXyacEbU2SO5eRGXPkWCO5GwifhDcGJ7vFCDViInbwkuL9keVWqH
 7UeuL8GeiyLK4QiJr67qtsrLcii/d1x3DN4edJ0fsGtcN01ge+boz7F4KL0msateGasg
 Pj3JUmCrUe0X76sBOvOQIwQj1RkLQjND1lX1rlKGCxyvWc4fRW6TbK15w/+Zpm3gIDUH
 ubdsj/USBakwOSlnm8cbGp8W1Z/i3uiQ1tGw4dxLkKTBgJGVJvFC8RSrZSlw7DDA+FXO
 e4m/+/e6UPPFpMicwR9S//FV0zD6/1K2T6SD4nIEls/2++OaKM8N7kQ2kTt3th7Zshjf
 5oDQ==
X-Gm-Message-State: AOAM5300k+2lxlcZwEDl8kwtIB7J4NOIF+ib1Olg8LjB0lmbs5LUtFrN
 3a07AsG0efoOPo9NPDRfvqIPaA==
X-Google-Smtp-Source: ABdhPJyyTbHAnyA9oimVDAhDNHIXwICL+53Bzd9EY6xh4xCJixqNyq99m0VAPjq0/rz2WIxaRfTgaA==
X-Received: by 2002:a1c:27c1:: with SMTP id n184mr21474004wmn.6.1595855868971; 
 Mon, 27 Jul 2020 06:17:48 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v12sm12850838wrs.2.2020.07.27.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:17:47 -0700 (PDT)
References: <20200724184107.24600-1-khilman@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, soc@kernel.org
Subject: Re: [PATCH] MAINTAINERS: arm/amlogic: add designated reviewers
In-reply-to: <20200724184107.24600-1-khilman@baylibre.com>
Date: Mon, 27 Jul 2020 15:17:47 +0200
Message-ID: <1jime985c4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_091751_719595_4CE917B0 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 24 Jul 2020 at 20:41, Kevin Hilman <khilman@baylibre.com> wrote:

> It's already been the case for some time that Neil, Jerome and Martin
> are doing the bulk of the important reviewing.  Update MAINTAINERS to
> reflect reality.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> Arnd, Olof: feel free to apply this one directly, otherwise I'll
> include in my amlogic pulls.
>
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..7f405aea706f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1597,6 +1597,9 @@ F:	sound/soc/meson/
>  
>  ARM/Amlogic Meson SoC support
>  M:	Kevin Hilman <khilman@baylibre.com>
> +R:	Neil Armstrong <narmstrong@baylibre.com>
> +R:	Jerome Brunet <jbrunet@baylibre.com>
> +R:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-amlogic@lists.infradead.org
>  S:	Maintained


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
