Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5926AC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTnt160qlo+l70AX9zBOoe2gUNjSlIFxYUq92zfAdkM=; b=MDKL4qPCSPNE9S
	gS/5VO/jDMM32+kXujDZ4kNOn2fAE5wGNU+HCqLwkgt5UGuGNYuGorIFkQrVtzy8jcxc9uXoqHUHm
	O/SYZmqL+nLznruFYBCC3QfAWtnp0uo23boC2MIWgHtBg00sWT7qvkXlwdxUbivo0lcKa4FXkqo93
	F6J7KP5dSy/cFK9IGVtLRiGdD6Tw669WiROIRp5V5ESd2bIt13Ja0smfZDFNtsfUnBQCl+GOb8pjP
	WTMf54rgmsURxpBQOgH2DHxD0Ob3IP5MKKzSpALNaaN09/3OSauPol4GxByi3GP9z/VK3RlvggTpK
	BD3eAY4V1L71ESB6CqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsX3-000pQ8-Pi; Wed, 23 Nov 2022 16:23:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsX1-000pOP-Jf; Wed, 23 Nov 2022 16:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99019B82102;
	Wed, 23 Nov 2022 16:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37FCC433D6;
	Wed, 23 Nov 2022 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669220604;
	bh=RhLtqnmMaCbDvylZulq2NNvZV6guUhXmHED0yPmvTDc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CDkx4u4ciq3BJQ+mm7Hg+RJrOfVOZ8mLnMe5UDgBT5umauYr4s1ocwrbskk3oLPT1
	 CI8ApNBAJxPXL//r+MD6Y/MLDgNTMu36IYbsGYHWOAqsTdguLYCaRANygKr3Lf7v52
	 J/N4oD2PcxgzOOG62Z6W3avfWHf0frB7YHrdqOuj3jFxbBC0B6ur3HUWFPh/TVEv0G
	 x7yNLKcmMlwyhoGsW/307+ZzYMvB9yhJMBXpXE1v9zD3pSyVTfasndAiJ2UpwsLHaI
	 ZSfggbRftdwoflaotCdXjmOcXdeT4oW1cLAHxRm8GvNwp+r/nGxqMHMfDBEkYzqr73
	 aegCrILbzu1Bg==
Message-ID: <a7ee14ae-3bbb-bc8a-a118-9721336d72ff@kernel.org>
Date: Wed, 23 Nov 2022 17:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/4] arm64: dts: docs: Update mmc meson-gx documentation
 for new config option amlogic,mmc-phase
Content-Language: en-US
To: Vyacheslav Bocharov <adeep@lexina.in>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221110150035.2824580-1-adeep@lexina.in>
 <20221110150035.2824580-5-adeep@lexina.in>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221110150035.2824580-5-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_082327_827695_0A799154 
X-CRM114-Status: GOOD (  14.63  )
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

On 10/11/2022 16:00, Vyacheslav Bocharov wrote:
> - amlogic,mmc-phases: 3-element array of clock phases for core, tx, rx

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> clock with values:
> 	0: CLK_PHASE_0 - 0 phase
> 	1: CLK_PHASE_90 - 90 phase
> 	2: CLK_PHASE_180 - 180 phase
> 	3: CLK_PHASE_270 - 270 phase
> By default driver use <CLK_PHASE_180 CLK_PHASE_0 CLK_PHASE_0> value.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed several people.

> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> index ccc5358db131..98c89c5b3455 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> @@ -25,6 +25,12 @@ Required properties:
>  Optional properties:
>  - amlogic,dram-access-quirk: set when controller's internal DMA engine cannot access the
>    DRAM memory, like on the G12A dedicated SDIO controller.
> +- amlogic,mmc-phases: 3-element array of clock phases for core, tx, rx clock with values:
> +	0: CLK_PHASE_0 - 0 phase
> +	1: CLK_PHASE_90 - 90 phase
> +	2: CLK_PHASE_180 - 180 phase
> +	3: CLK_PHASE_270 - 270 phase
> +  By default driver use <CLK_PHASE_180 CLK_PHASE_0 CLK_PHASE_0> value.

No, this has to be converted to DT schema first.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
