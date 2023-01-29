Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC12C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hncdPH6xDPKp8k/nlbWVFppwXBQ9SoGfDTeQtg+RNjM=; b=GPHAfYieYs+++Z
	wk+w9vbX22kQNCeGed6uKH44ppBHL9msi8/ZkTOvjzUlFjGRN5kQCHL1jcnptK7gUWTqDuUVoPOr5
	Zhurwkf/jLVihgklAdEGKFFS+4CeC+BV+EQV84JZIuivfYled7wYiftrmdxOlQM9bzyojkpgEuK8X
	gRMvvZdDH+bM2YFYn25kYLRTLTvf0KakG2Kt5xCW3jRV2bRKt9N9uXE4ISmUYw/o+rKTrJq5lmuvf
	RGrku++acTA3fteCKJ5R+KnFULbQdXaBb/I8ITreulcAUjVmqCGwM6qYXHuBs7katH4bNLYRc7p+g
	jif6DnLfYRsqcq+VRg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaRH-005Irq-8H; Mon, 30 Jan 2023 20:07:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaR7-005IpG-VW; Mon, 30 Jan 2023 20:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CaFo3H1tDG5YMgySek3qKOsvTMfAin67h2iUOrGlz8g=; b=Ocd0SaNFGsfZGGoHBAo1mdzCav
	Mxo6YPvr2k/+ppiM5Etm2zCw3OhXgmVDX7QySK8WzYbk/QjslHjzwrT0txwLUCmUJCv7vJHJZQ1LD
	UsN9Ia9j+uXifwZXt43mE3UNyydOYXgi7hYI3HK8V3KpbmdmVZqLRFwW5ADEEvXkwsCbCZNZwt/dw
	uSXwZPFOdywGGV7I64hJo0vMhXqvqAQhacNPMtlFGmtqFhdKWfDP1afDQDk4yhchv3+1gm7FAwhvJ
	xA0j3bV/i/vZ8TRkyTmK1FTpr5v5CIHe2W5P+jvtFDd1el++JHxlsGhNtvYTnT+YegBljX7v5TxCp
	cLC++AcA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMaR2-00AeAB-TB; Mon, 30 Jan 2023 20:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CaFo3H1tDG5YMgySek3qKOsvTMfAin67h2iUOrGlz8g=; b=UXuuezEkqZE1PX2b3wGWaWB6dR
	gFrCYpHGFUAWuB1iqKBbxt4B449orPwnFIpoQ0SymV1bjX1OV5zgMw1B2iUQqmEEbBpcap1E+0UwI
	Kbl5orR6eLG+Q3zvR7SSxjpV4WfMkJGlEAn962BEtov1wBq08FyjrrWef+iDsAt2Pq9Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pMFbx-003WTb-Vf; Sun, 29 Jan 2023 22:53:17 +0100
Date: Sun, 29 Jan 2023 22:53:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Healy <cphealy@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	jeremy.wang@amlogic.com, Chris Healy <healych@amazon.com>
Subject: Re: [PATCH 1/1] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
Message-ID: <Y9bqzZw4z6JWGeI6@lunn.ch>
References: <20230129022615.379711-1-cphealy@gmail.com>
 <Y9akLWJfigajMuQP@lunn.ch>
 <CAFXsbZppb5tDxR9tO7RN76=rt04MdAUU16HhyNizJBtAXtq+fg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFXsbZppb5tDxR9tO7RN76=rt04MdAUU16HhyNizJBtAXtq+fg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_200725_550101_F14B879D 
X-CRM114-Status: GOOD (  12.02  )
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

> > Hi Chris
> >
> > This change in itself makes sense. But i wounder if we should also
> > change phy_init_eee(). It reads the EEE Ability register. The 2018
> > version of the standard indicates the top two bits are reserved and
> > should be zero. We also don't have any PHY which supports 100GBase-R
> > through to 100Base-TX. So a read of 0xffff suggests the PHY does not
> > support EEE and returning -EPROTONOSUPPORT would be good.
> >
> This seems like a good change to make in phy_init_eee().  I should be
> able to do this.  Can this be done in a subsequent patch or does this
> need to be present to land this meson specific PHY patch?

They are independent, submit them in whatever order you want. But
doing it first will make it easier to test it actually works.

      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
