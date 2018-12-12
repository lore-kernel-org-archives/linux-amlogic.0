Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAF0C6783B
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 22:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6B52084E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 22:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alI6R/5M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="zFskN24c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6B52084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8y4kc4rR62P3QqNBMW7+kgSr9lK9JPXbbmJgr3ryBQ=; b=alI6R/5ML1uCs8
	YP3PfIxRSQtQKbMhokkkqoJLNDV+pNo0nCQcbZ1eEOKn/qILwX5HfJfGLuRu4xy55Fd6lxr8M9Wgi
	VPqNj3dtE0FPh4a9jZ8dKS/s0AMKLgL8nhJPYZuSc4FfogFflrIhizoCtQqJUz65I9YyaMXHGaUCh
	MOa6hpr8GvX8Q+l6lceJTBL9dUW/7OlqWwrqzqGGj3atI+37/zZFqwoNqHgVxiU4Jg6qxT4o5RByc
	DBX7gy1z/XCQtLI6To6kxycIGBoTJ22rFIheiavbq3IGrBuTbywVc8/wOLLHwTKrDaw9sD4MT0VYk
	IdTJ8emQqTJHUUPwcDIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXCoT-0007Wh-Bo; Wed, 12 Dec 2018 22:17:05 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXCnY-0006Io-68
 for linux-amlogic@lists.infradead.org; Wed, 12 Dec 2018 22:16:39 +0000
Received: by mail-lf1-x143.google.com with SMTP id p6so20636lfc.1
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 14:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qxs6ZAQUgD4g4r4faPlt1LDCC5EnYKOMrYjbaZHYm1E=;
 b=zFskN24c9TDeNRaV8VVNiGKjVgybLeRwVl5LPs+j1TW9yeavVGVJM1xMGnjNQkFRFo
 FVs02dhSdut/xFSb7apOkXqinCOduXWkcmGaQXBwefLQzh+sMbcW6GWGKoimWsRCHAT1
 ec6H8cG6WLDr8jrt/0SNoOiLWf+GCaPM19bt2+S4tQRHEB8VxVeh4qP6N6ETL3gFxAm2
 24Kg6RxDuO6aNY3y3tTpZBXsmwoZwvNc40yQHpC4GYDFIzqhdosxLANDDsdyzRPdH2Wk
 69raS92NaEWxzO+oXOvf2pViW4eywrNVm+Ti7lfGCOy1niDqDXyDG0NHGC2eFkvA1mSb
 DWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qxs6ZAQUgD4g4r4faPlt1LDCC5EnYKOMrYjbaZHYm1E=;
 b=VWoBwt9TUH/L4/hEVWg7eUtjiQGs414sHKteYkcuVJbaWebHaOWED8n7y5+lnvKITI
 IVLGOVt9fkyQ4NiHNlTT1F/rwvXPjDljzduE1pdIveksvi9UdvrAzYEms6EO9Zin7CSv
 dpYxvzpZi3ehq2AvnVuK4qoLoU053EzwOh+3gf1fHipG7gebOTsmCY1qDzpQ63Df5ozV
 qqZ5CDiOh3XqW0LF6YJuODlEQq3bvfQHAe/VmhJkGgpTgNYR0M05LzenOwlhiSyO1key
 tu8nwNd+wJvd3QAIDyKThwM9dUmxT1ueAyDwlqJwqlO4EE9iaUiyj8KvIzkxWjMrgQ5E
 coqw==
X-Gm-Message-State: AA+aEWauagatK729OXFQgjTJieeYR7fNUhqgvPN3cFHC15pBe1ximf6x
 EQre6BTBlZF5wV8zO/UPW5crgg==
X-Google-Smtp-Source: AFSGD/XZmXIAA1vwhbH86J77Aoo3znW5XRM5h1fsXpKmuoMVKLuLzoW8GrUeaZ/c8MySTBuZml+gfg==
X-Received: by 2002:a19:be16:: with SMTP id o22mr12346834lff.22.1544652956557; 
 Wed, 12 Dec 2018 14:15:56 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id z6sm1788lfd.50.2018.12.12.14.15.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Dec 2018 14:15:55 -0800 (PST)
Date: Wed, 12 Dec 2018 13:34:18 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] drivers/soc: Amlogic: updates for v4.21, round 2
Message-ID: <20181212213418.o247ht56e5prlnuw@localhost>
References: <7h4lblw1bz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7h4lblw1bz.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_141608_546279_DB3632EF 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 10, 2018 at 12:53:20PM -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> This is just a single build fix for the prevous drivers pull for
> Amlogic.
> 
> Kevin
> 
> 
> The following changes since commit 2b45ebef39a2caad409f70b22b4a2a41df9815b6:
> 
>   soc: amlogic: Add Meson Clock Measure driver (2018-11-28 16:55:35 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers-2
> 
> for you to fetch changes up to f56c06271c1c3caef9c7ef200e3d89967fd98a8e:
> 
>   soc: amlogic: meson-clk-measure: Add missing REGMAP_MMIO dependency (2018-12-10 12:16:22 -0800)
> 
> ----------------------------------------------------------------
> soc: amlogic: updates for v4.21, round 2
> - meson-clk-measure: Add missing REGMAP_MMIO dependency

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
