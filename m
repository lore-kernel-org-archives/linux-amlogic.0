Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C326AC2BB84
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 14:33:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847022074D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 14:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JrjJ0T3k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0Q59EDyr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847022074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ciwnvY1ZhxUXhvKkdVs+VQ8NZCqSxgzBjS9DjV7/4Uc=; b=JrjJ0T3kwjZSJ+hCSfR7Hdd83
	yPzkCRrKA1N5L/7mxq0Wmc6tvOgsfSRCAvP1A6h/SUkff9Lg9oZgURvtCDw6ir3kBEIi8dE3RWOOS
	/izPsyUPWjOY6vVE2L9Uk5txlP0YL+GJnNZpRy3i8T85XVuXwcuFTPZl3xQvXjrhu8wvu3ukHo9C3
	zgcCtjTvIl5yKJol096aSyCvl4lgYeWoIXEoeVQQRLGlHc2rytAG03WcIrHpkxheQTreqY8zWRQnI
	X3uclP7Q06gy83D40s0Swv2qhq0duJ6BOGV0On2b6NR09BTdCrhI3/HieXabyCQaEcV2LFvYhYTWA
	Zqi3K3gbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kECmW-0003ze-Pl; Fri, 04 Sep 2020 14:33:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kECmU-0003xw-4b; Fri, 04 Sep 2020 14:33:35 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97ED8206D4;
 Fri,  4 Sep 2020 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599230013;
 bh=FHJqC3D/q48MLQ3HRGqKHGyvwW/vPxlNJ/p/il47Hxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0Q59EDyrlwOKP/Lv7shUiKD3DG0Z/aX2eG11LlyzzBWvfl3wskepUl3gDXlW+CKcf
 naPYGdny3vU6acYu1CSVDPje+/FvGy+bTlv+NldEkyY0qsA5SNEyLcmDPqmT3G0v93
 3436aiX8puywmmMC9g07vEKb38uZBClN4V0YeyFY=
Date: Fri, 4 Sep 2020 16:33:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] Revert "usb: dwc3: meson-g12a: fix shared reset control
 use"
Message-ID: <20200904143354.GA3197700@kroah.com>
References: <20200827144810.26657-1-aouledameur@baylibre.com>
 <4e7c19de-f276-7b2a-695a-ef83c1477d19@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e7c19de-f276-7b2a-695a-ef83c1477d19@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_103334_302501_B834A9D3 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 02, 2020 at 08:57:42AM +0200, Neil Armstrong wrote:
> Hi Felipe, Greg,
> 
> Is it possible to apply this ? USB is broken on 5.8 stable and 5.9-rc on multiple GXL/GXM boards.

Yes, will queue it up now, thanks.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
