Return-Path: <SRS0=6t6z=WM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12FEC3A59D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 18:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A4F206C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 18:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DLBtkaCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A4F206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhp1ibUQx5ZrwdO2364PM4IzbhERiTedNCjL9wbKu24=; b=DLBtkaCnBtNCjJ
	xmsjCOblQWxj+olHYQAwBE9qFjTMEV+azTSzDSv8A6UAJK/WMbB5oj6a2d8xWTwtVUhjOTfjYbMi1
	OH3PlspJi/cRVS8IHJyrZjwoNPjFqiaByPozRi2zN5+3HegVxIJD5HvR6Ac3gtZFPLboGzJ2RLEeR
	DxuRhG07U+x7XXYW+SI7D1C/vTg3ONboARnB/ambr3NjLSBTg5Q8vx/n58pC/E+x0CTAmMDR0SwGO
	y9sAYJhZyj2cJfBTn/Dgk6022fz5vxcvyP5pYYSjxcl/Y1xRb+x5/ILMRQobNS4vzD6gM28Klm252
	k5wRcUCnlxco2M2JWi2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyhQI-0003hF-U2; Fri, 16 Aug 2019 18:58:03 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyhQG-0003gh-B2
 for linux-amlogic@lists.infradead.org; Fri, 16 Aug 2019 18:58:01 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 50175133FACBC;
 Fri, 16 Aug 2019 11:57:55 -0700 (PDT)
Date: Fri, 16 Aug 2019 11:57:54 -0700 (PDT)
Message-Id: <20190816.115754.393902669786330872.davem@davemloft.net>
To: hkallweit1@gmail.com
Subject: Re: [PATCH net-next 0/3] net: phy: remove genphy_config_init
From: David Miller <davem@davemloft.net>
In-Reply-To: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
References: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 16 Aug 2019 11:57:55 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_115800_377031_15347198 
X-CRM114-Status: UNSURE (   5.68  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 vivien.didelot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Thu, 15 Aug 2019 14:01:43 +0200

> Supported PHY features are either auto-detected or explicitly set.
> In both cases calling genphy_config_init isn't needed. All that
> genphy_config_init does is removing features that are set as
> supported but can't be auto-detected. Basically it duplicates the
> code in genphy_read_abilities. Therefore remove genphy_config_init.

Heiner you will need to respin this series as the new adin driver
added a new call to genphy_config_init().

Thank you.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
