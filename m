Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7B7C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 20:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591A0206C3
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 20:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bEmmhJkl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="loFZ3wg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591A0206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afB5jVuDfk/hxTqDLWYPCIoLjIbclDFND8D41OHCTds=; b=bEmmhJkllGwOfV
	Y5BtuAWtcK9L3ihOS7cgVcJvUBty6Qob8QFoHW4phlZHkUTYzEj/iCB4HsNOD8KOBb/NNxyevKpOG
	mKeFQ5yyZ9flXRSrXFc3CMnXXZoaMy+qf5BJtQ3Eo+iakW/6Ngc54GusiO6NMhnbsaNfilLh+ki2c
	c5SH8fawc2fB50WtG0NSMdAtEXUe6XHjfHmTxCkrv7nxdB421jLDgn8+oOI0IDEwUPRMa+FhXS4g8
	VO83xVhsD4EeRbulCDiniDDMNLlLqY5W35fAaAYZD9HEjT5ot4d3No0X4/L8l08QZsIZMcI3icuuF
	5RUin6zbgIAASOMa8gZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha4aW-00078y-8d; Sun, 09 Jun 2019 20:38:48 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha4aS-00077i-22; Sun, 09 Jun 2019 20:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aAgxuie2Hz2Ygvh1FvKs8sfXSa5TA6FHsD2v2BeNmlU=; b=loFZ3wg+RZyrJP5WO6P8HV8ypt
 gJzwviy22tCzfN56o6PocZ5VpSRqs864Mo6i6I+Uw8bhxw/vrbHap1giCG/rTkFt64tRsLPv8TE/L
 pPNZIwacKiE8RFy8kheg+N5BzbBM0mDbgETBoA9ACUsBkqJgg0bAHswXQXmQ2g7Xzl9k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1ha4aC-0002PI-Ik; Sun, 09 Jun 2019 22:38:28 +0200
Date: Sun, 9 Jun 2019 22:38:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
Message-ID: <20190609203828.GA8247@lunn.ch>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_133844_255982_56D86492 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, alexandre.torgue@st.com,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linus.walleij@linaro.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, joabreu@synopsys.com, khilman@baylibre.com,
 peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jun 09, 2019 at 08:06:18PM +0200, Martin Blumenstingl wrote:
> The stmmac driver currently ignores the GPIO flags which are passed via
> devicetree because it operates with legacy GPIO numbers instead of GPIO
> descriptors.

Hi Martin

I don't think this is the reason. I think historically stmmac messed
up and ignored the flags. There are a number of device tree blobs
which have the incorrect flag value, but since it was always ignored,
it did not matter. Then came along a board which really did need the
flag, but it was too late, it could not be enabled because too many
boards would break. So the hack was made, and snps,reset-active-low
was added.

Since snps,reset-active-low is a hack, it should not be in the
core. Please don't add it to gpiolib-of.c, keep it within stmmac
driver.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
