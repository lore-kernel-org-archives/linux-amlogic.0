Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C53C6783B
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 22:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 080B42084E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 22:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R6YGHEIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="stZ1j6Fp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 080B42084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/shRuk686BAFRw+pC5UA1H68Smw6+RTjHnOYbOLzuE4=; b=R6YGHEIhWxpyOX
	EE/FigL6RvM6pqpjVG5d4XVNCSueLpLn+Wqel9ZAtp4mbGPZHaHRzYlmOrGWGRQl2eN7XpIsRSj8B
	TeoT5qYRWWRcotN6jI0CuplK6lTih1nlC0XOF33u8A8Nz3bZKlnee0CTK67INEyJb2hLbZByFxoK2
	blr2fd6KAu1HWd9hm8xEbclNozm1fqtay8GhbJncBd0H8IZ4VWbBIoQEA5RoP/ctUIZbBkv2TyWsk
	ZpNSmEXPwGGtjdGL3zr3JXolt5dxEp6ql4inlnYm3yIIRkAGH506ayQW8iMgmP1QHTk7FFVwFymiQ
	HgFXxHrtPUnrkG8WO0JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXCrh-0003hO-IG; Wed, 12 Dec 2018 22:20:25 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXCoi-0007Z7-EI
 for linux-amlogic@lists.infradead.org; Wed, 12 Dec 2018 22:17:21 +0000
Received: by mail-lj1-x241.google.com with SMTP id v1-v6so30248ljd.0
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 14:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HB6SDHrpowouTptuTb1Hkgo1qmCQaswrCO4BpiUY7jk=;
 b=stZ1j6FpZiwNPRusrFUhtrm463rncVecpkyONEc/B7YtM1nNThsSBbk/GAc/ZEcRsX
 vjvChuzPIiFjgIJJq2uEmioG4FeaQ58jtqtQxn3Aw4eapXSQA9/B7Fvga2Gc1unUEQO0
 amyvOEfscjklcS1XbpB4so3QSiP5s1wYxeleouHBGT0sYBpEzs2DEYQxjIaRCFDPj8LJ
 m8DbNcSS6XGPERqiqVRVoN5IvJFLJyIkVNBA8xpSK/wgkMyRlAxozpzuTaw6eLGnh8Hu
 O1GzXl9d84AHYZ8YEi5W9rZ6Lsilealc80KGjz/L/JpaW1+vXuDGjJerRkkgIfGzTkAx
 KfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HB6SDHrpowouTptuTb1Hkgo1qmCQaswrCO4BpiUY7jk=;
 b=p0Awx20obHK3Tm6sb8ZXdKtSESunjYSaNmDqnY9Ia5fqoPwFW6R7Nq6xlrk8hAdI15
 ZKXqyG9m7lWbll+fpVcSrXv7cMtiwdWmZ71aKj0fx27nJyuf/U4HeWGYe3wvEsWWVVWH
 Bov6RTOigiEmATeoik1piqX2exc8HiW/Gj+s6ddWirtfzTIMXSFpb2giV+MV8dg81Blw
 osE1Mk7QP94T4FpIOqgH3F3feryJyCokpd5/QK8r7b86hAiDnLEcMfS5AdAjgPwXFXWW
 Bn9f1A0sGG4idZ+2FwiVAqWSfly/GVVDwQGlGbYSYm8noSURPhgeJrg4BJSe0jcJVOpU
 8oyg==
X-Gm-Message-State: AA+aEWYh+lg6t9oFI5fKJ5QxTVGDs6nWqlktC9sK+LRZz8iCCZyz3AJ/
 ZoalYkPtf2ApKgwZ0avzwJusGllh2cpxrQ==
X-Google-Smtp-Source: AFSGD/U2Kx8LbOvfWAopw/hs6ZiT+hgUhFpQIZeBzsVwTHNLglUpFjEzqNWAVbPLC2Ql++YZMP219Q==
X-Received: by 2002:a2e:4601:: with SMTP id
 t1-v6mr14478696lja.111.1544653030691; 
 Wed, 12 Dec 2018 14:17:10 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id v11-v6sm1125ljc.57.2018.12.12.14.17.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Dec 2018 14:17:09 -0800 (PST)
Date: Wed, 12 Dec 2018 14:04:03 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] soc: Amlogic updates for v4.21
Message-ID: <20181212220403.zekavgzgywjyxjm5@localhost>
References: <7hh8flw1ml.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hh8flw1ml.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_141720_503368_D466A9A6 
X-CRM114-Status: GOOD (  10.78  )
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

On Mon, Dec 10, 2018 at 12:46:58PM -0800, Kevin Hilman wrote:
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc
> 
> for you to fetch changes up to e9e863dc1dc88212b09d279a143027e1521b35d1:
> 
>   ARM: meson: select HAVE_ARM_TWD and ARM_GLOBAL_TIMER (2018-12-10 12:43:40 -0800)
> 
> ----------------------------------------------------------------
> soc: Amlogic updates for v4.21
> - ARM: meson: Kconfig: select HAVE_ARM_TWD and ARM_GLOBAL_TIMER
> - misc MAINTAINERS updates

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
