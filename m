Return-Path: <SRS0=7SbI=RU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA49C4360F
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2019 15:48:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD6921738
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2019 15:48:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ub6NTlXO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="otd8Jp2T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD6921738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEVos+Ch1Kej5lK4TUhFiPyAn+MPgz9qVeqETctQMAY=; b=ub6NTlXOEQRdFQ
	1hb2bEsGW/qs7tNnMLYjeoE4FHw/ugVS5zg4vPVo8fe72lz1NHnfcU5n+c/mTEf9HSoSM9SQ2kfgp
	szABGAqYtNFLxJ8ZkVxkZW/QUrnFGmtmeeG3GRssUvLI/rAYrVWVmGKw8C2LnLBB5IEVsFPf0HTJ0
	09jQHp+4yyzC1gy62NYt13H5zgTH5+T3yPh6VTwOkYqcoamIYKYJ0BgvxklWyL2HyQZ6reooyRcns
	VOuf/2CF6eu0Q5UKD+z+mIkxuO0ZPO+r69R05SNzaidW9+POAwF5NTkhu0YlTyC55Nu/uEdN7rodF
	vqPaaxG+0E5hPQWCZXtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5Y1W-0007Q3-Pc; Sun, 17 Mar 2019 15:48:30 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5Y1T-0007PI-Sv
 for linux-amlogic@lists.infradead.org; Sun, 17 Mar 2019 15:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tBIhQIi4ZTn01iZjkTLI+q7SovrG/d/r+dxu3j6bFWw=; b=otd8Jp2TWzGB0l0rUPiUMNr8Pi
 nkIAfy4eUKD8g3qd96ZYrX9WSDdiEg00NlzQidopMRH+uTkADGPU2IZxKf71wy2NbRuqUZvVigM9R
 vGr9AdB3tgUzVNj3eMCqOIvBfEXSGG8k/MzmgXcEs5I3a7fm846hnAjsgN+xW3cT2kPU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1h5Y1N-0005y3-B5; Sun, 17 Mar 2019 16:48:21 +0100
Date: Sun, 17 Mar 2019 16:48:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Message-ID: <20190317154821.GA22226@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
 <20190316025448.GD29548@lunn.ch>
 <13432d537f671c8065693b7e53348f812e8bbc04.camel@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13432d537f671c8065693b7e53348f812e8bbc04.camel@baylibre.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190317_084828_083057_60F1DB64 
X-CRM114-Status: GOOD (  16.67  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Mar 16, 2019 at 06:02:45PM +0100, Jerome Brunet wrote:
> On Sat, 2019-03-16 at 03:54 +0100, Andrew Lunn wrote:
> > On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
> > > > +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
> > 
> > You would generally use the _ prefix when you have a locked and an
> > unlocked version. I don't see anything like this here. So please drop
> > the _ .
> > 
> 
> will do
> 
> > Nice to see the generic clock framework being used. I just wonder if
> > this is the correct place to have this clock code. Can it be made part
> > of the SoC clock code?
> 
> the PLL is local to this particular device.
> 
> In 'Soc clock code' (driver/clk/meson in this case) we usually put clock
> controllers. Those controllers feeds the different devices of the SoC but we
> tends some more clock elements in the consumer device
> 
> Usually, it is just a few mux, dividers and gates (like in
> drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c) but in this case, we have
> a PLL. IMO, it belongs here. Do you see a problem with this ?

Hi Jerome

Some maintainers like to have code in their directory structure. It
would be good to check that the clock maintainer in happy with clock
code under the network driver subtree. Also, the clock maintainer
should also review this code. So please at least Cc: the clock
maintainer and clock list on the next submission, as well as netdev. I
personally don't know the clock code well enough to review such code.

	   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
