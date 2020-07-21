Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B862C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:47:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B3B4206F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 08:47:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfUzobTX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yLeByTOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B3B4206F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGQvngJCtzWrw0Xp02vSaQcse+1jFUHf8u/5m9qUGTc=; b=yfUzobTXSbitKBc5LK9cNqi96E
	tc4emBfdUMfQR05t3QP6Lww69HsfelLxxbtMVZa+/9mEgT6SuqjltXqq3YCkRXNrSvElL1jwpYoHR
	ANKXrDOxj7sRzKnEJf89UfDh0g6jUin69QKkExaPUBZEaRPHpOtkKIjbcdxIN6Diu2RCBbDsDZkru
	0+vZRNjT35hmIfpqFh6egq/q6G8/eaq0TATeCQongtIrrTE1gtcOW+KQUxBPoQUdaueZvdsXxIJDQ
	/oTGrT305tdQZiDg5D1yATCsB2tvjgFQQYXR4GJbaXmbi2RDmqDkDwYQMKqS6AcinnpVO7BVIqTny
	wNyiD2lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnvn-0000Id-7G; Tue, 21 Jul 2020 08:47:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnvk-0000Hd-Gk
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 08:47:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id y3so3000569wrl.4
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=K1UC6jdZ3c17SoyP6xlxlFovUPpmZnz7mywCnflsBk0=;
 b=yLeByTOo/OuRZOhYSglmXMos6TiL26zvvxwrhk+bL5lWrsou8qeC4S3+TZtxGQDLuw
 L7Ys23fspQbkmwkAVtzfVqsVHVxQm1MjRdHmOO3bNSC+l/cNljHbODizKlMXG/Ocde/Y
 h2Lhh11tIUosxCFVQv/QryUzJE3cnCS4aFo9sdixtsKYFaPW/4wE8bvMfKnIbT8TxdCM
 uH8bgVD/OCPfVOnC/cxBgiqi0abxIhCSyZsfGrCBnankem40jBRFEil+pi2XJfyX9Co1
 SsZjxOWJc2qRHH7LGcs2/OO94lkNMy2KdoAJ8i1qhwyaii3DZGFQOEpFRI6EozGLzqJ+
 sErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=K1UC6jdZ3c17SoyP6xlxlFovUPpmZnz7mywCnflsBk0=;
 b=fkzXsQ8NRzInV9ok62gl/jX3sUswpIbaihRZ0PpT4iEgPCC/RQ8n26UGsNucPyeEnv
 XAKBypPlt5gg5lLt9ZvbZy6xhPMOX9lsXzFZhfSKZzd6ioBSObFPcmNyPnRpHKAXP3CY
 YPwVygyxjf/BYbhWfZehP3EzSE66c18PlJ+UJZm39cLX4jClw7DwThwyMmJmzd105Cdg
 1PcoMXk1RRMvEJmnbEZSxTfeGMvmUoEsvQkFc3TAFa3XHx0KdZ6DRBJ3EMQFaZHOOrAT
 z9ktUTLiIa79CPg3tXiecGPKTY6n8PeSJVpqbden4WXMxnNjHS3gIVBd27eN8WvQMoPF
 f96Q==
X-Gm-Message-State: AOAM532UYCMj2U5M/Ke9ymB9Q44dyhQEwP5nferRgqeYrK0RVzCyhY0i
 it13ZMwPC3LlzvcL59Q73vi64g==
X-Google-Smtp-Source: ABdhPJwYjwvOJGv70O4j08oC5Qj/6svFm8pb1ZFxyQlbQgrUYLJvNUdUrDKKHwsDnuZm3Aohn4pOtg==
X-Received: by 2002:adf:f784:: with SMTP id q4mr25561076wrp.397.1595321239433; 
 Tue, 21 Jul 2020 01:47:19 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f15sm35050842wrx.91.2020.07.21.01.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:47:18 -0700 (PDT)
References: <20200718072532.8427-1-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: meson: add more SM1 soundcards
In-reply-to: <20200718072532.8427-1-christianshewitt@gmail.com>
Date: Tue, 21 Jul 2020 10:47:18 +0200
Message-ID: <1jsgdl8dbd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_044720_622672_DF834713 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 18 Jul 2020 at 09:25, Christian Hewitt <christianshewitt@gmail.com> wrote:

> This series adds basic support for LPCM audio over HDMI interfaces
> to the Khadas VIM3L (reusing the same config as the VIM3) and the
> HardKernel ODROID-C4 devices. I'm sure support can be extended to
> include other hardware but this gets the HDMI port working as a
> minimum capability. I have personally tested with both devices.
>
> Christian Hewitt (2):
>   arm64: dts: meson: add audio playback to odroid-c4
>   arm64: dts: meson: add audio playback to khadas-vim3l
>
>  .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 88 +++++++++++++++++++
>  .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 88 +++++++++++++++++++
>  2 files changed, 176 insertions(+)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
