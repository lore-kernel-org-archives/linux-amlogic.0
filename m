Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11491C48BE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 08:36:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1802089F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 08:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LMaidWsr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1802089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuWf2MjMbFEqbWDqw+kPF01VeBCkDVg13kdDU/Chp4k=; b=LMaidWsrLwz6pd
	qXPsyKDb2t54d3zSs2IzMGcwlc5t+pdaWRlH12tw4NAjjpOe21HNFdcuhME+pzpnj/dX2J25f5FOJ
	C3/FmXRazJD8EjmOt87LuuRRnC2/Dbv8vsCe+ifMe5gOk1O/huiL0lRpLiGKp8QMEAPlRPTgMyxxd
	f1/9/zURu6HSReyqqKPYU6Atzk3pynHQnw9nyf9GHutAVrxJ5a6zgKnpXqdXPbhDOiUZdgvGighi5
	EKtbfj8FHntZhaNTf+BXYCZRN+LIqWhb5gSYV4MYGCRMO5AhnmQlYh3bernLz5Nog5CTBXfPiMZUa
	l9eGfYt2+iWLSkhzd5Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfKSg-0002AB-EB; Mon, 24 Jun 2019 08:36:26 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfKSc-00028d-Rk; Mon, 24 Jun 2019 08:36:24 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 3F6F920598;
 Mon, 24 Jun 2019 10:36:17 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 28C092020F;
 Mon, 24 Jun 2019 10:36:17 +0200 (CEST)
Subject: Re: Help offering for AmLogic S905Y2 Mainline Effort
To: Daniel Laube <mail@dlaube.de>
References: <0292EC91-0CBE-4F22-8F28-BD581A157CD6@dlaube.de>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <2543a892-d7b6-f528-4df3-923edbf1dd85@free.fr>
Date: Mon, 24 Jun 2019 10:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0292EC91-0CBE-4F22-8F28-BD581A157CD6@dlaube.de>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Mon Jun 24 10:36:17 2019 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_013623_043923_D5222E4A 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23/06/2019 22:42, Daniel Laube wrote:

> recently bought a cheap HDMI Stick Computer with an AmLogic Chip (S905Y2 on x96s Board) 
> because i was told that it had mainline linux support. That seems to be 
> true only partly because there are drm drivers missing for the gpu and 
> no video encoding/decoding support.
> Because i would like to get these things working in the future i would 
> like to offer my help.
> I already ripped that thing open to get access to UART to see boot progress.
> Could someone please guide me where i can help with the mainlining effort?

I suppose the first thing to do is try to get in touch with whomever
might be working on this at the moment or in the (recent) past.

Look at the MAINTAINERS file, to find "official" maintainers and reviewers.

The baylibre team seems to be handling some of the mainlining effort,
so perhaps they are in a good position to provide relevant information.

There's also a specific mailing list: linux-amlogic@lists.infradead.org

Regards.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
