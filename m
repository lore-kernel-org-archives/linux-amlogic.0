Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB10C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 15:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CCF32083E
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 15:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbpdJPeh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yN0/QqWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CCF32083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENM9lRmh4JclnXVZ95SwfKojd+98/mZlJA6qsOSqKt8=; b=WbpdJPeh0EtXsq
	KvkEBNiyiNles8oNlfJAbidEygg/pCC5NyBJGxKJXTGpPHTqOYXbG104v84BASquHMlImfySjmO2X
	WesEikhKcaq8pfDEe0dfNxw2aRAxRANPXvvZMrw5EfpKT1VX6ooLNPgXZlgNYGqFenb99sB+DKiar
	tYpXp0JYu97KsHquYQ7ZJHP0q0N980Cn1+Xix5n2Om7rxtjc2XnZf1o7zBsTDepDKJvOK1Dm2RxgB
	BXBCS+bbfw82vSQqi5nclTkUJaPYQYA4/bC4c/RXDkwhky8F9kAGQoNoGs0SPK2pG0G9P/PImEn2N
	UPwpX6PonoBfKBZfYHyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEbSj-0004cy-A6; Thu, 11 Apr 2019 15:18:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEbSf-0004cA-V1
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 15:17:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so7897076wrp.2
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=/HPTyhpTZZCMQQkRclscxanz2gE7w747HH5mlULbwww=;
 b=yN0/QqWeJt+slmF371F5HdeAuu9fGHHex6im5bxktcHl8m+zmlb57h52FUAiutOFIB
 Bn4Tp/yBu4YqMzrIOGWCVd06VtrvaKt7r/+P05vqq5K9jFDPKW81MPQS4cQcKJd7IZCq
 tUMs8UMv/b5Lw4lqFshe2uRVs4LTznrWjVPHr7G3YGlCcHwoWJGjT5rs3DSEPibvNOwd
 xihG2TkjEPvh3Bm+Sg5ZHxOxcDbuLQ0DwpXQOxMkgz1MgD/odT581OsGONJChTXJH26Z
 2kAAZD/r09BnyKbaVXXU5qarfFUNIPJE8GkUfv/ZiGTzwCkz7r4NtLSaDB47/FWfvnpu
 x3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=/HPTyhpTZZCMQQkRclscxanz2gE7w747HH5mlULbwww=;
 b=JDGq6S3+FZQQ9RiXWNvlcVPzpXv8cd9tbBZ9vCMigB5Z+L//g4lbtCX4Igakm6raHt
 UppIk/7RXtnh+FnPi4RxTxc+6Je5aqwtqHN/rgVdRH0DA6Z2lSvlJFW81zKCzGzFBB4P
 1JT8zZ3sjvZ/E6HFQFX/fHVP7vF/LLWRtp9oa7KDmRkqW9qaFajy1dGOGFY6GrZBrlZQ
 QA/TtfI3Wt86dwCWCpvm5hO8bUK6vquFOUN77xjA2qOYM4bopFHJkVacStfud5sXkOIg
 jp2RulMA14h8ksMSYGxD/eFep3tZmENb1jsJBQq4nVzwy5o50WyEzTVJTA5QuNEMpQZk
 UuxQ==
X-Gm-Message-State: APjAAAWeLRbRW6T4Y0Pnap+hlGiPY/n1Vex6AcYFUSJS4E9+bqGITrdl
 oYiTxgK+McwDe4Pbv5NvpHD/dsfQsQ8=
X-Google-Smtp-Source: APXvYqxVbbpkE4iOg3B0fFO8Fh+S5yDFJmiW0seu6Z68ScGcYj/4Go6icoV2z4TLySMDWApKYVVskQ==
X-Received: by 2002:adf:afd7:: with SMTP id y23mr30565080wrd.254.1554995876158; 
 Thu, 11 Apr 2019 08:17:56 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 b9sm9177978wmc.9.2019.04.11.08.17.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Apr 2019 08:17:55 -0700 (PDT)
Message-ID: <e5a67b62d6cecc456633a4017f321807894aea3d.camel@baylibre.com>
Subject: Re: [PATCH stable 5.0] Revert "clk: meson: clean-up clock
 registration"
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 11 Apr 2019 17:17:53 +0200
In-Reply-To: <20190411144043.GL11568@sasha-vm>
References: <20190411101132.5513-1-narmstrong@baylibre.com>
 <20190411144043.GL11568@sasha-vm>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_081758_139006_3BBB4BE5 
X-CRM114-Status: GOOD (  10.33  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-clk@vger.kernel.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-04-11 at 10:40 -0400, Sasha Levin wrote:
> On Thu, Apr 11, 2019 at 12:11:32PM +0200, Neil Armstrong wrote:
> > This reverts commit 9b0f430450cf230e736bc40f95bf34fbdb99cead.
> > 
> > This patch was not initially a fix and is dependent on other
> > changes which are not fixes eithers.
> > 
> > With this change, multiple Amlogic based boards fails to boot,
> > as reported by kernelci.
> 
> I've queued this and the 4.19 one, thanks and sorry for the breakage.

We thought it would be harmless when it was proposed, so guess this one is on
us ;)

Thanks for maintaining stable !!
Cheers

> 
> --
> Thanks,
> Sasha



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
