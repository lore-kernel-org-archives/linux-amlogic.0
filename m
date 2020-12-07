Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62183C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:02:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68DA7238D6
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68DA7238D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Y934aI4PxtmorcVvj5uR6DBpk73YWg2NgygBArFtU4=; b=ABvfX5zuzyho3AJkUvq6vStku
	eL4qSvHy+lKI/GmDI7zv8rqxFZLzCpL2A2ZWvjlvgeYgGip/URHjjYomqX80kZjJK2pxesH9AEI2x
	inovNVy56VIUqM3lNRidw5IC0ycWT4efBTygKeUKToIpq+d+rG/i+uQ2AMfzHl1FKHQBs/1oki8WG
	wn6fzJxrivArBtMa6BSYsR9HG66tbDNwRjLT66VZE51AbBsa6Lf30+UiGppV+FwqLMAWs5ZwRuRgk
	32McrOtRtmQOum0dh2loNiBDtkw5hlfXuUKm1avgZkz1xO8Ypy+PN4UIkt4X8chgVlM0ZoJi92dFS
	j7QoM7YaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmLm9-0004hi-CQ; Mon, 07 Dec 2020 19:02:21 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmLm4-0004fy-N0
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 19:02:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id c79so10995007pfc.2
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 11:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNT/GSD6Jspry3xOETMgZ+5R7hOQNHkoYsb81OOSgoE=;
 b=qXHRxVdXGEt4jrgV3Np+hYLOFnMr+lPYCgp6i+RvZ+sOWv8QndMUEJLPtrZc3TabP8
 8yOJ6imHgzPwIzUHA92RNc3AWwrMrNVNEeIOkZJeKPkOBHtPvJNrT/6MO0nH6sFL8sI0
 x4w5Td/0H4765t4HieBvcBuxSaHDxZY7uB6B6pCT4x8Y23iopO2rWbP2OznBVLXT9i1q
 SrOk3hkltym0GA//wQ1R0+HbbzBeHe0zud277Sb0PQwMSagF41kDDSaWALifrV1LT/ME
 mXvITHn9NLjcchIsekyMQt36oNMA1E6er2zEwYOfZGtY7PSCzldqbyAx6AvNd158RCkF
 9ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNT/GSD6Jspry3xOETMgZ+5R7hOQNHkoYsb81OOSgoE=;
 b=D/X6AzSUUtEnSJuiFhUoV6slO+0aMBOuGFrAs4pzXLG0Us5lvWumdjOiWDEEFNm84e
 UWswzlYmdS8dY5qW3jZS5AkiAmlG7sK54vX0SMkQ0Pqp0tQaNCtMSG9BtrxeyWn8oR2B
 5DpgErIwX+hIlsb0o6FDMr3aHIKRToV5ewYi8OaYjC5p1fE3byZkyQmBZbarfPYTGTUC
 Qxl4rax33OAeiYfND2/HSeqnLFNY2aqWkotGRRjccm1QXxfh+w27D6+svM5CujZEDacc
 UI2f4iuPyb4YehhxBjbp3GUjl1OWP5KrG5SrNsCoho6qOTYvzCMa9LE6IugJMUq0QYGX
 eVsQ==
X-Gm-Message-State: AOAM530j578PV9Z2akHk38pDX+qwEebkluIWNIVBPsV0GYAdCG+WPQGL
 zYDMY43MgKz5Dp2Budv3wwlDxQ==
X-Google-Smtp-Source: ABdhPJwD7F8xYbr/B1aFoLQzlUyqcUSXwJaeS8K7Zyi68TZ6ORXeM8yNFnPC0loE4GWpnbs63dixLA==
X-Received: by 2002:a62:7b84:0:b029:19c:7146:4bbb with SMTP id
 w126-20020a627b840000b029019c71464bbbmr17309429pfc.52.1607367732544; 
 Mon, 07 Dec 2020 11:02:12 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t131sm1242202pgc.55.2020.12.07.11.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:02:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: hverkuil@xs4all.nl,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
Date: Mon,  7 Dec 2020 11:02:10 -0800
Message-Id: <160736772527.32056.13173177680923020386.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202174417.3778306-1-narmstrong@baylibre.com>
References: <20201202174417.3778306-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_140216_956481_4551EF43 
X-CRM114-Status: GOOD (  11.33  )
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2 Dec 2020 18:44:13 +0100, Neil Armstrong wrote:
> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
> 
> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
> - 0, 90, 180, 270deg rotation
> - horizontal/vertical flipping
> - source cropping
> - destination compositing
> - 32bit/24bit/16bit format conversion
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
      (no commit info)
[2/4] media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
      (no commit info)
[3/4] MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
      (no commit info)
[4/4] arm64: dts: meson-axg: add GE2D node
      commit: b03455ae3c8a7e7999f9cc43ad87c63b44a89344

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
