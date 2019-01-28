Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF23C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 19:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F08C2147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 19:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jU/sGJvz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F08C2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zf6n6r78jHNJRmEFfzgOGabVBzm8WJhQ9P2Y6Da4bGA=; b=jU/sGJvzs4p/Wc
	yHmGxmm6KYrgyw67cj/jKhjmixT+Tq5L437FApc9ygf3b7AYpMmfyYImfNnkyAcutLgIJFMaH6FxK
	njAmsCJbofVwX2Oq3nSRNzCS2gVoavUH0SYzI58MEPqWAgDuBVVE7ceh8dpdPL2nlLTkIxC8aH2FV
	f/7TdiC2ZUOK2UEzNFAZGD1KGDoLyPgVzQoPtl5rN/wjP02+7R8uBJyuZmc9GEf9bHA1zMaevLnw+
	9JueErLOI+pk9661pLm0uYo/tsBUYwLl0O7XPcmOtvnEgVbrU0LYUOOW9m2jld/VisXwnPEaxEU+R
	EuOUlMlRj/L3GVOJRgzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goD32-0001sx-P4; Mon, 28 Jan 2019 19:58:24 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goD2x-0001rs-RK
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 19:58:23 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pL5z0f28z1qxDN;
 Mon, 28 Jan 2019 20:58:15 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pL5z06Cvz1qqlF;
 Mon, 28 Jan 2019 20:58:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id to7mxngvqAQk; Mon, 28 Jan 2019 20:58:14 +0100 (CET)
X-Auth-Info: A5hNEK7ri0+gyilGPKCnTCJyGa8FXfVS8wyhGIVUfyI=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Jan 2019 20:58:14 +0100 (CET)
Date: Mon, 28 Jan 2019 20:58:13 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH u-boot 01/11] power: domain: meson-gx-pwrc-vpu: add
 missing depends
Message-ID: <20190128205813.69ae8454@crub>
In-Reply-To: <20190115161759.1657-2-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_115820_030008_B966F9B2 
X-CRM114-Status: UNSURE (   6.47  )
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
Cc: jh80.chung@samsung.com, u-boot@lists.denx.de,
 Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 17:17:49 +0100
Neil Armstrong narmstrong@baylibre.com wrote:

> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> MESON_GX_VPU_POWER_DOMAIN should depend on POWER_DOMAIN.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Anatolij Gustschin <agust@denx.de>

--
Anatolij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
