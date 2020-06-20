Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B02C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 15:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B683923D9C
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 15:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpkmZEJi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aRRZnSLC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B683923D9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiOOW7kp/0yNcEdX3EwhBSm8S42+1hV126TOaIgdYCs=; b=mpkmZEJiQO027d
	pYDPCewn0UlfttAegdgdU3c299qJ3F80bHMeReey1+VKpSGGbCW8CPvhLYlPMHg5pr29WvgI9eAnv
	yQfszyw01KzhS356PQBZHWW9x+4fVdbxocXqKZYq9YfZGroZJFzfOI/TNYiv9gP+L0Eeq0qOhaTq2
	k1nKSYbmq0DBfHk3lM2Wv62wYl6Vl9tKWaJOqj8SyEW03nQppqbXdgzw5mD493BpPJMJJ9gzwWsVB
	sw3a8a56+qxZ95jerSmUMkUO+TgT14BRamA8qdDn7J1Te010fOhe7bwuFW2K33L2gKMJ4tEZ7s+lg
	8hS4cCdeNrnwaHPVMpAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmfsu-0007SV-VQ; Sat, 20 Jun 2020 15:58:24 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmfss-0007S7-BC; Sat, 20 Jun 2020 15:58:23 +0000
Received: by mail-ej1-x641.google.com with SMTP id k11so13516725ejr.9;
 Sat, 20 Jun 2020 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=URfmF5zJlOcOhtFLjxyic0QyuCH3AQC3KnEdMwqUPZ0=;
 b=aRRZnSLCo8mhBuXJUHE+8cMgPXIWw4czxpU/mgGuaOBBYdCnqoQ3wLrG7/+2XxRyQQ
 kGxzAemV1pF2eJ2eWCRHjJJplwjeTI9QTCjmAq2y9EClfnWnqMr5jZaK1Q4QVlt2HUZK
 0K5YaK3/ZiENJlUg9jHch9mmLFYmDa/RV3IFLz+KXM6zlcLFPa3uElrJyVRCfReE+BE7
 y5Iam7JDs0Vn9w+C1t/Quau0USaKxYJ2l+12AH1u6ZLX86OBbRh5XXMHf2OgPp4Uh8cv
 z8u9O7YCIk0XHrzHU9x0mcHmrGvlQY1FqqbcEpSp9Q3B+SYW4dEKb3yWcf6+C5jvhYuF
 y4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=URfmF5zJlOcOhtFLjxyic0QyuCH3AQC3KnEdMwqUPZ0=;
 b=lKmIk7mv0nG5WzE01DrSmS2+Llw/mgeXMCSdpYyh9FkFpdOZacSSJll2rDlL7gHbAn
 toFVhEfELoQ2WlNi7t79lxnncCy24DsY6KyqahafKUvJpa58h4naDZZjRiaysRCC38zl
 UBZcsUa+W/KtC5uTN6hKn4PWSSBExkFOBwvyo9+28VGZiDvBmEYKmhuqSTL0TOHJQuAV
 ZHK2Fa6u48efHOQUB3Q4RxVqKHuwthPnHgDNvzjj7phN2KL96VENlcfneKLdvcJ5x64y
 3ooRoymZQW8c8mE3PtLbnJ+xRt5QRdqgZWD4tAbGaNtiiwLSA638Q/FxqZJ+REynYT7V
 0vlg==
X-Gm-Message-State: AOAM530jCv7lJPvoo7/ab4iSXCH75gPOlwNFvK3Tw4ybRmNu4CJJAaVJ
 bnxQr40QX6sI7q+zZQgK8lk=
