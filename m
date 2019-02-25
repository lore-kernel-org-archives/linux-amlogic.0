Return-Path: <SRS0=jntJ=RA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC0AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Feb 2019 09:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBC920842
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Feb 2019 09:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JRrE4g08";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIa7EFes"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBC920842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liR4iZOBwWi6orEoUYh4jJTlwBKV7di9IZ0N2vqkC1c=; b=JRrE4g08UNTn18
	pDc34cHhzuCHrXRFEbOXK5q4tuHi75krkwoe3vjaVIuTI3m3noVECMMdmLsPUmL62x6SpXo00127l
	mnx2JhbYgWCe0y7UEWeisMVFom4o3DpvPmcDRIdyWZJ0etvXOocMySna569GqjVz1VrtaOwk90Pz4
	g5FuUdnGx4LSnARIHx2ppO8iPbOdNJNK7XJgwBOEoL+AIs9EPleKCsT11WFS5weY/pFVsA1/fLAGg
	uxWy5r5ZM8wYDHNIwB7/zqQD6GmjUOHViDaZDeJeDTadUdqM5r1KCsA6j0eGBtnA4kTbczZBfAWbV
	6bqc7uJEQZjdOw5hSXag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyCVq-0006kM-4d; Mon, 25 Feb 2019 09:25:26 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyCVm-0006j7-Pc
 for linux-amlogic@lists.infradead.org; Mon, 25 Feb 2019 09:25:24 +0000
Received: by mail-it1-x141.google.com with SMTP id v83so1104777itf.1
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Feb 2019 01:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWodExgLrJjQ1DyALh2sOWkpHSr18H4ukE8pkhwaBNA=;
 b=FIa7EFesFjY/RPh87ZYG7wyKudGRJ8NkwS/zmozR9IYZbPRhqApaRsmEHQECvBjD8G
 G2jMXAjMd8JPlbNOHHWOzb/wuLDte6bzy1ChP6QbiHKR3v4GEoomBjxCu+agyGIRjM0w
 sGewTKYSXFj39DsJG3eRd9n+d64levgjlAiWhya7s25z3pNFJkSuo5mNrsXBCIqEyLcn
 015N/1aGpQZVz1VkMLZQS04T8AOTzQtrYn2EIHc4bdDsfCH3oaUmtUnQ6/a66uyykb8z
 LZAQJR1kwIiHiYJ9VbzHV7VjQQljQp2dQNnfih9lVzmY7+RGI0FKk+IPRAQlOw95IH7b
 SbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWodExgLrJjQ1DyALh2sOWkpHSr18H4ukE8pkhwaBNA=;
 b=Xg6ui468sAVBNvc5kdK6QD0PGDOK/fdGwpWL+heLilwtI/jGZBWh7UCDfyeMrxc8JJ
 8eocawoOwofgzQ7LroF7P+FsnpcraMQI4huyA08Ftn1Bczxvj88YCGrEu03lQjkMW9Rm
 CoH2r0fi/2Z2yXr6yvJHUJnlMfJakgD4M+5fhiKarC3TdYU8vi9C0txf2cg8g9hglCdh
 HU5mD++k+a987mCFutnvrVlE2cLi3x2dci9F0MH4ohnkkdbgy/OOqTPcYEpqnoRD4+Cp
 en61A51/QGIPYCVhzUIGJVf2P+h0SjQwZ3zR2qjO1FLANoDQJZ7s/D5wJtmE3+DSUeGz
 hbSg==
X-Gm-Message-State: AHQUAuYi6aRLlKlYzz9/wbazx7/sSxcBya7h+EidZnKcmHHR+eGTEW/h
 zGtXvZQ/ZVb+IJt7fkxx3cysJlNBTGXl7FABBWQ=
X-Google-Smtp-Source: AHgI3IZTbSVkwSg2njOHkx5tmRaeyGpyEIeWQ4H11d3Vi0rX+MU8yuNdHd5/iLpB80LNrSLPQtjgDsWJCAC2sZKK0NE=
X-Received: by 2002:a24:13c4:: with SMTP id 187mr9723193itz.130.1551086720887; 
 Mon, 25 Feb 2019 01:25:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
In-Reply-To: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
From: Piero <ottuzzi@gmail.com>
Date: Mon, 25 Feb 2019 10:25:18 +0100
Message-ID: <CAPo5REHZ5GA3TDKX-KqEoz2wmrNZdVWyP9waB9jNNo5bjjOzwg@mail.gmail.com>
Subject: Re: 32-bit Amlogic SoCs: avoid using Ethernet MAC addresses
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_012522_858754_475F4ADA 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: linux.amoon@gmail.com, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

  in my experience using armbian (so a different distribution) on
odroidc1 I see the mac is changing every time I do a new install but
it is kept constant between reboots: so it looks like something that
can be handled somewhere above the hardware-kernel layer.

*Ciao
Piero

Il giorno dom 24 feb 2019 alle ore 21:55 Martin Blumenstingl
<martin.blumenstingl@googlemail.com> ha scritto:
>
> I have seen Anand's your question in [0]:
> > only issue is I have is the each time their is random MAC address so I
> > get new IP from dhcp server.
> > How can I avoid this. I have tried to enable eFuse driver but with no success.
>
> u-boot on the 64-bit SoCs can read the MAC address from the eFuse and
> pass it (via the .dtb) to the kernel.
> This requires an ethernet0 alias in the mainline .dts though, see [1]
> for and example.
>
> I'm not sure if this also works with the older u-boot on the 32-bit SoCs.
> if it doesn't then there's a nvmem-cells binding for all Ethernet
> controllers: [2] (please note that the function implementing this
> binding was recently renamed: [3])
> as far as I can tell the stmmac driver doesn't support the nvmem-cells
> based binding yet
>
> Anand, if you want to work on this: feel free to do so!
> I have the SDHC MMC driver and a discussion about the power-domain
> drivers on my TODO-list, so I'm pretty busy at the moment.
>
>
> Regards
> Martin
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2019-February/010464.html
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7c36209c46c4d162202b65eed2e66962ad8c3c1
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9217e566bdee4583d0a9ea4879c8f5e004886eac
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=afa64a72b862a7a9d04f8d07fba632eaf06b23f8
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic



-- 
Stupid is as stupid does.
Forrest Gump

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
