Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35D2C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC263206E9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEelaO0C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+UP9rjG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC263206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=95F+2LMSzmso6mlBBSQ7ZlNCpKDCyD/yuE68uv6rF3c=; b=cEelaO0CaMWygqGmXWHO4mGyq
	Vc8uYf33nEufzCMHLxldGBaJPJFMiqKCqK5yxvPMEp24yK24jB6f1JjkbMNtSUWaycRPEA+nLCDjV
	CMdr7aTl5zZzj03HoYN5atj5spleRfiDUY/6KGXVuJdQUD+48I8biQtMlhqyysT50L1Hrd3kD3mhK
	nV1YdusSeauqisrSRhSIQx3IULZkzPU2RvLgG05T6COLvF8u5ZQ+hxP57rV0eFzLOQWPKVF3WEfxd
	WtjwZNSe2HMrkSlmxpeKkz/JwhW4IVkYpt4gz7ja4K1xPHHbyoSpyLhiB6GNJpMgRglnomB7Rd/RK
	o5gZ+q2bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgd-0003O6-P0; Tue, 07 Jul 2020 18:51:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgV-0003IS-7G
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147872;
 bh=ZCSC4AbmYV5hn3Ojp1Z5QDc10FKl06Upi5ZA8y8v7Uk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=t+UP9rjGzzoEkSjy+bPZcs8xf2iZXXSkcXePjBPn3popLzoAfEST6LU3OhN1XoQSH
 2SPbzwV6R4mR5Su7ebAtYRV+bSYCMibJjOM/zj8WVv/oMrDgHWw58TN//C4QkpCDr1
 cgXxkCihpAOSd93CWF8/wfvptQSbDb4Fo/4cnTGY=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: add missing gxl rng clock
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787291.3387.2354981560450344318.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:12 +0000
References: <20200617125346.1163527-1-jbrunet@baylibre.com>
In-Reply-To: <20200617125346.1163527-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145115_482461_C9C4F595 
X-CRM114-Status: UNSURE (   6.61  )
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

On Wed, 17 Jun 2020 14:53:46 +0200 you wrote:
> The peripheral clock of the RNG is missing for gxl while it is present
> for gxbb.
> 
> Fixes: 1b3f6d148692 ("ARM64: dts: meson-gx: add clock CLKID_RNG0 to hwrng node")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)


Here is a summary with links:
  - arm64: dts: meson: add missing gxl rng clock
    https://git.kernel.org/khilman/linux-amlogic/c/95ca6f06dd4827ff63be5154120c7a8511cd9a41

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
