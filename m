Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C10AC43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 06:29:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A72820840
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 06:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFpOEtx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A72820840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YNbvDMEhSbVJawut6n3BdKUM2hlY95YeRJV9fY+bHM=; b=ZFpOEtx38QZoQC
	nTZBcp2XosrgjUeSxSJpp5fRl1f516aL9DbPosw52+msU70Pa/8wt59kll67I6tEJAy6h80zwRcdB
	ACpKCYTJcxBhrRKdj6HBqQIgdiswnAQUPYcJ3zIKM9FM6leEMF1NWBlFChQ9+eHesKS+4HJPuWZ/i
	7kfqG+Zs6+E2i+Rv12CqjNRLLI6EeNWBizK3DX1eXGEp54yUSaE6oTX0Til5x+GeE3brnO4j0Jnmw
	fzk4DKUQxrOAWBjDGzlfjgWGAQ2gJts1foOElxiznzd5YDEwguZz3zc73cWJWphTrfuixTHDc/F4z
	IaOqU4uA2NsL4LS3496Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjeh6-0000sQ-Hx; Wed, 16 Jan 2019 06:28:56 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjeh3-0000s1-TJ; Wed, 16 Jan 2019 06:28:55 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 021B814AD1251;
 Tue, 15 Jan 2019 22:28:52 -0800 (PST)
Date: Tue, 15 Jan 2019 22:28:52 -0800 (PST)
Message-Id: <20190115.222852.1157339860050414390.davem@davemloft.net>
To: timotej.lazar@araneo.si
Subject: Re: [PATCH net] net: phy: meson-gxl: Use the genphy_soft_reset
 callback
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190113002255.15310-1-timotej.lazar@araneo.si>
References: <20190113002255.15310-1-timotej.lazar@araneo.si>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 15 Jan 2019 22:28:53 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_222853_943070_CF7D55FF 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Timotej Lazar <timotej.lazar@araneo.si>
Date: Sun, 13 Jan 2019 01:22:55 +0100

> Since the referenced commit, Ethernet fails to come up at boot on the
> board meson-gxl-s905x-libretech-cc. Fix this by re-enabling the
> genphy_soft_reset callback for the Amlogic Meson GXL PHY driver.
> 
> Fixes: 6e2d85ec0559 ("net: phy: Stop with excessive soft reset")
> Signed-off-by: Timotej Lazar <timotej.lazar@araneo.si>

Applied and queued up for -stable.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
