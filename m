Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3937C56202
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:03:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37BBD20867
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d90Vu1Mc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGon0kml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37BBD20867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=apENfCkXZao1QjhkRrpcZ/Zy4ezQsqgLP99DjjEdddk=; b=d90Vu1MchvH8nxekD/MS05Z9D
	lo87rRz/bzb4yKd1FZs6U3IbAHrLbLwLGv6pSmr13gaKpVg9g2Z57SxhHF76sV7UutFxrOptE4md2
	/aKWxyhuOFCRbwf/omRq4V6Hky374P/mhXjMWHGb6MyfnCAKfhGQL7DeJG3nguE2SbwsvzTsRFn86
	GIMIXoxylhnTAt5vsh1NCW+IbRPvnjmU4uoN4A7QrxZvAI/tZ5kiJPjhAqRpSoljG3q9w9sRgtUV2
	hswiUr637t9VdYPO0D8LmjEg/emuKDNRBUHWZa4zgPy66/LzONP3jtVZdpyluPTMbJqQHsSS3VjF/
	vQNmK9nLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg3G1-0001xe-5Y; Fri, 20 Nov 2020 10:03:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg3CJ-0008IF-G8; Fri, 20 Nov 2020 09:59:21 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 064F322244;
 Fri, 20 Nov 2020 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605866354;
 bh=/hwJuy51LfI8bco1UPEz1z3d4gSZXj9UtjndJ9W73f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pGon0kmlXcFqycAt7aES43uF+wOlBpueb39HWVBk3uKnbco/8rN8AElyQiSMNUm+w
 R8qhmRzSs467E72kOihBp7zIJPQgGkQ6jQezkA0Y0bDQw6bipwTndYuE2uyyDb0V4E
 NAkuKMUKBl1ayCvgckgfJ2c1+35TOY+oD+aIVliA=
Date: Fri, 20 Nov 2020 15:29:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RESEND PATCH v3 0/3] phy: amlogic: add MIPI DSI function to
 analog MIPI+PCIe PHY
Message-ID: <20201120095905.GF2925@vkoul-mobl>
References: <20201116101647.73448-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116101647.73448-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_045919_859434_29F03ED8 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: linux-amlogic@lists.infradead.org, repk@triplefau.lt,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16-11-20, 11:16, Neil Armstrong wrote:
> The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
> thus we need to have inclusive support for both interfaces at runtime.
> 
> This fixes the regmap get from parent node, removes cell param
> to select a mode and implement runtime configuration & power on/off
> for both functions since they are not exclusive.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
