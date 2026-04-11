Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A824F44875
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2026 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZJii2qESmbu1hVSVNStRal246QU1722ixaE1H4+gJQ=; b=Tmxe25vTWt7Bwz
	LlEHz+DmA9CkE7XwSzIE/VT8nWY1H1avmhLRzFQF8tF9kvp2Qw9FvWjRcg3rnzFknlvJ2CTbM52mG
	fu06F6PyLbuw43iYjQwoRnXQAU3AkbTDhShP2AnrWNVgqoDGuyqVDQMsjLQOBUGjSG71cbvCa1ZUA
	VsRGbYHnuy4JeHCItJs2ddf2Tam9neUPPquoQzyVorE0Z+pZSImlV8RxHInrxKOnX9kuYJq0Jwj0F
	CzNAL0uLy1jVRBVetgxbIQil2GtOruMof0NSU7cxh0tZ4CtHLl8lRX2M9fJkZuLvqJdHHw+51JcKp
	WhKXS8UPnLM8eLlLRw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBUhb-0000000DJrh-3xZc;
	Sat, 11 Apr 2026 09:32:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBUha-0000000DJrY-2gMS;
	Sat, 11 Apr 2026 09:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A24AA60145;
	Sat, 11 Apr 2026 09:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A27C4CEF7;
	Sat, 11 Apr 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775899949;
	bh=Bwnwhvav7SqaBcGFuZZ4+1wMWtuK1iYREbAFYllIJuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaXSsm1Sq4nXPSw6LEOW/k+FOhQYNeo0nXpITHwF+XkAZGvqtytXuqf0UvmMqAULG
	 g7jE5JE8esTBkZgWclucm+z6bx/ua3ORDCWiHHyM4KPR5PhcbzBYIy20I5gsdmq1Ch
	 XL8oyDoAhujzwdutvJXH4kcmchOYpZiaWh3iQ9WIO8xNCqWcZOWvd70kHIfG2UMJ5i
	 Ng9+owznce4KPf5kxS4ZZfHG7BpWj4U0BwcNMqVCvzivWuatm3fFYctp2kCkh1n55p
	 t4PtGRkdspC3qtuUhS22XXNIc04/mbaO8NiKlW0Ml8fcP/JtuupF2edZDgmV5KzDdm
	 fDMjVip+1tg4w==
Date: Sat, 11 Apr 2026 11:32:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
Message-ID: <20260411-spicy-apricot-newt-afa8a7@quoll>
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
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

On Fri, Apr 10, 2026 at 10:50:58AM +0200, Neil Armstrong wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT changes for v7.1, including a bunch of fixes
> and improvements for the Khadas VIM4 and VIM1s SBCs, plus some additions
> for the Phicomm N1 and a couple of low priority fixes.
> 
> Thanks,
> Neil
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.1
> 
> for you to fetch changes up to 401e5c73eedde8225e87bd11c794b8409248ff41:
> 
>   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-08 14:27:20 +0200)

Days in linux-next:
----------------------------------------
 1 | ++++++++ (8)
 ...

So a few things were just applied, unless this was rebased?

I will wait with this. It might miss the merge window if v7.0 is
released this weekend.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
