Return-Path: <SRS0=ZxT9=63=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021B3C433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2020 19:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1930206CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2020 19:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9Jg4QD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1930206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCX8kq+E7THLyyv1lO9rBzo0ncRBPVOFYeMuzXCVtoY=; b=Z9Jg4QD+IpG9b7
	4ubpzdW7eDfEKWwWSoVgFQsVcIH3RBey8qTfpKcr92bWYsLpeGzoiSfchy8/YtY3RRcWQVawzIPWP
	RmS+ma6jrSm0CEmJzXO2aX36xUgyjZdjbFYR+xHco/EziM7buLnuFqmCrrQz1bbqP57SejeULjpeE
	lk51ndb4ez6oJZ6XlEDl15Xy/O3FSeuaHMKmbOeDX4QKEjoh1tAyCi1Mo0hqoO3tLCnFT0hDFqgS1
	RfGa4xwxkk5wtVGmZVwxb28HSDvqHvFlIAQsGf1L9oeFkoCJ3Bwnx8xWjbgJxAi9YUT0+vCKXfETX
	w9iTq+n7vgmYr7xfEE8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYwyl-0000Ab-2f; Wed, 13 May 2020 19:23:43 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYwyh-00009n-UW; Wed, 13 May 2020 19:23:41 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 124F2127E5AC1;
 Wed, 13 May 2020 12:23:39 -0700 (PDT)
Date: Wed, 13 May 2020 12:23:38 -0700 (PDT)
Message-Id: <20200513.122338.1849377923675371554.davem@davemloft.net>
To: martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v3 0/8] dwmac-meson8b Ethernet RX delay configuration
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 13 May 2020 12:23:39 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_122339_982361_15AC5E54 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 12 May 2020 23:10:55 +0200

> The Ethernet TX performance has been historically bad on Meson8b and
> Meson8m2 SoCs because high packet loss was seen. I found out that this
> was related (yet again) to the RGMII TX delay configuration.
> In the process of discussing the big picture (and not just a single
> patch) [0] with Andrew I discovered that the IP block behind the
> dwmac-meson8b driver actually seems to support the configuration of the
> RGMII RX delay (at least on the Meson8b SoC generation).
> 
> Since I sent the first RFC I got additional documentation from Jianxin
> (many thanks!). Also I have discovered some more interesting details:
> - Meson8b Odroid-C1 requires an RX delay (by either the PHY or the MAC)
>   Based on the vendor u-boot code (not upstream) I assume that it will
>   be the same for all Meson8b and Meson8m2 boards
> - Khadas VIM2 seems to have the RX delay built into the PCB trace
>   length. When I enable the RX delay on the PHY or MAC I can't get any
>   data through. I expect that we will have the same situation on all
>   GXBB, GXM, AXG, G12A, G12B and SM1 boards. Further clarification is
>   needed here though (since I can't visually see these lengthened
>   traces on the PCB). This will be done before sending patches for
>   these boards.
 ...

Series applied to net-next, thanks Martin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
