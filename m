Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77C2C64ED8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gauEynN7ACbcItuZ0tg2rOva3ol6YtlfgZShaEOvNTM=; b=z1WVCYdt5i/VOt
	t+wXTxzA4YAqrNl3/pRWC65Ap6jIGpjZGbaVr43RhqTA28pqP4opEy97vn8OXzkLWO4FzihFJecXn
	zVa+PSobe8/DWc2yHfBUoMFjzr50fkOUzbd3vPGljMuYC/MkBiRwMvSQ4CbJZuaxZa753BgL/PAKg
	XRe88vz/9kHQvJQ966NHaBX2zNvCWc1X298fosVVAuBqH+7P4KogWWDfvkaBP+6vYlqQHtMu4Iai/
	e5X1f8WQyMPa0DI3gsmbNI9vD+r5fVjaPEidmuYiK91zb+Q/hDm9fZsUb1XOUOUCHypgiyPQqtpcr
	b+QfKS+FQICRz1MM/GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgV9-00ANhZ-NR; Mon, 27 Feb 2023 16:37:23 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgV6-00ANgb-EP; Mon, 27 Feb 2023 16:37:22 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1C89C5FD23;
	Mon, 27 Feb 2023 19:37:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677515837;
	bh=XV8j+HbOiRy1aa6d+0JDl+RpUDnhvQ0IDo+fq+PYfjM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=OL6DFWLWlPu1DV+ky2V9w8NQ5beb/Yd7Y5L0uQGbnq/G2l1Wy3RtMNUHPddDc7Fis
	 VSOeJ/6XxFtbZWgMR1+Mpnh44pnyXMe9Bn5xXPEbhSm5db9STCn858yMIA4hnNthp2
	 iO0hdfqpiJveJbmwPkV3+XsFj2ZPIssy8U0wdIH5Z0nkkkYjrAsIS1hWkhxqvW0daR
	 amhCsPLbOEwAFrXBsSQVEeKqNgmMPjPQL+2Fzad2CuNB7JFoXWUkivJrEU73+cWgJZ
	 3mqAA53SwuqPxxeh7EMNaqxlFUrM7t89r2wHA74xlRDDDufTdN+waJu+Ruuz+oec//
	 LAr4IpAbBRa6g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 19:37:16 +0300 (MSK)
Date: Mon, 27 Feb 2023 19:37:16 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Arnd Bergmann <arnd@arndb.de>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Alexey Romanov
	<avromanov@sberdevices.ru>, Rob Herring <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>, Linus Walleij
	<linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
Message-ID: <20230227163716.fxlczbqol2csumpa@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
 <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/27 12:14:00 #20900843
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_083720_849596_AE228B22 
X-CRM114-Status: GOOD (  23.76  )
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

On Mon, Feb 27, 2023 at 05:15:58PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
> > On Mon, Feb 27, 2023 at 03:58:50PM +0100, Arnd Bergmann wrote:
> >> 
> >> I would argue that is a problem with buildroot, and using a 32-bit
> >> kernel is not something we should encourage over fixing buildroot
> >> to do it right, or building the kernel separately from the rootfs.
> >> 
> >> We do allow building support for a couple of ARMv8 SoCs in 32-bit
> >> mode, but that is usually because they ship with a 32-bit bootrom
> >> and cannot actually run a 64-bit kernel.
> >
> > To be honest, I didn't know about this principle. It looks like a very
> > rational approach "start from max supported bitness".
> > Based on overall maintainers opinion, we have to prepare a patch for
> > buildroot to support compat mode :)
> 
> That would be great, thanks a lot!
> 
> For what it's worth, the main arguments in favor of running a 64-bit
> kernel with compat user space over a 32-bit kernel are support for:
> 
> - larger RAM sizes without highmem (most 32-bit kernels only
>   support 768MB of lowmem, and highmem sucks)
> - larger virtual address space (4GB vs 3GB or less)
> - CPU specific errata workarounds (arch/arm/ only has those for 32-bit cpus)
> - mitigations for common attacks such as spectre
> - security hardening that depends on larger address space
>   (KASLR, BTI, ptrauth, PAN, ...)
> - emulating instructions that were removed in Armv8 (setend, swp, ...)
> 
> Most of these don't apply in userspace, so the incentive to
> run smaller 32-bit userland on systems with less than 1GB of
> RAM usually outweighs the benefits of 64-bit userspace.

Thank you very for the detailed clarification! It's strong arguments.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
