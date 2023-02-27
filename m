Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B801CC64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+oPNxc28QDC3L8f1msuzvb4QlyNE+PtfBaJb5hLzCY=; b=KyfCq9ZQ7OBsXH
	xtNED6w98/f6ckxM9tn8b8qD8WlkWvsFDVR87pkbZmHQiW3oApBAsiBXQmcBhYYfktRXdp6jxbxqy
	wgYG9UnpAK+Se7KEcDyJb85xmP33ipJEOUZKVD+PZzp7vSU47xyrKWsDlY2DBGpv2qhcbJsN5VBcz
	UyCBqiF+4N7kbGI35BwM+InKAlqBFGTJTuZJ3I0MiSt50qtWH7fg1cbb3XVAPJBb5dkHnFL1raNql
	B6ghU/7ex0cW2Hu9VJeW4Kes2PKfc3UsE2VRHXnbyJe0Nh0Zru1ECzSE3ICb/p5e8qAlEtKudL6Vk
	+muE3SdrgYmn5VV4KM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeyZ-00A6kU-HH; Mon, 27 Feb 2023 14:59:39 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeyF-00A6Uq-6L; Mon, 27 Feb 2023 14:59:21 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 0190B3200929;
	Mon, 27 Feb 2023 09:59:11 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Feb 2023 09:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677509951; x=1677596351; bh=QLLRw6307b
	THJCej6Dsg3/3/0PoBqWfSBSLn7yYLifY=; b=Zr7hsxRaft6qOSczlEXCHedPV+
	r96EXTSibv+H/UWEsXhc838Rejel7LOs9McoeemUQo00cMKwz/Ed5Nnwz80d9sVW
	je5164z2h30FqrLYmvRXXPwQgS2m2IzsZmiysTm3fFl3Nns/iQutYYeNfrDcZjQ/
	CRGvO1UzHD/4Ho1rFUPnWXNyvMc7gfocah5yJMoAs7H1YEVa7XzR1h2xJHC4yf6Y
	inirBw7UpfTMs0pS+sVjyzm436cMponYakuUj+R+mMjYJbFYFp48fGiEVTnq2LW7
	tQL9phYkwCsCz7FCLDoyO26o2vHQIHvptMeCaWP1m/ZtFPHaGWP1g5N05AsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677509951; x=1677596351; bh=QLLRw6307bTHJCej6Dsg3/3/0PoB
	qWfSBSLn7yYLifY=; b=fsQrMtN9T2DGoyaRs2G7JF87rgV8mM8aLVOlz+saByM3
	ZIoe5+10++ITaYkrYcKL3rZxQxIQ9wqQsuwcrPQLy5+6M/kYMoKkCYYzVFZeW5sF
	a8W6fbZ8pjS2VoZM/nhuvP8YoHKkkPEOknEZ1w2jfIxbwGqThrQS8QKmPMXdARWH
	BfM6XWOW6tcAycp0BMLkzikexwLlUSOVtIWaB01EmMeko2g09es/iMA42KsJN3ub
	xRmZCqzl3OuCzisFPtgWKJgkoGjOrHeBSRliEOTqVZ5bezEhFM+c39ln+o+Sh9HD
	18yVa1PeI6zzIDLfvBLn+JwUQrY9m+BsXTrC4WcDlA==
X-ME-Sender: <xms:P8X8Yw4R4tyM3Di0n8tiuJ22TZFaHDsvUVxJeObM48lCS9S4i2vjYA>
    <xme:P8X8Yx7zcUxANilRbGReT_Or2RzHkKwzIuwVYx5_CIvIF5SNgvybasN82WY0ys6f3
    VC9m_V-A-4sUROu784>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:P8X8Y_fP-QcbqSDT8-z_TnywZc5LWpabQqZt1sXiQObMaGazkHi2dg>
    <xmx:P8X8Y1LizARy4cFAaLtRXks7BHS0HzyvGKQNes_7WJ3OCW8jf7GcNg>
    <xmx:P8X8Y0LNbRpd64Tjs0XuOsTjbGumTnge6ox2WH2rF0jyWbI7TAZWZA>
    <xmx:P8X8YyyTHLvhXZ2BQor-9PqVOVIs-c8G2phPueuDh2RdqE_v0YsYuA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 50F53B60086; Mon, 27 Feb 2023 09:59:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-172-g9a2dae1853-fm-20230213.001-g9a2dae18
Mime-Version: 1.0
Message-Id: <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
In-Reply-To: <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
Date: Mon, 27 Feb 2023 15:58:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Rokosov" <ddrokosov@sberdevices.ru>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: "Alexey Romanov" <avromanov@sberdevices.ru>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Kevin Hilman" <khilman@baylibre.com>, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com,
 "Linus Walleij" <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_065919_779408_7A19D180 
X-CRM114-Status: GOOD (  22.75  )
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

On Mon, Feb 27, 2023, at 15:28, Dmitry Rokosov wrote:
> Hello Neil!
>
> On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:
>
> [...]
>
>> I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
>> of memory, but those processors are ARMv8 and the arm64 arch code
>> has been designed for those CPUs.
>> 
>> So far I didn't find a single good reason to add 32bit support for
>> ARMv8 Amlogic based SoCs, if you have a solid reason please share.
>
> I totally agree with you, but I suppose it's fully related to 'big'
> Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
> a cost-efficient dual-core SoC which is used for small, cheap solutions
> with cheap components. Every cent is important during BoM development.
> That's why usually ODMs install small ROM and RAM capacity, and each
> megabyte is important for RAM/ROM kernel and rootfs footprints.
> Why am I talking about rootfs? For such small projects a good
> choice is buildroot rootfs assembling framework. Unfortunatelly,
> buildroot doesn't support 'compat' mode when kernel and userspace have
> a different bitness. In the internal project, we save several
> percents of ROM/RAM free space using 32-bit configuration (mostly rootfs
> ROM space, to be honest). Therefore, for such 'little' cost-efficient
> SoCs we can make an exception and support 32-bit configuration, from my
> point of view.
>
> What do you think about that?

I would argue that is a problem with buildroot, and using a 32-bit
kernel is not something we should encourage over fixing buildroot
to do it right, or building the kernel separately from the rootfs.

We do allow building support for a couple of ARMv8 SoCs in 32-bit
mode, but that is usually because they ship with a 32-bit bootrom
and cannot actually run a 64-bit kernel.

The overhead of running a 64-bit kernel is usually a few megabytes
compared to a 32-bit kernel, to store the larger kernel .text/.data
segments, per-thread stack and page tables as well as 'page',
and 'inode' structures. I see that A1 only supports DDR3 and DDR4
memory, so I assume that there are always at least 128MB
of total RAM available, or 512MB for the most cost-effective
size with a single memory chip.

My feeling is that for the 256MB configuration, it is very hard to
argue for a 32-bit kernel because of the countless downsides,
and even for the 128MB configuration, I would still try to avoid
it out of principle.

      Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
