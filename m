Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F99BC64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/5j6X6/ZYr4VYFKpZFrU4Zn+k/rbloPzsutN/KtiaI=; b=FmvSHn5XLo5xuv
	OpD0gP2gSORgA/0lmEeqWIEwDBAVIr7Ep+ekeBE4XGqK/xmpQlXC7mAzFz+YTJ/wjIxIRii//YaDs
	VfAuEfwRqSv4Rs1bgkVfOqoOxaBrgE6+IxGtiTgdT3gdijtDLq/PrwnswlxYEi9ohqrjfNPl9oZ2U
	A1NuqMbpGVqmNvcXXeX6IsZirzkrBEoaeOksKsJZZ4LSjutlfvBHlMMwOOfTMnuv/kS+zx6SKM8e0
	zAIVWwCfS3N1EW+AuncBEoJuXahFK0LrPspcEZlhk9/YyvuiBTuiVH36tolsl7m+SDQo3J0jP/xoq
	UaNbnHBYXHmPp/KnPvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgAv-00AJue-Iy; Mon, 27 Feb 2023 16:16:29 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgAs-00AJsl-8P; Mon, 27 Feb 2023 16:16:27 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 3AA09320091D;
	Mon, 27 Feb 2023 11:16:20 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Feb 2023 11:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677514579; x=1677600979; bh=gyEHnWGhDf
	Ft2Gu4gB/Bqdx54bxIG396QI5JbNzq7aU=; b=eRTtkeH3NgJCjy1to2Uusv6Qp/
	Nygkb915sQzycJJtLrfWs6aOhC3aNr0tQYVmu4VTcEJYz4xTMSEApRwPXmOJ2lzA
	Sheu2vj4jyFJC/z3vb6aiI1KrLbs0/mJbAZbqmM/UgukR4Yn8OUDIi11yB0Ig7LW
	HcGL/LG+d5XmfYOnCAA23ZhaLYIbRyVJ/nGFjUcC1912Y7izj1FO1YTxvZ59YAWr
	TbwfowaTngAr9LHF2qNEAQmvPJpHLILqmo8HNtfbipUSzV2wVvozEiBhIN9Haebo
	zpbIKm8kvHKF4nYqdNX0KvQzl3xUlMfzyXEm8Djg5WiQTPQkJR3Bksn+dNkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677514579; x=1677600979; bh=gyEHnWGhDfFt2Gu4gB/Bqdx54bxI
	G396QI5JbNzq7aU=; b=svhAJi84rKRyvhhozMBsXMvg6qI/GYqiFTpIKRvDAqjw
	n98CxMFl7OYokOoyd3J6H9j/ZiH2VTbvVAWwPaP60Z+J+Vsq+C3OYp0jGBCUAYdE
	k4GMSwzvx37hEv7e1kkI/mZXxwMjCbAk/tLowT0QBE3+hCQLImqMTsVT6En+tkyU
	bt1lMWLKwJ5J0FL5WKQ4cVLfJewGfzhn9B13flGAl2J2A+L2LZgBQcyO1CbjbJaC
	CCpMiweOeRQjqNEJG+Rvuqb29mAaXx9mZB6Cez4JZToCw+K41uKdDXtURBt3Sygq
	wrscnQxhqetCXiw14qA9gAsY5GLg4eWWYQu9TaUXBw==
X-ME-Sender: <xms:Utf8Y-FOyucHm-41KFBp0YzaKK8ynadWnWt4znVCo9OlRDcKwmmgAQ>
    <xme:Utf8Y_XXY5Hb6Hkp8_pom-ELkmg0XrSJXjuajU4_JKkffD0K81D3BKtieRtgn2Es3
    3Cc6cYcBN5DgsymRec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:U9f8Y4JpxR4zmsW0albUDf-0duNZYbOkUWz0jzOtJdwkGSrYZd4p7w>
    <xmx:U9f8Y4EklLudLiEmcV9xrE9OyR-XD9QMTw1TynXiGsj-YfHPs8v7KA>
    <xmx:U9f8Y0U1D7jCEdezc7CtK4Kym4v2cMOdFSsXc8U69txsfTN0Yh0Ofg>
    <xmx:U9f8YzPuLTFjjbJ4FfqrQstIEqYX9-oK28Jxa0mK9rkUXjYxsL1G-Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC7AAB60086; Mon, 27 Feb 2023 11:16:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
In-Reply-To: <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
Date: Mon, 27 Feb 2023 17:15:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Rokosov" <ddrokosov@sberdevices.ru>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Alexey Romanov" <avromanov@sberdevices.ru>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Kevin Hilman" <khilman@baylibre.com>, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com,
 "Linus Walleij" <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_081626_348208_4A25E042 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
> On Mon, Feb 27, 2023 at 03:58:50PM +0100, Arnd Bergmann wrote:
>> 
>> I would argue that is a problem with buildroot, and using a 32-bit
>> kernel is not something we should encourage over fixing buildroot
>> to do it right, or building the kernel separately from the rootfs.
>> 
>> We do allow building support for a couple of ARMv8 SoCs in 32-bit
>> mode, but that is usually because they ship with a 32-bit bootrom
>> and cannot actually run a 64-bit kernel.
>
> To be honest, I didn't know about this principle. It looks like a very
> rational approach "start from max supported bitness".
> Based on overall maintainers opinion, we have to prepare a patch for
> buildroot to support compat mode :)

That would be great, thanks a lot!

For what it's worth, the main arguments in favor of running a 64-bit
kernel with compat user space over a 32-bit kernel are support for:

- larger RAM sizes without highmem (most 32-bit kernels only
  support 768MB of lowmem, and highmem sucks)
- larger virtual address space (4GB vs 3GB or less)
- CPU specific errata workarounds (arch/arm/ only has those for 32-bit cpus)
- mitigations for common attacks such as spectre
- security hardening that depends on larger address space
  (KASLR, BTI, ptrauth, PAN, ...)
- emulating instructions that were removed in Armv8 (setend, swp, ...)

Most of these don't apply in userspace, so the incentive to
run smaller 32-bit userland on systems with less than 1GB of
RAM usually outweighs the benefits of 64-bit userspace.

      Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
