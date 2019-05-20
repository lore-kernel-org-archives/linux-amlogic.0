Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00232C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F81205ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEp4+zlA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="d1TmZCCk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F81205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usgKmBOQl3N0Ph1EXveSjx555ikTgYms/BhK+bYJvp0=; b=WEp4+zlAkrVIJh
	wky7CuTvnOU/ULsZUKq9tqN7ylyVFdR9MstOHZAwxZQyBXbecsgrINNYYi4IjzvFju0M5EJJxzEph
	CyqdjtBhJj4zq+crPmktXxxBWsZu6BpPrpiqFLhLOyT7ntYEOi3+2BvSv6FO129a/4Yp3xNnj8AXp
	LnobDCD1I57ztRchD2MYRtdm1DfXwZN/AECVusNf8zXhQVx8EMLjqQgpn2DJe0nTHoVYaedmOLs3t
	+m0mJrNcyfzsneGCzx8Hzf4JyHdi5wLxv4VEktJ7tyGAT6liie/nS6QhDb+FKHhtXEGBqtKmM5U2G
	EL33qF4CXYUi+JkagpqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSnbR-0004a7-IS; Mon, 20 May 2019 19:05:41 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSnbO-0004Zf-T1
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 19:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hr/1iGRppucKUPs7Jd/NpqKBvJMNwEtcN7Vo/hR52/Y=; b=d1TmZCCktRBG0kT3B2zm851Rcq
 Oq8vGbMMGgpwEBZ9ZdSa5IHBD/v5MLv5h9tM6dI1VVWjQlDc5+N8VGv7b95g762H67pv4Xw0v0852
 hrkH2UWVrEPyYE7JTy1tlvY2fDG41ksB4Nyk7ShaeXNwLx6lYORQHCHkvryzT9ximM2M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hSnbJ-0002qk-7O; Mon, 20 May 2019 21:05:33 +0200
Date: Mon, 20 May 2019 21:05:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Message-ID: <20190520190533.GF22024@lunn.ch>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-4-jbrunet@baylibre.com>
 <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_120539_095970_384793DB 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, hkallweit1@gmail.com,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> > +                               int_mdio: mdio@1 {
> > +                                       reg = <1>;
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       internal_ephy: ethernet_phy@8 {
> > +                                               compatible = "ethernet-phy-id0180.3301",
> > +                                                            "ethernet-phy-ieee802.3-c22";
> Based on your comment on v1 of this patch [0] the Ethernet PHY ID is
> defined by this "mdio-multiplexer" (write arbitrary value to a
> register then that's the PHY ID which will show up on the bus)
> I'm fine with explicitly listing the ID which the PHY driver binds to
> because I don't know a better way.

Does reading the ID registers give the correct ID, once you have poked
registers in the mdio-multiplexer? If so, you don't need this
compatible string.

If the read is giving the wrong ID, then yes, you do want this. But
then please add a comment in the DT blob. This is very unusual, so
should have some explanation why it is needed.

Thanks
	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
