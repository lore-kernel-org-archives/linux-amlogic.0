Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F79C38142
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 05:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpKtAvnVnbsdSjxGxbxlai4ScafoKON2OHnnIVuZvvg=; b=OQegWt2qoRvY1S
	Z7qDTQZoro4CxiIj0Oi3j6PB8zJrRR+/FNcZMF1ltgWq1llrY5jtz2BjQjN025A6zICemaGObxtnA
	otmA+KYL/HIeMMcI3DtFE7xPbvonkgqHb+7dGgtcJj/IJAi88IJWpb+iP7f+4GHQ5uzA7gWIUMMzb
	yXVjgLdB6P5FJPdB+otF6uJadQGWmU/T0X7LlCwj25uHJq6GwdwcoZmBOYP4ZQUBfDIC4GYCpnakQ
	gBX4N66AtctvS8u8aWupBWDrxhxjzsSb6Lqj+JsD8Nin3TaV4/38GPhTLfIOyoaPjPZo0QhGmREvz
	J3PwB4odEKuHi/cY3wLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5Xk-00AHSq-OH; Wed, 01 Feb 2023 05:20:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5Xh-00AHRd-T5; Wed, 01 Feb 2023 05:20:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD7576109A;
	Wed,  1 Feb 2023 05:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A351C4339B;
	Wed,  1 Feb 2023 05:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675228818;
	bh=SNDkwvktwMB6hGwtfdb89+BZQ5kt9sv25XcqeIWOYl8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k0wFyiC/Vr0bqslGZf1/s8ReGxrsVweGwva2KgbhJmqhLixc93eJ3fCTGFwWlgqtv
	 f1oVBSf1mXbj9ysle6yMWdkmTW1mmcXcFmXMKangPmM2OyqMm8qwRejIC7LXFLZaUf
	 1v6rIp+UEI7TLG/PnkRcQL0+XkpPUDhQ367Xudbobcs3DceCpcktO68DQVUrRvXf42
	 SbnWLjwUO+vp4S9T7ZIvZ0/FEKJhTSDlAoexT2lwnMPvhTu94H9ZG1va9QSYB2em79
	 LXUTuS4T/cJloqJrIYTpvDx2GgvIE0FPLY756MDRAyiy84Jx0y5bv6C16CVqaFhtcc
	 FQl/steRYy0pg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0A98EE270CC;
	Wed,  1 Feb 2023 05:20:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167522881803.32169.10037943725132569260.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 05:20:18 +0000
References: <20230130231402.471493-1-cphealy@gmail.com>
In-Reply-To: <20230130231402.471493-1-cphealy@gmail.com>
To: Chris Healy <cphealy@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, neil.armstrong@linaro.org, khilman@baylibre.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jeremy.wang@amlogic.com, healych@amazon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_212021_991677_F4E69D34 
X-CRM114-Status: GOOD (  11.84  )
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

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 30 Jan 2023 15:14:02 -0800 you wrote:
> From: Chris Healy <healych@amazon.com>
> 
> The Meson G12A Internal PHY does not support standard IEEE MMD extended
> register access, therefore add generic dummy stubs to fail the read and
> write MMD calls. This is necessary to prevent the core PHY code from
> erroneously believing that EEE is supported by this PHY even though this
> PHY does not support EEE, as MMD register access returns all FFFFs.
> 
> [...]

Here is the summary with links:
  - [v3] net: phy: meson-gxl: Add generic dummy stubs for MMD register access
    https://git.kernel.org/netdev/net/c/afc2336f89dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
