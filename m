Return-Path: <SRS0=/Gxn=YT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90736CA9EB9
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Oct 2019 11:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C9A205F4
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Oct 2019 11:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MtYDwfg9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W4ZHEiZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C9A205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSffY4jxCgFPP6P4K22EHhSEviYse0FOELK7xtWcq40=; b=MtYDwfg9mylKZ5
	7EG2z8V6iVxv2uEakuQ5LvAYruwu/cY185gOD3of34wK7EcrDy5iDuoHgTJZKSigY3V2hbRha0F7A
	isCfP5F5N8ftaEXYDNoZVymv13PkqJsmWCMZCkCuhGUlFXUTcAomJ0QH+j7CzRasBkyctA5ZZ+8w4
	HFMdDbf3QuhPVUuqD5RNsgNPb9zRNNRVO0qRTUXd13tkCMqqSYwkC6kSx3xRT1S4TbJX+48Csy6Tn
	rhOaVGRJPuoGOb8bUkYZdJpv7fkJFfMi/kUS1mQnU5FF8q7P04FWKukYzO4CAPozBiAnRGPMLLlGf
	Kdu1r334lxp4O6fDVJFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOKWk-0001HB-OT; Sat, 26 Oct 2019 11:46:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOKWZ-00017l-E6
 for linux-amlogic@lists.infradead.org; Sat, 26 Oct 2019 11:46:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id 22so4453432wms.3
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Oct 2019 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=WvV3v05v3ZEEVXEmLYdFb7lylJednPWrhNA9CKc5BuQ=;
 b=W4ZHEiZIpNqE3hsCeGHeX4lyrYRkFJ8+N2pzP5EIW+H2uFC30kwXAhqq34aA7o+DDB
 BmU1dchLy+sQVZesfH/mgQBQDsdBbSDqrjHp4rrvN/hygQxIKYOORGF6JIgpFkpPKVlt
 UX1ZC79a1kG1Tb5S12311GoebWaT7Ub492bZ3+7A2UGgJVGEzG5ccbJhAnhhApB30gp6
 2Yqv04+sNcM7GWXQPNdhpABEuHMIeuWBCyxbJaIKRZFaUFVHsK2SJ0wyxH1aC4ARqZoq
 AL38hGrSHCxmYez764UcYWBgdjsfFclVsenwWzYKCLW3HlF04rxnTaEz+TXd8tgEc2TJ
 nAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=WvV3v05v3ZEEVXEmLYdFb7lylJednPWrhNA9CKc5BuQ=;
 b=VtNGTKH170sHHQ0arUSCMA9j/axsGctoA+arSDB/8AEbkrxfTTNAm4FfKZHuMu/jED
 fvwXAiPXLEVdHUvfYRzB/qDppLtat18ETQxVzw/qOaR2ypfZsRwcr4xHRRuisIXnHHBD
 XsHEqahVKpCco+1wNhCv9TCpS+NSltzQvdkJPUcs+xPyt2y7Vk9ugokwgIm5wRGhqEbn
 4P9RaVEYwuayiepDibb9QfDjaQaszwXCzgGuWHFyjpnYXO7g4G6VNTo5Eni8KMaWQnnO
 PMPPjHEYj4b8NhW3QcWyP7+YbRQfG9+8Gy/iCh/LrTp88huiHf8GYC9lUd9QyNy0ut8s
 pdxA==
X-Gm-Message-State: APjAAAWh/9Nyf9bAmUmFfsmJGBeCt6MTYIZrMmnpnM+CoFdS3Z6xXNcN
 g6rnh1710glIR/fSxNs9yP5/XZC5bcQxZA==
X-Google-Smtp-Source: APXvYqzIGA1fzbnD59EkfsIe3VNpri1WAOprW76nJRcZAdCg/+VTJ8MZ+ItfjZ0R+iC4V6eP5dKUrg==
X-Received: by 2002:a05:600c:2387:: with SMTP id
 m7mr7366917wma.137.1572090385092; 
 Sat, 26 Oct 2019 04:46:25 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o73sm5340728wme.34.2019.10.26.04.46.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 26 Oct 2019 04:46:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Corentin Labbe <clabbe@baylibre.com>, davem@davemloft.net,
 herbert@gondor.apana.org.au, mark.rutland@arm.com, robh+dt@kernel.org
Subject: Re: [PATCH v3 4/4] ARM64: dts: amlogic: adds crypto hardware node
In-Reply-To: <1571288786-34601-5-git-send-email-clabbe@baylibre.com>
References: <1571288786-34601-1-git-send-email-clabbe@baylibre.com>
 <1571288786-34601-5-git-send-email-clabbe@baylibre.com>
Date: Sat, 26 Oct 2019 13:46:22 +0200
Message-ID: <7ho8y3g25t.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_044627_579089_D5DEC655 
X-CRM114-Status: UNSURE (   5.11  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Corentin Labbe <clabbe@baylibre.com> writes:

> This patch adds the GXL crypto hardware node for all GXL SoCs.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Queued for v5.5,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
