Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BCCC04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 19:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22BD21479
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 19:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iFkkboZf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="A0FLOxsG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22BD21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7HD5SPN6iXU+OtM/ACStotVe5NWU2ve2XpbyapPf5Y=; b=iFkkboZfFs1NYd
	EnegKjMBOeuyzOvCN6P9tDNxJtaddT4B6fP1tTOKDCIXvW1U2SGrOzFpITfWPJMfLrcIR/kBSJsYe
	d7pnsLInPkOLOVIhhslhJFqVw1oOL7AcjI3yOuZiQYnd42TrJ1umzrlL7yhm5IrgCtHBh7KOqUxE7
	3Q7BKrCzbXtC/j4WuazJAdFCkodLY4tzveO1VtJBLiLBYZyD1VOIEXVx9yBIFwkWKVjoG2eGyYPb7
	8jcX/uHhJ5YbfrxYfiTkIuwQa3hX/VXDYtK8LePmcBTNPS3OdJw3h21S9dz1CvdWaDSBxFR5zdrB+
	ocLVcUNKJGQ55pUnGnQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPY2K-0006y7-BC; Sat, 11 May 2019 19:52:00 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPY2H-0006sl-La; Sat, 11 May 2019 19:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VG2yTD+3xTD/lCdbsfLUdnozxfIXWImi05fuOhNelsI=; b=A0FLOxsGDhE132dHk+ANiSr+Of
 y5fR+E5D2ElZTUeFSqT+oZzt+RnybP0qzb5B3vd+OrQdwb1qCeCM2goXyaaCxjqpuOZDynp786UT1
 dL81W2XnvCAsLpxFIh9u85tca1ol0B6WVqdl/6oU02bJSjQfFH8MnzvVLB3rkKFXpA7g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hPY2A-00056C-Pe; Sat, 11 May 2019 21:51:50 +0200
Date: Sat, 11 May 2019 21:51:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: remove ethernet-phy-idAAAA.BBBB
 compatible strings
Message-ID: <20190511195150.GI4889@lunn.ch>
References: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190511174534.2403-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_125157_854110_2EDF8E78 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, May 11, 2019 at 07:45:34PM +0200, Martin Blumenstingl wrote:
> The Ethernet PHY documentation
> (Documentation/devicetree/bindings/net/phy.txt) states that:
>   If the PHY reports an incorrect ID (or none at all) then the
>   "compatible" list may contain an entry with the correct PHY ID in the
>   form: "ethernet-phy-idAAAA.BBBB"
> 
> An older version of the documentation suggested that the compatible
> string can be used when the PHY ID is known.
> 
> Remove the ethernet-phy-id compatible string and add a comment with the
> PHY ID instead.
> This is a no-op on boards which are shipped with the PHY that was
> listed (= all known cases). However, if a board manufacturer decides to
> ship a different PHY we will now load and use the correct driver because
> we ask the PHY to identify itself.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
 
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
