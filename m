Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126D3C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 20:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D37ED214DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 20:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGhQc2x4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37ED214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffg1BgSw+6gqHh3Vj6ptxc4483zWqgMX3crCfr7E+SA=; b=pGhQc2x4qi1WTS
	t+v5N/hRQJPOoIjd0fpW7dfn4f0rCHFvZh1QeMx0cxE7KkOTwdo+bOD1L3V7C3F5fuE+NHKCaLnnr
	XN5m6YLjXJ7RtNaloYM84NDg6ojfw3LkaXBS2kab+j6VRdGUyZsQM5Z6G4YQPo2ZBQhqAaUtN2gnX
	af6rz7VxZsqiJed5JalTurskobLadAh4bTcTxBLfe+5V9x79yC4T/eiwmVs9IZQ0veY3fCUJR2a8z
	PLFOZc8vMhk3kZYMHNw8KzPRbf7SErsfDR/zfJfbk5AxyOdCNV39I+jl/bBCZ1PDzU7UnMOSK3N3H
	vyiOUpgUbIMEtk63PL8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goDC6-0006VQ-DT; Mon, 28 Jan 2019 20:07:46 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goDC3-0006Ul-8P
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 20:07:44 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pLJr6wbyz1qxDN;
 Mon, 28 Jan 2019 21:07:40 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pLJr6DJdz1qqlD;
 Mon, 28 Jan 2019 21:07:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id be1pFz2K81-1; Mon, 28 Jan 2019 21:07:40 +0100 (CET)
X-Auth-Info: +nJwrrIaBzIP9YAfci9X6vOoKZHQW1JOarwaPYnQ6OM=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Jan 2019 21:07:40 +0100 (CET)
Date: Mon, 28 Jan 2019 21:07:39 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH u-boot 08/11] arm: meson: board-gx: Setup VPU in fdt
Message-ID: <20190128210739.37d34dbe@crub>
In-Reply-To: <20190115161759.1657-9-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-9-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_120743_453431_2B050D62 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 17:17:56 +0100
Neil Armstrong narmstrong@baylibre.com wrote:

> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> If VIDEO_MESON is enabled, we need to setup the fdt for the framebuffer.
> 
> Call meson_vpu_rsv_fb() which reserves the framebuffer memory region for
> EFI, and sets up simple-framebuffer nodes if simplefb support is
> enabled.
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
