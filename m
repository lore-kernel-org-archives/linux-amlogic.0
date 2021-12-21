Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42980C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2lJIdlVl1DQgnvyt4fUr2jF+Hfz14O04L7URY3aSJs=; b=IsKpm2j7i8wCul
	jsjYN/LWRquB8Mtw9ADMg5Ii6ts0CArCIXRhEekMtJsBehtCeW8S7/OIQw9Dsd/SYqoX4EMVBZPU7
	3ubMqFXcebIuTnzHiSqMC5n7UIn8WrWFyrKxHczhFm0M6mBxUAuZNeCVk5pYKTaOBbtO5liOdPwqz
	C+Hz5bNe0SSvxtt1t49Xfxr/fY2wjffkAe8gmooR73tB9Kmep3/8GVrPsZSUNK78kZeBGcy1BBDe7
	mdfnhFV/72lC2Gfn60PHKnqbrifsWhOnmVhDJBbInX5dqIjYgqHb0ycAqnG64FtKijxubKh+BWBQm
	3sZ5N0R/GIRtTt9U253g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzZc2-005mFO-D5; Tue, 21 Dec 2021 07:31:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzZbz-005mEH-C2; Tue, 21 Dec 2021 07:31:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD28361425;
 Tue, 21 Dec 2021 07:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF9DC36AE7;
 Tue, 21 Dec 2021 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640071862;
 bh=CNeQD1UgCcyk9OiMA9cYBMpngp02cKvoagD3hTeIwiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Azhs+JHNZ37JDosMNQkxDfvhzLkRxssGF6G494z3+bQk3e3ZkFFUbq3vex4IT/Rac
 O4Yn0Hda1++RQksqcMyuEAZMOr67wYFboaz0ucD3Q4XvCGlph1FvJAxWEnhZGLtYjk
 VdNLOOUhlgf1I3WCMbR5ieQOVdpOfdn7ZNn4jZeM=
Date: Tue, 21 Dec 2021 08:30:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/3] the UART driver compatible with the Amlogic Meson S4
 SoC
Message-ID: <YcGCs1LYqXNnQwsF@kroah.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221071634.25980-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_233103_473147_9C090C5B 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, Dec 21, 2021 at 03:16:31PM +0800, Yu Tu wrote:
> The UART driver compatible with the Amlogic Meson S4 SoC on-chip, change the
> UART interrupt interface function while adding IRQF_SHARED flag. And add clear
> AML_UART_TX_EN bit in meson_uart_shutdown funtion.
> 
> Yu Tu (3):
>   tty: serial: meson: modify request_irq and free_irq
>   tty: serial: meson: meson_uart_shutdown omit clear AML_UART_TX_EN bit
>   tty: serial: meson: add UART driver compatible with S4 SoC on-chip
> 
> Link:https://patchwork.kernel.org/project/linux-amlogic/patch/20211206100200.31914-1-xianwei.zhao@amlogic.com/

What is this link for?

And why patchwork?

Please just use lore.kernel.org links for mailing list threads.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
