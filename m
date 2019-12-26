Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA501C2D0C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 21:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA843206CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 21:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rw5qZfh6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZTxVZbP8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA843206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OEYqkKb3+Cl16uFAZip63G7HlAZu+ciyuRR9OhRpok=; b=rw5qZfh6Gvyw97
	LdCBurRvGxq1fH7oFnIthstpebbQS51sfOWFQaW72vX+OlBnAwFBA4CBeY+PB7tmsc2X+myNqalmB
	NwhjHGCplxC/uQZuQSnaTItAcsWb1Vnzx3HCoTlBu/edc2DjKlNdUHN2g5maLmkS7TA2EBFm/alTS
	b0qqwkqYP24ZGVihzogKOgizWrj6F3Tko1MFzVC/FGfKYNCgTvUEfTaEE9Q5edjxwES1qv0zzB1SM
	W68btm/GJxb6KdI3RGMMhQPMoAvh/BYAN+RcvN9jV+Ynh7B98lgjh8ppjaMx47baoNoqO+eac36Ee
	+fNbOdNojEXvMT3qsr6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikanz-0007zn-DW; Thu, 26 Dec 2019 21:36:27 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikanw-0007z5-No; Thu, 26 Dec 2019 21:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bZoxgAannd2tkNNwwKV808Ug99KBWslN4hI308jxAhg=; b=ZTxVZbP8jHh4LUydfIbDacSml9
 p6f862RCdnk35tCi5JKeLOO+fJT/giHdSgS1id+hipPbF65+xyiR7b/hqkEhs15n15sqduE+4zPFP
 GnsJ3c5yflBU/GhXqC41Lr6fy1BdKK2kA2FLoIgAXAAFOwssipmQ4yHGNajKopjJNuFY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1ikanm-0000Ho-Fy; Thu, 26 Dec 2019 22:36:14 +0100
Date: Thu, 26 Dec 2019 22:36:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/1] net: stmmac: dwmac-meson8b: Fix the RGMII TX
 delay on Meson8b/8m2 SoCs
Message-ID: <20191226213614.GC32477@lunn.ch>
References: <20191226190101.3766479-1-martin.blumenstingl@googlemail.com>
 <20191226190101.3766479-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191226190101.3766479-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_133624_772536_BE91F483 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Dec 26, 2019 at 08:01:01PM +0100, Martin Blumenstingl wrote:
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
