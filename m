Return-Path: <SRS0=wHej=K4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC6C47092
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 00:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46FB0613B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 00:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46FB0613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EP0nFps2JBwDb92zlB8/P4MDPkBkx97RKYi51cKCbJ4=; b=y8u2kQyLhrnmOd
	yhraeW0jNKFIIihF7XZkB3EvYqnj5FVmTTa8tdq93vmw1hA7br/EjgtAm4NUfE269PQDqBb02l8i4
	AN2N4QpTYO171kqUTzMYkC64t2RNpfGn9P4xJE20kaRtqoBhJNDiukx8esfivLtJvjW2j2IbolpQm
	PNWibGMhYwX/lhukbzCyYIUX7448NsL+3x2JyznkcEduwrAPgeVcNdP8mg1CsnVQwg+ld9KUMYZhL
	UENw/7nryeqekQg2kbCWX9xUmBI8FMnJQtWN29gYOIlQ+KA9eKAr8e7cUgu9XiJ5/smUKMEZJ7mLb
	8LwPlSDDvaCK7g3LdvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loESk-001JYr-Qp; Wed, 02 Jun 2021 00:10:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loESW-001JVM-U8
 for linux-amlogic@lists.infradead.org; Wed, 02 Jun 2021 00:10:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C22C613F0;
 Wed,  2 Jun 2021 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622592608;
 bh=gAYHZWW4kwwHt2qK0ddcmhZfQ1JRKF6JQjlzU7JhLSM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=i+k1Ek1Uyg1nuCsvZUwMYO2UOX7tmbSvqA4J6QSyfFvGljMJS/oCQYxQ/VW9P7CEC
 328IcSU4ePrD05mLZ+Z9TtALpSIYFN1CO+1tdhVsAEM2FOfADADt9zroBgiMLUKDSq
 dZVprSPHXFUyrnSfBp3Aa++3dGbOAHT7tZpitbRzBSYRjegWZMmHoAnwLbcPlnlykY
 K8Kct0sA3QtL+Z7/uWoD6dMQRJ9vOZjV/DQRKXH58opGkI6ESmMj/kSkCEChHc+Gwq
 Qg/2i2iFfG3JxedVl4e2ZY9x4uwqc2WnMgEVJy2FEzpjYw5ZmzHSrcquLPISeFkc0e
 S0tBf6VraqQjA==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: mdio: Fix spelling mistakes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162259260843.22595.7591249584461639788.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jun 2021 00:10:08 +0000
References: <20210601141859.4131776-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210601141859.4131776-1-zhengyongjun3@huawei.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 kuba@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, narmstrong@baylibre.com,
 khilman@baylibre.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, opendmb@gmail.com, f.fainelli@gmail.com,
 linux@armlinux.org.uk, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_171009_011531_DD55D328 
X-CRM114-Status: UNSURE (   5.82  )
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 1 Jun 2021 22:18:59 +0800 you wrote:
> informations  ==> information
> typicaly  ==> typically
> derrive  ==> derive
> eventhough  ==> even though
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: mdio: Fix spelling mistakes
    https://git.kernel.org/netdev/net-next/c/e65c27938d8e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
