Return-Path: <SRS0=pUon=SJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19769C282DA
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 01:17:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1F02133F
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 01:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABrP8UVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1F02133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uNhKzQhyjSEhWc5RDKihqlaRp/thsY7+yBMHFQ/3jQ=; b=ABrP8UVQngUgZD
	pHCYnTancZxbR4CZu7XphuK647P/xUttPJ2ejvWjeK7rhtUeMKvQNvndQ9JU4DCCL1aicop5TQwsZ
	POl79frxoyJNvfMIswovjN4yYj9nEF5hVfj5gA4irIH2IHkD6mtpDy59sg+Ij/oHxRN3yqOa1roJv
	eAcMPjLRJ/H0byp8TtMwQ6E7qRNdYD7HBITGVMvP95gU8MvKD+3+StJUTomm+10PbrhGKJFjHOQO0
	j6WptRq8yjTGmgzZeIcp0eiLBig27rXsKd2gbqNRVoSE5fYm4b+9CJ8G0FFT09lXW29iAJeY2BbzY
	gnpcJghxP64+jebJsGBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCwR0-0005pa-V0; Sun, 07 Apr 2019 01:17:22 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCwQx-0005oJ-EH
 for linux-amlogic@lists.infradead.org; Sun, 07 Apr 2019 01:17:20 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 946CC14BC08AB;
 Sat,  6 Apr 2019 18:17:12 -0700 (PDT)
Date: Sat, 06 Apr 2019 18:17:12 -0700 (PDT)
Message-Id: <20190406.181712.1121608163259706596.davem@davemloft.net>
To: jbrunet@baylibre.com
Subject: Re: [PATCH net-next v3 0/4] net: phy: add Amlogic g12a support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190404131147.31156-1-jbrunet@baylibre.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 06 Apr 2019 18:17:12 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190406_181719_479929_367485CB 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu,  4 Apr 2019 15:11:43 +0200

> This patchset adds the necessary bits to support network on the Amlogic
> g12a SoC family.
> 
> Only the internal PHY and related MDIO mux needed to be addressed.
> The GMAC remains compatible with axg SoC family
> 
> This series has been tested on the u200 (S905D2) with both the internal
> and external (Realtek) PHYs.
> 
> Change since v2 [1]:
> * Change 'clk part' Reviewed-by as suggested
> * Remove default callback from phy drivers
> * Use exact match PHY macros
> * Default MDIO g12a as module if ARCH_MESON is enabled
> * Don't print error on probe defer in the g12a mdio mux
> 
> Change since v1 [0]:
> * drop '_' from function name unrelated to locking
> * fix peripheral clock disable on error
> * fix variable declaration reverse Xmas trees
> * fix Kconfig dependency on CCF
>   (Actually needed for 'struct clk_hw', Thx Andrew !)
> * Minor fix in the DT exemple as reported by Rob
> 
> [0] https://lkml.kernel.org/r/20190314140135.19184-1-jbrunet@baylibre.com
> [1] https://lkml.kernel.org/r/20190329141512.29867-1-jbrunet@baylibre.com

Series applied, thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
