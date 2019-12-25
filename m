Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DE3C2D0DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 15:09:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14BB72072A
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 15:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bx4/NrFZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zTEfMuOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14BB72072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTicEZ7ewc8TPFki6M9K+TvBBBdkS3Px3Ir0xrmR8P8=; b=Bx4/NrFZ+VI6HP
	HbNoHMcnrd26vPUTQTHMohsEdfY6xLaDBJYV7JcxJnOhQN2FWiTyt4BEiw7enDxtmQz7Eq+Pk89ea
	wTprr5qW8FSKJvhLelQUa8yHaWl/v+MR/gQNOcfqPS3i+Z91RKjDzWsr9VvwEGZHt+9+D2+SisUEu
	/wCWzlAfED1bC0a9B+3SorQc47FvY8hXUQ0HDCgAERxMkeUVVyiphLbZD4+XQZmJHvn1IY8cuE6Wf
	TbnVnNDR1Oc6uOjJcgJAb0A/btgkaoMs+BHs2DuiO1M8SR/ypehP2z9cAKzGVTFR51XhOkLmpNkaf
	UWqk9thQ52uaSm8o85IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ik8HW-0000j8-Np; Wed, 25 Dec 2019 15:09:02 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik8HT-0000ig-RQ; Wed, 25 Dec 2019 15:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQM1mPv2ronZJbcInLqrwGfsm7Z5m5AylYfzZgE2JXA=; b=zTEfMuOoUE9MwHB3sP2D4Xd29U
 B+ejTbVH8L+m+Y7bydqkF8Dm/oDIF0kTrd+TKU5JrmBdJkTJbF1cPtIa5qlI4XdJcYZcJR2eZKCfI
 NTTb5UzoFmrjvo0NuqfqIaHH1JhkSOviMTwD8hDle1tN/hewSV9OhQeSRTHZtCZwz6aw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1ik8HF-0004Zd-42; Wed, 25 Dec 2019 16:08:45 +0100
Date: Wed, 25 Dec 2019 16:08:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-meson8b: Fix the RGMII TX delay
 on Meson8b/8m2 SoCs
Message-ID: <20191225150845.GA16671@lunn.ch>
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
 <20191225005655.1502037-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191225005655.1502037-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191225_070859_887484_F74CA231 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: linus.luessing@c0d3.blue, balbes-150@yandex.ru, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, ingrassia@epigenesys.com, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Dec 25, 2019 at 01:56:53AM +0100, Martin Blumenstingl wrote:
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
> the following settings in Linux:
> - MPLL2 clock set to ~500MHz
> - m250_div set to 2
> - TX delay set to 2ns

Hi Martin

The delay will depend on the PHY, the value of phy-mode, and the PCB
layout.

https://ethernetfmc.com/rgmii-interface-timing-considerations/

RGMII requires a delay of 2ns between the data and the clock
signal. There are at least three ways this can happen.

1) The MAC adds the delay

2) The PCB adds the delay by making the clock line longer than the
data line.

3) The PHY adds the delay.

In linux you configure this using the phy-mode in DT.

      # RX and TX delays are added by the MAC when required
      - rgmii

      # RGMII with internal RX and TX delays provided by the PHY,
      # the MAC should not add the RX or TX delays in this case
      - rgmii-id

      # RGMII with internal RX delay provided by the PHY, the MAC
      # should not add an RX delay in this case
      - rgmii-rxid

      # RGMII with internal TX delay provided by the PHY, the MAC
      # should not add an TX delay in this case
      - rgmii-txid

So ideally, you want the MAC to add no delay at all, and then use the
correct phy-mode so the PHY adds the correct delay. This gives you the
most flexibility in terms of PHY and PCB design. This does however
require that the PHY implements the delay, which not all do.

Looking at patches 2 and 3, the phy-mode is set to rgmii. What you
might actually need to do is set this to rgmii-txid, or maybe
rgmii-id, once you have the MAC not inserting any delay.

With MAC/PHY issues, it is a good idea to Cc: the PHY maintainers.

	Andrew


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
