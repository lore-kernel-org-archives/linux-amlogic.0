Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11229C47409
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DEA20721
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 18:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ARMWYQ9k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="llAxTV4c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DEA20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kx8nwl5Epe8MyYuk63gjeJLGkIBgSyAIyXGOgSN3j1Y=; b=ARMWYQ9keVx7Cl
	n4cJMuKta8c8dc7g+g0spOD01uD/GGNv4nMst66BhEMSOXuBDZDS4jAgMKB+T+F0FBMklTdMch5oV
	nokxMkF2UfoudS2Sy/JszJTAuMEvp89qNCTAzKQAxvyTlBmwqaG8wEFytjRbNhg0VxE0kfHHARPbd
	NnR3BZXMwPFQWCBDPWkS5dWNwHjFUUnA5cm28uUIkHNDNlJaNVresOSOFvKMs1Cun8KJ/Qv+HO7fg
	mpc9NzwjLIxyD7FVT7pMgTXWmxY3v030gSxvWiTxw00AK55ZpGx+tEBuhgc5tZsbBd6ACTnWFKvWm
	wvAbrh7HgmoJFMSQf7MQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipcQd-0000Ky-Kt; Thu, 09 Jan 2020 18:21:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipcQY-0000Em-TU
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 18:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578594062;
 bh=xlUaB/0WF0BeqNoBVlEoULjiNkFzxy4OF8hM+Z/jE9U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=llAxTV4csA9RjLaIS9en2QTfsjgGwtYW33PnmmntbXqvtBT1az0Yq5iieX827u68s
 rkX1++OvP1zFYDzSoGYAgyBEk8UoLiiDO0G1Q8F+jIbEO3qLQSlOv4oLhoCkYIczSn
 qQ1UpTkOKSSvt9ocaA+36R/j8BT/i+z183TKrSWM=
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/1] dwmac-meson8b: Ethernet RGMII TX delay fix
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157859406229.9795.1671891616013155203.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2020 18:21:02 +0000
References: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_102102_996048_5112E667 
X-CRM114-Status: UNSURE (   6.97  )
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

On Thu, 26 Dec 2019 20:01:00 +0100 you wrote:
> The Ethernet TX performance has been historically bad on Meson8b and
> Meson8m2 SoCs because high packet loss was seen. Today I (presumably)
> found out why this is: the input clock (which feeds the RGMII TX clock)
> has to be at least 4 times 125MHz. With the fixed "divide by 2" in the
> clock tree this means that m250_div needs to be at least 2.
> 
> With this patch and a 2ns TX delay generated by either the MAC *or* the
> PHY this results in improved Ethernet TX performance and no packet loss
> anymore:
> # iperf3 -c 192.168.1.100
> Connecting to host 192.168.1.100, port 5201
> [  5] local 192.168.1.163 port 42636 connected to 192.168.1.100 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   105 MBytes   878 Mbits/sec    0    609 KBytes
> [  5]   1.00-2.00   sec   106 MBytes   885 Mbits/sec    0    683 KBytes
> [  5]   2.00-3.09   sec  73.7 MBytes   570 Mbits/sec    0    683 KBytes
> [  5]   3.09-4.00   sec  81.9 MBytes   754 Mbits/sec    0    795 KBytes
> [  5]   4.00-5.00   sec   104 MBytes   869 Mbits/sec    0    877 KBytes
> [  5]   5.00-6.00   sec   105 MBytes   878 Mbits/sec    0    877 KBytes
> [  5]   6.00-7.00   sec  68.0 MBytes   571 Mbits/sec    0    877 KBytes
> [  5]   7.00-8.00   sec  80.7 MBytes   676 Mbits/sec    0    877 KBytes
> [  5]   8.00-9.01   sec   102 MBytes   853 Mbits/sec    0    877 KBytes
> [  5]   9.01-10.00  sec   101 MBytes   859 Mbits/sec    0    877 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec   927 MBytes   778 Mbits/sec    0             sender
> [  5]   0.00-10.01  sec   927 MBytes   777 Mbits/sec                  receiver
> 
> [...]


Here is a summary with links:
  - [v2,1/1] net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs
    https://git.kernel.org/khilman/linux-amlogic/c/bd6f48546b9cb7a785344fc78058c420923d7ed8

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
