Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BC6C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E5D2067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rB/+rYTR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3L4mDSc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75E5D2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bpb2SU0H8ZTmYhCazkXWGBJdfiI9qoUPqzPURFhTsV8=; b=rB/+rYTRW0GkGSDRbSDOB7DTd
	ui6czJT2FlSZp7BNZgODddMvgEIiY9VpY+vIXUc8b6qCmD1XzDE7Cp5gGkWPrGat2vUa2T852q97E
	JTwDH3RgnKT0Z3cEErGymr/TJkEajeMakeEJ/Ebc4Dg4x5m2xTU5KXT7iSx8Ld35qlL606zzBdaFT
	LMWu07qhFyj1EPJAmmVMt08HTouGBM3b9Gyr0r0HkgwXWNDrPMKWBuGy7gNVJC40ua6mEIR3HiG78
	UBcybiobHdNKVxIujSo0XwrRVD0oeJsCv0PsA7kIgGfrddT2FIY7ToSCuBIAGKDohKHioHEiM2a6T
	9frTBNyWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFh-000227-WC; Mon, 17 Aug 2020 17:48:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFc-0001xS-Ts
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686531;
 bh=Q/9B7fPWXb3FWe9WzMQUhBeB6Hw49K0R5QkHETETqgc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=G3L4mDScTnYqay/9NLqTVX+aac0MyK+SsR6yaOcOdh+L7LWysoPkoSuDpxO6dh+3u
 5EsV9Qnsbx8AuKU5KBZGP3ANX1LnaMgUyYfa8iXZx+2eLZtq5LkhptDM5KLpmikLn3
 Ue0Ssswrg4AZZaCywci7M2NgHR4zURZd0fLqY2JM=
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653162.32160.9829331777853339749.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:51 +0000
References: <20200713160522.19345-1-dan@dlrobertson.com>
In-Reply-To: <20200713160522.19345-1-dan@dlrobertson.com>
To: Dan Robertson <dan@dlrobertson.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134853_082026_E4EEFACE 
X-CRM114-Status: UNSURE (   6.37  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Mon, 13 Jul 2020 12:05:21 -0400 you wrote:
> When testing suspend for another driver I noticed the following warning:
> 
> WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> Hardware name: Hardkernel ODROID-N2 (DT)
> [..]
> pc : reset_control_assert+0x184/0x19c
> lr : dwc3_meson_g12a_suspend+0x68/0x7c
> [..]
> Call trace:
>  reset_control_assert+0x184/0x19c
>  dwc3_meson_g12a_suspend+0x68/0x7c
>  platform_pm_suspend+0x28/0x54
>  __device_suspend+0x590/0xabc
>  dpm_suspend+0x104/0x404
>  dpm_suspend_start+0x84/0x1bc
>  suspend_devices_and_enter+0xc4/0x4fc
> 
> [...]


Here is a summary with links:
  - [1/1] usb: dwc3: meson-g12a: fix shared reset control use
    https://git.kernel.org/khilman/linux-amlogic/c/7a410953d1fb4dbe91ffcfdee9cbbf889d19b0d7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
