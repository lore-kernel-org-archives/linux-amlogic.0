Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E0DC43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:46:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DE7206A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WMuZ8MbD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KzcCsQcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DE7206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zDRkoN+2Sn4eLVdNhil2bpv00jd/hExoaXmgY8c9JoM=; b=WMuZ8MbDC2ea9WwX99HATe78x
	9bhsBN2h51Sng2Ca3/Mc8k67DFq5gwo6RuSm6/1yUl4c30Y6hkbbIN+zHrD0wLNMgbBxPZFf7owun
	DEd3ex3b5ZOk0OE/0akAR5I+7xLhw2p0GMjgGEiO+YoHf7a5xNn6xQV0ClpkfCv89eVAACdJZerRd
	T3mQyA5xnMy2uxwEQJ0QNho4U4mWxkPFkrQLu3EQwyMWaQP+qK+nBbgJnUDbIj2dJDZ66y16/e08S
	HXSNEL8ychO1tHigxvU+MH/qovEymt9fGAwLPtjlXLvyFcypJYBXaRrsnPiGO3NSgfodCVE8ePPV7
	zUy6FxgrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIALv-00033G-F2; Tue, 15 Sep 2020 12:46:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIALR-0002r6-1E
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:46:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id s12so3121316wrw.11
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
 b=KzcCsQcCjNO2iAn9TLGuYKccXqq76Nj0G9UJEj75DZeAVJEgvJT6Akrl2s/t8SN2jR
 f+VpZ3IYj0dWNYEWjt3KYBSzy+3ss8FhI3NjAX9w7PAbvdI1K75ZPZTCdZ3N9EZTpRcC
 9KyxKduWnNaYewl+WxNSAPi5bUdQAPrc7dH2IXz/+fOpTb3AJ92YfMuVMk3VtQtucnyc
 WeF6Z35o9CcD+fsh2JtEmSrhXeediy1NniiqbJptEfq45VvvtOXHPVKjusNu4HMMoBXC
 CHYpVKAW42yRxwxbyVUQvVGwzhaw46d2jKslG9h9oQI15IMindO2vTldycnwE1V4VQlW
 dF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GVroTBa/RDLMNit62OYeyl1hwDTywX684KnqperhLJ0=;
 b=hJn/5MAxE6SlOL7bVGVmpbPd16tw0DXDBpDTECie0fGuerdj5jLvpHZTgObQhLmmyY
 lNSAMXcX7Gy4UBiyBRgRoCN8s3MP9rTEjE6ZJS5fW13EOVVuomLaF3tFZZWblQK84Ppj
 iqLHrKLouuanSNCHvO9J3UMJOckXhtzA4J8OGOVUKXm5a5SeajcX2WVZS58yVjOKYBMd
 DP23KcUk5w6moBDm6Kjuu+961HVgF1Ph7NrdlwtKHtmk49zWeX3Djkyey/Ka5h2W5Qkt
 DEHaX2AqbYRUDXtZOvSZOG7UzRtN0x4SmDj9a/tVbClpP82kBTjMMHkyLXrmxslyYMFi
 kVzg==
X-Gm-Message-State: AOAM533Z//EnNBvR977DbXjAG6Kx1imKXUxqx762aTHQI9Awx5aHuI/1
 xqlZWxNDSeXK8rfHdIOXBdNaxg==
X-Google-Smtp-Source: ABdhPJysDu/Y8r8jEY0r1n/+h2yMo4tuRHu2mdOTiCUa1sJv4dyYJnuG+Dz8/5wjkBbEz3rOODjJgg==
X-Received: by 2002:adf:e690:: with SMTP id r16mr21086562wrm.15.1600173959260; 
 Tue, 15 Sep 2020 05:45:59 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 q8sm26548589wrx.79.2020.09.15.05.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:45:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: clk: axg-clkc: add MIPI DSI Host clock
 binding
Date: Tue, 15 Sep 2020 14:45:51 +0200
Message-Id: <20200915124553.8056-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915124553.8056-1-narmstrong@baylibre.com>
References: <20200915124553.8056-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_084601_150504_C9417DEB 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock ID for the MIPI DSI Host clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/axg-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 281df3e0f131..e2749dbc74b8 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -96,5 +96,6 @@
 #define CLKID_VCLK2_DIV6			130
 #define CLKID_VCLK2_DIV12			131
 #define CLKID_CTS_ENCL				133
+#define CLKID_VDIN_MEAS				136
 
 #endif /* __AXG_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
