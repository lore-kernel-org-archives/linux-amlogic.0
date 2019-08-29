Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA0CC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E84332073F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mp72ftIE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dLorAy/D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E84332073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0hAv7HSM/1yMFe3SD5+UOb8m9r+aGklTwqjp/WMj1Q=; b=mp72ftIEa7bvH9
	JTwnl/sBbXKowsPhB1UjBSPMRAfkSc/8/BRXYGr8ZA+sVMh7i3KeAhIHrHPSuhbmCnZFBG6mo3eNT
	/pUwkpp7MB00MgOwnc/81eGLMKSMBra7OfFDymSv2T1fK7z3SvLz8Z+vNUK5h5qWQAt0mLC7q2Kas
	Go67fbbDTFqFw9uKvcw0gBuz5ON4hAfPLlqoJxMRny8zO8D58ishg+Mnk5RC8aj6JK0s+hAEcM66p
	HsxtN2OC4rnAeOEdP6688mIWw8hnuMQd1puUgkO2ewmbFVbAgV2jM7XCTClgRRctQenB+Y6C5BHhm
	y5TimzL17XmYgZRcBgJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MM2-0001KT-Cv; Thu, 29 Aug 2019 15:28:54 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH9-0007SM-Ue
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:56 +0000
Received: by mail-wr1-x444.google.com with SMTP id y19so3879211wrd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDNcnLq+b6mBPqMQqj1uI4ke3syAlfKCQSY799vo0LM=;
 b=dLorAy/DgPWHgQKpS9UzHskRBhT6WrHSkOcR0GwM8nusl4Jg4sN2daFt6AE5GcvhMO
 2RtioBnQxvK5m1Nt4mmURPkw0nsjew196jBud9NnF9Or+MzKApgoqbZtongSNtejaPCg
 13e4P/O0DFPCAAOvUqo4DJApwVJB2UiAQFzU7oR3ZjMhGoJBUCfhuwA5POL7vA/G/8it
 3c+qXohLp81m2Ku1T+PKJ7ngGADw09iRR5nVqp8tz1dFtKr2+az9yHm8QhAwe5HA3yL/
 bSr+SKNFvvj75dZge/2ZqhhidNdFhgcUMkHBlSBqPmcIc0swIE47G2B5cdv0VV/rUI9j
 fnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDNcnLq+b6mBPqMQqj1uI4ke3syAlfKCQSY799vo0LM=;
 b=Q8e7jIO3wGzfzNJHX5T87Go/o4TckblusoZBGuiPzI0FsqX7dJwLee+R4t0dwg5egr
 fuq8GolKFaJgm52q5Stwvku0z9C24PMxHsf1XZu4KcrTDjo3FdfuDoNIV6pcvhxpMGGT
 fhZvUBgZ67rBhY48mBWJDq7e+l5286nRshPjkY6qn3wtmLenzDXlrCyGK7Jqg4dDg+vg
 ZKgGocFBTm9tkAxL7QUq+St6gUTr1H4ChLP71GJYcw0XXgOEfvrriVRJMlgfo3rx9MgW
 /TPzpZKQK048iIfVUDCZSaWUDPwY/eN+LV+Ouv9YJPs/pmgmKVlX/Q/0HL7wRkHJIGC3
 bOOw==
X-Gm-Message-State: APjAAAXMcxhyMyNxmO13HbpH/3oQZhJpm07O2I1depTq7PX/ZdUiJEFe
 ATdVbSqOkmKZTLWNUj5N7F423w==
X-Google-Smtp-Source: APXvYqyTy4p5gj4PxVF79IC7zf/oN42FSf8AQ/YXD/PbaxsDqieMtxf5MdKlVyNt9EAxAJmJzZ9Mdg==
X-Received: by 2002:adf:8541:: with SMTP id 59mr12256907wrh.298.1567092230520; 
 Thu, 29 Aug 2019 08:23:50 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 08/15] arm64: dts: meson-gxbb-vega-s95: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:35 +0200
Message-Id: <20190829152342.27794-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082353_806061_A519C85D 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 43b11e3dfe11..d2ee2577d479 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -183,6 +183,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
