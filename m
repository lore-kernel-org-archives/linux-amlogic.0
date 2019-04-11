Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBCCC10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 08:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC712083E
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 08:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CdRwjJpc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="brU6yRC2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC712083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMT3lL3sSBl6zLmC5OgjMmIUCoDdvIL+1B5szdNnT1I=; b=CdRwjJpco7uJ6A
	gGTq6wugjAcVpbpC/bTiL/mLiBE3PPZVVmtngSBHI6vLAcE88+MPjejyVDOJChvcdWPvBZ5m7IkLY
	+gcdts1Eb20RhcxfibT4ikcErwn0jMy+ViAcFLlzR2GsWK5l4EqSyJ0FsdEt4JAZeRAVhqSHxsKvi
	UnC30pePBjaSiecJaBj8PdC6MsQ45mcjClSFZ7eM1IvKzYhw2TKWDvxu5mJyWab65WpMpDfwF669L
	MUyWs7qjKBtNmkMOGZmw374uMVcjji/xr85+P/0SeM9eXh9iTbCd49ZTewadz844KxXecjP/z6USr
	EIWcw1LfLrGindF6SsVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVLQ-00033K-RR; Thu, 11 Apr 2019 08:46:04 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVL4-0002al-Ou
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 08:45:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so5594694wmd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
 b=brU6yRC2/R67qR7FwEPXgWq7TMtY3G392GEJp4iDaBRyvhCusWFHyAaS6pYicJMf60
 FJV8zzS64jtbceJfeADF5+UAO8jacrkTYcZ7pp6+JGcHd5z/neIKvlLN+wRfC7qUHsIh
 YOEUxQTUj6SDJ+t9OGUxNCOID2PE43j+B4dvYouzart1YuyCaOp/MMPwSJLE6bpX8aZD
 NDbVvy3g5fHNVl1xV+TuRZOS7beZEef5kJmo5F1wFntu8AfiJt3eVeDYMr48o3LoqYXn
 +VdlfQayRS8iyKStauO6bGg45cnZefIdE1snnnrxUcwm9SgI1JygDlhOmNyxVecixHZx
 HqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=72YojJ2ZI4Hnj5UZWtMVH1bJJscttQzZHVGA77jha6k=;
 b=h6+g7Kchpih8gTTwrhj2UCc+P2ublLa6NwOi2iPibD5pLQSfwXYtSFIYT2W9DgstiM
 HlJIp30aAHnx8H0iEV0i8SOeBZ/CjE3aMCaL/9EiFg+1kmPgMstJ8BXM+rkA6QrNH97u
 m2Gm+ijFGKHpGA2Y/HYM2YGc2KcEAOD4v1l0VQq8vpkkn2ddmvs6eekWAvGh0Cr1r53b
 yM/Isskb1XNTeNm2Xv4dOrKBQClNiUVMod9acHvWOjXTGUd57h4cyLIdcf/VeNJ9d0Hq
 Im/4FYoAHOiF+742WcuFxytmmgmp9MaOwng/gWSKzYnE1Jb9x/rmAM4VaE4nbunDFsk5
 /zxA==
X-Gm-Message-State: APjAAAWOZMTqPSLzTSiQrOFYKGdq8/nRWYxpb7k/ogrkaMYoZLuojOHU
 z3MCNktEedXjo993OEVZ0kaYOA==
X-Google-Smtp-Source: APXvYqzD6/VS9PfVDNO6HphW5M4EV309P4F8/HO4da7MQt2vi/o/ZoTzBqwZPAJIq2PCDip1y0tfhA==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr5858487wmf.5.1554972340768; 
 Thu, 11 Apr 2019 01:45:40 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 7sm128602876wrc.81.2019.04.11.01.45.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:45:40 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor clock
 ID
Date: Thu, 11 Apr 2019 10:45:36 +0200
Message-Id: <20190411084537.30299-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411084537.30299-1-glaroque@baylibre.com>
References: <20190411084537.30299-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014542_807514_F62C1D57 
X-CRM114-Status: UNSURE (   8.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add clock id used by temperature sensor for G12A Socs

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..85cfcab10507 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,6 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_TS				203
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
