Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735DC3DA78
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC5MsPriE3xsT0uF/FyrdL7qhrFtyg/2AkHvRMQcIqs=; b=qX5MRueflNCCKj
	cl3IQbYZSrFhijE0TvWVDAcMR5Qt3zROr83gfPHMRtX9R+VR3jas49EZ/zyJ2fE9QFQ2483iLsEX7
	IrluYzGQxaxx+yMH+BQVEiCzeEZu/yS4AbNKfUyFr+3qDxHEfLebgUZBJyRDVGcIkfbdX6oYj6s0y
	G5vn2YBBYoSGeSgtKDLPxvhQz3h+tct5GlVzfzc9h4VpHayMou42whm5CSQnG7By69H1r2nXEgtRY
	NgJVmtU3hyuj3EG53ITga7k6sCe+tSrcaKRLuZ92W2B0305RAyLFVEmL9iPv/3nKzlVZ6Zp6e1+ZE
	0XZYfmEpBsJ3GPVHvMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHm3g-00EMyj-OK; Tue, 17 Jan 2023 13:31:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHm2s-00EMbj-Jp; Tue, 17 Jan 2023 13:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1wIVZSVUgTUedV2LQo9/FHDRbS3j1hP9CCyFacP4Lu0=; b=mZQbWh0YsZcChCYJOyOVHzBOmN
	QV1tP2wkYK8wpRRzlXwWKJMTwxlRLSyR3Hn4PpnwpEhU5Jb9Lw/yGDwq63BG+UQFbGmuo80vOvC60
	Ny3PIdAfGTFx6mMFT794GGZYqTvGf858VSB/B2zTp4PWOorGQegTqPp9lx3t9k4JJAvQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pHm2d-002KAi-AQ; Tue, 17 Jan 2023 14:30:19 +0100
Date: Tue, 17 Jan 2023 14:30:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
Message-ID: <Y8ai6+oaaP0KwkAY@lunn.ch>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch>
 <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <699f6ee109b3a72b2b377f42a78705f47d4a77b9.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <699f6ee109b3a72b2b377f42a78705f47d4a77b9.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_053034_688465_1992C27B 
X-CRM114-Status: GOOD (  13.01  )
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

> > The PHY compatible string in DT is the following in all cases:
> > compatible = "ethernet-phy-id0180.3301"

This form of compatible has two purposes.

1) You cannot read the PHY ID register during MDIO bus enumeration,
generally because you need to turn on GPIOs, clocks, regulators etc,
which the MDIO/PHY core does not know how to do.

2) The PHY has bad values in its ID registers, typically because the
manufactures messed up.

If you have a compatible like this, the ID registers are totally
ignored by Linux, and the ID is used to find the driver and tell the
driver exactly which of the multiple devices it supports it should
assume the device is.

So you should use this from of compatible with care. You can easily
end up thinking you have a different PHY to what you actually have,
which could then result in wrong erratas being applied etc, or even
the wrong driver being used.

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
