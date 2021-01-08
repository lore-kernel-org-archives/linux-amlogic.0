Return-Path: <SRS0=c83m=GL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3151C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Jan 2021 00:10:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D06236F9
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Jan 2021 00:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D06236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vFUhFEPYFoi8MqMQ5Xn3VMdNZiyPH40hS17pAk2U0JM=; b=KsUxfesanqudTAYVcpxW9edXw
	Y/n3rrIxd6tmi0Zoa2wjvE7CKzjZ3Y3BiMs7cFSWZYv79lxpB3i2ReSFIZfDidSzZvjNkSi+K/cwV
	AsHORMzEm6WNkxEotKEp+Gmsn6RtGuP59WuQiOTJqUS3NrOJLrwqsb9pPZmRFesociv0DBYBMqne5
	5FoopnaEKsnq/jNMMWh4tL/o3SYz13rJEGYyw+7/mQmztQ+AFVOgY7sdubxYQG9vHAfjCZIssYJZC
	pG5j4XCIAxoy+UxdETVJ3VVoMlNzQVEuahbKdk1Ztkyll2LJK3XuswiPVUz+ylLOS62127Sxn7Gan
	+FxSrm9mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxfM6-0002nl-Jp; Fri, 08 Jan 2021 00:10:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxfM3-0002ms-Bi; Fri, 08 Jan 2021 00:10:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 489F02368A;
 Fri,  8 Jan 2021 00:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610064609;
 bh=/bl+dbUQLW5CaBdvmpIzjWmsxh0p83ugF1Vo+dLtI4U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uWzA7PeycjLb4035QydEmCtOyAkyifDY/SsgqIUFsomS6J7UBqdsVuhT7C3Ddj5tR
 yY4gKO/61/At/fOU2qBQh5pD8nFZm4ERxwL54dFGACjsk2oRISOpXicVvVAPImBEvc
 H71k+VFK4S4nG8LnFBvf9yt1gV+byg5WD/iiCZfRjsRAY8aI5Ge4AAL007OIqsO05A
 ApUt982gsAZYSALR6kYs/ov7Etpc3uzON+g8PGbt+ZrDnTBKSYOfNIsqzoOJ9HGphp
 0VH8jrPkOttw9p+a7+eLmRW8Xl0uEOpG7rsWMikL6yZeiLz2hZAidvMKwfoCIMm4BL
 6vF0kUunGfpOg==
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] dwmac-meson8b: picosecond precision RX delay
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161006460922.17100.14707302007622685350.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jan 2021 00:10:09 +0000
References: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20210106134251.45264-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_191011_492825_BFE2404C 
X-CRM114-Status: UNSURE (   8.94  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 andrew@lunn.ch, netdev@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, khilman@baylibre.com,
 kuba@kernel.org, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Wed,  6 Jan 2021 14:42:46 +0100 you wrote:
> Hello,
> 
> with the help of Jianxin Pan (many thanks!) the meaning of the "new"
> PRG_ETH1[19:16] register bits on Amlogic Meson G12A, G12B and SM1 SoCs
> are finally known. These SoCs allow fine-tuning the RGMII RX delay in
> 200ps steps (contrary to what I have thought in the past [0] these are
> not some "calibration" values).
> 
> [...]

Here is the summary with links:
  - [v4,1/5] dt-bindings: net: dwmac-meson: use picoseconds for the RGMII RX delay
    https://git.kernel.org/netdev/net-next/c/6b5903f58df4
  - [v4,2/5] net: stmmac: dwmac-meson8b: fix enabling the timing-adjustment clock
    https://git.kernel.org/netdev/net-next/c/025822884a4f
  - [v4,3/5] net: stmmac: dwmac-meson8b: use picoseconds for the RGMII RX delay
    https://git.kernel.org/netdev/net-next/c/140ddf0633df
  - [v4,4/5] net: stmmac: dwmac-meson8b: move RGMII delays into a separate function
    https://git.kernel.org/netdev/net-next/c/7985244d10ea
  - [v4,5/5] net: stmmac: dwmac-meson8b: add support for the RGMII RX delay on G12A
    https://git.kernel.org/netdev/net-next/c/de94fc104d58

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
