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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBD6C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57BBC2072A
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iG5WGv9I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK7jE8jh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57BBC2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6osgK+7PPpCeL8Vy6ggpg1SAD5JWJEj4EGlQeBPdEA=; b=iG5WGv9IFNPT+VGmUnKKkAtvO
	rSu41Ws07oIX7I8SnY7XiIJrZFT1z8kkZtyabRTegqOJCqEJRDE5wLwNdxUYRM7OkpI0QPJggTC8/
	XJ5Ov0aFNPpe5MkQJS+ihIPgwt8UMm4sLXsT7oTPnuQ6NnCkkzXugu8lkdsd18GQM8MPZORJvB+BO
	bFI1/2UxlAkyKj4Dar/RzoSPJT61TNUgW0kDTC9g6VioUH8jk6dZGajfjnm9IJsO/ifQsvxGzcEMz
	sAjDG9gb82MpQgv7WD56L42kGXRaC3SKmEYEfz9WBlsxOnXSpGXl4xTyUNusBd8XoW+1CJNQojyVT
	yvRNBJ/eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QIM-0002ov-3y; Fri, 31 Jul 2020 08:21:38 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QHk-0002Ya-2W; Fri, 31 Jul 2020 08:21:01 +0000
Received: by mail-pj1-x1042.google.com with SMTP id a9so6701966pjd.3;
 Fri, 31 Jul 2020 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YTWKAn3+2FJLU6pvEHBBRL1vMfMKNpM5AF+rpxplthM=;
 b=OK7jE8jhsDzB3Zk+Dhp1+73UDIg/RQ9fSdRENbMxrXIS1jPzaEVwrpnVpUvnFFNRiM
 aHTesh1aohQoNJMxesBTd4eBo0aKJQmIHCP42HCPWRX2wGmlNhqiA2zRrxJHDF0KKomJ
 zdAoK+rx/dSMfjeD9O8r7XnwLf2WUOg5q9DJPS+38rHC5ObaBm9HUL3xvY0xNhaRCAOQ
 8SZ3OkvzPQ7Dv6CJX6hnZPJwG36u4eEw7tMzOugR1Lf7+BcX3fxRJ+b71X4qQj2lV/LK
 wPadv9PN8Fmrp4wz4ewyzR+NTFKl0DfsCxJ5nEJVx+zvQbBaNcLsQHnaffVqweiqPdqU
 P6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YTWKAn3+2FJLU6pvEHBBRL1vMfMKNpM5AF+rpxplthM=;
 b=h3t7zoTVnqNF0YzWvf5TDdxncr0MHasci9vc5Pfw3Jhik3NjQrAPiLelAbzEcJwQ/f
 2SJ0GizJXNGu5c/8wAsYkLm3xPUKu5cLSV6CsMyzsu52S6snTEdDsUVwZ82QfuGOa6wS
 AECySOkfYRoTOByydpLzS1vr9A8Ntz0gU+c43/QWF9K+lIl/cJ8poCZXxkrL5sTwR6ZC
 kxAylr+mtaKo/DisiXJx5ZvzoZXS8iP5Da2IoFooYrHctU24+L0rqqLHZ3/5KzF9JJK5
 uGmgYafDIbH4fXX2C/v9o6/2ie6Ws332WDnTVX7HSQSBmAytmw5Q947VJlXl5Y+TfByr
 f8fw==
X-Gm-Message-State: AOAM532uUMb1Wr6t0iq9SiYMBRh0+7vHlQ2DtHXLf/woSn8qnK97APqV
 KOQmaVRlaO+As+Ve5QYzsm4hJQri
X-Google-Smtp-Source: ABdhPJznzaliEY53DnCVMcPVQnzQIh7a4ERWAc2r8pTCt1Kl7Fsz0IHLW3+EVOVE+3u+E15t5KG7Eg==
X-Received: by 2002:aa7:9357:: with SMTP id 23mr2683678pfn.278.1596183658173; 
 Fri, 31 Jul 2020 01:20:58 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:20:57 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: amlogic: meson-axg: add missing ethernet
 reset ID
Date: Fri, 31 Jul 2020 08:20:42 +0000
Message-Id: <20200731082043.1682-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731082043.1682-1-linux.amoon@gmail.com>
References: <20200731082043.1682-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_042100_206421_5E9ED44D 
X-CRM114-Status: GOOD (  13.52  )
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
---
Changes V2
-Rebased on linux-next-20200730
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265..8e134cb470d3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -187,6 +187,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