X-Google-Smtp-Source: ABdhPJy99Zp7FW/lLQW54XKAHKHdIN3zBL7LCt43g0W5sKxHR8WoM342wP5Z9toUDOBG31W2t+Jp2w==
X-Received: by 2002:a17:906:2e4b:: with SMTP id
 r11mr3004840eji.227.1592668696360; 
 Sat, 20 Jun 2020 08:58:16 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id gj10sm7545001ejb.61.2020.06.20.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 08:58:15 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jmasson@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RESEND v1] drm/meson: viu: fix setting the OSD burst length in
 VIU_OSD1_FIFO_CTRL_STAT
Date: Sat, 20 Jun 2020 17:57:52 +0200
Message-Id: <20200620155752.21065-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_085822_381939_69ADBE45 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The burst length is configured in VIU_OSD1_FIFO_CTRL_STAT[31] and
VIU_OSD1_FIFO_CTRL_STAT[11:10]. The public S905D3 datasheet describes
this as:
- 0x0 = up to 24 per burst
- 0x1 = up to 32 per burst
- 0x2 = up to 48 per burst
- 0x3 = up to 64 per burst
- 0x4 = up to 96 per burst
- 0x5 = up to 128 per burst

The lower two bits map to VIU_OSD1_FIFO_CTRL_STAT[11:10] while the upper
bit maps to VIU_OSD1_FIFO_CTRL_STAT[31].

Replace meson_viu_osd_burst_length_reg() with pre-defined macros which
set these values. meson_viu_osd_burst_length_reg() always returned 0
(for the two used values: 32 and 64 at least) and thus incorrectly set
the burst size to 24.

Fixes: 147ae1cbaa1842 ("drm: meson: viu: use proper macros instead of magic constants")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
re-send of v1 [0] with no changes as I still noticed that this is
sitting in my tree and I wasn't asked to change anything in v1.


[0] https://patchwork.kernel.org/patch/11510045/


 drivers/gpu/drm/meson/meson_registers.h |  6 ++++++
 drivers/gpu/drm/meson/meson_viu.c       | 11 ++---------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 8ea00546cd4e..049c4bfe2a3a 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -261,6 +261,12 @@
 #define VIU_OSD_FIFO_DEPTH_VAL(val)      ((val & 0x7f) << 12)
 #define VIU_OSD_WORDS_PER_BURST(words)   (((words & 0x4) >> 1) << 22)
 #define VIU_OSD_FIFO_LIMITS(size)        ((size & 0xf) << 24)
+#define VIU_OSD_BURST_LENGTH_24          (0x0 << 31 | 0x0 << 10)
+#define VIU_OSD_BURST_LENGTH_32          (0x0 << 31 | 0x1 << 10)
+#define VIU_OSD_BURST_LENGTH_48          (0x0 << 31 | 0x2 << 10)
+#define VIU_OSD_BURST_LENGTH_64          (0x0 << 31 | 0x3 << 10)
+#define VIU_OSD_BURST_LENGTH_96          (0x1 << 31 | 0x0 << 10)
+#define VIU_OSD_BURST_LENGTH_128         (0x1 << 31 | 0x1 << 10)
 
 #define VD1_IF0_GEN_REG 0x1a50
 #define VD1_IF0_CANVAS0 0x1a51
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 304f8ff1339c..aede0c67a57f 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -411,13 +411,6 @@ void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv)
 			    priv->io_base + _REG(VIU_MISC_CTRL1));
 }
 
-static inline uint32_t meson_viu_osd_burst_length_reg(uint32_t length)
-{
-	uint32_t val = (((length & 0x80) % 24) / 12);
-
-	return (((val & 0x3) << 10) | (((val & 0x4) >> 2) << 31));
-}
-
 void meson_viu_init(struct meson_drm *priv)
 {
 	uint32_t reg;
@@ -444,9 +437,9 @@ void meson_viu_init(struct meson_drm *priv)
 		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
-		reg |= meson_viu_osd_burst_length_reg(32);
+		reg |= VIU_OSD_BURST_LENGTH_32;
 	else
-		reg |= meson_viu_osd_burst_length_reg(64);
+		reg |= VIU_OSD_BURST_LENGTH_64;
 
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
