Return-Path: <SRS0=z86A=UD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB1FC282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 14:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16ED52166E
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 14:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvaMquX9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NGVjvhlU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b1GKNOnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16ED52166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MGzd16sJgN5d/fFQ4mpbSb4P47Q+bW+uk0C7PaaWrSA=; b=rvaMquX98FkKAw9yxH98U8tx/w
	/J+GLE5VyKP/xBGGprDmsuGkz25ZIMTLwuU0kvwNTMFbZw5lOscsIDomuBk6JyphvklECGq0xtkfp
	an2XCEO0ta6Xf5II75Ei4Dk2YWfsNYSu3shwpOToHTd5IYrwzUNt+HOHSXCNvviHyKdLPuaxonaHR
	kHdNPziuQJKKR0/0sTbCLMHUrErqxFEmI+ycTZ9rw1kSNGgnV9C1RvyWfwCE7oyqv6DZmX8xY+lzq
	l7rinJlJGODVe8jmP92/I+qoBmvSIlVgYP3xdlSNDHAaTc69sA5oAk8VXThoPOHC0QX5yacGNTKyN
	7JGy7FwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYAiz-00008i-Ts; Tue, 04 Jun 2019 14:47:42 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAip-0008G6-0u
 for linux-amlogic@bombadil.infradead.org; Tue, 04 Jun 2019 14:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SnjvT/D0cW1JiliaxzQrnOjeQzlchEAI6VR+JZ5y+Qk=; b=NGVjvhlUPF5oQQr5tzsue5J9M
 symAnZU6/khCLCOqzjdF1FKxzwMyRwlWSLUkW/9vm8QSW44h9Qtmd1xl/h6S7Ziidk591LjpxK25t
 VGax0x8ytD/CsDwYoo3sjSpfEkDuucm6G4CCeKiYU03tavXO4PGG9CXcknDFdRJUMLSxTphuJbzsc
 tjb9+JvDguDfWOn5gNFZt2NYcD8wdHGzTJ0QOfCmsTuur4KzHbTvNcOUyrdVs8FXzjL0GNkCOeBon
 xK9MhE339UIZL9zUXdlGRCODwRTwEm9BZ7KA8veva1w6gzrUc36nH3c56nhMefuHEM3HqJeLj3o3u
 N1F1vEsKw==;
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAii-0006Tx-Na
 for linux-amlogic@lists.infradead.org; Tue, 04 Jun 2019 14:47:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id c2so16146540wrm.8
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Jun 2019 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SnjvT/D0cW1JiliaxzQrnOjeQzlchEAI6VR+JZ5y+Qk=;
 b=b1GKNOnN95jk6p9sY+UTKLGXWVTPtbcumXKRhyS/7BVQ0GSsVUG3onM+bQfdjl6yoc
 ukbAzcipgmBZWkOSbAkttBYNgCq6tDvGfhzOFjJAodCqZKHhLdCtnFSdGB+EhpvJVWVv
 Ao5yFwm+UVLgGbs0siLkS87AK9ePzyhi+lbK6avLEqyfxa2tcWEtIsf8/g+PA8vxqy0a
 XzPgCwVb972Ddl9WFCD+0q8Qg0S6z4D/KffGpWfog+syujg7OJWZPxJemwHT44InwjGo
 +8Z8xPxWQpIyOay3xiAVFFEa5JWwSWFNWlvuDSWLPeUWykVajK4/5dpKHsoeVERZzb2i
 hWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SnjvT/D0cW1JiliaxzQrnOjeQzlchEAI6VR+JZ5y+Qk=;
 b=Txp3c/BqproNzHMSv5Bj6M20Byn1zEaMX2vMvxq16Faw9y8895ze/5dcZcyZWwII0/
 aJkKU2utng6AEOOnFRSSBv1pUpW8rF8EQrC7GHNOxVeMpAU9u58Sx4k7ouUTtgM0X7WB
 4xdqS5qkxLNfoWU+McpyDl6Oc/TCa74J2qA7J5wGPMSiYiCbPPEz7AFM1SqvicTVshDs
 P4lxOEK26c8Uic9rnEtNyaKY5Au9LNfFZRwrsQZfRV6ZEUpIrqDQHaoxRtadO1O/8ecb
 ZsB3AIt8qZSf3pijGq5KAOBm/bX+8ZJoy6XSnv442NOJHpmI1ogV7aVZfkLy7u3mKoyS
 FVVA==
X-Gm-Message-State: APjAAAVGoDlFCBec6TWgYbzd4i5XNb1Xh6HtAMtF/9FQoLsoRVDCghmJ
 YKJgoB8moIji6QGsK2Fj1mTQhw==
X-Google-Smtp-Source: APXvYqyRQhjdyMK6YK07C+dlJF+QvuSSvZcEwhbdHS+SKqZ1uaK2nDj1a6UiJjyrdfuKgXxc/NmwfQ==
X-Received: by 2002:adf:e54b:: with SMTP id z11mr6859295wrm.198.1559659637766; 
 Tue, 04 Jun 2019 07:47:17 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v184sm3649639wme.10.2019.06.04.07.47.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 07:47:17 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jic23@kernel.org,
	khilman@baylibre.com
Subject: [PATCH 1/3] Documentation: dt-bindings: add the Amlogic Meson
 Temperature Sensor
Date: Tue,  4 Jun 2019 16:47:12 +0200
Message-Id: <20190604144714.2009-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604144714.2009-1-glaroque@baylibre.com>
References: <20190604144714.2009-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_104724_859724_6ECCA90D 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the devicetree binding documentation for the Temperature
Sensor found in the Amlogic Meson G12 SoCs.
Currently only the G12A SoCs are supported.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../iio/temperature/amlogic,meson-tsensor.txt | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt

diff --git a/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
new file mode 100644
index 000000000000..d064db0e9cac
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/amlogic,meson-tsensor.txt
@@ -0,0 +1,31 @@
+* Amlogic Meson Temperature Sensor
+
+Required properties:
+- compatible:	depending on the SoC and the position of the sensor,
+		this should be one of:
+		- "amlogic,meson-g12a-cpu-tsensor" for the CPU G12A SoC sensor
+		- "amlogic,meson-g12a-ddr-tsensor" for the DDR G12A SoC sensor
+		followed by the common :
+		- "amlogic,meson-g12a-tsensor" for G12A SoC family
+- reg:		the physical base address and length of the registers
+- interrupts:	the interrupt indicating end of sampling
+- clocks:	phandle identifier for the reference clock of temperature sensor
+- #io-channel-cells: must be 1, see ../iio-bindings.txt
+- amlogic,ao-secure: phandle to the ao-secure syscon
+
+Optional properties:
+- amlogic,critical-temperature: temperature value in milli degrees Celsius
+	to set automatic reboot on too high temperature
+
+Example:
+	cpu_temp: temperature-sensor@ff634800 {
+		compatible = "amlogic,meson-g12a-cpu-tsensor",
+			     "amlogic,meson-g12a-tsensor";
+		reg = <0x0 0xff634800 0x0 0x50>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&clkc CLKID_TS>;
+		status = "okay";
+		#io-channel-cells = <1>;
+		amlogic,meson-ao-secure = <&sec_AO>;
+		amlogic,critical-temperature = <115000>;
+	};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
