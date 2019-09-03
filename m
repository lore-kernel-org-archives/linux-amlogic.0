Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A21C3A5A7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 13:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6E52053B
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 13:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hKiMse38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6E52053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNF3R9B14qN0EqBq1W3XAHaaJBv+xn0GF19SyY4fprU=; b=hKiMse38LcdUIl
	Q0d58utKAFMNSbn1JvswG3J7ZQZsdW47dmsu3Bc2P5xjGs7YC5pmxXXdQbxEjosH2MCiz8+PujFNw
	wRerQNwCZOLtNzHhMT7BGQyIgWtxwNvHYUmKDaCTnFh0XlgJDteCzWviikoaqgPFGedoBZzzvu3e4
	Ktvply1TMpYmnIu2QdIz63x3K+eB+2sp9moIvyst8Wm2TAkF3PG2SIX3ef6PBz3zchqaTMTc4D8Ew
	k5AvIMzExlF27jCHjFFapLQS8fqUcx8mrLYPPydAq95A1l+4Ov7LDx/Z17gOl4uWqF7s9mpszMwED
	xTUtTBZYdLp7hylA3MKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i58dz-0007NO-BB; Tue, 03 Sep 2019 13:14:47 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i58dw-0007N2-Hy; Tue, 03 Sep 2019 13:14:45 +0000
Received: by mail-qk1-f169.google.com with SMTP id i78so14382608qke.11;
 Tue, 03 Sep 2019 06:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vybxxlQWuJ/jiGHHBw6oBxGhkxzzryk8LPYF0tIqjjs=;
 b=RPjfJhL35HkuxPEq2/saILSpzH8xTp8AJwxPpsM+WA+lYvlSkn3Mqp/EWT4b8wuNRE
 KbQpQFzaZm5ivPHf5bmlwgSWFLmMBNQDQ1w2rVhekM9m93duCCDMoprt32hVjH2uRmij
 7nJPmKKxPcrrBVuzMS07B9uYAf1TUWrkrg/mrCpj2i+6vWqCXF/yjWYbUDCGzLzkBSKP
 MgUWZJlNqaTuhiLiqWNJCPf/7ZP+NvC4H8/91Rq6P3Z+Gn0vkLs8vQKGbD5Vbaw2wJ4a
 pJqli2sfpCuiVvP8Rd7AwZhudawEaWM+3esYK2wNtyBk8dJ4bcxeqdJ75lnJR+4Fb0V+
 N+aA==
X-Gm-Message-State: APjAAAVb8ZON8cLFSw3vzVu6JLpsB/NCSN88Dcp4cp2ZDUIL4HRn3kMB
 RZAdgviNa5dzAUTq5BDx7qHsHODHsvZRs6mXQyc=
X-Google-Smtp-Source: APXvYqx4tXna6Ix/f7NwN5KM2PECS0XZfHrcOq6jtLkNuD3hUL7g52tj7TUW130t4hrQ2phG8LMp33K4Zq3cAjP1n6Y=
X-Received: by 2002:a37:89c4:: with SMTP id l187mr6356337qkd.286.1567516483487; 
 Tue, 03 Sep 2019 06:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <7hzhk3bi96.fsf@baylibre.com>
In-Reply-To: <7hzhk3bi96.fsf@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 15:14:27 +0200
Message-ID: <CAK8P3a0Zfz8+njVfj+G-O0zPyusmGNzHUypH6VAKDKCJbw7ENg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts: Amlogic updates for v5.4
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_061444_597798_5691FA83 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 12:10 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> ARM: dts: Amlogic updates for v5.4
>
> Highlights
> - odroid-c1: use MAC address from efuse
> - add VDD_EE regulator to several boards
>
Pulled into arm/dt, thanks!

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
