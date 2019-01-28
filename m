Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2778FC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 20:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BF7214DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 20:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0D6elPY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BF7214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjjWlBmZKpZkeGsbgJxagRe1kFwr6sw/xssV9CDX3dk=; b=X0D6elPYG8803e
	/lm+z4j5bgENOvSkvbBfitKy82sPrVeNNmyFYDZiYdZdux4LfyUoX9BZNnq5gmx6LdJfcRufsprX4
	SSirU7cZznbvAipJKMRHSZ9bRu1TOk6imOYZOgANIlG0NbL005Qd2+zIk7Rafnr//vk2weVDgyLW8
	MITPKJ8nilZhiqIyqrVxzJuiqeAuWFGIzc/4Sr2l6OrY2n+xcj2YhRr1NE4+kMWDqArGHl7HPQ1Bk
	NPyrh/lu8V9PKp4S0CadQoqB8kqna8DW9Z7JkmvqBhNHukSez8B863o3Bvj/pnFDXpc45+OGtBpKS
	CZrpXcXoXsPm3pp4+Tbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goDFT-0008CC-I6; Mon, 28 Jan 2019 20:11:15 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goDFM-0008Bj-08
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 20:11:10 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pLNp0R2Qz1r0H9;
 Mon, 28 Jan 2019 21:11:06 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pLNp0CZxz1qqlF;
 Mon, 28 Jan 2019 21:11:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nbTvCfSmoKgv; Mon, 28 Jan 2019 21:11:05 +0100 (CET)
X-Auth-Info: JmipxuRlA0wklJ9+tR15uSXJuwAonQhCmS6K3A8JJYQ=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Jan 2019 21:11:05 +0100 (CET)
Date: Mon, 28 Jan 2019 21:11:04 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH u-boot 10/11] arm: meson64: enable console mux and
 console env by default
Message-ID: <20190128211104.24e5a7df@crub>
In-Reply-To: <20190115161759.1657-11-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-11-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_121109_256416_05D07DB6 
X-CRM114-Status: UNSURE (   8.23  )
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

On Tue, 15 Jan 2019 17:17:58 +0100
Neil Armstrong narmstrong@baylibre.com wrote:

> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> With the recent addition of the meson VPU driver, enable the following
> config entries by default for meson-64 targets: CONFIG_CONSOLE_MUX,
> CONFIG_SYS_CONSOLE_IS_IN_ENV.
> 
> This allows outputting the console via video if CONFIG_VIDEO_MESON is
> selected.
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
