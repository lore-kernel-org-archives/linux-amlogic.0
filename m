Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B07C28CC7
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 13:26:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DCA207E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 13:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrTIaCb2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GRCoQxzs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DCA207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUnCN/m7SVIZmPnkZnkUrFUhD/i/v/D1QMzEUt9TLYA=; b=OrTIaCb2KL7S4T
	91F8mkJWSEV1PpYcTuKjixLAac0uyWWyKqmkV2ooXqQwAzfZgqAr7mZ5HgtuaCh5gCNZ2JS1v9q4F
	BzcXR+AobWretlLG7wSnhLKx21SOnk8JBsalmNfbw1G9IrxbURFVYipW7/eWa/dpDKLf7N/NByvst
	sfhswyfRva2sZMUXR58yMViWb4goJ4GifZ66ROnhc+00OdGg6xOqjBFCVU9rzKtfiPnyf2C+vCrEz
	jsOAPsqTvFzjYUgKLIsnChbkjHRQ2vrXRy97IV9tzOwnNbTYglRgJPuyeGocgTkypfYlrvLRJd9lo
	u/p4iTjhQrzdJ3cVXQ3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haKJH-0004S6-8n; Mon, 10 Jun 2019 13:26:03 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haKJE-0004RG-CE; Mon, 10 Jun 2019 13:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YI80HFnKhwfC06RagYAUP7ThPG5kbxVc9JBgg7X0bw4=; b=GRCoQxzsfFqofI/UoDR47FyGeh
 PXcWJC0FwW5udvg5zB6I1T1LiChU8rv8Jthx+vt8ENT0ibn9T3tlEYZ0FXRYnP3ryf1pXwTWnmJCv
 gOtGl5LRYrKCfS6iAGy680Rc8vL0QfqpdtYcupc3fDaOQSXeQ3e+62boTKbSztAhwzmc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1haKJ0-0006kC-Nt; Mon, 10 Jun 2019 15:25:46 +0200
Date: Mon, 10 Jun 2019 15:25:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset
 GPIO
Message-ID: <20190610132546.GE8247@lunn.ch>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch>
 <20190610114700.tymqzzax334ahtz4@flea>
 <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_062600_565375_32466374 
X-CRM114-Status: GOOD (  10.38  )
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
 linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 netdev@vger.kernel.org, linus.walleij@linaro.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, joabreu@synopsys.com, khilman@baylibre.com,
 peppe.cavallaro@st.com, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> if anyone else (just like me) doesn't know about it, there are generic
> bindings defined here: [0]
> 
> I just tested this on my X96 Max by defining the following properties
> inside the PHY node:
>   reset-delay-us = <10000>;
>   reset-assert-us = <10000>;
>   reset-deassert-us = <10000>;
>   reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> 
> that means I don't need any stmmac patches which seems nice.
> instead I can submit a patch to mark the snps,reset-gpio properties in
> the dt-bindings deprecated (and refer to the generic bindings instead)
> what do you think?

Hi Martin

I know Linus wants to replace all users of old GPIO numbers with gpio
descriptors. So your patches have value, even if you don't need them.

One other things to watch out for. We have generic code at two
levels. Either the GPIO is per PHY, and the properties should be in
the PHY node, or the reset is for all PHYs of an MDIO bus, and then
the properties should be in the MDIO node.

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
