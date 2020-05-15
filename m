Return-Path: <SRS0=wX20=65=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA08C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2020 07:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB895206F4
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2020 07:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VAn7pYUm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSrx2nxF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB895206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUo5WH/PCxNh+to0U7zLVWBOvMoWcoHcmHCKso+7dAM=; b=VAn7pYUmE/Kxt+
	/diHKLByspfUqOIU6qTRSqlsmNG66rNSD1QRYF4LG1GR+6RphPuXVQjC+jNfWZkeyICN2uGTrWBOa
	Dff9QEljui3rdzNqR90R/rGQgi3yaDjERDSMfu1PKPy4xSb3k0jzMALOdM+7gBsPDv1Esh3Ddi5mB
	N4I5CG1sMrZ2xXb/1xFx8Pt2wnzamBpQTqOCSC6obr0RFLEdTLdhtx0Nlj0JK06mnxUFgPHGNMKL2
	p3F4knBoQzjzKWM04Bxn+qcDW0d2A0fbcNm+N0zxy4yStwmu8NnAcZl7Sjlywmh5XSRZmBG0R8JJk
	sxMqRyUXNYevLI4vy/Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZV5x-0000vx-EF; Fri, 15 May 2020 07:49:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZV5u-0000vE-8k; Fri, 15 May 2020 07:49:23 +0000
Received: from localhost (unknown [122.178.196.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15F35206F4;
 Fri, 15 May 2020 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589528961;
 bh=hiG4bQ7MQyZN5lGrfPWrCEefiCNplXpHLb+0Mi5heto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSrx2nxFwOyF8wwohGG6EF+GEC9wVTV9KUxaxf7I1c4j01NtR8LS4aTdZoqnCjei2
 HKjNRzSBsxWneTImqZkq7o8gJcKnLLvaYWHg2S5jVqQeUySRTH3xWkcAn9rpQVZGMt
 AXfFn32m+rf8kyO/7GOGYzKYK+4brCLr3vGmPKuk=
Date: Fri, 15 May 2020 13:19:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/6] phy: meson8b-usb2: small fixes and improvements
Message-ID: <20200515074917.GN333670@vkoul-mobl>
References: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_004922_328344_6097E6E1 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 hexdump0815@googlemail.com, linux-kernel@vger.kernel.org, kishon@ti.com,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13-05-20, 00:24, Martin Blumenstingl wrote:
> This is a batch of fixes and improvements for the phy-meson8b-usb2
> driver:
> - convert the existing dt-bindings to json-schema and add a fallback
>   compatible string which is already in existing .dtsi files
> - differentiate between Meson8 and Meson8m2 using a new compatible
>   string for the latter
> - simplify the code by using a MMIO regmap
> - set / unset the IDDQ and ACA enable bits depending on the operating
>   mode (and for the latter also the compatible string)
> 
> I suggest that all of these are applied to -next because we will need a
> separate .dts patch (which I already have prepared) to use the new
> Meson8m2 compatible string in meson8m2.dtsi. Otherwise we will be
> changing behavior in patch #4, because meson8m2.dtsi currently inherits
> the Meson8 compatible string.
> The number of actual Meson8 users is very small (I only know one case),
> so keeping Meson8m2 working is more important to me (because I know
> several users with boards that have a Meson8m2 SoC).

Applied all, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
