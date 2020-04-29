Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31E4C83004
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 21:29:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B440620787
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 21:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="doDJrWD3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gXPH7oCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B440620787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sjH8moBtLIjOyMCcB4hkU9aADQ3vCWCUiV6Z6fXwHU=; b=doDJrWD3KQQbWH
	1hj0fjoHiHwS2267Ax/2vxxa14dOko4uKcq2HJFRZCAYwOMAHKAZJ4rC1CiH8UK3tpEP/ZHlThL+C
	aVVrDUcTXCVRCsIJj7JJ9ejzEbfBmhHPGOtmEas/2jfgzzBZMWiXV3uueP3xIhYA0le/ZDBzFDBmO
	UvpOrewN3L6gnu4xqcgS/y/2QcXPa5a2UBP8agmTBxIIkAqKO+ph/kthnCJXM5h21SP5IGSQD20Ex
	ypOVhaeXoFGEgmGHMm/6+yaAQvwyDjTEcq6ElXHIEMuTccXQRCuwqEod7dD07N0XvOcyo4mTtOa7Z
	SXZaFH/OUx6pYvQuXFNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTuH4-0007mw-Tv; Wed, 29 Apr 2020 21:29:46 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTuH2-0007lX-Vx; Wed, 29 Apr 2020 21:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ehAF5VJKlo6UElUpdCPqKU/hhwZxb3s8IJbl7lMP8jU=; b=gXPH7oCruVVWWeaOWFGwA4pm/n
 QF4m36glwEcwVh2Bb98/eY9snKBd52heUHGFf8+aXqtVT3WG82JcyjGkWkh77WdwqoUpMgUd0/My9
 e+cpUxQc/kkL5FJhrsZsuafeuFua40IXiztBYAzYe8OvgYyTbPnfFnu7U+qSNEt7Q9C0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jTuGr-000KLe-7W; Wed, 29 Apr 2020 23:29:33 +0200
Date: Wed, 29 Apr 2020 23:29:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 00/11] dwmac-meson8b Ethernet RX delay configuration
Message-ID: <20200429212933.GA76972@lunn.ch>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_142945_028875_45ECA3B4 
X-CRM114-Status: UNSURE (   6.68  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> - Khadas VIM2 seems to have the RX delay built into the PCB trace
>   length. When I enable the RX delay on the PHY or MAC I can't get any
>   data through. I expect that we will have the same situation on all
>   GXBB, GXM, AXG, G12A, G12B and SM1 boards

Hi Martin

Can you actually see this on the PCB? The other possibility is that
the bootloader is configuring something, which is not getting
overridden when linux starts up.

	   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
