Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49271C4743D
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DAF6121F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13DAF6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXTkRZecAzm8PpD4yzTuxcYiSTBlizjFgBY31Tn1pA8=; b=YoWjYURnakX6mH
	tEZDjSsgPnz4/BpERlkKFd6uEBgHXC+MKcf9bc5m5sDEPLxrjm/XUOuDWwyECWfwslkIqxUERH8Ir
	teWJh1jS22VcGN4z/KhGBO63l25Mj7ZVAQCokoqmxVd8WwS2SRtSraUxpjaIvdwOZxMGUK7Vs4aje
	fS/6UhFNuy8/e3Bn55Hge5+wP5VzYjrg8NRNoJHXlYtAWGfJdxqBiE4HTenM7VJWcrBG6ODAtfZGi
	LyNkAF5tzHXE998U83OLDKm/ZckLVEK63xV99dGeE7l9rFpOE3MmUs6SH8lWNWpxI/HN1WP4mmmR+
	SFQiNdABF2nE6mHNrBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPk2-00G6wD-Gr; Sat, 05 Jun 2021 06:25:06 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPjo-00G6sH-Qp; Sat, 05 Jun 2021 06:24:53 +0000
Received: by mail-pf1-f172.google.com with SMTP id x73so9027078pfc.8;
 Fri, 04 Jun 2021 23:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1f90Mva9ReuDNqMb7g12jTb4T/8wcPfWg+nhhZqJDgk=;
 b=UH2iDKtFrxKudw2KauZVehAyPEQhI8UT78skAhfpIen5K+PIgy1HAj557zAFkuqYfD
 4zhcLZK7PMHgc8VCCRNgiIdxpiLujqjBvX9uUHSmLLtimdZmh+Ik7ooqUXSmgKbdPr0e
 ChK3iwtHyoVjgqVdEFVqthnNOCHl4ClWtDy2ZN+Z8J78CJ25ZitVn/aG2/rZODRp9oc3
 f/wHBASftFLPm18DB0R2NpvkiqStjG5aG8UnPpLkU//g/5n/Afk+20HjYWCpFi2v4QY8
 NPosp2GHASBBlPglxidVN2xdvfY4qPC/rY5U4cfLhVoSoco+FGi1SyvvOx05uPYSqCYN
 +8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1f90Mva9ReuDNqMb7g12jTb4T/8wcPfWg+nhhZqJDgk=;
 b=q0M9exTuw9hfdOgLSJuUkHlBJJNTRXZ2/72SlnQE9bzdHDq9kpLOdjz53g+XoEngQL
 2dVeIVHPjDCL9wRyXvz0PHi+Aii+/mH/CxnfG4AVetZLeywVw0q7RSJbqSd2RkrvV/sG
 Q7e6wUuEAt6Dc1aP5nqNzU4CzVaMpbP0Cs+05RWltsuRJLi+D3vmlBGvH64M+EGNVZMi
 O3/tFuc+FjN8zmd85mYVUdNZPTTKKuGTP36eLIAQ40wzpKhCrv+z0CwDwiUED/MFtXLC
 rFQ/LYJHqH9q3ni887nTGCebY2WZwKw1+BXhhMcKabqUUeu7C6z0h4jpXDwppXVX+jV2
 b0Rg==
X-Gm-Message-State: AOAM5334DMYyYy42VLbYLLMizl8ggbJymfgRryR8FJWW8nnlMy1HDTIz
 5FxoQNFqhKeS+yDoGSH7Auk=
X-Google-Smtp-Source: ABdhPJy3+ehugYWHZX8thcdb3tHhsPT7Hx7G9ltjWt/CtRZhbgPUCCSZZMKjVMQBMxkMZGx2OPsNoA==
X-Received: by 2002:a65:4985:: with SMTP id r5mr1479067pgs.122.1622874232165; 
 Fri, 04 Jun 2021 23:23:52 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:23:51 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 1/6] arm64: dts: meson: vim3: add serial aliases
Date: Sat,  5 Jun 2021 14:23:08 +0800
Message-Id: <20210605062313.418343-2-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
References: <20210605062313.418343-1-xieqinick@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232452_878745_349D883D 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

From: Nick Xie <nick@khadas.com>

Add serial aliases for Khadas VIM3/3L.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 66d67524b031..4686ea7abe0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -13,6 +13,10 @@
 / {
 	aliases {
 		serial0 = &uart_AO;
+		serial1 = &uart_A;
+		serial2 = &uart_B;
+		serial3 = &uart_C;
+		serial4 = &uart_AO_B;
 		ethernet0 = &ethmac;
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
