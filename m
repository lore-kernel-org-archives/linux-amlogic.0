Return-Path: <SRS0=GnnG=FE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77D9C5519F
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 06:03:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D016820757
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 06:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mAeMlwNt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqddcHl3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D016820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/aLUIZn76ujfZNljHtWn2Bhf3IdDJWrSc3Z8C5HIoM=; b=mAeMlwNtB4UolBs3HyQL8xIp60
	SdPBPPL/207Nu6QT9ZLe26dJvHMBnTUO2Ni4KqSY44Jo9p7BKQLj310+cy3ZibTOWD0ZB+6A8TxDd
	FHHNUmzArN5SVLznv1oCdUwXesWGQgQlGA6QuGr2kC5ekBMfNqqHwnTAx89DUwS40A9mQLxpR0SBv
	+6cm0xHLfjb52Rg/gvrEcZQJHPU8tBCR41rGds59jTC6McicBOgsvMQJcs9/grF0u1iLJucxZDbku
	7IYhWlhnYRMcp3VAvhmCyaLs5kFtljzK+ni1JXWpvU6d104NSK7ZRDnbPBAHSU48g2q3Kd/0J10CQ
	cGuX4mNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjcHb-0007wt-1f; Mon, 30 Nov 2020 06:03:31 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjcHX-0007wI-SK; Mon, 30 Nov 2020 06:03:29 +0000
Received: by mail-pj1-x1043.google.com with SMTP id t12so714785pjq.5;
 Sun, 29 Nov 2020 22:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=zhVPQbT+XsqYAAdzPNfOUxHPVoA7ByFSiGyznpbOHYo=;
 b=KqddcHl3nG9ICuWJI5DhumJWe0ZJ88hB6nEwLUN+dtqViY08r6a0vu16zc8qG+vR0n
 8279aVJZl22tp+TSIAnn6PNyWHSN1u4dgWZozDehwOSQK0sGl1PKY1EEfxYG/6ZkmXyq
 epXRr1a23/MvWPB4oli4SmPagrz6BAqGJG2rWIRo3+zDTK59gS49tNJJhxNH7lOACTec
 gENqMi9CoNqfiYx3fBfHQvggMyXQ6/XQYh/vuo16n33RniWvfMCQpkvIJCS3dJRCptfv
 UCbyj5DedjgoLaL0m9qsOp30fUQ5j6FioVqCbTXh7URQCqKmC1POMn9nJpY2d8cx2Gf5
 de1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=zhVPQbT+XsqYAAdzPNfOUxHPVoA7ByFSiGyznpbOHYo=;
 b=VbcvlkcfemV0LMm851ZbfO1ehRa6CYKXBQL/a6YlThT8v2uQ1vUUldyqC5J5nKX7zZ
 Th6TUI7vwCvHhAyCdodDz5R5alaT/5Q+sgm46j8Zr97hTtCQ8cke8945W61kEK/hN/YR
 XWA/ePe5Bg9J1LNaf7EJ7xiRTX0pX4hmBmOFUL7KrJyXeCa0Z3jvcLmcEwxgitHynGxG
 1UbVr3Nwjtozqj5DvMOrsv6nrHtTMNqqi8NzH6x9Gsje/WbZ2kLrds+GN2o6mRUl1v2t
 HGp6dHqjRfKaGjAU7GEDh1Aul1jFxMV7XJF2zRUSDZIehBZh2AbfYLXnWKkSYfQgIt+b
 LUwg==
X-Gm-Message-State: AOAM532LdC6UfA593GWByurXEDiOauUYTueqp7hya31yACpJ9iQ36je4
 h/aWn4OrIDSgMn4m0/K+rgY=
X-Google-Smtp-Source: ABdhPJzCZc1/oz48r0UAFMuCgh/kMY0v4ZvQ4ywv8DqkGU1WeB0wz/UvXP1kMHfB2QZFWxFbus8R9g==
X-Received: by 2002:a17:902:b116:b029:d8:f5d7:5fe5 with SMTP id
 q22-20020a170902b116b02900d8f5d75fe5mr17220389plr.48.1606716205705; 
 Sun, 29 Nov 2020 22:03:25 -0800 (PST)
Received: from anyang-linuxfactory-or-kr ([106.250.177.234])
 by smtp.gmail.com with ESMTPSA id f123sm148057pfa.89.2020.11.29.22.03.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Nov 2020 22:03:24 -0800 (PST)
Date: Mon, 30 Nov 2020 15:03:20 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson-sm1: fix typo in opp table
Message-ID: <20201130060320.GA30098@anyang-linuxfactory-or-kr>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_010328_042655_129710E4 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The freqency 1512000000 should be 1500000000.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---

Change in v2:
  - wrong fix in the previous patch.
    https://patchwork.kernel.org/project/linux-amlogic/patch/20201130054221.GA25448@anyang-linuxfactory-or-kr/ 

---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 71317f5aada1..c309517abae3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -130,7 +130,7 @@
 			opp-microvolt = <790000>;
 		};
 
-		opp-1512000000 {
+		opp-1500000000 {
 			opp-hz = /bits/ 64 <1500000000>;
 			opp-microvolt = <800000>;
 		};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
