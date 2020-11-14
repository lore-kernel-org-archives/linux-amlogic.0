Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98515C5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:59:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C2262242E
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bfQMQi7X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EulDwzCP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C2262242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zSkY1AzoDmeKuwOvFwj8zR087d77EE/zET6hQF0YNMM=; b=bfQMQi7XVlUYug65EUgqJwylM
	BXty26vXfJzrzkjMze0lusk+6sFLLyNu2bBzDVo8oIdLH0Lch2e7GEP5hVwUjpAClDNHb2b07uqyq
	VdJDnOpw1XNBiYdZa64ys6pL/EmDP2GHK/jmpUB+SdgV4zpjrODZSOCkxZQZTaytiQVty7lF80Xi9
	a/CkRYXcLrMhY1vRr53zMnr28udo8KTg0E14S0iFECtwMMZsosdHlIeGMowqwf4hj3qx2DvDm8K/6
	caBYT7gmcDm8UY1lgM7wGvPmzjffWu2cdA6hKS722CCspw/ITwbHU9Zg4uCV5X5uVzDpb2YDq/Aef
	Mafa7YWwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2dU-0000Lb-2o; Sat, 14 Nov 2020 20:59:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2dS-0000Kv-9K
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 20:59:03 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E30C2242E;
 Sat, 14 Nov 2020 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387541;
 bh=Q/efP1kGS+jsxpxCjbrpMp46zOMO6NBBfhlTQC48S3U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=EulDwzCP91i3YffAk71DBxovy0/kqT0HY1Mdk00feZum6Iy7Ka21QsrpdKAg+dG+e
 gWfN6Xf5VrG3im/YqPohFdC7RA5Oji0pOX+dL8rzRYvj6nu8mZ2fzf3ESAwDgweDGJ
 ScbWIPHdztjPdGMmyD+rzVIQucbfow8zheeKNqkI=
MIME-Version: 1.0
In-Reply-To: <20201021163847.595189-3-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
 <20201021163847.595189-3-jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson: g12: use devm variant to register
 notifiers
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Sat, 14 Nov 2020 12:59:00 -0800
Message-ID: <160538754041.60232.477564298644612511@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_155902_409411_52FB4492 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-10-21 09:38:47)
> Until now, nothing was done to unregister the dvfs clock notifiers of the
> Amlogic g12 SoC family. This is not great but this driver was not really
> expected to be unloaded. With the ongoing effort to build everything as
> module for this platform, this needs to be cleanly handled.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
