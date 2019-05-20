Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6582CC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C7B20815
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2rOa6Tx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a9+TNBgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C7B20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxAvNPcILcWEVDb0hPkRBqQ0bjGB6BKYiuK9cW3NMaw=; b=p2rOa6Tx1Y0GQN
	xazu9OtS4fONrOoUa/tVS/jOaKDFTwRxZW326JscapP6fm300nF6k6DdqLdoNoqd1FV7kGGhqpllC
	kVrLlU1qVSpmHnEVDsicCf6odcrRV1GiEnNX9bafk0BoSP6L084hOLiFpPzYzdOKxfLFWh6VS1SCs
	lYHYNQoDe3DgdVkfe1+fuZvst4g8N2+m2R+2v12P9vh6x6OWWGjNYGnkE020/z9yWb4tdzMpQx19/
	DIMammKrDzlqV/Y9uM13n2fkszEIXADnlaXsLs4rPJZPG7m9G9ypGUn+446p82kzvc59lANCEoBLS
	XoVaQhXooMJ9GtFGZHoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSi7R-0004rX-93; Mon, 20 May 2019 13:14:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSi7K-0004i0-Oj
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:14:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id i3so13271705wml.4
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m47c/l62ndl1BZoIquVCAdRz64Yquba0Nph44qgFKpU=;
 b=a9+TNBgqnV2CrEHXljT0uw9ovdO7ia1lACaaNVfaHCiyWMp9hbktkPEO4xtWN1wlZN
 /OBe+lIsQLHY/0oZNXeEgz7oYLTwoFmTtfqvfznfqiPjmj41i2mcgXCmFoBBwI4Btee5
 Yc5+MbcTTrqcHSdI2/CUu9w4m+/+ikRZoCEZWuRv8I/cqhW3DcRvommSzq8FCT5dGrc6
 GwT053sPmg6D496MIDo1xNreR+nnWNVKCVDwzRp23MROzcQNcgMc5WnB/MK4ZjUrVQvX
 8vF8a6r0j8rUGlCKW+pLIqfIY0IAryRP1rUldHXTX42E9n3Gai9fok4OSqOL0CA62yFi
 22cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m47c/l62ndl1BZoIquVCAdRz64Yquba0Nph44qgFKpU=;
 b=AFFD+UuP8gyhJ03M/SHF//0ZeqzrZRFEs2KauLnw61FZihhJprs01DfT+R8wtEDpK5
 BS4doia+zVN6rH9itqCikE8iQr8qcUm2IbqERBedBpl+WibFdXCFFvkEHbiZEq7BGfDY
 qF5dWd7qrAuLCdybYGoORK/hs35mlZqsJ8EVHy6kFLevcZyIEwUrEPmb/aGlJHcIKtfe
 8o+OwIf7SZHBrOW/+1K3EqPqVz5cLb7WU0QIeNnFjhVhZDt6023NxsgOTlSfgPn9+7q3
 DPMTovdFSxId6Z3rzC40cNH6FhvOAas66V1yuwDUaxeQ7F0tF+qSHczubXGskrG90BXp
 5GZA==
X-Gm-Message-State: APjAAAUUpfA6ZcNkXYpWthFQBecOoMbFQ5sAozAWKweREZTiC0lDXiX0
 0M76vyw2IfIBb6DR1+WNMjEk6A==
X-Google-Smtp-Source: APXvYqxLfvHVZc8cuXZUlVVEnCemwaArTi91A2WfQOsaaIfxLFsAdBOHU81+/ps8QxtzRG1xz26+Ng==
X-Received: by 2002:a1c:cb82:: with SMTP id
 b124mr12189669wmg.107.1558358053429; 
 Mon, 20 May 2019 06:14:13 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z8sm18054284wrh.48.2019.05.20.06.14.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 06:14:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 5/5] arm64: dts: meson: sei510: add network support
Date: Mon, 20 May 2019 15:14:01 +0200
Message-Id: <20190520131401.11804-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520131401.11804-1-jbrunet@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_061415_065834_551E36FB 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the network interface of the SEI510 which use the internal PHY.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 484b93ef11d8..be1d9ed6d521 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -29,6 +29,7 @@
 
 	aliases {
 		serial0 = &uart_AO;
+		ethernet0 = &ethmac;
 	};
 
 	chosen {
@@ -149,6 +150,12 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
