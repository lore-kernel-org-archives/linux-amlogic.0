Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF45C43218
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9F820679
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X1bTP81h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="Xf0ngrkk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9F820679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWNQlUKuQOxTouwQQaOQMmu8IloJMyLbRvir64Mn3fM=; b=X1bTP81hneP4zZ
	jA1lOx6NqgYdNpeZjUphsqXF2XsibXhL75zMeBKdnqp8SiISRKEIiXfYwAqytZH7DFo2iGoQOujlP
	/h5FxPSq+HspIkGsqXGAPDmJv5tZMoAnxNkrmQVLbiOtfLeM9//mPYZMfk0VL8r//5S0f6TmQB0Rn
	gbiE3R1ba/WMcGHM9q7dTS/k5oXgFZfsaDVVtwh6LsKJU10LFODNoMChzPmm9CIGE2hCG7/1R0uhu
	6h8OwwKor9kJmvh/rQkpZly2Iv5Cvyih/xk3cIMuzl4rkncyTJTFfmVEnuvB0d56yJ8YKlZC7A8qV
	jGhr4LOJJIXiYr6bxzPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKqMO-0008IN-Jm; Sun, 28 Apr 2019 20:25:16 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKqHM-0008Be-88
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 20:20:06 +0000
Received: by mail-lf1-x141.google.com with SMTP id h5so6373410lfm.1
 for <linux-amlogic@lists.infradead.org>; Sun, 28 Apr 2019 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3dIVvC+MR+L0wsGCt/+00eAggIxbLnOsQ0t6cOQQvPM=;
 b=Xf0ngrkkqsbOgDazYS3iEaq416sGquHH/DhSQ/G3z+PRF/F7+vzSWMgYn62pgNU6Jt
 A1l227ntcOQFLLfrbg3oslHCwS0h87y6b1V8VPKDO5q3uTHr2QI5xGVXORkI5Q+0Wbc5
 irerdKY7aOIAIrnhAcILalbrLmGnnRqs/L+TtonPSfCsR/pxzQ9QIK8BH9LR7sJenmrt
 TaC90khKIvcwPX31v8HEm6ZT6eshdwzCsSkxaKqTaWLIQ3ayBv/Hvp3R8kCJPDK0otGl
 PHWntFWVnCWEDwJEKIhtI+srU8XIIi/HZMetm/MqoQe7qZWJKD1Q+cOmfhrPLbDmq5yI
 Gz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3dIVvC+MR+L0wsGCt/+00eAggIxbLnOsQ0t6cOQQvPM=;
 b=Nk256sTXOb6hTtpeTEdvEVYSXimCf4xAYA/Zt+czrNsipjVb+6ignVqM6aIa6qcvYR
 Ubl5y0HC5ybF8eY8jTmQvrmrKAXyNaeuPFz8t0CVr9z/gAtymeDGz3dt8+ISQgFhLARG
 4tA1Fm7/RyOcjKTglxoFoovLwD6gxh+dfsyZwPu1J3rUDWaZS70o95kLYRkeDGejS2gM
 +8ShaAWxwhwZJeOXHTSoQQMinBqs9GYarB7pCylgHkCgdZUaiYtYXZmWpIMCnpU3vbyf
 5lp+wKoInQjxF5ZGLzW9DeIasahRtUd7PUCRM5IAKZKVPCDRhMTF1dWqkUCZgKGucM+k
 KHEg==
X-Gm-Message-State: APjAAAXhEx3NZ5D09GtsG19cZborAcP3Ey5LOzBiQ29sAGs9KKw/2zGo
 e5rT35PK4ju8EXY0kWzM0Y5I9BVjrR2bCg==
X-Google-Smtp-Source: APXvYqy4lzUtWieq0ZEpbdsrDR3oT5/do6l+w43pSGxubsDMKjiR7Xr0rZiizXiYc2//BsXYuAc1Ow==
X-Received: by 2002:a19:cb09:: with SMTP id b9mr30862688lfg.55.1556482802553; 
 Sun, 28 Apr 2019 13:20:02 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id t9sm4108531lfk.20.2019.04.28.13.20.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 13:20:01 -0700 (PDT)
Date: Sun, 28 Apr 2019 12:50:22 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.2, round 2
Message-ID: <20190428195022.z2ig4vb23rgv4ryd@localhost>
References: <7hmukj9zsw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hmukj9zsw.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_132004_499443_7B21017B 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Apr 21, 2019 at 07:51:43AM -0700, Kevin Hilman wrote:
> Olof, Arnd,
> 
> Here's a 2nd round of changes for the 64-bit SoCs from Amlogic.
> 
> Note that in order to support display/gfx and USb on these, there's a
> dependency on new clocks and resets also added this cycle.  Those
> dependencies are already queued in the respecitive maintainer trees for
> v5.2, and I've merged those tags into this branch as well to avoid any
> build breakage.
> 
> Please pull,
> 
> Thanks,
> 
> Kevin
> 
> 
> The following changes since commit e2cffeb398f4830b004774444809ee256b9bc653:
> 
>   arm64: dts: meson-g12a: Add CMA reserved memory (2019-03-29 14:19:42 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2
> 
> for you to fetch changes up to 659f2563d323b09ca12b0e70bb6a50c1b25af3ee:
> 
>   arm64: dts: meson-g12a-u200: Add support for Video Display (2019-04-16 11:21:46 -0700)


Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
