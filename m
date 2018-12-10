Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E080C5CFFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 21:17:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB87C20672
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 21:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="awNqVQ9t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YDb+iCCM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB87C20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBO2EDucugkBmxpM+s1OjBh4jkkvneq9e3A+UfnMTCw=; b=awNqVQ9tavIJr7
	J3DOAKjRrZ2viR7ti3o3WJiipqS425T29Fw8OuBH5BhgVCy/o7oWa+QR2ZOCUaFnQFCo++hB+5UEp
	r2/MS61IxJZHJno/vwjWEztk7keXZLWUkUaRe8kHLrHuGtJ2TTs/MchWz6QKppi1UfX5en+PnnJkA
	WNQ6ruEFxE1Cye2PdDTJ/112TiTKhSGU3riMwm5JxbjH8geBYcg5KJFs/lpUCJNo8UXjVK3LtVAbS
	yOE8lUsKXq/xaDZ1NcwKxwZk5B87GFYhei/dRvXrA7N7Oa2LDI7p0pduRILZ8zvyJ+Om7gYsAsRGP
	x1qWLfj7AFil9vx0DbVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSvl-0007Gn-8V; Mon, 10 Dec 2018 21:17:33 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSvZ-00077f-SW
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 21:17:23 +0000
Received: by mail-pf1-x441.google.com with SMTP id g62so5988401pfd.12
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 13:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XDQ09Tp/Ax+gyJb/FUcEX9STCMsKssGuHHluuKTb8xk=;
 b=YDb+iCCMOpyJg6K5ypWyW6fFU+ACcQ12siYXOoViImv1iA4RWCXpGPTO9mQYTNzFwt
 ZGbJFnc5uTGa9A9vhNGKMaaf+mEIA5LkAZq5fOfkiVPHcK3MTOXEKOCuQoCocFpmUfi5
 R28wd/UKtnGXboT8zT06TOp1QTOyABF2oUiJXx0UB7DRro+IIUGj4ZcPITJAF5EBlR+v
 U1OvL2romgz4Hi74sjNJG1ATXYOuYGfmqlnhp0/brUGcxyR3HFF23bFLzPHe9xFEv14P
 w6XkO5ZSJEhWb3foeno1uH3xzsaAIBT52KDN33dSWDdD2/7RU8dhSsKckpOLnen/ns0F
 RyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XDQ09Tp/Ax+gyJb/FUcEX9STCMsKssGuHHluuKTb8xk=;
 b=DsthYLyAMnTuRj1AHm9xV/dpl95utwkNtXa5/nB7yZi8yKTYfyuy+6EW2zN6u0Eszd
 rFBGhXBnopEGlfJbD4y1Q4hLnSJUwWpGoTHU9TkAmF09MHg//rjUT2wTMroaOJBW+eZ9
 SYAUzfWm9IQceLjULha1esw+IUvbhJ70lxxWSaW/dPaKZ/LjgoJWlhOzq+Oqz+xQzaRr
 EnjrKV9WuyVtrCvQmTK3Zq9rRT2TnVinfHtOcyUtRSfNMzkgzwaE3nZ/5lh2Um/b8G1z
 6/rm69wbAnh16+kKz2t4U2Aj9WJrwifqh/wywpio8EWRYNNx0IcwgD4Rv9o+7hY1VX64
 B26Q==
X-Gm-Message-State: AA+aEWbGZA5uC9IB3eq88Qtt9Xj0dwXVTJftlluY9DA8EU1P+QsgvsAP
 PP7FvOGaD2vJB5FF/dlamiwhnPusxpE=
X-Google-Smtp-Source: AFSGD/XUfXCN2UcMXzZd1ccHNqV1PJxM1JY/M9O0lpkrnf8oOWsl/OZdFbintbLFty4K6MIZd4m2Sg==
X-Received: by 2002:a62:8dd9:: with SMTP id p86mr13654965pfk.143.1544476631178; 
 Mon, 10 Dec 2018 13:17:11 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 f67sm17436997pfc.141.2018.12.10.13.17.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 13:17:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: add driver/soc/amlogic/ to amlogic list
In-Reply-To: <1544471155-26661-1-git-send-email-clabbe@baylibre.com>
References: <1544471155-26661-1-git-send-email-clabbe@baylibre.com>
Date: Mon, 10 Dec 2018 13:17:10 -0800
Message-ID: <7hva41ulnt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_131721_923008_35AE153E 
X-CRM114-Status: UNSURE (   6.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Corentin Labbe <clabbe@baylibre.com> writes:

> While sending a patch for drivers/soc/amlogic/Kconfig, I saw that getmaintainer.pl give nobody for it.
> This patchs adds drivers/soc/amlogic/ to amlogic maintainers.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

nit: in Subject, I did a s/driver/drivers/

now queued for v4.21 (branch soc)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
