Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21012C11D2F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 15:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E384320828
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 15:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T8M/WPyr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BYcD3EXv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E384320828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8lcBxPmIyDYeaEShcXO9gi5sJpDJI3r7n2zchP25rk=; b=T8M/WPyrk8CnFQ
	TGfkPFyyRXbMfWPHJX4nCse8q8RqpqQMkxwuWf7aARj2BipV1Q20thpNFbFqN+jQBoHk6bpWaINfa
	hkZzl1NZ6t8W8B2GC7/vrNR8Yy2pOOOci1IbCjmE2GyEYavzJIBAtedUsHxq+HGk5gAKNG80zZMIX
	lVjdyJImVM0bPbAn0x0QzzPW5aemSlr4uT1+verfrsDaQdDso+ZwvmdHh4GBQbZ5ML3CffXF6YzE7
	Q6VaxupvrySWePM/FgLLHaTtG2rMM1u1/HtX1wTcN6HiS2NG5q6zpzO0TuFMmEMMbTDecYCwQ1hBa
	GQaMxF+QwTrxU4So0DRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6FLJ-0007tV-WF; Mon, 24 Feb 2020 15:08:22 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6FLH-0007s3-FR
 for linux-amlogic@lists.infradead.org; Mon, 24 Feb 2020 15:08:21 +0000
Received: by mail-wr1-x441.google.com with SMTP id z3so10789349wru.3
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Feb 2020 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fT05dRla7k6mi1JhUyZzqKYXuvZdKNrDT0WVGGFRTl0=;
 b=BYcD3EXvKfzozIA2053JwVUhJ9IPx5JuCxPDLSoD+2e1TGLiZUpUZCHd2MMdViO7Oi
 HzZ8tSQb2CglmS9jZ31gIsquRyMfcrLsxFTYsuVUSfJpGKoAAN/YUV/1Re1ubTXTEXwo
 i64S5HP2Rvg3tQhPeunM0uJex3kztuETRY15tqrfR2j4iYsRdyv82/t6mDFDNNFrjNuI
 xtBbXXeDXaSu8PTmXmmDndi6NcyqtvX2yyJXTh3FQ+iQU0RYEIchk8VIe7ljr1ScoQ3p
 NcJJDIqNpVyNMUy2qHp6iwxB826rpWgNToIvCWPusyW0wL8PgsVZVwS7A3ZbtHM5K0Bg
 bpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fT05dRla7k6mi1JhUyZzqKYXuvZdKNrDT0WVGGFRTl0=;
 b=k/+JN957NjMiXHnVWhoTc3nL2YlYsPm4erCTJOPnZbcETx/Gv4+/gt1QvX0HOWZeBC
 a6zdrfmQWgosOPEzQ0qQqNXF2qhEcG02lTYDlNApEiWDmGjZSY4oleuSXIfDP4xMbqLC
 chLXv5TCob8XqhKlBfbTSqhVrOSoJn0SIIXXBfsH/42Wvkz/bMmOsP6FFsGV9eb961XH
 Q9ksQP575i9UP5TBjs9DQN1VQibnDNp6W21EXMb1yAGMwXuY885wVtzjU8QugylNTXwd
 1xlStF1fqFzqKJwTCDKXCS7QsgeIKOfDCwXQ5XR6T2r0jc9i8uCQy9nrdhEnv4HGnz0k
 wAAQ==
X-Gm-Message-State: APjAAAXXtWIzed3miRdhmKm9D7w+f9O5DtlmLUE5NEmYDRiWUP0BXj5s
 3BiARztr8iJ2jgb5a2/k4n7EEw==
X-Google-Smtp-Source: APXvYqzMKfwIAC3EPjlKXLjC88+oVE8Nagq9Gy14JsUqh3VEvQ3KLe3E/Wsf/vNE4nwruJpKV/hnmA==
X-Received: by 2002:adf:8084:: with SMTP id 4mr15568503wrl.201.1582556898282; 
 Mon, 24 Feb 2020 07:08:18 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c15sm19074794wrt.1.2020.02.24.07.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 07:08:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/3] arm64: dts: meson: add pdm reset line
Date: Mon, 24 Feb 2020 16:08:10 +0100
Message-Id: <20200224150812.263980-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224150812.263980-1-jbrunet@baylibre.com>
References: <20200224150812.263980-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_070819_519773_B39C7F7D 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the reset line of the PDM device to g12 and sm1 SoCs.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 03054c478896..55d39020ec72 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -56,6 +56,7 @@ pdm: audio-controller@40000 {
 			 <&clkc_audio AUD_CLKID_PDM_DCLK>,
 			 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
 		clock-names = "pclk", "dclk", "sysclk";
+		resets = <&clkc_audio AUD_RESET_PDM>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index d847a3fcbc85..d4ec735fb1a5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -448,6 +448,7 @@ pdm: audio-controller@61000 {
 			 <&clkc_audio AUD_CLKID_PDM_DCLK>,
 			 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
 		clock-names = "pclk", "dclk", "sysclk";
+		resets = <&clkc_audio AUD_RESET_PDM>;
 		status = "disabled";
 	};
 };
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
