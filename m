Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515A3C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 15:28:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED446235FD
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 15:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3bUDC2o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sT0nysyl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED446235FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gs8YOErKJ51m9jTpSo4HkcYb2jLKrHWr9bfI2kqGrNc=; b=e3bUDC2oaXElhJZ3jKdi2hH+J
	5oGo5cA+53k4JOC3shknYXM+QeQLvuDDMBZH9zojwCcDDz1ukqozdBDqL3F98V65ZNE91RtqrED1y
	7RhILkTyPHNxUVSfpgVigNIM1A1gFWUorU/5h4Wg6MF4/UqqlkkpEoQJUMghZvIin3pBi0O66p61T
	VuKSl5GyiQgyfiLOjrHbhUZBkK3eQW+oLaCx2TtpKf5o1afoiQ2kcu+ez6lMBkyslS/aTsywqnORV
	l9bbpGXD90mX0OBcN8BiDnG5B5R1J9ERknnGkYiSoS0RZBmk5JCdtB4R+0amqsRIvQ+3TZtg+FMt4
	jcrZtHENA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpe1-0007IU-5t; Fri, 25 Sep 2020 15:28:21 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpdx-0007Hh-M4; Fri, 25 Sep 2020 15:28:18 +0000
Received: by mail-ed1-x544.google.com with SMTP id n13so2879542edo.10;
 Fri, 25 Sep 2020 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXmuOZs0DtJBI5d4YWGL14ALmZnj964Bo0N22tOY/CU=;
 b=sT0nysylsyeePQrg0Wyo/iQOddOxzcLVRdDOu2h3ce5aCydGJhpmWHad3J2VPu1BmL
 pnPP1w2Hm9TFX4LAU9QzKE/5nd5BXJkvSx/LkWy2HWunkz3cpMPhRS7zpGhgxCh5+bUz
 SyNOgp43hnDX3Kf8SfOoWpOM+ueD7KKTKDpg20709uuuV9u54JD8+C5qyIGK+88x0dvo
 SaG7jtSlJvbIoY5XHlawwDHhefiuxlFxR2RGP4UtJFBk/OFL6OIBbd8BRJtk8EnzDaRI
 Cb3HK2+QWfi41X/SUJ2pxVAPjD2KsF6AtiQ+xbFBKFB98mhRywxcFas/j1WPFMxVHKJt
 dY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXmuOZs0DtJBI5d4YWGL14ALmZnj964Bo0N22tOY/CU=;
 b=NLeB19ZuP3tEDPBEBWd6q/WraMTAIeKGTuiGyASXDJR3UoCFmBgdlsm7pll2EENyQn
 ACCO1KQ64kqObiN/IYwKl5DfX/rb3wyo299oZnuBY/HRPWq9CzeeRiuf7epy1Nxo9trR
 si7CBS/o+d3V79rL2nHW+Q6dcL3Tm/hKfdSh8ed3xv1BQ90sT0jB9FjA4SO6ftmjEELI
 PlcFd0kAUjYM2MdEqlJv+AH8SEDZ8edqii4b8ZR8tYAFxLM9bCGYUznfZNmZB8D0a2jw
 ke1CF7LR53D0+0lJs2OtyBw+HJh85LVdz6o8kbHYLgb3RMdX6tPGqwEcDERoVZQaU5y/
 UiKg==
X-Gm-Message-State: AOAM533hGuVZFEhlIdxIiXlsgFsmUXgJX+IKoxdfN+dqb1cNyqbUBqex
 1gA7oC9LliO7zgDhNr24gr61FJzAkPFdbQcJWoU=
X-Google-Smtp-Source: ABdhPJxwBbbU1UpXBELIWwegXfSCZxQOgGDN3fGNZ4ZeTBDazTeqn5IvL2gzzsvqFbFMDfSYKrQfRnHb2/4i6NGlqWA=
X-Received: by 2002:aa7:d697:: with SMTP id d23mr1949423edr.13.1601047696366; 
 Fri, 25 Sep 2020 08:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
 <159830380185.24712.3464811968459073992.b4-ty@baylibre.com>
In-Reply-To: <159830380185.24712.3464811968459073992.b4-ty@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 17:28:05 +0200
Message-ID: <CAFBinCCrbVzK8A0s-=Q++n4yUFO6+Wm_Ayh_vdxkATJh7oSx1A@mail.gmail.com>
Subject: Re: [PATCH RESEND v1] ARM: dts: meson8: remove two invalid interrupt
 lines from the GPU node
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_112817_819317_B534AFAC 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Graichen <thomas.graichen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Mon, Aug 24, 2020 at 11:16 PM Kevin Hilman <khilman@baylibre.com> wrote:
[...]
> Applied, thanks!
>
> [1/1] ARM: dts: meson8: remove two invalid interrupt lines from the GPU node
>       commit: b468412409c0e5752ad3396b147cac563ff8dd3b
this one still seems to be sitting in the v5.9/fixes branch
I don't see a reason to rush this, so can you please queue it up for
v5.10/fixes?


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
