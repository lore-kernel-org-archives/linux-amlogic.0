Return-Path: <SRS0=U+p1=4Z=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AAFC10DCE
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2020 09:17:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B753120828
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Mar 2020 09:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQj/r1yD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B753120828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjEZKUvOZYzqzVpJSwQ5UH5K0I3Wmthb0hIOdZNjnto=; b=lQj/r1yD5/lt5R
	Hk5yDZRAwt4scWwngG6mR1Xguw9nJaxPljrhjY58ohRFJ9IrOV359S7oRQSbSebmRRy48VwGIqNT7
	Wup3wTjaXu1yUG2YkBNzqdGe2rwUftrw0KTleqTXEVXVYpCYojHAFLebUWeTyjUufuOCeG1SjDLvQ
	kw1rJ3i5Xi2/osGpzO7Zv1tmh4SFbXtZGMj8REbjk+lFPJdO2XOVHq/01Bfnt6bznrDWDuyL9R6Vf
	nL8FYNuLVsA9p7uVZU08XifpUkCs9VmN9Q8VVFhhg7MI1p6f3JRmoZ+yrUqzFMqqyz6EoFzpoKAX6
	NVy9HEJq0o7BXVMNv1ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAs3k-0003N6-IE; Sun, 08 Mar 2020 09:17:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAs3g-0003MG-R6; Sun, 08 Mar 2020 09:17:18 +0000
X-Originating-IP: 37.167.192.10
Received: from localhost (unknown [37.167.192.10])
 (Authenticated sender: repk@triplefau.lt)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E877F1C0004;
 Sun,  8 Mar 2020 09:16:50 +0000 (UTC)
Date: Sun, 8 Mar 2020 10:25:36 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH] net: stmmac: dwmac1000: Disable ACS if enhanced descs
 are not used
Message-ID: <20200308092536.GQ2248@voidbox>
References: <20200306193036.18414-1-repk@triplefau.lt>
 <BYAPR12MB326999F850BD9BDD037D87CAD3E00@BYAPR12MB3269.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR12MB326999F850BD9BDD037D87CAD3E00@BYAPR12MB3269.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_011717_014925_AB7AEBE8 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Mar 07, 2020 at 05:34:28PM +0000, Jose Abreu wrote:
> From: Remi Pommarel <repk@triplefau.lt>
> Date: Mar/06/2020, 19:30:36 (UTC+00:00)
> 
> >  	void __iomem *ioaddr = hw->pcsr;
> > +	struct stmmac_priv *priv = netdev_priv(dev);
> >  	u32 value = readl(ioaddr + GMAC_CONTROL);
> >  	int mtu = dev->mtu;
> 
> Please use reverse Christmas tree order and also provide a Fixes tag.

Done in v2.

Thanks,
-- 
Remi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
