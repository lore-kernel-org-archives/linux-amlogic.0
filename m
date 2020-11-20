Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E15BC56201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:12:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FA322240
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYKTOinI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Cul6ov3K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FA322240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2NHKopyeHsntan7LLv3Jy6yk3+G0EfQJdnYPTTzFvyA=; b=ZYKTOinIsJNvy/h34MCY4rmTG
	DXoxGP2VmYjjIBdZXww7s0+1gum6m1D/G03rG76Co3RSoHsMybMGnDkIFAfEB88oULX1IYLi1fNZf
	297JRCI1O1BEMP2adGIQ3PL0DUzB5BnGkg98qgsgy1WLbv8hWyzrPmgMpafOL3QKN7NpA9HJqPIte
	lOJ/ANz1PMKEvPpLcv9dETWnyCFN98C7xlsyV0xd5yG0VBZfXNyeQkkzOyh1wX6nsuhoZKrHbtGDk
	YRaaPclsyRnsmloMyWfyILFGu1L/xQ3JVlYWJdAhRcFZQnZz+B8UTKHMKqZX42QmwTqv+XJYNLqyV
	hyOYvXE6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBpd-0001nM-Tu; Fri, 20 Nov 2020 19:12:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBpW-0001jp-6A
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 19:12:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id k7so5356725plk.3
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 11:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aaGl6ENhV+1nPNZxVybs/FqyHjk4NVv4G31ODZymJco=;
 b=Cul6ov3K/VrA/M6yoYFsMyWnWv5RABcGfwZSulkK5F9T6qnjBZrn7I4r88vJw2gyv9
 19Syq6s/L48amcXSrIKJ6jzuDkyWBs8JdGegXCGCpIwMf/ifUGZ0JEO61rQk5EQ1UpLz
 Gv3v6r8IwmCi/5QffwPcHWRM8ZO6JeS3b1ftRlC7g2f03C6HqXvQr8qzHa31WxbWjfiZ
 qTQwLGKi4YYNjFWAs+8MIXlaYM7ezRPoL4eDylmDaB4bpW2mipRJdJNAhVmkojJE5I99
 b+Bnt2ptITKxsM0MswcGuzopqovb/hesx3Nfwl553aplVEz1pq3PCwKRv1RUA4znX1p4
 C3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaGl6ENhV+1nPNZxVybs/FqyHjk4NVv4G31ODZymJco=;
 b=GriD+ncIXtrHB4uTjy3wUPyz02wj4eYG+JbOPm67+ws+JQYzRdPoQU5n9WdL4pBWIm
 qbY1gxp6wJVOFV8gckR+27SCZVDghUhHyhjuNs3KZlc+W0mPh6HmApHdHIftyZl+AVb/
 ZoAo6ctdC/I8TLAgQIFcQxTyA9+ogCMeMMmQKzx4MSz8bGCV1gOzD36p95XNvzkRKJ8v
 oXXWSLz7BZNGX7hPmRBxoszW2fZqKGQGLwXhjk8tAhtLopv4vwZnkS++N1eYzI855ScK
 H+sQSUWX85oVrd+CGKrZXprCXgWBUzpDB2BG7pDF+ggU7FgVO9NQo7stq57ZFX3nE0m0
 lmNQ==
X-Gm-Message-State: AOAM530ehBiNfjq5SknQB8rHCNEFVKGSNCZr9hm87zGWXHkf9r+60Apu
 mAaoIQOROAHL022bL+vyYFKk2Q==
X-Google-Smtp-Source: ABdhPJxJF5h3qSdDs+4Ydk1ojFx8QCmkTkP0nPcN5ISznYDLvh/GoUqEpAEfJg9xGZKLCBF3ihkrQQ==
X-Received: by 2002:a17:902:24b:b029:d6:cd52:61e3 with SMTP id
 69-20020a170902024bb02900d6cd5261e3mr14944214plc.2.1605899538860; 
 Fri, 20 Nov 2020 11:12:18 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x13sm4659006pfj.54.2020.11.20.11.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:12:18 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: enable rtc node on Khadas VIM1/VIM2
 boards
Date: Fri, 20 Nov 2020 11:12:14 -0800
Message-Id: <160589952950.11499.16597042753112987237.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116064147.12062-1-christianshewitt@gmail.com>
References: <20201116064147.12062-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_141222_300245_A1D4B2E4 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: Artem Lapkin <art@khadas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 16 Nov 2020 06:41:47 +0000, Christian Hewitt wrote:
> Enable the rtc node on VIM1/VIM2 boards so users can simply attach a power
> cell and use the on-board RTC without modifying the device-tree.
> 
> Cold boot with no cell attached is gracefully handled:
> 
> VIM2:~ # dmesg | grep rtc
> [    7.716150] rtc-hym8563 1-0051: no valid clock/calendar values available
> [    7.716957] rtc-hym8563 1-0051: registered as rtc0
> [    7.729850] rtc-hym8563 1-0051: no valid clock/calendar values available
> [    7.729877] rtc-hym8563 1-0051: hctosys: unable to read the hardware clock
> [    8.126768] rtc-hym8563 1-0051: no valid clock/calendar values available
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: meson: enable rtc node on Khadas VIM1/VIM2 boards
      commit: a735defaf1ee74e9f06a616162f1ba6f26555d38

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
