Return-Path: <SRS0=e5Du=DL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D0C4363D
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:23:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30DF206DD
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wnF03dJX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="uUS873vk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30DF206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dN83f4rMBZgR0Xc8dy7h2u7dSnYyittxisOFuDVqvQ8=; b=wnF03dJXiI9kkFSZqaSjBKxGm
	TlU1tUTobiIMVy/cAEknn/GvZgbkWfj1BevGxI92cKI2AV6f48AQE6y7PyMpAfOxqrdjCzjmx+XEZ
	i+/eCwPYAnsd56GrqYGqxnptf37OEwQ3eAUSqKGrW4rHPbnukEKHObOMS/ThV7gPNNV2NZJ9NFqZI
	VPz7+UzfnFkEOf+F3JhOYflzFiGYwXRHG3YaTDOkQa68myDumMcfuHKegGyCVZEmjrvtj2WC8jE3O
	G2CnXoMNyR3xPKJ0NwWTlVPsacdCcBlq6sP4NLO04PGQMsSKAPWYLVEFQThF3iDK9uOzGgpkML+YZ
	QJd0nSv+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvYP-000177-20; Sun, 04 Oct 2020 04:23:21 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvYM-00016I-DL
 for linux-amlogic@lists.infradead.org; Sun, 04 Oct 2020 04:23:19 +0000
Received: by mail-ed1-x541.google.com with SMTP id g4so5996561edk.0
 for <linux-amlogic@lists.infradead.org>; Sat, 03 Oct 2020 21:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fQ/Zq6PQEGB9ILeYfh+YuOCgWVPmB5UHN8jyKpIvP2g=;
 b=uUS873vkB8wb2OHno3xl9s6pGWVGqZZQuXAfzohWo7HROHkubda5SrZfxKDh0yTNpy
 WE+cCOjOl4XmymYzP3dBSZg2e55rOFHSSGKvVoYZlmjYJmeWGY1UWhE28iKLA06jP5qy
 Lt8BX/r3v9I23yIwRtn6RFDNEq60nwbexPp7N1+L3cUcgvFTLs2Wb7kXD9clIz6KjQ9I
 aV3nFNxKdtLZcf0jVqxEGwUokhPdrReDeqaKn0z4/deghJ6XntxyzMol7wGz1/HalHhX
 CI6BY9n3vZqW2ONpag85W4luf9w+UzvisOzs98KbrOf2j3LORS3dVOOCd169svBE05tb
 vf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fQ/Zq6PQEGB9ILeYfh+YuOCgWVPmB5UHN8jyKpIvP2g=;
 b=rGVdUtzY7QPWg0M8RljPnxdO/F4TZBwBDY5Bhwo7ecufCPR8jZaytULZO7Hd/29sst
 m3JZNEFssXY7BPP241rEeePH2qwNyqgsJjl79iMjbeTQHHkgU6KUvCR87+A70H60wbxV
 sjrUHCJ9/k6MQ+6/cALw+hvaWnyyEurzQS055+y3zPATGepzjmT3LKgA3WJLKCV685gY
 o9ghyPzuaSXyYB0kkNodZAchUbHfR7Aq5L4icJ4bGl3EKnLGx1QnSRV0c+E6YPJloAFX
 oXmtf/xBb6yMJr1sUItcrsHrD8Pp1PINaXJqBRGPQKlJOrgWhSli8Aoy4rNvFQqes6w/
 RQJg==
X-Gm-Message-State: AOAM5332bQCVNGuYfTMRa2NFSZKZ180FlM8yHwUU+zmfHlEILfS6U6Fl
 iV3d+xs06lgBuFUBj36gmHRT1g90++ZpLl44
X-Google-Smtp-Source: ABdhPJyZaXAKGnrQbPlNPGk3BOFBSDbqdpr7YwTi2O4FDkjuoW5MFFKZWVOFNi3eD3F/F8VwmpBHRQ==
X-Received: by 2002:ac2:4d05:: with SMTP id r5mr2621484lfi.267.1601753364553; 
 Sat, 03 Oct 2020 12:29:24 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id z27sm1848117lfg.14.2020.10.03.12.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 12:29:23 -0700 (PDT)
Date: Sat, 3 Oct 2020 12:29:06 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: amlogic: updates for v5.10 (round 2)
Message-ID: <20201003192906.GB8203@lx2k>
References: <7ho8lkl9fw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ho8lkl9fw.fsf@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_002318_459864_24588BB7 
X-CRM114-Status: GOOD (  13.28  )
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

Hi Kevin,

On Fri, Oct 02, 2020 at 12:22:27PM -0700, Kevin Hilman wrote:
> The following changes since commit 63fafc5a046b1e21756de691b48f0c70c25e1426:
> 
>   arm64: dts: meson: initial support for aml-s905x-cc v2 (2020-09-18 13:35:27 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2
> 
> for you to fetch changes up to c0c6f8e527a652d4785cb38ac82be0c95913349d:
> 
>   arm64: dts: amlogic: meson-g12: use the G12A specific dwmac compatible (2020-10-02 11:32:17 -0700)
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

Scripts found a snag:

  b3cf5ff01d47 ("arm64: dts: meson-axg-s400: enable USB OTG")
  628c9c809f84 ("arm64: dts: meson-axg: add USB nodes")

are missing a Signed-off-by from their committers.

Looks like you added a Reviewed-by, but not a signed-off when you appled them.
Mind respinning? Thanks!



-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
