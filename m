Return-Path: <SRS0=yXyy=WL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFFDC3A589
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 12:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7299B2084D
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 12:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fR2k6Ujh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7299B2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vngfmMmaE8bsphLJTJKbk6l3NXGh6S5iDRzFHVlf/Q=; b=fR2k6UjhV21kGi
	5GimlqNp93VM2M0P1wHvSC9aY1+KEEFDFfYSop6K9EbZ0bHI7/CkhwOkmFvY1YcL2qvGF4/iyUR5M
	HPTT7zrQOe2jSBCeKLyz6I7FawPVBEz39qnfAw1XZyUrtcQCcje0+1xSU7koTZTd/uZZflnB4qJyY
	hByoOvV4HJjARU+otrel4V2Zybhkh/xPXszOaYs6Eo4huL7vNDufi3EI94RWfPDiu3TFJjFdYUdae
	IdEQ6tGTvf2FQi6tJbumKqh/nIRiKjfB7mwoeeruWZdR7BcvBpqfkRvQOJiok1tJYtogwVK1QrQL8
	2F/447xxxsK6G+9hhGXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyFAz-0002j6-KN; Thu, 15 Aug 2019 12:48:22 +0000
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyFAh-0002Yy-P5; Thu, 15 Aug 2019 12:48:05 +0000
Received: by mail-qt1-f195.google.com with SMTP id u34so2186882qte.2;
 Thu, 15 Aug 2019 05:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVSvjWJCsDHACl/PwNeLVWRIpo2I8RdbKwBGK3OphV4=;
 b=fzfJKwbmeEvGuWhsI5m7VbDQCL7cfHU0BAGupBda7VmpwtCrV3cfcnigG+1RAC8rQv
 uq72KXQqGJGebp2Dhjtv5TP+v/PKivIQCt+jmcSBAvfgQS2AvPAlEhJe2DOb2QAgL6pD
 A88uGATUjHWxt9TIVkVARrCg5nnbNTVkxPYe1ZjZCxgl5zPagUzuJJVrQffBo6VoPIAS
 lPZEi5wkfnn6JoXy+fFURw+eGY4CjQIeTg0zz9UB/tuzjWPKM/9nkey6sqzglmZc6v68
 5oJv4UzcF61MethyEQnFXa9hvXOwAMZV7qL/+3MJtaovPBSWkJOJ/SXRcZM+2cgQV9S2
 gEGA==
X-Gm-Message-State: APjAAAXIEUtvsA6eXVcE+9XVGYRDnRW83IEEsDXgrUbIf2ca1C65mjvM
 3cL1wafE5WuqRtfA41N4Zv9I/V3fOkz1ml6BHW/KCDQq
X-Google-Smtp-Source: APXvYqzKa7qrCV31ODoWGaG4F2FhE0u4jULeIkabqSDyV+Ec/D4h61uiX5sg1HWGlstdnz+UpvDxZGLWlAZzjBT0E08=
X-Received: by 2002:aed:3363:: with SMTP id u90mr3734597qtd.7.1565873282445;
 Thu, 15 Aug 2019 05:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <7h1rxq0ws9.fsf@baylibre.com>
In-Reply-To: <7h1rxq0ws9.fsf@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 15 Aug 2019 14:47:46 +0200
Message-ID: <CAK8P3a2dep_fbAVJ000e4dvC2k30GBR9BtPyc63hJTnMAQ=hzw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic fixes for v5.3-rc
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_054803_814404_29AAC3F5 
X-CRM114-Status: UNSURE (   9.86  )
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

On Tue, Aug 13, 2019 at 1:49 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes
>
> for you to fetch changes up to dc7f2cb218b5ef65ab3d455a0e62d27e44075203:
>
>   arm64: dts: amlogic: odroid-n2: keep SD card regulator always on (2019-08-05 14:06:55 -0700)
>
> ----------------------------------------------------------------
> arm64: dts: Amlogic fixes for v5.3-rc
> - a few small DT fixes for g12a/g12b platforms

Pulled into arm/fixes, thanks!

      Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
