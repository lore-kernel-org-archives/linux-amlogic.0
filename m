Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A427C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 22:43:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CB62064C
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 22:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZnApPB4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CB62064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g8CM38arIHgEdW0AmVG/xJEk2GwwgM2yMbmlTdAHs0=; b=ZnApPB4V4e1+CM
	2BO9Br8cn2qa+JS0sOxGl/P8ylkpMNZrF1/SZn+OUX/M/TBgEfE+OKesjasmDSbUh0rwTLZc9Yd3Z
	mlDQId19rKWCY0MrsagFEvz6KEg5aPj81HXsm7Sha7G5VbOHPnMpp2fC70J/P1pvqi+31OdJNFN1J
	oe/2NGg8Xnmxt1/IPrbG5SB+XQ/mWeQoJaHt/0Cz/AS/anlXAwOoavTFR96LluYyViZhYiYxBp9jz
	kSo4SoJ3oSDF45h4SxoZMJR9rXYp0MlqgbaXdNz8F4JaVBulzChs2ydzJRcEHBjsYMDw9yuyiz7aL
	JUB2UFUruJ36i0h5amjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghj2W-00086a-3K; Thu, 10 Jan 2019 22:43:04 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghj2M-0007xP-1u
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 22:42:55 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AF1EBFF804;
 Thu, 10 Jan 2019 22:42:43 +0000 (UTC)
Date: Thu, 10 Jan 2019 23:52:00 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] mmc: meson-gx: Free irq in release() callback
Message-ID: <20190110225200.GC982@voidbox.localdomain>
References: <20190110184908.27413-1-repk@triplefau.lt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190110184908.27413-1-repk@triplefau.lt>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_144254_227583_6791528E 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Elie Roudninski <xademax@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 10, 2019 at 07:49:08PM +0100, Remi Pommarel wrote:
> Because the irq was requested through device managed resources API
> (devm_request_threaded_irq()) it was freed after meson_mmc_remove()
> completion, thus after mmc_free_host() has reclaimed meson_host memory.
> As this irq is IRQF_SHARED, while using CONFIG_DEBUG_SHIRQ, its handler
> get called by free_irq(). So meson_mmc_irq() was called after the
> meson_host memory reclamation and was using invalid memory.
> 
> We ended up with the following scenario:
> device_release_driver()
> 	meson_mmc_remove()
> 		mmc_free_host() /* Freeing host memory */
> 	...
> 	devres_release_all()
> 		devm_irq_release()
> 			__free_irq()
> 				meson_mmc_irq() /* Uses freed memory */
> 
> To avoid this, the irq is released in meson_mmc_remove() before
> mmc_free_host() gets called.
> 

Oups, I missed the fact that the same can happen if probe() callback
fails after allocating the irq.

I will send a V2 for that.

-- 
Remi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
