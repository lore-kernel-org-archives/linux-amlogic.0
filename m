Return-Path: <SRS0=4pfR=S6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630A9C43219
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FED32075D
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxQCPDMq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="vn8qPE7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FED32075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLP5AK4NNNgXp5j4zbZYGrXjhAzi6kMLiH92QlF3Mjs=; b=bxQCPDMqU69+4n
	vT8n1Q5OfXRyPnN218beJ7NnV71udRHyWZZq2iG7cs4C+N5CpOa7yKTIvytMYBXnpYXI64v8DCao6
	1JOy1I3GCCy8fo0TX/vKYbYE2alXHbRPItFOO/hU0hbWT1ekoo4RUpf19O0UCvQfipTOJH/nUKI6A
	ehXQd7+qQCyVIfay3qinSOGCN0z2/gs7SYY8WMKK6FtYUaqbJq4V5LmkMsaZ8hIi5PbQ2dcU9Vp8b
	o9mouwbLXIlTgQL8f2q4Hmt50dBp0VMM+YGzXzcC/ljv0ACDV62G9FJqwV2N22bPbLUdjvOi4E34J
	XkocqopbB05wQSfdCH2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKqH1-0007ut-6j; Sun, 28 Apr 2019 20:19:43 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKqGR-00078L-Ra
 for linux-amlogic@lists.infradead.org; Sun, 28 Apr 2019 20:19:10 +0000
Received: by mail-lj1-x243.google.com with SMTP id m18so2847000lje.12
 for <linux-amlogic@lists.infradead.org>; Sun, 28 Apr 2019 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=drtBTLYKAbIQ0v+2iJbh9AJivb+hzVmfXbX10aiOY8U=;
 b=vn8qPE7nHJB61AillBs2r+SvrdQAzQ5otqadLny5wcV6cQOgVEnLQrdemfIpcVogo9
 B8GiA/ytJ5lMkVc/t0C4fwq9Mo/Nb502SMOVEEIrkLRjaS1X3KE+pnzmfPdc3vD2UKJP
 stl5wKpggolAmU93EiI/KX1y2wOfXrNDRPi7ud26HL4Zs6MQZC7lHYjwtqxcJjIOizj3
 5O36aWxcByo6rOcDsqDoSotxdzvCtKIxAPhorhyy7gpHmgA+Z4o2BvupPFWFmUr3idO2
 6ZbfOeQ/NYI030THfnGh2/viRKJSzU/Ka0LCwkSFQ1bkrqvDUow3DA11/rMOR4TAg/CM
 Rg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=drtBTLYKAbIQ0v+2iJbh9AJivb+hzVmfXbX10aiOY8U=;
 b=lbu6Zn2azz6Nu9zi1tELiWdtWFcCw11icKQ8q0zkFbWS+GBtvG7p9eTmkErTLCvgkJ
 RN14tpG7EFpdmKBPn473zwF9UeMVXObuFsdldYpuOM513Kywh07H7jXzDvwTFazInv6m
 +xgRCZsyfaC8mSMUeKXu0FLIEifCnKpaY9p72TSQap1qZnmPTo64WXELo7DfS1ZCcn1U
 o2zAb6vJjV6R/Gc0ciGxPdLd+jrhoOLP5SNqBA2RN/EgxBJA/Do4JdAjPvf/bI/TFrEr
 xCBRbqVMxCXdjzIXyLAbnpOenvj5MO9LyWYNmoZnnn/NLszb+eiz+4x1QICnNGEHkGOe
 8maQ==
X-Gm-Message-State: APjAAAX+ILrOWfb1ToPxByqLjWtXQO1hi/beNMqcDKYaao17pPnx5JZ7
 CsPiE472DUDdrS3VDS7lJ45OFpZq8V4=
X-Google-Smtp-Source: APXvYqwSmhCdGRXh/4Wra3XqKpZQp1cFm40pRhlpE5ZmjeKQmag6hiIiTy2B/6FXJACDVy84SxSN0A==
X-Received: by 2002:a2e:309:: with SMTP id 9mr32411949ljd.114.1556482746279;
 Sun, 28 Apr 2019 13:19:06 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id d5sm1445917lfn.36.2019.04.28.13.19.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 13:19:05 -0700 (PDT)
Date: Sun, 28 Apr 2019 12:13:28 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] ARM: dts: Amlogic updates for v5.2
Message-ID: <20190428191328.2373o6ivmz7jgprd@localhost>
References: <7hwokhv09s.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hwokhv09s.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_131908_130032_70123F73 
X-CRM114-Status: GOOD (  10.58  )
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

On Fri, Mar 29, 2019 at 02:27:59PM -0700, Kevin Hilman wrote:
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt
> 
> for you to fetch changes up to 07f9da2900674e8e7b15b090b878d8defe223277:
> 
>   ARM: dts: meson8b: odroidc1: add the GPIO line names (2019-03-29 13:59:02 -0700)
> 
> ----------------------------------------------------------------
> ARM: dts: Amlogic updates for v5.2
>  - add GPIO line names for odroid-c1 boards
>  - support internal clock measure driver

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
