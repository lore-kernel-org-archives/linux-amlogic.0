Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4F8C433E3
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F87420720
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdYO6pyV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dt7CJ0ba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F87420720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J+43kKPQWjAQqGaLolqDbZGuZO9rmWYE8nsFuqSasak=; b=QdYO6pyVdfB5XbpYk5uYmmgM0
	RkWMwgg1O0VMAHHM0zRFiiCJd9ucso51Otdxl1T5sKuqQ+NL+BV0tlXKXVKAfqOKyDhluc8mKV/HE
	EGDSfjDym/BE06VSsxYfj5FnouBWDlssW+UpfWhVEuymTqiRJmifguWVSupa34BjXZkZZFbn5XdwP
	9FC1TO0mTRu2s1CHDP2/Ovefrpuj5R1r09E0DVyWoolylRaGzIuC2Q7y0YWdILJmpiHxZBax2ujBE
	5ktTtB9taqznOtwrGZJETd1S/8pUsbX2vvYyGIbNQjFUVc6/jHYAyEdBEZPN3VNxMpz43shggw2dA
	kiQ3U3MrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssga-0003LV-Ac; Tue, 07 Jul 2020 18:51:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgS-0003Fv-Hn
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147871;
 bh=fNpZ5PV8K4nt+/2wBAzlWk3CL2BwpKS3Ack4poqMzSY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=dt7CJ0bay0DRyO1sGHXSccJpyz5nPjR63pZFj5WoM+l/DIBC63aJdbGhsasWH6wox
 sPSYpf9AVUzLo2yVcxCBYF5Cp7zeEjcYbclBMP+nDkRgfr+eP0fHSkUKyL9Q4FL6vg
 iTIPckaou8omCpJGsZDjOD7Ex0r1ZS2sTvoNrtqE=
MIME-Version: 1.0
Subject: Re: [PATCH v2] soc: amlogic: meson-gx-socinfo: Fix S905X3 and S905D3
 ID's
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787147.3387.754139708922968561.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:11 +0000
References: <20200609081318.28023-1-christianshewitt@gmail.com>
In-Reply-To: <20200609081318.28023-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145112_675684_5C986C19 
X-CRM114-Status: UNSURE (   4.24  )
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

On Tue,  9 Jun 2020 08:13:18 +0000 you wrote:
> Correct the SoC revision and package bits/mask values for S905D3/X3 to detect
> a wider range of observed SoC IDs, and tweak sort order for A311D/S922X.
> 
> S905X3 05 0000 0101  (SEI610 initial devices)
> S905X3 10 0001 0000  (ODROID-C4 and recent Android boxes)
> S905X3 50 0101 0000  (SEI610 later revisions)
> S905D3 04 0000 0100  (VIM3L devices in kernelci)
> S905D3 b0 1011 0000  (VIM3L initial production)
> 
> [...]


Here is a summary with links:
  - [v2] soc: amlogic: meson-gx-socinfo: Fix S905X3 and S905D3 ID's
    https://git.kernel.org/khilman/linux-amlogic/c/d16d0481e6bab5a916450e4ef0e1c958b550880c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
