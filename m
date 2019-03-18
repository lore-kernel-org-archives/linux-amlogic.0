Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF72DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:07:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10B02070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aAJ6faRJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V9q4JOR/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10B02070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xqo9swcKwoJYmesnkyTdOiFYYOZJJIXBwvW8B8SFLFg=; b=aAJ6faRJ0/FNuQ
	ROO/OaCgoKBsmgMyLrlfASMa51wwVfbGQpqI1OZvK0f9/s9B8AO1sSWR6SPabW9bYVZ6aUve9ClAw
	I0aVjnLD9we47YSqRvKYe2MM1OkUggXz8BBUq0HvETrz3FQll3gpv/qV7PYmRbC83tLpYb5891cEl
	Ivkqh/JaMqzr1IyU/clS3joBjDILhFyQhuVAeiMywpR915l8OZKbSwm4YT6yfIhNJUHyszNjS1sl3
	WVE5rGjqtBljrl5aISWnzaqgVJ6gRYPU2+O/3GJ6Pjl+mUeQjhrvs6ORfEYuQY6RgjcJ/NQCkVAac
	K0QD/S0RQfdquMNWStFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pB0-0003Zh-GG; Mon, 18 Mar 2019 10:07:26 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8o-0000U5-Fb
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id a188so12026996wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1m2cZ4Hsds4Mlix4L4I7dVD1tQWYPx7jZATENXCdR0=;
 b=V9q4JOR/b6VgtxPAtDphRKRoCMPKmUrMmGNXmfYimJeJX1X1Y3Z+jIbjMRn59t9T4M
 cRkEg1vfHvXpsFzNQ3Wc9VWr+tVxpiEcgfUWgrvQquo2b9aPBGuy6Cb2H2g8eOEYbkfs
 VZPEkMGa5q5bR1BjBV6YOZB//BBO2vXwimr4en9WnssSUXzROoZmtRBgu0LrvJQ2xXqs
 OzRGZXzUT/nHnXB15BTBT4xO5VBlV6GNq0y6oEWtzg1m6PMsXGeNaFOdUZ6h56aUc1IC
 22Qj3W/YQTa6QKYXLv0W9QOtnt7GsOFdwY0bpU4qsYUVrphrPYGqdwH9RcU7ZW3x2pjS
 5tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1m2cZ4Hsds4Mlix4L4I7dVD1tQWYPx7jZATENXCdR0=;
 b=n2cYelJ202N1gqtW87GyDJJjVCsD5cYqMbfSVdjqoCcpO1OMvQof7lfUZSWNm3Mbfy
 la9bVYRzz64Ue0/IHzYw5d4yiAElazSdCMPZUFip3fbpe05uE8MfMIT8ZRNwI6fpbJrn
 D0kd8pz+Uek5a7cfAtz1oBSM2RLky2sJ19J5yON9iHNn9EHTMHfL+MHXMFdk0qCtJnog
 DaxUsL6P2bKkF6bmPMm6UzWtXXaOvxLG2eF4C63RaLQWjdaxj5mwNw8nE/zCEPnQPlcA
 uYhKaTJsuWWBns2IFdyNXy3lBq1Qkyl8naVK4Efy5fn9yUIniZ86Zasxudp0OdRZBfZv
 CUTg==
X-Gm-Message-State: APjAAAW8ZOefgNa5JLjvIAJm3CQAWIhLXeYno+RTlYINwKZ/zwObng31
 07XHC/BnKFAHcSx/juFU6F5VLA==
X-Google-Smtp-Source: APXvYqy6mAWZbbu3AkNr+/6AEaAM6DGSfu7zYfBU0VUjbVtjtWASTJfE6YJsIxzhhQszgSvy5Of6ZQ==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr11086345wmc.30.1552903509019; 
 Mon, 18 Mar 2019 03:05:09 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 09/11] arm64: dts: meson-g12a-sei510: Enable USB
Date: Mon, 18 Mar 2019 11:04:56 +0100
Message-Id: <20190318100458.5619-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030510_738041_F2A1CB4E 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 and USB3 Host ports on the SEI520 Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index ebdad5a192f1..c350a0165d44 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -125,3 +125,8 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
