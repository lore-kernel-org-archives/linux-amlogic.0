Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B3CC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 02:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E427A218D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 02:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c9C/pIH9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4UloEVf6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E427A218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1I3+g2/4nHcPVlfiHVIw5uKetvSiJeinfdDiIzP2tI=; b=c9C/pIH9SBmqIC
	0m1cPHd3SAOsIu8K9FU/gDd54PgO7cfzFc5cS91pHOd0kVHRhVE379vHfmHIyTIwpsWhvIFMVc4Z1
	8LE/3BQKuzPDoomDV20wVXSbwnr/ztUSYlLLp0spZDpcT5Dw2R1e9sxsPeDiVbm09S1MOIjnuk/hY
	T3X5YhgIq6RUKN3QV/JO1mWhYvC5CKssuhVqeUmSBOnRDGa1AkFBx7AoMvL4QM/1lXDhEMDuR78Nw
	lGf1Ow+tPE7iTAzgQrw9+lNG58J9EH582ToUrG8oBflhGmCHAaoGraqi8O5UXEvccK6ATutadEyZ6
	mBKyLpsXgbd+qJSmzP3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4zTR-0005iX-D0; Sat, 16 Mar 2019 02:55:01 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4zTN-0005i8-Sc
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 02:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=37sAF8C8/qCmXTPggKiGRUEhfZFTnwCYGURkoeMlCe4=; b=4UloEVf6VscxOhlUmJz8Wf7LSg
 YhJP8e2JSq/aa8nMXYGXrrEkMLgfMYtm3stMAQlBZM7GpGOoOZPHs7ZzKCtLfRlhMmtzXr2eEVsJC
 BHp69H59STxZfLp1l2HJVTs1S4kTayxiHrFMERnpv2NrqZkIbJpL6uapt6KjTcGbB9bQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1h4zTE-0001Pb-IO; Sat, 16 Mar 2019 03:54:48 +0100
Date: Sat, 16 Mar 2019 03:54:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH net-next 2/3] net: phy: add amlogic g12a mdio mux support
Message-ID: <20190316025448.GD29548@lunn.ch>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
 <20190314140135.19184-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314140135.19184-3-jbrunet@baylibre.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_195458_076962_EC7B3446 
X-CRM114-Status: UNSURE (   7.11  )
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 03:01:34PM +0100, Jerome Brunet wrote:
>> +static int _g12a_enable_internal_mdio(struct g12a_mdio_mux *priv)
>

You would generally use the _ prefix when you have a locked and an
unlocked version. I don't see anything like this here. So please drop
the _ .

Nice to see the generic clock framework being used. I just wonder if
this is the correct place to have this clock code. Can it be made part
of the SoC clock code?

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
