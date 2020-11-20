Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8946DC56201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:12:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126A422470
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 19:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2EsQ98QZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fiqD0N+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 126A422470
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=717jlC7jCAd/3l6QtPBUvKIqJ4mZLGxEQogduk46D6U=; b=2EsQ98QZMru+B8/XoZALnoxVO
	OjXaLyt7x6Q6Q7b9aih6Z0zL2L+D5z0WlnkT7uY2Dmhwl+yx6wEgaLEvZ52mFfX3XoIPOmcRLIWEf
	lmoTg8/j7yZoIs1uDFFoZ5zWX+dEaDc876leeLGNHWUSJYDta3+Zso3rIGw4rfSYCyBdPFvHUH7+1
	hkVMGFwIPMoSMevs0qvPlrRwj2DY0VVnkE2zGcBisBXqaMkYCIZ3mXbUemnFv21z/yj0QMG8JyihB
	gQipBWN4sMmmxPyyjbVpsYMw/C0m9bJ0qpsevZXBDKYO/4L6Rv56V1swagdOKFwpBco/cCBbjdbip
	uZ6+/FrLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBpo-0001pK-OE; Fri, 20 Nov 2020 19:12:40 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBpW-0001jy-Kg
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 19:12:25 +0000
Received: by mail-pf1-x442.google.com with SMTP id g7so8793544pfc.2
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 11:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pSI6Hxh+VGHB4fhlPl5YbxM+ykFtkRO9Um5a1XP/b8k=;
 b=fiqD0N+EBqOKVErzzLpV4bPF1fE3+I8bj1UxfCHzf+jxKi2FyR3ukjSq/Cr1nHP+qu
 KcHv4/L2yeq28sT0z44zGo285lcYYILwn6A0MOZjDZmfzK0Xt3aPtg6iFGpSisg2hLbo
 vIfIZblp9FAZiEI6w4/B3OvshJQ7xBPICOeDHOW5pcZaISvBJStpOJAUgQrCMkNGuIBX
 PI2Fs53GtpS6+WiiTdSZuXkhabqyo1ck0kSsjaGTKTWWBoyDgn+SvAfe48HRSGULGIyH
 N+UMBIlOiPG+rQyvWuP9y7DbhRZt5AZpTojOeR1skRvcY4LsR8T3yMeY/50VWDjtvN2E
 pGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSI6Hxh+VGHB4fhlPl5YbxM+ykFtkRO9Um5a1XP/b8k=;
 b=cYNDPcnQRk7iYxJshvTYvljnS97wjmtGQhfTQjx5b8kTjfcZZzTtDR0Z5Hy7EHzMrJ
 ZcAUWKkOND/mB+WsX1W5kc4jjUBBlRRud3jV7gYAfne2F7izFPjUMlroLenyuKDhaF8b
 xFGGJO0GX9n76fFZ6HEx1IkZhK7pxmd2sRj9fMap8tkU/6+BRabx9CRnmSgreMPn8c/d
 78NJ9sUdxbcW/BgQy6EKvEEI1MDtwAMv+8iysLY6k/Yaxf1EKIF4LaiEXv9/74XZp1kr
 hy+wKbMt9D8TxkcsOHuIsExINbkaHi3du52xnPvfFxWvocY+AAou773w6qSSWbGzULz1
 Ye7Q==
X-Gm-Message-State: AOAM532iqUfi9R66BprsFLLfl+g9uJpLI/068iuL9TpMJcpI5k8Qdbmt
 JyGAMZC15kz9JvfUD4o10rCiSg==
X-Google-Smtp-Source: ABdhPJxFoeHhZywzkXWoTbSzWIgVy74o7t/ThSjCrakBbElNmKQW1LKLaPXh06bYW6FDvfuO8COE0g==
X-Received: by 2002:a17:90a:8b8c:: with SMTP id
 z12mr11473452pjn.233.1605899540131; 
 Fri, 20 Nov 2020 11:12:20 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id mp16sm4739987pjb.13.2020.11.20.11.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:12:19 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Will Deacon <will@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: meson: ship only the necessary clock controllers
Date: Fri, 20 Nov 2020 11:12:15 -0800
Message-Id: <160589952949.11499.17291456333845583802.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020075034.172825-1-jbrunet@baylibre.com>
References: <20201020075034.172825-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_141222_747916_89F8DD3F 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 09:50:34 +0200, Jerome Brunet wrote:
> There now the menu entries for the amlogic clock controllers.
> Do not select these when ARM64 is enabled so it possible to ship only the
> required.

Applied, thanks!

[1/1] arm64: meson: ship only the necessary clock controllers
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
