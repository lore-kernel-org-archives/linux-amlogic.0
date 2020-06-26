Return-Path: <SRS0=11Ec=AH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A00C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 19:18:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04EA20836
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 19:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcLnjlBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04EA20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cobGbkVLfTh12IvAk5Th4FpmnuFkNGd7+pPdmugPITs=; b=WcLnjlBUMNDehNOKD0vnK7gGl
	7gWPuWuMsfPYqK6D+kvIaN231hoxB+TPXSuJwLCFyVIVcAvKbShPggyQ9r1rZcUg8BV26uhYTfIvI
	VxkVONGCCX1tky5lnPMopK/pf3HKVrqHaEC8C96mYz0KZG8OR0lNBstaYvOORZqjvV2pbje65FhQ9
	iwKxno8XstX/FSR6JcLXEwicGuWUoPxYhYb4RQNRyKI4QAYAzaYbAkwN+q9I4qrLe6m76UhzOx1t6
	TotHmgfUbBU709B41htnBFKNR2V1slDTVxl732dGfYraPALJtSQJ2xy4KwqBvjsM/vjrya/w8tqAw
	TbvbiLVdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jotrR-00010l-C3; Fri, 26 Jun 2020 19:18:05 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jotrO-0000zs-Qt; Fri, 26 Jun 2020 19:18:03 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 64569120F19CC;
 Fri, 26 Jun 2020 12:17:52 -0700 (PDT)
Date: Fri, 26 Jun 2020 12:17:51 -0700 (PDT)
Message-Id: <20200626.121751.1918257116637546551.davem@davemloft.net>
To: martin.blumenstingl@googlemail.com
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: use clk_parent_data for
 clock registration
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200625182142.1673053-1-martin.blumenstingl@googlemail.com>
References: <20200625182142.1673053-1-martin.blumenstingl@googlemail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 26 Jun 2020 12:17:52 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, jbrunet@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Jun 2020 20:21:42 +0200

> Simplify meson8b_init_rgmii_tx_clk() by using struct clk_parent_data to
> initialize the clock parents. No functional changes intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to net-next, thank you.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
