Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EE2C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 20:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16CE422CF7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 20:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPPQN6uy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16CE422CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZHZsnJJ9OeiVUQ3z6tHK/4wUXv9Cq4nw8h94z1dbCk=; b=fPPQN6uy/CZvJ/
	VIXJReQkWXFNfwQHychw3WGwnc+77OfRBbMJjUJFlWfPVtTevwveB8TVXOIKidEc4Rm401YyaTII/
	BiWD3v23WEE1tscX7Z9/dzhPLUM7vEE6ms2M8+Sgz7fLw1CamuiX1iZn7RiijMpcYsH3UoRL/O7jM
	Q3b/UJ480O98u91/AipkG32+vu/+ZS9V7ixW15BfnZS+aDRocjP5kySFDPxkc3qWGPPDA8nbh9cHd
	adOXVniDXZFfBTZheZ/YPDidbXAPYSR/4N5w7gGxnfxvG+vIoXQRVW8D9hZh4m6wMHTnuBiuI+rYK
	543sokqX1PXEGvvCZYTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Xbp-00032b-4e; Wed, 21 Aug 2019 20:53:33 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Xbl-00031o-TJ; Wed, 21 Aug 2019 20:53:31 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 70ACA14D6C961;
 Wed, 21 Aug 2019 13:53:27 -0700 (PDT)
Date: Wed, 21 Aug 2019 13:53:27 -0700 (PDT)
Message-Id: <20190821.135327.606639734369366852.davem@davemloft.net>
To: yuehaibing@huawei.com
Subject: Re: [PATCH net-next] net: stmmac: dwmac-meson8b: use
 devm_platform_ioremap_resource() to simplify code
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190821135130.68636-1-yuehaibing@huawei.com>
References: <20190821135130.68636-1-yuehaibing@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 21 Aug 2019 13:53:27 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_135329_951454_21840861 
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
Date: Wed, 21 Aug 2019 21:51:30 +0800

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
