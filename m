Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFFFC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2BB22CB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E2BB22CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j49N2OjBbALyBQAcE50qjR6YRXrF80lZYDaLZz2L/GM=; b=ykvec3opLe9WuwUzir/Fv18J8
	a1NfczFKQQ8dMqV7r59Ku9EqZxUWnKgsqFtWHkuNYVFebhfbZd52606NoGS7DHmB/SRUvVGY823VO
	mw3+7Y7gNkLgurhKDt85ZglQGpo2oStl++GBjNJuipxWyJGQHkWzSd4sEgoVhGDUA9O3/wRoF/zup
	oZWc9P8iLE2ECLISOdA0rDF/8hM/zOFy1VXjhjASEqh4JSRXzac+T2hwwfgpjyzu98JLjaVcN6Xe0
	onYjc+/+D5inySxO8EzvrpHtdDiQyhqpqIaMhF8PGLEtxvUCNzvXMSepMN9H4ILEajp0MnolOzNpN
	PMZ1yKf7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQ34-0005GC-2x; Mon, 21 Dec 2020 18:36:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQ2s-0005BN-N9; Mon, 21 Dec 2020 18:36:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id b2so10569435edm.3;
 Mon, 21 Dec 2020 10:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNd3Cj9ofLW7wsKsWYoo4m+jvoyCrPWYva0lGSx6HLI=;
 b=iS2yVEm0mrQBkSIzs31UmsZ8tWjNIpcJE29cPmW6sbugzwVDkaARPZkD3lgzrlAFhe
 3Z3qqcrfvufI8FsD0iCzzr4fw58v3BSxMyAlGMdWldSoL6Hl6fki+72imeQHD+cqVYSg
 6s+gDNUd4j2JRU0pAghzMbys1e8uFqkTyCavTSfJ5rSJYWXgyQCxLPAyvbocG5vDhbgO
 XRYNdF20Mn4R/jnfRnTyObyUl0cksHEMOLNb8UX4b+0TYWADoWcg4JRaoenze1t9LLPF
 u9uobKiLp3exk3Bg6VOQMlXXqxQrY5aKTVzoHfS8CXAWIq1PU1neVlWjPsVP/FmANnft
 aAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNd3Cj9ofLW7wsKsWYoo4m+jvoyCrPWYva0lGSx6HLI=;
 b=M2pjzGiYs4YPVOVwrdVVIEE8ylDMQQvLsqbpLm58o+aCLX8AWJfU6d+ATf/Ltt65LU
 QRJFCesTmrVGZiZMVVH1kGaOBZ6r8ytUEVyZCZdueIN3b+FR2S2eokZyPI5dhBSUlFc+
 tDXnDz01f8oTLmAp+86dUkJ37dK97D1X/EE1BMGgyNZiWyJsfPTgBNY37cjqTym/CRAj
 rCaD2UC8RcyD8Ca5NgboFC5re0g5W6IRYzvWSPkpREk60V9qkhAVYCMJMv+gQH0gVavU
 pSa0+Fd1OEBsB5GgEb6wBYk89Y+8L4+JgZ+Aoaww1voTfPrxO7hq46J3ZXG7WoWx7Ecy
 KHCA==
X-Gm-Message-State: AOAM531T6Py2iLrOXK367C1Lht1MjQ27g4zSWyBhcfpdcM/J7Dq8J04I
 ow10SClvmiFu/aiV9qhiEvnDWNsy0AA=
X-Google-Smtp-Source: ABdhPJyD0W/TddTDIYPKP1wBicmpB8JUJSeMPnIuBd+Ypyt07Y/3n769MYyET0XEuVsR4qEKglpLXA==
X-Received: by 2002:a05:6402:308b:: with SMTP id
 de11mr16882835edb.205.1608575793147; 
 Mon, 21 Dec 2020 10:36:33 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id ld2sm9390408ejb.73.2020.12.21.10.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:36:32 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 2/2] dt-bindings: clock: meson8b: remove non-existing clock
 macros
Date: Mon, 21 Dec 2020 19:36:24 +0100
Message-Id: <20201221183624.932649-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
References: <20201221183624.932649-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_133634_798681_75F2A8C2 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CLKID_UNUSED and CLKID_XTAL aren't valid clocks. Remove them since
there are no consumers of this anymore.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 4c5965ae1df4..f33781338eda 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -6,8 +6,6 @@
 #ifndef __MESON8B_CLKC_H
 #define __MESON8B_CLKC_H
 
-#define CLKID_UNUSED		0
-#define CLKID_XTAL		1
 #define CLKID_PLL_FIXED		2
 #define CLKID_PLL_VID		3
 #define CLKID_PLL_SYS		4
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
