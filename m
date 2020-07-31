Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1272C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF802072A
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z24mn/9J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRKxy5s3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DF802072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Tfoe3lryU8WrUl1hkRdLvmQ2xHxtCJETNCG6S1u+qA=; b=z24mn/9JoWZ8Fbf3YSq6Gh83r
	KuCI947ZG4Z9vlmK3FK1Bx8D+/OfGHNahitBeJaHWjS8Ap9mNo/ofoQOIcmkFeK90WJO5VxXIaHNS
	UqqmLMDhUdA4LV+GUmuXTPc+wDjQ8M7ONtEtYCoI88Gfetck14xI9nCiGY3hAk149m3qvhrqoEdFH
	3y85i09FXR9xoa07k0AG+9LFcXsxLo/gUI7+ADJPViQL6LiP8j0rqIiISlkbD08gOZjV7g97Qmi/C
	vEUtjQ2nntGgnKeb9XILMo58xDg8O3h6LTFN8tGvZW9Ovetc8jTrxvsGgDAFoWwVQsv6LMwsNpElZ
	lSV6kD+ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QIT-0002tb-KK; Fri, 31 Jul 2020 08:21:45 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QHo-0002aM-0v; Fri, 31 Jul 2020 08:21:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id p1so16716613pls.4;
 Fri, 31 Jul 2020 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7vrHd79Z+pB65Q/lSdE36wEYsbddr7yLB5xs7W22qOY=;
 b=bRKxy5s3lMKDLKQz57qJPQY1ZTwGHFhyvb1WR4ryQzwfvprSKXH6u4pQ/R8gG3iFyb
 CaehQfSMN+ZikN0sSHGC2+SJ4FimjjiEIEexQprnEeHT/FqCaTaM1Ctb/WMGsV9cHbiv
 bD8laxxI4UcGBqYeRkOX0s8/8EJFeiE5aj4COiwxFkZ/bLwqMb8IIr19HpvZN3D2kfZS
 D4d4BLXt/Tv23VCq9kskT4aQ2GsZcglWhuPT6k+NsM4Z5mJ4QukIHrIn5YvvTLIYXaH8
 TUUwQDP1+RiE7sTXFtiawHD91Q97pc0RbQCT18fjAokCu1y2AF7zIpwqwzp6P64Gm6bT
 csFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7vrHd79Z+pB65Q/lSdE36wEYsbddr7yLB5xs7W22qOY=;
 b=bt0s6cO04BhOQB9ohG3B5Yi72DwGI4YKas2NC1Igko9nIXFWk35YeAH0tbgli5L80/
 6l8LvZaycbZV21jzB/rvpPYqwJ3rFNEr9pKC0eaHSgv9b584Ndcoc+5H/SSOPAIVuvsp
 fpNv9gTCshI3gYaBwhRHH23OwjOlO/U3DTJwIE41qVsS5BNnjYOJWowFiKaMWSWE5OOW
 gftMKnHKDObhfiBHUprn/vWDBC3tk5jFAEl+eNDk63ay35Ei/fMdLZ0cr6ChpOXxN0er
 wKXBssCwx2/dq3PpgQOA1SNALeB6L9XLUbsczkLa4XJuC+GFmu29Qt/ec5246Zqo6Qlp
 p12A==
X-Gm-Message-State: AOAM532PZVPmORIVsRXxMolFfRClIXCTFzGRQBF4C8nVJDlMo89f9o9R
 jYcgYSu26I10E1R1uBvivzA=
X-Google-Smtp-Source: ABdhPJzjpXk8dwQTiI/C3EeWHzDALfK6uKLrVhxXumTFfJ+TQNcW9N1dwa3Z4nSCD7Jr2LvuL+GmlA==
X-Received: by 2002:aa7:8a0d:: with SMTP id m13mr2612584pfa.13.1596183662062; 
 Fri, 31 Jul 2020 01:21:02 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:21:01 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: amlogic: meson-g12: add missing ethernet
 reset ID
Date: Fri, 31 Jul 2020 08:20:43 +0000
Message-Id: <20200731082043.1682-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731082043.1682-1-linux.amoon@gmail.com>
References: <20200731082043.1682-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_042104_450612_272BD848 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
----
Changes V2:
-Rebased on linux-next-2020730
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..63d19fbe8899 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -224,6 +224,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 
 			mdio0: mdio {
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
