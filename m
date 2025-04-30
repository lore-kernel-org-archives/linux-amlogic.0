Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED16C3ABB7
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:To:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHT0Gp9yZVHoFgDhbWDHeMqjeYhxNjSLnC7jlCxMw5k=; b=fS3hQAinxAsEUc
	yvLOlIruUEhxtpV92BW34YrYMlHoLRucE9Aht8MGwWFzRbK7Yot/oLfKdUf9yqjA7d6eXCLPlqwFZ
	rAK31W7r9uIrIXU+JQhVIBbKt8K27Wvg/YP5hALIkynIbLIibLUTNOKTtiCPqmR61AzBlGxzpVb60
	kaCdKZuwFWzXPPkqdpv6l9If//cu/Tc6K0Qubght71gID2w+yW0m2rx9dm+AEeLtWoj2AS6pPzxn2
	fgPxapuRuY3zlVRaVIk72NpaA4W3ZCZtjss0jRMN8OkmBYcuCjcKmzxZkrnh4jLys2v1gT18Rohgw
	mALBeAiuI/pBzpZ+tmbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60U-0000000Cjv4-11nv;
	Wed, 30 Apr 2025 11:53:42 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5XF-0000000CfQ7-3axF
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Apr 2025 11:23:32 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746012205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oM2zbKt1/qIyxTawQZGhnPddYmnxVZavyO2Gp5Yz0XY=;
	b=HhGTIWj0Px6eu36xrjuDQqwaSQPd30dlubr8MyZ2r/dpTxjpgXJ3pWRBsOZ6AQhTW1hX2M
	2i7v22zl0cbkb64JTNhnEWNxg4A/mA3iyfv3RpmYm9q6gh1B7gE6aqcrGFnbBO9VK1lDcm
	tT0jq1uuKUhjuq2ut2FxuoRcJ+Trp/uCU/QOlmGGpFDHoN6L0ijUlZyXfPYCnDJNZIoy5K
	0HY+UPWh5ZIm2cyakQJJPUjIVCUwNcTKTUL6n/zYXnOzujiBkAlC78uPlD2/i6N3iCjNKg
	UephXnYM41ynRjMrBfzPIuKZOp8pPOh8ScHtsmUPKlwu3J6ot4FUFa3ekm3m3A==
Date: Wed, 30 Apr 2025 11:22:59 +0000
Message-Id: <D9JXNU6TFEYQ.3T8YQVP6V6LOR@postmarketos.org>
To: "Jeff Sacksteder" <jsacksteder@gmail.com>,
 <linux-amlogic@lists.infradead.org>
Subject: Re: AML-S905X-CC-V2 emmc issue
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
References: <CAOgeiBY9nLNS8==Z_d4PQQ-Quyp89dSD83ZmuGHOMkFXmd=AWQ@mail.gmail.com>
In-Reply-To: <CAOgeiBY9nLNS8==Z_d4PQQ-Quyp89dSD83ZmuGHOMkFXmd=AWQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_042330_589028_0F786434 
X-CRM114-Status: GOOD (  17.94  )
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

Hi,

On Tue Apr 29, 2025 at 6:59 PM UTC, Jeff Sacksteder wrote:
> I'm having a problem trying to install Alpine Linux on to a Libre
> Computing Sweet Potato AML-S905X-CC-V2 and I need some clairification,
> if someone has been down this road already.
>
> The sd card is detected, but the optional emmc module is not(per dmesg
> and /dev/mmc*).
>
> The suggested distros Libre suggests work correctly, so I know the
> hardware is good.
>
> I don't know if they have magic patches, so looking for clues
> elsewhere, the current Gentoo image for Arm correctly detects both
> devices.
>
> The first obvious difference I find vs Alpine is that they include
> PWRSEQ_EMMC compiled as a module, while Alpine does not configure that
> option at all. My operating theory is that this hardware needs some
> bring-up power negotiation before it is available.
>
> However, since I don't have a cross-compile environment available, and
> it takes 35 hrs to build a kernel, and the Alpine build process is
> convoluted and weird to me, I would really like to know if that single
> option is the solution. Otherwise I face multiple 35 hr cycles of
> building and testing.

Last time I tried Alpine's linux-edge kernel (was on an S905 board), my SD 
card was not being detected correctly either.  I also suspect missing
things in the kernel's config.  For reference, this is the kconfig
postmarketOS uses:

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/4c0787f38f74a089f1140f85ba980da91fc48016/device/testing/linux-postmarketos-amlogic/config-postmarketos-amlogic.aarch64

No patches are required to get the module working.

When I tested it, the eMMC module works perfectly fine on all my Libre
Computer boards (alta, solitude, lepotato, lafrite).  I've no doubt it
should work on sweetpotato as well.

Cheers.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
