Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15432C43612
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 09:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB32420656
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 09:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPPpBYaz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq/Tfern"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB32420656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3L9fnGwzk2jebsjfrjZuZltQ485YdoKTcxqn8P0lRUc=; b=IPPpBYaz/AtZbu
	mdSDRw9Odda/NAqWpktrb0mFkhptUBTaXYD5f1RW77TASukfmIj/q55kYHIHF5Er9HNSB8PwnxUf2
	1YjuLJVMnKFH01lX7WlYl2qxGcmXynPH2JLT4hcOJ+DWxNfUOE5oYGk09KjSS2sBWjTyilRcrOrvG
	t1bbkbjTZqDdU/Cf/gL9Tc/CMggiDeqhl4yLzoJj+0eDyhHf9yVaBfFmboP+/UaJB7C9obwPr1ugl
	K6C/mjDGW9QEdMuqD07bOtMIVGgt5304gWRXsQr0SHEwrIJv1ax6WcifVeWuKGE1t0ZZojxswAvpU
	9VB8nub2c4s8W+9OHPIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1giyxf-0001Za-6k; Mon, 14 Jan 2019 09:55:15 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1giyxb-0001ZF-Vk
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 09:55:13 +0000
Received: by mail-ot1-x336.google.com with SMTP id s13so10271141otq.4
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=D4RbSyoLDCNJEOvhjcz7f+Ny9nXLFzKdBXzkK8hPjPg=;
 b=Rq/TfernUBtqTCjzGdN2uznHsACgJeYPpv5tRQ07BbWsFj+HG3umUTGod+SeXl3NkY
 qsHzA4ZrdX8djNZlMVYPaP67LbElvK6NkV/dJbo/lrgfpjMnuhckZc00vEQBWPnDOYpC
 r5116q+z5krGKwCbI8DqIQe+nKEd0WeVyx4tEsdWa/PMQ4OxoTjLMgfmyjFX4dw8p9Ly
 0NB8VOddmnOBXUcrHTTnombT6Rbpwk1C24K3atBtd7UXI+p5jyI4/vRXE1vs9gbRcEbn
 Ytkz4ktDPAlIyF7aS5FBgHjO/K26+hxZp73tf3b6z6601NQhNk+/XWA1WIenVTqNAGjL
 VT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=D4RbSyoLDCNJEOvhjcz7f+Ny9nXLFzKdBXzkK8hPjPg=;
 b=GxY5sJim675kR8uuve/MjOY6WId76npuXatmtStBliONEx5Emux1WGErkxBaOJmI0k
 lSOYBuk5ff86DwIs/dJrFJMvFIKcYpCi3jHo/spm/FohBcQzSnrsmH94JTQODpTg4C+L
 R3aMUk8ws8682ljuyDprsDhNVwZFYW47jouyRFb3K3wz0vp4ucq9jAtTcWHOnciaI55A
 ncp8zfa/yespnvPa00V4V9NuPDhH0iq7lJUb1B0oEn56anZbpgnW2P1pnX+DyZadW439
 oKrTxv5IruIKEKBBDWV/b9LbDBtxHLDNwJejj7TOSl536JssxReKfK1iqu9vRbRX4hSY
 bLog==
X-Gm-Message-State: AJcUukfkt4uptrZbzBVQEeyBi+ndsD3VSIlWdNJMgfZGYybwTG+SHqS/
 2gFNuTnyE5bJLpBmrUN89G5BCsuLpEozlQfaPVjMNlu/
X-Google-Smtp-Source: ALg8bN6kmOy5dVmzgAIMVyRS96xrIuuMCvXJfZewkFlOaBLA0EKGx6swt38rK46IpqpE/bkxRpGhrfdz4xwmxeQFe7M=
X-Received: by 2002:a9d:beb:: with SMTP id 98mr7856954oth.284.1547459709953;
 Mon, 14 Jan 2019 01:55:09 -0800 (PST)
MIME-Version: 1.0
From: Andreas Fenkart <afenkart@gmail.com>
Date: Mon, 14 Jan 2019 10:54:58 +0100
Message-ID: <CALtMJECdszQv+ZqbPv9dfq2QbogVJMfth+fNL40pgwh0_RtbCw@mail.gmail.com>
Subject: amlogic mmc_partitions support
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_015512_054152_B877FC62 
X-CRM114-Status: UNSURE (   3.99  )
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
Cc: krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

What is a feasible way to port the vendor supplied
drivers/amlogic/mmc/emmc_partitions.c into something that could be
mainlined? My thought is to create a custom block/partition/amlogic.c
driver. Would that have a chance to be included in mainline?

Anybody else that tries to support the existing amlogic partition
format, not the implementation, as is. I want to upgrade the kernel
via fw upgrade on existing installations, but not touch the u-boot nor
the formatting.

/Andi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
