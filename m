Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D73BC4361B
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 02:04:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD7823A61
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 02:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD7823A61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6l/JTvGvt8sWo8csQ39+1wjtGs64E2a7UfdVHwfuXQs=; b=FQeQ0W1DZ0w7MyIkit6WTEuXN
	skkE3FBwmMn4/jGtTaa3pAJA7HI0ukHo6ECvHVCISjzHetfaK2T4wfmutTXGUHggjqD0LeYn5iy/A
	8nFQhF8vGGJvNoCl50Vg3o6yrZGyW3rlQksMB0bmGEcAoBM2XH/Phnb2o/dzi9TBByYyoOJySLL91
	nIigw24KNLdVgHEWLJC8Sc8doz6s5++ZDA7Qf/D/am8db5bBT4dhKaZhAw0nm6Cj/0ZatrgGW9QDj
	dqRUzYUFtuj7z7o7qyQmtWkT7GETFAu/9Y0bpBL/VX+F4JnijrTsH0G0vn5dlALVVOY1vWpSKELKL
	pEWlZq3mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmSN0-0008DK-I1; Tue, 08 Dec 2020 02:04:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmSMx-0008CQ-2j; Tue, 08 Dec 2020 02:04:48 +0000
Date: Mon, 7 Dec 2020 18:04:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607393085;
 bh=KognAkCYfuOB1Nu4iQHjV0+XS82XioxE4y/7HqsoFSI=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=knwrH+dkY81EEXnXNZrcZ7/DxgrakZsW/jRIRhprkgTkBBpdy2Owu0tNqcetN6IDt
 4u/G5n9YDT8JYkLyisZRP9dKW54WjJXuJBMbbet+sMZGrhSkDdfLXEZQGFSKUETobW
 8KEb57LGEJugVUVwV7skGo6j0k5D7ttGWBptAP45kKt1XWHVmYxHnq2xLn/6ABgi3m
 P6O1pnrNTY10rqcjPklFIeE8If1XZwJIUvR+2vsCHsQaNFitbNW/pONVw1+ZQ0ZmSk
 uKCHK0i42P/oOgTxW70VHFgXU7A2tLsbntopIPou5K9TMn3ikM1OYtQoHwHL2dk3mP
 icQbKxYNw6tww==
From: Jakub Kicinski <kuba@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: fix mask definition of the
 m250_sel mux
Message-ID: <20201207180444.2a48c366@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <1jo8j62c8t.fsf@starbuckisacylon.baylibre.com>
References: <20201205213207.519341-1-martin.blumenstingl@googlemail.com>
 <1jo8j62c8t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_210447_298117_B87E0925 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 07 Dec 2020 10:31:46 +0100 Jerome Brunet wrote:
> > The m250_sel mux clock uses bit 4 in the PRG_ETH0 register. Fix this by
> > shifting the PRG_ETH0_CLK_M250_SEL_MASK accordingly as the "mask" in
> > struct clk_mux expects the mask relative to the "shift" field in the
> > same struct.
> >
> > While here, get rid of the PRG_ETH0_CLK_M250_SEL_SHIFT macro and use
> > __ffs() to determine it from the existing PRG_ETH0_CLK_M250_SEL_MASK
> > macro.
> >
> > Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>  
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Applied, thanks!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
