Return-Path: <SRS0=5IjM=GY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86251C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Jan 2021 06:20:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1619F238EE
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Jan 2021 06:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1619F238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9jIDXa6F93BeWANmeWO1qH9C6WT7ILGtAJ5Yc32NxfE=; b=NAzDs673ZU2Y6a7fJjQeCzGLZ
	bxkyryprT6qQfpXd2Y+1ELCWah350ATMPC05aE+yUxVrg0MWEu/JBQP6C1NxokG+8e6rL5o2QzXQ4
	FfENFTBKaIH8DeJry1oYgAnKuat9luBmpvgoXtqmiHyBcA2ONlSH0WHVPVNJ7Yzk0SKO2SCFH0061
	2ehvAoutiWoXnWePYboKoJD67EqU+owNM3LwD7j0H68BB6GMv8Xq/11f4k+k89b85d3EKDKXQMFmw
	j98kTitdO+CBa3YlufdBmOHfYgHghvKP3R3U5aRqVqDbL7gzlj3Tmv1/7LpYKTgVCQHbyKLDvY6WM
	auLlMTnpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TKH-00020A-Vx; Thu, 21 Jan 2021 06:20:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TKE-0001yh-E2; Thu, 21 Jan 2021 06:20:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id ACDFD2396D;
 Thu, 21 Jan 2021 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611210008;
 bh=3OUlOwnyM/Lq6dcSDU7VFLAgwB1L2BEv2nrFHtIfGZI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gmkaysQdC+C8KtxfnWCiL2l1hwazNyxA0OR4MXtwUbkKsDwt8HFJt7qqyMhqsA21m
 Co+mJDRLp/cpuhF8jjEhJImipHZ04+ocPkEl+ALKr6yYCvkgzDt4L7Gvqnvml8tGPw
 RntRHXrv+hcH+bFN1+ZlD0OtZisD1gip1VEewKcLUzRQrpvznrmezLzPD9BIOSl0AS
 +zgBGLkh5VBugmE8sTD3CyHnmYRmspReCGGYa7lLGKB4b9iPQwlPTHvgdhkuQtF7Nz
 yO9BUqkZrE/CWYTwDpiAAnnZhVzET3QdbjvQkf+Nzg3oq+q5L101IdWTALM8IAvnLI
 e5bVBLDm0o9Bg==
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: fix the RX delay validation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161121000864.22302.2434343187659178869.git-patchwork-notify@kernel.org>
Date: Thu, 21 Jan 2021 06:20:08 +0000
References: <20210119202424.591349-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20210119202424.591349-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_012010_572049_0184EFEE 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, martijn@martijnvandeventer.nl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 19 Jan 2021 21:24:24 +0100 you wrote:
> When has_prg_eth1_rgmii_rx_delay is true then we support RX delays
> between 0ps and 3000ps in 200ps steps. Swap the validation of the RX
> delay based on the has_prg_eth1_rgmii_rx_delay flag so the 200ps check
> is now applied correctly on G12A SoCs (instead of only allow 0ps or
> 2000ps on G12A, but 0..3000ps in 200ps steps on older SoCs which don't
> support that).
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-meson8b: fix the RX delay validation
    https://git.kernel.org/netdev/net-next/c/9e8789c85dee

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
