Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F656C05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE9OL2eO47l3PYfQ/shf6nyBvRbj5sehpPdc2yNl3O4=; b=pabsF8/oE4Y/Q4
	rZnjgo8P550jsGCfLnF27+J7tsAEiTRPF7swe2kXXDi+EvU3Ru7g5DOoaWnK4v085y9TDVH7vgT4l
	kv09rftYLoKYtwc6P89diAmqXGr7ZpszWm0fu6IgDwA1y4H7cNEAJUPlTkqoP3XtY5rbbAkn2Thmn
	qjVZGgYUPLk8NbybPfrazT1QBG5l9uewBEjKfSlAQE6k62S+mspS6X7jMw+5+tkJ1/SAyPtJ1zn4I
	yPREQl3RJKxo5K3HpUnIVBq4zTapEg/sQNJMg1xXaDky6kc64l90rFOx9tZ+XrqCmVwc/6DjaruH+
	5YUbIV9B1Aa2uguufmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMAuj-001jir-TB; Sun, 29 Jan 2023 16:52:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMAuX-001jfp-DU; Sun, 29 Jan 2023 16:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=loe6zYoEnP/MUhESYQA4cmRuiS4ozpW2WWxXFcKEAC0=; b=6FxHhcpkpDR5txGRZKHeS2LSi5
	kiGxT8C2VWCYMp3XeU6S23uLB7TU/+qdGDqAIYoxgePlfcFHXPlj1QCRI3GK/DeRM6OSM+QVWct/K
	fw+iEC0AqgtAZyrxmmQMNGvqatDbbxKq/WCSQd8ovtQMtl/+foUVCQVeaSA4NfayQywg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pMAuL-003Vri-Si; Sun, 29 Jan 2023 17:51:57 +0100
Date: Sun, 29 Jan 2023 17:51:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Healy <cphealy@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	jeremy.wang@amlogic.com, Chris Healy <healych@amazon.com>
Subject: Re: [PATCH 1/1] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
Message-ID: <Y9akLWJfigajMuQP@lunn.ch>
References: <20230129022615.379711-1-cphealy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129022615.379711-1-cphealy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_085209_495724_CCAB0FD0 
X-CRM114-Status: GOOD (  10.68  )
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

On Sat, Jan 28, 2023 at 06:26:15PM -0800, Chris Healy wrote:
> From: Chris Healy <healych@amazon.com>
> 
> The Meson G12A Internal PHY does not support standard IEEE MMD extended
> register access, therefore add generic dummy stubs to fail the read and
> write MMD calls. This is necessary to prevent the core PHY code from
> erroneously believing that EEE is supported by this PHY even though this
> PHY does not support EEE, as MMD register access returns all FFFFs.

Hi Chris

This change in itself makes sense. But i wounder if we should also
change phy_init_eee(). It reads the EEE Ability register. The 2018
version of the standard indicates the top two bits are reserved and
should be zero. We also don't have any PHY which supports 100GBase-R
through to 100Base-TX. So a read of 0xffff suggests the PHY does not
support EEE and returning -EPROTONOSUPPORT would be good.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
