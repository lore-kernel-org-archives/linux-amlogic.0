Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C54C41514
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 20:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7766122CF7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 20:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cqOyUejt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7766122CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ld4ppQSkszOAz5YvnrcjA3vyTCRi+hnubnA3dm9WdKw=; b=cqOyUejtBTuJFl
	zEw1XKsyXqAvH5YhSInNqIqjk6KqDsOk4rMktPU1p5ZCOE1ebW78lDLCRi64sebRZaFdpbEpA1tpe
	pY2bShonMuMxRuAut7jKwpOHb0a/lYz/ZJaQukf6Nk0GGjPHkwpm2Y68Uwx1eWvqTnDVFNXHqcHGF
	Ut00d5GaU2BP4/Ewob07d1XHKS5P8xGyB/845/w2Mfev0k0bFymBxF6JlbdSqo3OqSjsAOH0Bsg8l
	1CnT6HEJfyL+0ALmGLVB3ibjo2W6luOev0S9zM8YMKrZ4Hm2xWUSoTpNcISEsiKEb7xDdYgtZ8pE0
	mHkP7Z0XlTassgqtGezA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Xbw-0003CY-8t; Wed, 21 Aug 2019 20:53:40 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Xbr-00035D-BR; Wed, 21 Aug 2019 20:53:36 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C2C9514D6EAC3;
 Wed, 21 Aug 2019 13:53:34 -0700 (PDT)
Date: Wed, 21 Aug 2019 13:53:34 -0700 (PDT)
Message-Id: <20190821.135334.39526649595657864.davem@davemloft.net>
To: yuehaibing@huawei.com
Subject: Re: [PATCH net-next] net: stmmac: dwmac-meson: use
 devm_platform_ioremap_resource() to simplify code
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190821135406.26200-1-yuehaibing@huawei.com>
References: <20190821135406.26200-1-yuehaibing@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 21 Aug 2019 13:53:35 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_135335_417193_889B9589 
X-CRM114-Status: UNSURE (   5.19  )
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
Cc: alexandre.torgue@st.com, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 21 Aug 2019 21:54:06 +0800

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
