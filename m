Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF7DC43218
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F96220679
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ez0APEOT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="X3Ofe1hY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F96220679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bs9wRDIt9hjpmOlxmRPAG340isBRfImvVuSARHY37mw=; b=ez0APEOTcAuKRD
	kE5Kv7xpk6VhUFDBi7zkSs86FinsSn/h+X8BJ1oxXEw6btm3vEZ29HLVzxQKJ0sDk/EDFu6l/ribZ
	Iu9zbEeno0zn03p1Hr9OgvliVqC+wgvScfEVZ6lx+Cem5qexqtaMDIcBQxyVL9nck1rGsVcXnx9e2
	dxLo0fb1z0sFFe2RTH3lVo3FMG0lBTfmBGookHmWnPgqDKeWhb9XKqRSU1pnD3zl9RBkeWSqifpWo
	KOu0vF8tSIg3YFxAIVjmfj3F9NtSLdQIMojwlDBcPyOWbine+h5jP0RYMswC6mNmREZECAD3wG6RL
	lB9Tf++8jY5tyL+5KYNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKqM5-0006r8-2n; Sun, 28 Apr 2019 20:24:57 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKqHJ-00087s-Md
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 20:20:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id b12so6280774lji.4
 for <linux-amlogic@lists.infradead.org>; Sun, 28 Apr 2019 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/TiM3QOq77UXU8UuXIC/MnuQwwJP3i4j4CNdcOAI12s=;
 b=X3Ofe1hYSMQSenw8HmrvaGNib/O1BW5N8GDVCcG/JWjjOelt8VFaubgjr5nEPRnZOE
 VjYGbkeaG7+uAERZjoZeDqufpifYXF+Wf2dzEZLx4dM2iFIFTrGX2YD2zAVZZZ2m3SOT
 V7oZsrK+YXthgaknOX5dCFtGBNhy3+zGJ1Lw5Sqh1/amypHQQdUrOBBKfEY4c963WiHU
 Ba/pq0DwWTNqNnRLpzZwkg6dK7squhltJ7ItEu/6HvOn773mAi0rEzOoId3BI00+qr5C
 wWNSZoVZwsaievSB+kfKnAy9hWvndYYq6EyG7zmo8ISWQ+7hJHjntPswxhSEFwKE0ENg
 jX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/TiM3QOq77UXU8UuXIC/MnuQwwJP3i4j4CNdcOAI12s=;
 b=iAXbrP/SEH4+6KW9+EnU8GHMgXim27WBtTZIU0DMEjPyE7+QZvtqpP9OurOX0IZPOI
 GCCEZQkYiySYtoZqjunlqzUeSuvQkh1q3u3VZlKNjQaRBNmM06SQJP7b8s23PsCEkXwj
 g0gUs0kBwssTEhUW5TomD0QTl95Dx8YckMZTSA+X3rvr+Y7w1pfB7zHgCUrHr2S/eqLz
 N+sstewfNasblULh/Y4UodUJxxtbNBrY8U4J3IKvraW6FHVF4EHPHqi4biJ0F2ymbQnm
 3wiOrSFxjicO8eokd8u/Ef3JeRDVvYbBxjAVirn/bBnWkOxsOrx6o+ryed7OUiILksW+
 S84g==
X-Gm-Message-State: APjAAAVRzJhUvqX/2PEJTlIwsQL7ZAcb3e78yPLCxFp8nbt9TfwJNvlT
 szMyw/rSNjtqWpp52M55vKTpLw==
X-Google-Smtp-Source: APXvYqxs0RlnZwBqMoqWOA3dUb+Uwo7tXqrODP2Xk7hSYs6nV2ihqiL/aDkAvEnopHAJ8G7+C+Kk8w==
X-Received: by 2002:a2e:9241:: with SMTP id v1mr8232057ljg.6.1556482800181;
 Sun, 28 Apr 2019 13:20:00 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id n20sm1357734lji.53.2019.04.28.13.19.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 13:19:59 -0700 (PDT)
Date: Sun, 28 Apr 2019 12:49:49 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] ARM: dts: Amlogic updates for v5.2, round 2
Message-ID: <20190428194949.75s7yp2shknbdbcg@localhost>
References: <7htvera073.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7htvera073.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_132002_192971_CD7EE0CF 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Apr 21, 2019 at 07:43:12AM -0700, Kevin Hilman wrote:
> The following changes since commit 07f9da2900674e8e7b15b090b878d8defe223277:
> 
>   ARM: dts: meson8b: odroidc1: add the GPIO line names (2019-03-29 13:59:02 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt-2
> 
> for you to fetch changes up to 09ee951617d9af8a86d228b2ed34035076ab6001:
> 
>   ARM: dts: meson8b: odroid-c1: prepare support for the RTC (2019-04-16 11:58:00 -0700)
> 
> ----------------------------------------------------------------
> ARM: dts: Amlogic updates for v5.2, round 2
> - enable RTC on odroid-c1, ec100
> - meson8: add internal clock measurer

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
