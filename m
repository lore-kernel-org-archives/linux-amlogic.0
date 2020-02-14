Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4D4C35242
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 22:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B90E2073A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 22:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oIQMWHNT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofUca7Gz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B90E2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuCNnluCYjUpApem1f3PcdNcRnGn8EG35vgfsw6OCt8=; b=oIQMWHNTP1sHRE
	oN1vZ6aj60GLyvMAG98obFzoA+lihOOoM5jGWfzS9cUnt5Mye0mrG4UtwN9C0XGHzxZ8/HOUN9Txw
	k0tt93oN9wt7+3IJUeAeCChT1ARs4kRplwp/wQ4um7wYKHD8ubH0DAmp4wJGwydK4n3jPGAJsvSZX
	QPJhpr1s4+s6eCsr+56N7sKlN1yv4CxvIWE9i7Z+NuZmopS+4MGrCC6Bia7moJTd7kXzw+5VrfZUW
	uNpjMCTl1eVTwctDGsiq2Gind3196tKsr8uhs8B925+5aIZ8JV5tUI/bnsMd8UuygJqIXpxXf5JoT
	V7u+Fdk131b/Uvy2C5GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2je9-0001tF-6n; Fri, 14 Feb 2020 22:41:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2je7-0001sf-4F
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 22:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581720074;
 bh=aspx7OnDRTCxwc23Z1+5q8PrtvapKwKPb6jVDsO81y8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=ofUca7GzwanehtaM+gAz4i0hDwMaYWi4SV00VOGunogtB00ljnbbCimnRHnDDoyq+
 3q+IUOOrCOAHd25SoV7jQNB/UXpO3X7ioGRVTTbtoPztNeRVjOeYEzX1KOVewlHaWw
 8skzxcnTZhW9CK4yFsV2uXGhoKpHA6Ryytfq8Rfs=
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] arm64: meson: add support for A1 Power Domains
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158172007444.10727.13504766491969992612.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2020 22:41:14 +0000
References: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_144115_193823_4063D8D6 
X-CRM114-Status: UNSURE (   5.88  )
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

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Wed, 15 Jan 2020 19:30:27 +0800 you wrote:
> This patchset introduces a "Secure Power Doamin Controller". In A1/C1, power
> controller registers such as PWRCTRL_FOCRSTN, PWRCTRL_PWR_OFF, PWRCTRL_MEM_PD
> and PWRCTRL_ISO_EN, are in the secure domain, and should be accessed from ATF
> by smc.
> 
> The secure-pwrc will not be probed before the secure watchdog patchset is merged
> at [6], which adds of_platform_default_populate() in meson_sm_probe().
> 
> [...]


Here is a summary with links:
  - [v6,1/4] firmware: meson_sm: Add secure power domain support
    https://git.kernel.org/khilman/linux-amlogic/c/fe98d0ff5d5c43ee179e801275bb37641d398c6e
  - [v6,2/4] dt-bindings: power: add Amlogic secure power domains bindings
    https://git.kernel.org/khilman/linux-amlogic/c/165b5fb294e878f00015b7beb91cb00e36e4f8b8
  - [v6,3/4] soc: amlogic: Add support for Secure power domains controller
    https://git.kernel.org/khilman/linux-amlogic/c/b3dde5013e13d44799b3477cd0bf0c9ad34fe5e9
  - [v6,4/4] arm64: dts: meson: a1: add secure power domain controller
    https://git.kernel.org/khilman/linux-amlogic/c/86e00420426cf6b040e71de5d9aa48c371e9b3b7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
