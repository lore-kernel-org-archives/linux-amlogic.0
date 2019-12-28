Return-Path: <SRS0=KhJ2=2S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA36FC2D0C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2019 00:38:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF7B207E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Dec 2019 00:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UPV7toAp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF7B207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XZP+DOCf2DBmCrmM76icy0Umf+PFQDSvoCiJSKBZmc=; b=UPV7toAp3qeqss
	e4XDJHxcAPa5lFWn7c27xM99cTHxhCo2dxoZwQ/GI4ri6DouY6qsM4Wp5F5fVJpo4FQKJmieBnWn8
	CIFz1ChRWH+jsIQSWxdN3/XS6GOCVFruIku6Hs/fD2gSHDC95dmF85ily+sHCmrFF8XQ37UzK0vVc
	RWP36jhnVg/puhyrkCBpmb9AcBzzdk2L37DJXx3H0JxOgGF63VRsHoV69z1SagS86YjmzB8u3es0I
	SKhSWoQqk/aIxHpSdUafQURbHEYsh6A/1dQNh6c83/LGiLRWF2QAj2R96htfSwx1I1Rxtma0zfppV
	OB8/1ZYW8YLhAYvAwcrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1il07C-0002Du-4m; Sat, 28 Dec 2019 00:37:58 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1il078-0002DS-DC; Sat, 28 Dec 2019 00:37:55 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 02E0C154D18D0;
 Fri, 27 Dec 2019 16:37:53 -0800 (PST)
Date: Fri, 27 Dec 2019 16:37:53 -0800 (PST)
Message-Id: <20191227.163753.1973785313910356084.davem@davemloft.net>
To: martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v2 1/1] net: stmmac: dwmac-meson8b: Fix the RGMII TX
 delay on Meson8b/8m2 SoCs
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191226190101.3766479-2-martin.blumenstingl@googlemail.com>
References: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
 <20191226190101.3766479-2-martin.blumenstingl@googlemail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 27 Dec 2019 16:37:54 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_163754_448933_0C3EA367 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Dec 2019 20:01:01 +0100

> GXBB and newer SoCs use the fixed FCLK_DIV2 (1GHz) clock as input for
> the m250_sel clock. Meson8b and Meson8m2 use MPLL2 instead, whose rate
> can be adjusted at runtime.
> 
> So far we have been running MPLL2 with ~250MHz (and the internal
> m250_div with value 1), which worked enough that we could transfer data
> with an TX delay of 4ns. Unfortunately there is high packet loss with
> an RGMII PHY when transferring data (receiving data works fine though).
> Odroid-C1's u-boot is running with a TX delay of only 2ns as well as
> the internal m250_div set to 2 - no lost (TX) packets can be observed
> with that setting in u-boot.
> 
> Manual testing has shown that the TX packet loss goes away when using
> the following settings in Linux (the vendor kernel uses the same
> settings):
> - MPLL2 clock set to ~500MHz
> - m250_div set to 2
> - TX delay set to 2ns on the MAC side
> 
> Update the m250_div divider settings to only accept dividers greater or
> equal 2 to fix the TX delay generated by the MAC.
> 
> iperf3 results before the change:
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec   182 MBytes   153 Mbits/sec  514      sender
> [  5]   0.00-10.00  sec   182 MBytes   152 Mbits/sec           receiver
> 
> iperf3 results after the change (including an updated TX delay of 2ns):
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-10.00  sec   927 MBytes   778 Mbits/sec    0      sender
> [  5]   0.00-10.01  sec   927 MBytes   777 Mbits/sec           receiver
> 
> Fixes: 4f6a71b84e1afd ("net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied and queued up for -stable, thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
