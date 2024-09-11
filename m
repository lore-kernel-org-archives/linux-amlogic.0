Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D11BEE01FA
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 02:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLPw1fWspnli4nshRDrr4x5cLIYFZ4OW/rjEz+hNpNQ=; b=R7Zd/HefzoQKsV
	AFndyR+zP6vuEMl1QbEY251n78k8sw0rB/NK0J6mHEtCOrsjw2mVbblRnX1Jprb2OTE09B3hXQSKz
	8S+OaG/FwQJ9av0WcfzRR6wm592D/wfkha0hI13ebiJrrNwBJ/PsmAjmSNrlpfs7bvAqyk0YfYT4T
	0eGV3BUUbKvavHXYx0xswm5w3nydny4Ge28DJig3Y9SD/dpK+CSptPhaROAsk0CHSs4wTfl78NDXr
	1d/KnTIPjuXNEHwWTRphNm407ViOGDBclolQUAQ7GU4BH6Pgz3y/uDdQ+PaQtU8r+TrOP8i+V2lTt
	3x04ULgohQyRuAGC+C8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soCoZ-00000007myA-0Krh;
	Wed, 11 Sep 2024 02:10:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soCoU-00000007mvb-05Kp;
	Wed, 11 Sep 2024 02:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82015A44255;
	Wed, 11 Sep 2024 02:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6CFC4CEC4;
	Wed, 11 Sep 2024 02:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726020632;
	bh=Ukvdmk6V9AkDsXn18d1wcBFwVU2wInYSavYgNP9N5v4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MJhxmXY5ACfTu9lK2dO6lJ12cvkv49jnbviNSg4Y/wPAJxz0MT9j7dHnp8KY4p0D1
	 wsJtvXAeupdL21TRCMVgaIPiKQQ72pMuw5b0vklKdaALjcVnskZveAbmp0+P9QVcMk
	 eYgyNOXFknJr02WbWl0RzEYwlaTWe5gJAoKqjfhlZofNMaQ/N5Bkedg2igpqnCvtvW
	 PFt7KNjONwxKHWl2iSybhQ5GQBmgns/GoNp6oKgKesTdN9YZUfVYiGGVh9jeCDY0ow
	 UzSt8tdLxIToQcPrgaAKFjFvMCFTb0lSgdw/dfdS1TqXhiDlS7fe+RysJmBgky9IPH
	 d5oy4avdJNCTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBB5A3822FA4;
	Wed, 11 Sep 2024 02:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: amlogic,meson-dwmac: Fix "amlogic,tx-delay-ns"
 schema
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172602063377.461532.17295023219958087443.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 02:10:33 +0000
References: <20240909172342.487675-2-robh@kernel.org>
In-Reply-To: <20240909172342.487675-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_191034_140090_EC8F2781 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Sep 2024 12:23:42 -0500 you wrote:
> The "amlogic,tx-delay-ns" property schema has unnecessary type reference
> as it's a standard unit suffix, and the constraints are in freeform
> text rather than schema.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Here is the summary with links:
  - [net-next] net: amlogic,meson-dwmac: Fix "amlogic,tx-delay-ns" schema
    https://git.kernel.org/netdev/net-next/c/955f5b150862

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
