Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B0BC64ED8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwQVFi+MOKP7OeTg6DU1rOU5pM5GUEcYs67D8swXL7g=; b=WqgcLYvxco93l5
	X9YXQEmFZRKPKzsK5i7zahTr9xcPsf19CSIiJhZN3Gd3MrQdNqYrpZ0aXo+QBS0fYUcaAU3I8lOj+
	CQklxUBL5r4gqVg4eA1JmKTQbEC96gcgnH744hBXncBOX0MBR4qKaCJlaVOaQ5DmBQqzfp5cdMoh/
	xW21ex4kmFkXWKP5ocMdwUbMA6ejZI24jGiGh6bW8o6qd86icWODRzOTWc8igtSxPeGSI1eeX4t8P
	hSvvW/oJP88sXXLLwLJTtimV9odMU6X9YHkYFIwQMtCB+bGgmd2fSLOJL3IeicIautdgNbQU0Z8+J
	dvGo8IIiiws9M+6l8/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWfmR-00AFc5-Vi; Mon, 27 Feb 2023 15:51:12 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWfmO-00AFaB-6J; Mon, 27 Feb 2023 15:51:10 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 429E55FD19;
	Mon, 27 Feb 2023 18:51:01 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677513061;
	bh=3NB9Zg77s2V7JybNtvo3+pUvISAkjx2ar52mHE6m9LM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=aisrcImdj/tfvNXRxaJn1zZcbN69p/PRhiu3yzK8Tze0Mz/BmWPD0ZWvAVz+5hTq7
	 UqDGSF6wO1yM9MeQ1P9sO7eD4mI3QSt/FteDeQRZLWkCLdGL24qF4OVyGW2Rm0MtkA
	 cwBuyO8phnRG+Ai2e2BxAh1IjNDU1lAkf7Yj/7OxAsKwJX2cq1v62610SjR52W71JD
	 hQmSthvuH3J8Flsr7n622cZcgehMj9jRpktsDzJrYKg5h8cmnA8IT4PGPoSnrXUcI+
	 0P88nnY7yxN+o8KQIT+vcOc16XbxdFsaZym8rN8oX0XQRjDBWUzUPkdWg8DOsM2io0
	 KkWfQuYVkSE5w==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 18:51:00 +0300 (MSK)
Date: Mon, 27 Feb 2023 18:51:00 +0300
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
Message-ID: <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
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
X-CRM114-CacheID: sfid-20230227_075108_602542_788ABD08 
X-CRM114-Status: GOOD (  27.93  )
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

Hello Arnd,

On Mon, Feb 27, 2023 at 03:58:50PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 27, 2023, at 15:28, Dmitry Rokosov wrote:
> > Hello Neil!
> >
> > On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:
> >
> > [...]
> >
> >> I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
> >> of memory, but those processors are ARMv8 and the arm64 arch code
> >> has been designed for those CPUs.
> >> 
> >> So far I didn't find a single good reason to add 32bit support for
> >> ARMv8 Amlogic based SoCs, if you have a solid reason please share.
> >
> > I totally agree with you, but I suppose it's fully related to 'big'
> > Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
> > a cost-efficient dual-core SoC which is used for small, cheap solutions
> > with cheap components. Every cent is important during BoM development.
> > That's why usually ODMs install small ROM and RAM capacity, and each
> > megabyte is important for RAM/ROM kernel and rootfs footprints.
> > Why am I talking about rootfs? For such small projects a good
> > choice is buildroot rootfs assembling framework. Unfortunatelly,
> > buildroot doesn't support 'compat' mode when kernel and userspace have
> > a different bitness. In the internal project, we save several
> > percents of ROM/RAM free space using 32-bit configuration (mostly rootfs
> > ROM space, to be honest). Therefore, for such 'little' cost-efficient
> > SoCs we can make an exception and support 32-bit configuration, from my
> > point of view.
> >
> > What do you think about that?
> 
> I would argue that is a problem with buildroot, and using a 32-bit
> kernel is not something we should encourage over fixing buildroot
> to do it right, or building the kernel separately from the rootfs.
> 
> We do allow building support for a couple of ARMv8 SoCs in 32-bit
> mode, but that is usually because they ship with a 32-bit bootrom
> and cannot actually run a 64-bit kernel.

To be honest, I didn't know about this principle. It looks like a very
rational approach "start from max supported bitness".
Based on overall maintainers opinion, we have to prepare a patch for
buildroot to support compat mode :)

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
