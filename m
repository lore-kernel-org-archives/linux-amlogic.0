Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D1EC282CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 979DB2175B
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 16:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Esytg2HS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 979DB2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TfJRvZ7Uw06B/VsFt68/VT8r5opeIOu9J2+JcuwUzo=; b=Esytg2HSY12Z38
	HaKxaH+fSHbuvGWV5JV4ROqzT+WAmAhnNS4W9AIxAXr6rXJrYmIOwCqlg+8pCwmedcmMLKW0ejRrr
	yyFHUt0JhMzJ4XO8jMiKHvpzYr3mJfC8qjs6cUZ9nW6BFUUkmiCAPi+StQgDwJlHn0AHesW9tbKUV
	hIdjkz1llCPE5zTFn+nX/5HfeZKCIwZ7Dr8rporQTkB21PsHXOx4Otd3ii3cV1xn172AeQWhVME9y
	kapxB+mm+e2pkfQvR6NMBrYOHNQQf84FojoNrjszhSLs3pGM41RvqVEtuV4oG6Wct9KVlO2UaqLEE
	ebgs3ngrjsCi0Tyzcviw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go9MJ-0002EY-Gs; Mon, 28 Jan 2019 16:02:03 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go9LK-0001xZ-1S
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 16:01:03 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pDrB0LDTz1r41r;
 Mon, 28 Jan 2019 17:00:58 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pDr96lHzz1qr5l;
 Mon, 28 Jan 2019 17:00:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 53BRWFAN07Ov; Mon, 28 Jan 2019 17:00:57 +0100 (CET)
X-Auth-Info: pSt+q9HVhwLsSY9ExNLNhIchfV2uaUcz5jVxpFra+V4=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Jan 2019 17:00:57 +0100 (CET)
Date: Mon, 28 Jan 2019 17:00:56 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>, u-boot@lists.denx.de
Subject: Re: [PATCH u-boot 02/11] video: dw_hdmi: support SoC specific
 read/write ops
Message-ID: <20190128170056.6a4191d6@crub>
In-Reply-To: <20190115161759.1657-3-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-3-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_080102_231871_109B6921 
X-CRM114-Status: UNSURE (   7.07  )
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
 Jorge Ramirez-Ortiz <jramirez@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, 15 Jan 2019 17:17:50 +0100
Neil Armstrong narmstrong@baylibre.com wrote:

> From: Jorge Ramirez-Ortiz <jramirez@baylibre.com>
> 
> Some IPs like the meson VPU have a specific way to write to dw_hdmi
> registers. Make it configurable.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jramirez@baylibre.com>
> [added commit description]
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Anatolij Gustschin <agust@denx.de>

--
Anatolij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
