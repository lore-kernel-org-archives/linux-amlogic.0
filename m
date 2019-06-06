Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718F2C28EB3
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 13:24:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482F820866
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 13:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCWRQWh0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISvIfUwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482F820866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9XG2IJ2n7PFHvcSVpZ1Nh2Acq7YufwNb2/Hz0lAb+0=; b=iCWRQWh00VCJdo
	NhsjNnYeRkatCa2zcBwUix+TR5iGjDepJX+tuZPddcRQjcjxwkLHZT57GClnoEI+GlXv9yK40Lhaz
	DRIfN+VLFXfqAf08JO6bO4YHLEVALEAfAC4gN5uN0aMI63UouSfGYEy7AXhm8LCSwuutRJc6PUeNv
	85dx982a1qVqX0rugaxyoECN5JIMVFpngfdJTQpxQTyj7j1QLD6IfmwDPzyr2NBX3J+qM8hEQKEWo
	euerlgO7Ntln0m2vT8wiWzsQTlYSB7CStTzQVRvfQcmF73xK3zDKHZAbitYKevIwv9Y45tpQszZnM
	tgGNBFobfycrVWZ4fMzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYsNy-0005r9-0N; Thu, 06 Jun 2019 13:24:54 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYsNu-0005pK-PF
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 13:24:51 +0000
Received: by mail-lj1-x242.google.com with SMTP id v18so2013295ljh.6
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzAzlX0RIFpmEOPyKd7L5UTvYpPd/VYX5UpRcJFDD9c=;
 b=ISvIfUwteBIdzflTCBaFl2o8TAUOseWkc5P7K7P2AIn9YlqtRq+BVcbxUKjf0brXuR
 ulad3xlhqbKy8saBohRZBtXjB1YY21vaaQSfhkUgyb25aGG03PpGReLxpLrIo5ETjW29
 l1vIBLnciZ5WaXjTrryKs4vGY9a+gTFOuxfyUg0aWmwlnYzw0SSGFI24/53ROxl6fveW
 Q+HqUgjtDqwPqvP6ov/9/B/aE5RNZQ3l5yd5C/3P5F8ykvf1duvTNjhtb1m+BjDccIxK
 Lk6iyBzRBdY+9i6wumFZz7LDuK1wbptNMk3wddRKZpl6ygV1S8i9JtKBliE0u4nWB6HH
 R0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzAzlX0RIFpmEOPyKd7L5UTvYpPd/VYX5UpRcJFDD9c=;
 b=pyEhilAkMNUqimKsgM3jOW7rJQeEPWspM5Vc8j/TCggQp5TaE4BMUTFBLekNTFbEyZ
 PqjwD7KGcUXlGiEYXJAL3mTr7UPuduO+eR0uw1UvhbMFanpFm6wIftGINYDDIo6RYjGw
 Z9py4ye6yv55cZ2FcEnogeaDjvc3RIwgYK2+HPQcEVZgp9xC0b7nMRGZcbI6CJ11EzsF
 LTzD/tX60/EQaoE49z2jo/4pT10QXn5rsJYPchVC8GkoprPerzUHlgDr7aHB1w0xH6xM
 DS/DT0PMWNaro9RbsQM0ujONi6HEd1Z9/NrBr/EqrcB7PCRxhIiRDk0ESBTiLzB2kUwQ
 8J+A==
X-Gm-Message-State: APjAAAXijANDY53ptpCBeZRd3Sr/kTARRo3NgmbUnejPUVkR2J3QX1vb
 k/XUCA19OcwVopmyw+IwqTM=
X-Google-Smtp-Source: APXvYqzwNCVniwtux2uKgU0PbDinjvkAvfhz2iw7+tBYSDw1HUi9lAQ5PwjN3s+IHNjxWawqiWov9g==
X-Received: by 2002:a2e:9582:: with SMTP id w2mr9495289ljh.136.1559827488900; 
 Thu, 06 Jun 2019 06:24:48 -0700 (PDT)
Received: from localhost.localdomain ([217.153.215.58])
 by smtp.googlemail.com with ESMTPSA id t21sm354932ljg.60.2019.06.06.06.24.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 06 Jun 2019 06:24:48 -0700 (PDT)
From: Krzysztof Michonski <michonskikrzysztof@gmail.com>
X-Google-Original-From: Krzysztof Michonski
 <krzysztof.michonski@digitalstrom.com>
To: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] Enable secure monitor on gxl
Date: Thu,  6 Jun 2019 15:24:39 +0200
Message-Id: <20190606132439.25182-2-krzysztof.michonski@digitalstrom.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_062450_815173_4C31BCD7 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: Krzysztof Michonski <michonskikrzysztof@gmail.com>, afenkart@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Krzysztof Michonski <michonskikrzysztof@gmail.com>

Add secure monitor node in the gxl dtsi file.

Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 3093ae421b17..fd75538ee9f9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -37,6 +37,10 @@
 			};
 		};
 	};
+
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxl-sm";
+	};
 };
 
 &apb {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
