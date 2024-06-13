Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B91C27C6E
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0bG4UqPq6SEfxNwJKzAc8h5U3YKy0Rr83Q7f1u4O/c=; b=5AinRsqcsEb9y0
	XDN4Nb10dLjzAWxPAo2+oP2iYRLAfYAvl/suAoD9/k5mG4jOFreVHc/vbFrEQPDz82ZQGW93HrUPH
	rRTPZnJ1yg6qGk9teIYkUCCmu/eJfrJCGRLYnVRNgZBZAiEmUtNEoirj36iTg0uM8NS4DA/rez3kq
	AVahfRSEALrEaSLsJFpno0NUWq70P6o/UI0LCZGFq7v0mrh/B9dY1BQPsbSPUa9G097DNyqWOW5rV
	ehyaXOUZ9VIH7JXv6pzQrro7xjtGEPbasPoa/cq7DzkwQW1ddwYxvRIqnvPHYy3Q9PBcdbnKM7kmD
	c1QpcYj+nSHYITguHUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnXG-0000000HNht-1QI3;
	Thu, 13 Jun 2024 16:42:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnXC-0000000HNh0-43GY;
	Thu, 13 Jun 2024 16:42:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15E7161C1E;
	Thu, 13 Jun 2024 16:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BE0C2BBFC;
	Thu, 13 Jun 2024 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718296965;
	bh=k6RZFuL5RbQMXBfC1QGbjlIe42D9eii5Ww819cD7sCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kncp641X+UbghLKCtc6JUOvH5mOgzmtoEz/z4YK0RdIZ59bV2tVcBnppQgJB7g00v
	 i4Qt+uGMjBwLFzx7fAkeb157E4AROuJI7qDYEjm5YCRB/qqM7NM4gFCBJj7BA5VnjP
	 E2tFErP3LenNAcCr5q0F7sW641LObjwlB617yjTOuM1nNokJcs4HhsJBamqM7EyxKY
	 WcfEHR3bIWoFqAOg7nDg4s9M4b11HZ77dTcXzFF+1gE4aY2onT15YV/Rcp8P6tQ4yo
	 KjN8x5hP+GNpgpY9YCN2taV1QCRnSLox7fcvKDApOMcG8tvy+4Lz6u0t59RFrYeUCY
	 czqPkuBZpIaWg==
Date: Thu, 13 Jun 2024 10:42:44 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>, Viacheslav <adeep@lexina.in>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: amlogic:
 amlogic,meson-gx-ao-secure: add secure-monitor property
Message-ID: <20240613164244.GA1999034-robh@kernel.org>
References: <20240610084032.3096614-1-adeep@lexina.in>
 <20240610084032.3096614-4-adeep@lexina.in>
 <20240610-dropout-compress-6d6a9b749524@spud>
 <4866f6d4-2e3c-40c7-a8cb-ba4e422ffef6@lexina.in>
 <20240611-undying-earthy-00236ac251aa@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611-undying-earthy-00236ac251aa@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_094247_088156_D75AF2C3 
X-CRM114-Status: GOOD (  20.73  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2024 at 07:07:28PM +0100, Conor Dooley wrote:
> On Tue, Jun 11, 2024 at 01:25:11PM +0300, Viacheslav wrote:
> > Hi!
> > 
> > 10/06/2024 19.08, Conor Dooley wrote:
> > > On Mon, Jun 10, 2024 at 11:39:49AM +0300, Viacheslav Bocharov wrote:
> > > > Add secure-monitor property to schema for meson-gx-socinfo-sm driver.
> > > 
> > > "bindings are for hardware, not drivers". Why purpose does the "secure
> > > monitor" serve that the secure firmware needs a reference to it?
> > 
> > This driver is an extension to the meson-gx-socinfo driver: it supplements
> > information obtained from the register with information from the
> > SM_GET_CHIP_ID secure monitor call. Due to the specifics of the module
> > loading order, we cannot do away with meson-gx-socinfo, as it is used for
> > platform identification in some drivers. Therefore, the extended information
> > is formatted as a separate driver, which is loaded after the secure-monitor
> > driver.
> 
> Please stop talking about drivers, this is a binding which is about
> hardware. Please provide, in your next version, a commit message that
> justifies adding this property without talking about driver probing
> order etc, and instead focuses on what service the "secure monitor"
> provides etc.

To put it another way, how many secure monitors does 1 system have? 

What do you do if the property is not present? You didn't make it 
required which is good because that would be an ABI break.

You only need a link in DT if there are different possible providers or 
some per consumer information to describe (e.g. an interrupt number or 
clock ID). You don't have the latter and likely there is only 1 possible 
provider. 

Rob


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
