Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AEBC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E8C2084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9z2hjlV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I32dt88p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E8C2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CbZ4rZ2LKGRovZ6B360DeYjTPXAiHvwkhMgk4onoW0=; b=i9z2hjlVyD5fg6
	epmijrsT/JgW3O3LVr9Z8EAZRSCC3SejGILoPuNGBz+9hfHloaNcUUvGOBw6ex04UTBUhrbcGw5vf
	bqvruPePzS+SHtghjhbI/BwfQOophKF3JwnY3SnXW0dAFgYCfEYQTlAlu7W3x+dngU0fyKhYzdef5
	EZLA7waScqZ1Ay9fBaSo8bAwKRSP3+WIgPN2sCk8hcHMCLR5SxO5h3b5kFdo4VXj9wD0h87feeAJL
	Jc3yFtfKT8rO9uvnZGS5tflzI0rOqLu/YZSsgv7ct3xjB0pzfNAEzxBj2RPrWZnXXbLOxEs0m4bLl
	1c3UDDG4ls4TCKTgYGwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEt12-0007ml-TZ; Fri, 12 Apr 2019 10:02:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt0r-0007YE-TT
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 10:02:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id p10so11188846wrq.1
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=9Zs17V+7Q5Y7LncnLItMZNJBDJdxDInYfDwePk9CLOc=;
 b=I32dt88pUCKmVfIQ4jJMEa9xBqnSBOBOeNqfWUDRJa/j6GZUkxFyZvD3pBnYWuTMzX
 nubpzsMSx/QKv9dakvSn4GqzLt8lamlpxDKvxLm/Me/4mZme7+u49mai3Imm+201EvhI
 y7tJ1Cg0A8k3+JZ2LCpYOBWyw5YbS0pue17Bc+JP2LJtIs2VcIRcIHEhHBTvDygJVM6d
 w0Vo5bKZ1qtCVGYK9L1hoVbQzn+8L/V2klZ/3XjsrkLwR3B1TtwXO2/syt5uRD+BRqFX
 WPDqB1Y8gTo+fwW0Fc3BLruvJXuDuhcRjkoKrNGhRLVSEV0l6tvEDDnzIqCd8IfPJkjC
 PnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=9Zs17V+7Q5Y7LncnLItMZNJBDJdxDInYfDwePk9CLOc=;
 b=s84Wq+JiPXpYJXLphJTTNlH0grtd0SLpMpBNCnRrGZz1kG+PkEOCQVRoEZ19594VNt
 gagUkB+MgQtp46pQP8T+RofBWqlGqyjbIWjoIwGHHvNufFciTjiMxqZZVe9LZHwVXgc2
 lWsrWOJWFWaUhEoTlKbBZRerr6je2Bo+1HbHJfreNV4hbxxFYVP3xGQh8dE4Da2ruGOd
 522NOih2/f+0QSB7tIArjjuSvtos0d0QV4vXzMygMDPWzzA9mmOZyKLcsc+pqBRZQLi0
 Y71MZ78k9i687cabrUc00E940Smpd0zfokXoHpaywvtGEKEY3lHZKuP2Rad1qw6s/MQY
 EAJA==
X-Gm-Message-State: APjAAAXI4MgqvTWq1Wpzw4iuRwkz6wO46WKeVqBwKXcHnFIHD9s3FOEQ
 o3AHYKwbMyuJdzLGq9wCOmTjbA==
X-Google-Smtp-Source: APXvYqyg3+xxim/zUet/g4yD/5T6+z7+B+1j6pkHJ3bnUx1OXbz9NTSoaPB+PYUcyQjlE8SJpG4YCQ==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr35745079wrj.134.1555063344334; 
 Fri, 12 Apr 2019 03:02:24 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm5961031wmi.16.2019.04.12.03.02.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 03:02:23 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clk: g12a-clkc: add Temperature Sensor
 clock ID
Date: Fri, 12 Apr 2019 12:02:20 +0200
Message-Id: <20190412100221.26740-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_030225_946928_CC86E934 
X-CRM114-Status: UNSURE (   8.38  )
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
index 82c9e0c020b2..cfda463091b7 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -136,5 +136,6 @@
 #define CLKID_VDEC_1				204
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
+#define CLKID_TS				212
 
 #endif /* __G12A_CLKC_H */
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
