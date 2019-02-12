Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA29C282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:24:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A1A2075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DHI5yaz+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bWuUTyTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A1A2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQ6AbjjK5HCaPQB+ryM7cQOHqgPjEz5jJGblDq6+os0=; b=DHI5yaz+CdLSUB
	bL+FREIN1PNH1oBOLvxHudKXwTqGMwylLnS/UeZjEpkiWWnBT8JKW0+r0G533BaXUYmFT5uhfHQZA
	6jNArjxwo5y64j6FzEyAE8Nh2DTyIqusy3f9UOUXi/WoxpUsspriCo1wuyPyKLV3bYwlRV+mfqq27
	gyuch8EWV0F+NBAUKUTbAlMTucY6u3L3svRwGC5XKH7Q1HcoVgxX0SpA6IKhqtGq6gfJA8lScJoxm
	nfUAb9J+J6LGmQBPtTL6ceqAJwRb7xDRWBtrGb1xjv9RCo8xQcZuRNNddsaA4gpAM1rfsoWhattPn
	SX0WXacZ1dUDok8tflLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYyv-0003Ye-TE; Tue, 12 Feb 2019 14:24:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYyU-00036R-1A
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:23:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id l9so2840633wrt.13
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yod8/2mWK4Qd4G4cKjNo2LDaZQqOzQK+ax711W0cspI=;
 b=bWuUTyTk+K7IOE1U0JkgR78suNjCu4uZMTdc4aHjtqrSjR1Ohnv8ODAP/grJKpMKJL
 5VEFSJxRm7lL0A+b4GP7fVNY/kMnlz4tUYa3IMojDRemFMgV45VHHkFcq8yDQos25jDj
 Z/bpINroM+UX2Gz19ehPSV2sEMb/AqVu+b+G9cLn6g43mzSOYBJcpcWzqBgpzmlK5u7z
 QK9d8y2UjqJ9BcpxdthXDCGZtV1LKpM7BHuVLy+De0J7uoC8OOByKi/uKDFIDMWiHKlh
 MvFls1QBrZx91hu7Cc9AufpyzpIW4mnkpQKGs9oCUFkWL9qX0bl/fLkxd9OGXtce4UG8
 GRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yod8/2mWK4Qd4G4cKjNo2LDaZQqOzQK+ax711W0cspI=;
 b=O1suZqlHHOKchP82bBGZSebpHPhyd50Gj68oE+ohL8SaF0vfxV0LNLwUnAaH64cJag
 cGdm4Ms/3pry3iFzFsOlB2JlATd2Lx7qHaTRbeIQtM3asSt6zt+yu+JvuV4LP+a5C2rv
 jW9gw3doIq+a8yT0Xo8AAGphN1i4O9CVD2Reg8juk5KZbTk+TGyuTMHAFIA4+qRWb7J5
 wqtRSEO8t2g5G8Ij4XaOIM4hl+LNTolMYh+/X2APsj5C/BQYmoBkl/37IIlvFUB/pCoX
 OeaJBpLMmbuNl5ki9WVe3hoRJZFgLWuPQTFtcv9WaIF8/rdD+Zmx2LjMHznupOhMHULP
 E/kA==
X-Gm-Message-State: AHQUAuZXAcglkVHYaT2LgtxFAenYgeubF7L3/fj0tONmt/XiPD6GMbH8
 OBtWktOG9QDpYEAgNrfkIGWsxA==
X-Google-Smtp-Source: AHgI3IYLGpRQ1uFj2rXREsPDErxHuMzviiqaPR2IY3RnkyVn5W5JuVEQmaiQ+qlymVpSwLdvFK5RAg==
X-Received: by 2002:adf:9061:: with SMTP id h88mr3094553wrh.65.1549981428568; 
 Tue, 12 Feb 2019 06:23:48 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y22sm39043216wrd.45.2019.02.12.06.23.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Feb 2019 06:23:47 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/3] soc: amlogic: gx-socinfo: Add new SoC IDs and Packages IDs
Date: Tue, 12 Feb 2019 15:23:43 +0100
Message-Id: <20190212142344.13634-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212142344.13634-1-narmstrong@baylibre.com>
References: <20190212142344.13634-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_062350_072526_7CF8A5D8 
X-CRM114-Status: UNSURE (   8.65  )
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

This adds the G12A and G12B SoC ids and the S90X2 package ID.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 1ae339f5eadb..c1a9c34d861b 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -37,6 +37,8 @@ static const struct meson_gx_soc_id {
 	{ "AXG", 0x25 },
 	{ "GXLX", 0x26 },
 	{ "TXHD", 0x27 },
+	{ "G12A", 0x28 },
+	{ "G12B", 0x29 },
 };
 
 static const struct meson_gx_package_id {
@@ -53,11 +55,14 @@ static const struct meson_gx_package_id {
 	{ "S905W", 0x21, 0xa0, 0xf0 },
 	{ "S905L", 0x21, 0xc0, 0xf0 },
 	{ "S905M2", 0x21, 0xe0, 0xf0 },
+	{ "S805X", 0x21, 0x30, 0xf0 },
+	{ "S805Y", 0x21, 0xb0, 0xf0 },
 	{ "S912", 0x22, 0, 0x0 }, /* Only S912 is known for GXM */
 	{ "962X", 0x24, 0x10, 0xf0 },
 	{ "962E", 0x24, 0x20, 0xf0 },
 	{ "A113X", 0x25, 0x37, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
+	{ "S905X2", 0x28, 0x40, 0xf0 },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
