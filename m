Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C346C2D0EC
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3ECD2073E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ovoyQcH0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E0Av0gMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3ECD2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOoY6UyojYW/GILaPbXpqmwm8lA0O5eaKpx3nQbUsoY=; b=ovoyQcH0WkuXFZ
	fhSZpwaoWMlUgIbhpGSc0QIN5h1EWNxt1ripDyEn+y6EcFvvSxWVOmN6APuKH+oFF+bXbDtuH6rNR
	tVx7aRfmWFddtanWjDevY1VnLlIeDGhShCYrJNKW+SCLCv/W8gWaS3DStQRow8kwcfzi8/8A9+FbV
	N5v0q8dUpZHKp1Bk8xxiYYvaqKBVUxQkjDRbFT9wxSxTprXaT65JFiXyJ7tKqFG/xkwQhNQA21Qqv
	3NtyNBZeEXGQEf5eJYGrsW7Bxg3iaTg7p/F/9fzqZsf3Ozhgn4umzivVAx4hyPIIVESOXXOS/zcM6
	9AQFRJeC1fo74WEY45Mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVtL-0006eu-MS; Thu, 26 Mar 2020 17:02:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVrU-0004da-OG
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 17:00:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id w10so8754407wrm.4
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9+ngUpmkFwCrrCCNM5K1pYaDR7H/QYUrPj981ohJpA=;
 b=E0Av0gMBUOqV1dPvKF2FITdx8Rf0uAaobKa9Ln4rw+eC7JsGjCT057RazyNLToqdYH
 uDM362SfMEaE7zSr81m7UtJQ2xDDpsqsxmUGaVfeKZBeqvv/vEe2gsnqwKSv4np35TFW
 8EFA1KJB9qJxQUbzq/UzRCCRMY4nBGQUaajRFRG9MMBwrp1LPEaDjWccAoThyaXXPfm+
 ZHpQR74vp4XXkR1gbn4lyQYMaZUHpO68kkbt/0dLeH/z8KMmdSSWBl/m09gMcbefsYKq
 4hjpimLD5O3WfuEsmeJvI1MXq8AvpVQ8HKEBwpsxvofC/mt+BL9LfjlSdxxwVGPvaGpo
 qdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C9+ngUpmkFwCrrCCNM5K1pYaDR7H/QYUrPj981ohJpA=;
 b=dNQuRHlfAiDwTCe3OcunCQWowa3pgwxqjxLy9mX84eyDnJjGhyG3SbP6Cir0esBti4
 Xs9Uau84sDHrYexv7LuKaPasUAXXTjAM58zkW+FuOM7fhxg+q3WBd2vsXQM5EbN8v1SE
 yOLz2ufqzHhMjftj/Dngev6s7vbYz5K3+r8/6RhT+wNMFgwB7ncJ9WhawRsNxo2ALLrl
 UhMou7q5B04DmIL0YggSia8Sey2JC4MOrbFUSlLiBWwD60dKCIFaGcdvT0mHZSWSpJTa
 4fhF4o1B+vyQnTkUEBshY7BZEXgRR3pG0JorOTN10+d80bdXZ3SDqkbj0dF+yAvjDCW/
 ULTw==
X-Gm-Message-State: ANhLgQ26KsiDet96GSjBXeUN/RdFhXUjmW48PDz+fpgcA/S/HtelY4AD
 w3/QPNsMfJj3G8B1rJTQ4bO8ktvSq8M2MQ==
X-Google-Smtp-Source: ADFU+vseedUJg+qIi0p0xgZxO6cJSY/Je6ly7V3VTm6ALURObymwtKpKsQpPYy2rJDKVcOfhXF3N0A==
X-Received: by 2002:adf:82b0:: with SMTP id 45mr10206215wrc.120.1585242006281; 
 Thu, 26 Mar 2020 10:00:06 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:00:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: meson: fixup SCP sram nodes
Date: Thu, 26 Mar 2020 17:59:55 +0100
Message-Id: <20200326165958.19274-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326165958.19274-1-narmstrong@baylibre.com>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_100009_140345_66935696 
X-CRM114-Status: UNSURE (   9.11  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GX and AXG SCP sram nodes were using invalid compatible and
node names for the sram entries.

Fixup the sram entries node names, and use proper compatible for them.

It notably fixes:
sram@c8000000: 'scp-shmem@0', 'scp-shmem@200' do not match any of the regexes: '^([a-z]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi |  6 +++---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index aace3d32a3df..8e6281c685fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1735,18 +1735,18 @@
 		};
 
 		sram: sram@fffc0000 {
-			compatible = "amlogic,meson-axg-sram", "mmio-sram";
+			compatible = "mmio-sram";
 			reg = <0x0 0xfffc0000 0x0 0x20000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0xfffc0000 0x20000>;
 
-			cpu_scp_lpri: scp-shmem@13000 {
+			cpu_scp_lpri: scp-sram@13000 {
 				compatible = "amlogic,meson-axg-scp-shmem";
 				reg = <0x13000 0x400>;
 			};
 
-			cpu_scp_hpri: scp-shmem@13400 {
+			cpu_scp_hpri: scp-sram@13400 {
 				compatible = "amlogic,meson-axg-scp-shmem";
 				reg = <0x13400 0x400>;
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 03f79fe045b7..e2bb68ec8502 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -398,20 +398,20 @@
 		};
 
 		sram: sram@c8000000 {
-			compatible = "amlogic,meson-gx-sram", "amlogic,meson-gxbb-sram", "mmio-sram";
+			compatible = "mmio-sram";
 			reg = <0x0 0xc8000000 0x0 0x14000>;
 
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0xc8000000 0x14000>;
 
-			cpu_scp_lpri: scp-shmem@0 {
-				compatible = "amlogic,meson-gx-scp-shmem", "amlogic,meson-gxbb-scp-shmem";
+			cpu_scp_lpri: scp-sram@0 {
+				compatible = "amlogic,meson-gxbb-scp-shmem";
 				reg = <0x13000 0x400>;
 			};
 
-			cpu_scp_hpri: scp-shmem@200 {
-				compatible = "amlogic,meson-gx-scp-shmem", "amlogic,meson-gxbb-scp-shmem";
+			cpu_scp_hpri: scp-sram@200 {
+				compatible = "amlogic,meson-gxbb-scp-shmem";
 				reg = <0x13400 0x400>;
 			};
 		};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
