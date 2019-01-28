Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE0C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439DD2175B
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hRUI6n2u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 439DD2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTerpsCjLXz2Xsh5wRGzu3Jz62IwL50kgp7McX7EkjU=; b=hRUI6n2u6jG6ee
	2MB1Aa2UMS5eJ5pEqJ4JVmnNrNBHgHh8Vgy54nUAB62lcVBv/Z6TYKfNjCU+37Xxv3FCDT5KVOzYL
	XF/HmC1kdASti9c+2cgsWtMtJiPLwGZZJr3bIaN2NfZ4QgbbwS2RlhADMuPls3pg2tlypv8h9PAz2
	fZt0DhMyz7yGfZlbLkvnS+6ha8mNNiuNxXlVmFR8p1jFMrXbV9dAixlgSj/PeNTosF7g7v5WCj4Ql
	8xRlWO6NBm9hHsj+8PcIYz4M8JfnYzbkaObe2TqbkkZNgUr3xr9izLPEue6XehxZYm0VU6pu5H4fM
	mJII8eDEWpxP9c0fmd+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9ML-0002Hq-S6; Mon, 28 Jan 2019 16:02:05 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9LQ-0001yt-3v
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 16:01:09 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pDrK4fyGz1qx9S;
 Mon, 28 Jan 2019 17:01:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pDrK1Fn6z1qr5m;
 Mon, 28 Jan 2019 17:01:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OiRWWT7JKYPZ; Mon, 28 Jan 2019 17:01:03 +0100 (CET)
X-Auth-Info: XtQy19hUnZmh5yINXThI+ldfY46gVJngn5TjAJHPWHQ=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Jan 2019 17:01:03 +0100 (CET)
Date: Mon, 28 Jan 2019 17:01:02 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>, u-boot@lists.denx.de
Subject: Re: [PATCH u-boot 03/11] video: dw_hdmi: add support for color
 conversion
Message-ID: <20190128170102.432de479@crub>
In-Reply-To: <20190115161759.1657-4-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-4-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_080108_306012_1A94A669 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: mjourdan@baylibre.com, linux-amlogic@lists.infradead.org,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Jorge Ramire-Ortiz <jramirez@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 17:17:51 +0100
Neil Armstrong narmstrong@baylibre.com wrote:

> From: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> 
> Some IPs like the meson VPU can only feed a particular pixel format to
> dw_hdmi. As of now, the driver is hardcoded to use RGB888 as input.
> 
> This commit enables different pixel format inputs, with the appropriate
> CSC configuration.
> 
> Signed-off-by: Jorge Ramire-Ortiz <jramirez@baylibre.com>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Anatolij Gustschin <agust@denx.de>

--
Anatolij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
