Return-Path: <SRS0=7Z6j=VZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4138EC7618F
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Jul 2019 18:48:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A54206A2
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Jul 2019 18:48:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fly0HNbC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1x6CdvMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A54206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp5oHPO1KA/ajH3k/hwE9ruwdCfBp88oSONQeBj6MNM=; b=fly0HNbCkzrigr
	8C2oVwgoUoDjhna6XsC+nNW2180b9UoefiHU3BhezIG17ELd0JClwIItIrIgsYrAXs8VkMZkRwAxc
	edNoJM5WNp2c20bwauVe4iKZorK1nKIaYijrLb25ppStECB9W0rOUSkfLRNcBKn0rSHfl5BlyJXZW
	lIpTE2hJ2qx7jkAaEBuuv5StyYykgWlNFP2vrLISE/ONjjeguFSfKmXzfQBEkrv9C0XO+XoxxD/MP
	suS5YxIB1BAtpv2N7KIEb7Utvhdhd19xY+OkAwmU7xLt7T/7ipuXrxzjpS1o7WPJS3qpqmdxbVcjF
	Ja0UM74Cqp/rnAOwm1UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hroDN-0007Xl-MN; Sun, 28 Jul 2019 18:48:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hroDK-0007Ww-11; Sun, 28 Jul 2019 18:48:12 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F4F9206A2;
 Sun, 28 Jul 2019 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564339685;
 bh=4DYiX1iZmDAb/6QIy02mrj5YucN4V4gh5wPN40oeVcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1x6CdvMFhhJpAqMrHpTg8s1dw/3onqj82ebkAM634Qi9JtPrLS2d41BDRyleQF8rc
 z8ez9kt631w8KhvzEa8NB2GGiD7L2QdgmE8nUQeZdO0Bm2BPRmjruLsOjQh4v3nMJC
 lBf5+MClR7Io/D3CHcsbKBpNz5sfw37TOm+n1UPI=
Date: Sun, 28 Jul 2019 11:48:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH 0/4] crypto: add amlogic crypto offloader driver
Message-ID: <20190728184803.GA14920@sol.localdomain>
Mail-Followup-To: Corentin Labbe <clabbe@baylibre.com>, davem@davemloft.net,
 herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, baylibre-upstreaming@groups.io
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_114810_091251_912763B6 
X-CRM114-Status: UNSURE (   8.74  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 herbert@gondor.apana.org.au, baylibre-upstreaming@groups.io,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Corentin,

On Thu, Jul 25, 2019 at 07:42:52PM +0000, Corentin Labbe wrote:
> Hello
> 
> This serie adds support for the crypto offloader present on amlogic GXL
> SoCs.
> 
> Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc
> 
> Regards
> 

Does this new driver pass all the crypto self-tests?
Including with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y?

- Eric

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
