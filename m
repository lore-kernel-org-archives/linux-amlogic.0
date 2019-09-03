Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F711C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 20:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1258B21883
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 20:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pSD4u6oP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1258B21883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhIDYkr1EQaq2a1dlxuODRz+pxNYmJJ8JtNw5lMIriU=; b=pSD4u6oPk5f/qW
	oF+9IIoiC9mghQFaXURKirvdDlCqJmGOOxDJq5ye2f5/8HMVBc/ckt29xnl0h6kKHnoFBUwBKX4Nd
	LMegkfLKnSAHPQ+7vp1y3f0AQ62hyk4uROvTwTSEGK8zp+Yw+N/kNmTWukvBb0QCE3l/COFT5zDcE
	b4AJNBHa/8XO/FeUpTjee1ex5rzdbgoHMNOuzO8VpdiA0kqgEETGo1SzaJxKFAXgnMGwF8iKFpkAs
	b9104WcdQpewayISgr1rOVEPwq5rQvHi0XrypLFMsOtxe2XosncpreWsrGAsn5z+9UjlVFxuzqqbN
	R1hIwR2VFyZQ75Q5ghSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5FCs-0001uL-9x; Tue, 03 Sep 2019 20:15:14 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5FCp-0001tv-T2; Tue, 03 Sep 2019 20:15:13 +0000
Received: by mail-qk1-f177.google.com with SMTP id g17so17332032qkk.8;
 Tue, 03 Sep 2019 13:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaNvwZL5YWaZG/bKwEBZ9df2QhrOhw+SgmbPyzVBVL8=;
 b=JswL5V404ZRkp03BlqWXRc9Z9DxYyFv5SksXcyfibCbKz82XYR5IfnMUNEU2wfDM7r
 B8H6mxWN3KivpKHCOaTbMtCet02NbJYn4peJ4oVqxVc1fH8dFhqFpPg0oTNj/AGWjWdQ
 kZ6tnucY56+96wT+h1ATmdHFlxiZIDpN108gJ5uroDyvSwgQ38ckmvl5ahEoAaoQu9sy
 yePAXYsySfHWqegwnj6L5j0kbBsDbbcC6g8HJWd7l71KsQZo4X9sHyMlbgZWJRZxiyqf
 EZ+mI/NEX1HItmqfAN0p+8Ra1dkZ/AdErBlzRBH/D6yrZk+2NqsACZG+LavYDJNPKSND
 0SzQ==
X-Gm-Message-State: APjAAAXlRbNcBd5DpwQcvRLMFYCYsAitx7glYM2L0qsxeOV5ZubvrosZ
 FI9MwsJxDrPUKA++EXzdgTeXbLIcqVI7S2sELRc=
X-Google-Smtp-Source: APXvYqxM7sRnulkSBKxqdLGbx8zLwCOeaEfdX83mRD+lX+1y6+zjV7gnoa7SRBHw3aZc0JoNh+EeO+CZlpalO11uo/E=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr35325133qka.3.1567541706918; 
 Tue, 03 Sep 2019 13:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <7h7e77cwv5.fsf@baylibre.com>
In-Reply-To: <7h7e77cwv5.fsf@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 22:14:50 +0200
Message-ID: <CAK8P3a054FDucEHMz1H+oK0SwTDgH1NWv6nUK-fCTGSVXT7WcQ@mail.gmail.com>
Subject: Re: [GIT PULL] soc: amlogic: driver updates for v5.4
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_131511_950046_39DB00EE 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 12:09 AM Kevin Hilman <khilman@baylibre.com> wrote:
> ----------------------------------------------------------------
> soc: amlogic: driver updates for v5.4
>
> Highlights
> - clk-measure: support new S905X3 and A311D SoCs
> - socinfo: support new S905X3 and A311D SoCs

Pulled into arm/drivers, thanks!

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
