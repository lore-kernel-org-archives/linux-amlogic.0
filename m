Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC55C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 19:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F4D6120C
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 19:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35F4D6120C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F216nRw9MhDrBVA8QQOCCRroQYN664VpuS0gYOzbCBE=; b=lvqBL7xbiX7k9y
	C+gU/MPncTzbCVpqeObD6MP3tOwuWt4C79g/6qHD7SpQJtyLodYhMuul/GvSHN+Dc7zFv5S41tzlE
	1FPBvTvs/5HO6i06QQ6oN3UjmQHzd/h7RASp6KJ8vBKvrJG7inCb+EuW2FmcRgdvcgx/1CFr6KrY/
	NxUWfPq9BRku3XCgiY6Z1tD3OCdR/CQrD4Nc1QLefmimxunDsdnYJ5q3PbdVkDy5DiO94mKS8tc8l
	CXYtLzQD7PJxvDPjNYi9IDR/6x4kRSMekEXKC/S74ALaIMryyNa8+2AipiHRiStrQJTUn43bR8C0p
	jJPBW7DAuThJTVXv9lUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIG5T-000Uda-4c; Mon, 23 Aug 2021 19:58:27 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIG5N-000Ucn-Er
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 19:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GpyOlPjzkVman/xz6U9nRO0hrxXvVycp3ftxTY9a7NE=; b=KA2u/854Aag+RH3uz7vKq/MMSv
 rhyn0HsPvD6jQ6R5qbpNU6feqBmdpCE/utd3Fc7QUNTfasXY0+S7AlD/IIekWVdh6W5e78QKCcXs5
 Xu26CuvkmjF6Wgw5ClUibFJqPzx+oZfVEMPYP1AFibW7pdv9ehRX/7KantFyCCRIJBlQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mIG5E-003Vi4-U5; Mon, 23 Aug 2021 21:58:12 +0200
Date: Mon, 23 Aug 2021 21:58:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Saravana Kannan <saravanak@google.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for
 "phy-handle" property
Message-ID: <YSP91FfbzUHKiv+L@lunn.ch>
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_125821_547248_71B7EEB7 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

> PHY seems to be one of those cases where it's okay to have the
> compatible property but also okay to not have it.

Correct. They are like PCI or USB devices. You can ask it, what are
you? There are two registers in standard locations which give you a
vendor and product ID. We use that to find the correct driver.

You only need a compatible when things are not so simple.

1) The IDs are wrong. Some silicon vendors do stupid things

2) Chicken/egg problems, you cannot read the ID registers until you
   load the driver and some resource is enabled.

3) It is a C45 devices, e.g. part of clause 45 of 802.3, which
   requires a different protocol to be talked over the bus. So the
   compatible string tells you to talk C45 to get the IDs.

4) It is not a PHY, but some sort of other MDIO device, and hence
   there are no ID registers.

Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
