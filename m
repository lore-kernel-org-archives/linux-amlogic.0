Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3992C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D642087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vl8OImM5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IVslo9x0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D642087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwKxYBeWLuNz+qjbW0SilylRSFmYJtLTaIWWfpyTZ2U=; b=Vl8OImM5ZaUBIr
	MgkjAxZhvnDYEhsDhPfCFkNUOcilIxfI823bzafwto4XVno85UT+STFHpx6WPuhYIWGQBhgka71CK
	B/d9cnziclMxB6IuL1P+M40eN7fQpdrCBTTE6uIb+IuKz9JAQf7kVjPHLpPGoonhlmhMnqDZMMySS
	myqYKgCGuLhJ00/lyetrUo4NzLfcsydFN8b5pkywTZgOVP32+jI24t5l0Bg45Y3Uaesr9xhuZ3Dxg
	+FTTNijnqMkytI+l2pFDSPRTo2Fd1kY0BpChbaqXFfN2b1hwK/GiJ1hVyvEz4vk2MiwmT7E/sevKO
	A5dvKZscwbetPT7ZAirQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkRUC-0007s5-2Z; Fri, 18 Jan 2019 10:34:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkRU3-0007ip-LV
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:34:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id p4so14408211wrt.7
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sx5kHS4kmd+hNzvZDxwBBsz8nNk2fnwFetGiR9GhdQA=;
 b=IVslo9x0IqXExyg8jC62O3Uv52+uI2i8twr+lPmhlFgnpm4e2n8Ki21cPmGIWDDP8W
 ZzgfS+bF/Magm0/l7xxW3QEYQvwNDI8xb6ioqY0E0ZFQqfsbr9I2EAYopHycSgGJFYaH
 nBaiT2eJV9nFkHjj8rfBSqrhQwQKzZzMSJJsf+Zm42OFJyksd3AQl9zdMIPaZY4mGG/k
 k/5QbjKyC0WWgUOh3KvXhVBJmGI8owGt5dw4lh4J9GQTDR5TQK9NqSSds7uGTxMLKUWd
 3zs6T80vJH0kJ5aJmKtI+HBOQnsz0c1g7ApxBxSzjeQJGLC0loEA49A2lhuDJlyvWfUZ
 77NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx5kHS4kmd+hNzvZDxwBBsz8nNk2fnwFetGiR9GhdQA=;
 b=sv8DC5S0gX5zTEEwXmytKP8ysLJ5zlvDPHypGZbm8a3NwwakJrgRnLWpxx7xys4QaM
 IG+QbwdLNkBYCjvM8xBdoYUB6wbvL4yDEv9subWvPEve3yGOCYKI6O453ImWxJauJ541
 Krjbj026pymo8oXaLVQVtQxLqfKSQIz/NoH5De/VNc72qtAM9bSgl+YHIRxSitLBMYov
 e26mjAaAj9CnuHnKqDyNVOj5NVqbxwJHI8BoZ2ngbPogI/qNxbX58qwthk1KvpcVZg6i
 5kxf+v98hN8KC3vTsUlg2HYiSMCR8xblI9tio1sDJxVhwSMYifnEARzZlWWicqKzNx/D
 SzUA==
X-Gm-Message-State: AJcUukdkh07K7bJ7+ajgl5XaCYkujXIbdwkCwGQ4WDgDE9bELErtOsc7
 s/ovJT5cMRBjpPjO9IAlXyfBSg==
X-Google-Smtp-Source: ALg8bN4WK9cZ7OjNrnCox9XA80HNJql1WjqaFEasKqEqa7gD+Ouc90U1UEU87dwPhCvKBeCxHDXd9g==
X-Received: by 2002:a5d:4202:: with SMTP id n2mr15671977wrq.260.1547807681752; 
 Fri, 18 Jan 2019 02:34:41 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s16sm67066247wrt.77.2019.01.18.02.34.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 02:34:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 4/4] arm64: dts: meson: g12a: add clk measure support
Date: Fri, 18 Jan 2019 11:34:23 +0100
Message-Id: <20190118103423.15075-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_023444_044404_E6D2FDEE 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock measure device to the g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index bd24de947a5b..59900ddb7b43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -193,6 +193,11 @@
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
+
+		clk_msr: clock-measure@ffd18000 {
+			compatible = "amlogic,meson-g12a-clk-measure";
+			reg = <0x0 0xffd18000 0x0 0x10>;
+		};
 	};
 
 	timer {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
