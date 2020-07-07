Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9123C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B765206E9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CIQ2GJgR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5VyFIsD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B765206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2K7aEbFnBJFGB2cbxflLE96GWqmUKDIgoOsVZ+tzl7U=; b=CIQ2GJgRg98xpGGDVLssNJehl
	/eEjHDbwmN4UV0D+5EAfDY7uHH6kbGyeKQILQBhZT97OdNU/fzTK1T0pjFUZuQ8LZSLzSPE9xt78Q
	Hjb76OSCV5UArbCxdyXAhLdAKPpaRu9DNjqxI5ze8CcgNS5kUeNtqQKvgUKMP0r4fBeD6S8lpebKL
	PQhxcHrXvHYQ2a4VPnV6Zx6O/tvwv+IiNMpzWhj/2qYSKhulJIvD5afIxv+G+jkyeULJ47OLRFR5P
	QyZsRf31eAebBFD7WpS1uBxQxPY/ZX7XPQobDdPYil3WCkdMv4NbD8psTzoImwMwliI4okmW4GcWu
	47iC2JnHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgh-0003Qe-Tn; Tue, 07 Jul 2020 18:51:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgV-0003IT-77
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147872;
 bh=B2hPX05FJ8oI9l73mE7aWbUGl1YjtQBtd8uQtLuglyw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=P5VyFIsDEav5L+w5ZvtaExiZmgKKDqMN5eiatyJfLgRLf5KGQwPOt+YeXBSOA/hWx
 iMHM5bvqaFtQLyHRheFXlQ/u1LCwezqdmzo+U1RzT6Fc/RJY3Qp0IQOejLQ8i48rHW
 4g0up1Qf1WcaoL3L1zJJ7dIyjjS8KrWHb5jZ67yY=
MIME-Version: 1.0
Subject: Re: [PATCH] mmc: meson-mx-sdio: trigger a soft reset after a timeout
 or CRC error
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787274.3387.6774407965149983621.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:12 +0000
References: <20200503222805.2668941-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200503222805.2668941-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145115_527348_C4E5F8FE 
X-CRM114-Status: UNSURE (   8.27  )
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

On Mon,  4 May 2020 00:28:05 +0200 you wrote:
> The vendor driver (from the 3.10 kernel) triggers a soft reset every
> time before starting a new command. While this fixes a problem where
> SDIO cards are not detected at all (because all commands simply
> timed out) this hurts SD card read performance a bit (in my tests
> between 10% to 20%).
> 
> Trigger a soft reset after we got a CRC error or if the previous command
> timed out (just like the vendor driver from the same 3.10 kernel for the
> newer SDHC controller IP does). This fixes detection of SDIO cards and
> doesn't hurt SD card read performance at the same time.
> 
> [...]


Here is a summary with links:
  - mmc: meson-mx-sdio: trigger a soft reset after a timeout or CRC error
    https://git.kernel.org/khilman/linux-amlogic/c/91995b904ec2e44b5c159ac6a5d3f154345a4de7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
