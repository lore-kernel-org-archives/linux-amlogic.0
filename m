Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101FD606A324
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IPVsv9z6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=RRN2HoOG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=g3GMF9+WuQkzRmn6N0PyWknJihIhktoUVhZA0O0nLi4=; b=IPVsv9z61IsrFwa8OEdHE5FARy
	r5w35xEr/UQNm4Mpng9NHgASSpgZ+QsQqqufinxQQH3fSPGT84WbKJtb+TSRIco8PnIUw+xisyjTo
	UBcr0LmZaaST0LxyeSZAiF/0Q5aCvFUFy5M/UjzRiakZRzvvwpBvgdJCu1msMlBM3tmd8hQLSRt/M
	IivJfM6f9wn5LTckt1n4QttZZ6aqBhA4O19YaSY3Z0x1gKmCzy4yejRjH5vzSBn70cWcne8xsCmvb
	gPaWr84834jmrphqVS38sePXJLbytXMjXCrWi7Uj8RpZFDBqQccvThkmbQVY4UA2s/PCqhlyW/uuD
	aW+uht2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzaO-00000000Tzw-35P4;
	Mon, 02 Nov 2026 21:29:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzaM-00000000Tyo-0y3z
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 21:28:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3116498f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Nov 2026 13:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793654936; x=1794259736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
        b=RRN2HoOGwgLCHLr8W9ZxRwivQg+dMVB+e7ATBWicgSuAUlW6Zet3NdRZ6EBOL5FY4f
         0Lt5aB35oRpKtRWoJCavJ3xny47QECsgYsowsw6gJbTezBezfZFmhwS4yMpFOJ1LyOWU
         p6Yn/GThFAtdfZy/IjkHBeXcpzIdEZ2rULxXbkAz0exNH/kyUdygmOWDpg7VahjeOCnJ
         EnwEvVpqMjS16juRX2NhKypcxS2i1YewcXhTQ5VkUCD5mOp8pmlcVJDLpOS5YG8qFPwp
         Lhm7TCUlzHM2u2YA9aRx0YQazvzfIDge7YVOEfDBb8Mj7axkFTF6XgoxP8xcgq2UzSsR
         2EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654936; x=1794259736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcVggVYajR4k5NgQe9pbGY6+WDVxyFxQve/L9p1a8zk=;
        b=vT0I2x2wP9yP9Gqm7PE31wxDwU+KW4ad/dlMA9rLpUuzXd9pEqlfjPn9X64zuU7+Ts
         iFq8xSAJbRNCjRrAMDO/Pbx+nV1t3lbIFcx0ZVzDNZmEH/+tidrRngU3wowTOGo2n7ZP
         Z/i8titD6MskU/otRpuHcf5qQWwy8h3LfZhb7IMn2NvZ7BbxbztoMX/Xnl9IlNWk7JrA
         S+9S/Zv47kH+XFfUGlyECP2kUoo5ZESJgkswIQqdyZ/e5ePPr3sYe/EQR3OPH3c5hBUl
         6BQJyAiKuIv8iaj8olJsmo3mdMMAbhXfs6Wv/tZbqX7oTAHlIcH/rvul2eLsxIqsRBAq
         sF8g==
X-Gm-Message-State: APuU4Z/kKT8uBFqfPAn5oB29Druah1xSaudjxjngWLIqXCLF0Z5U+Ou5
	zKz01sPLa23VNTpvTMMdNI82tul52WXv3ok94cND5RvKG1MMJclMgLSrtGAR8Q==
X-Gm-Gg: AYBFou3ho6xDI+0Jf2eT4AadScPqj7kz9tZVXZJJ2O8FXHkTNOpT87HkEOTKlpb4g5F
	gE73kfMe96fzSYJx00KDUypX/3vJXRpzsYjALdx16kz4LTMFNBCYNbzSTRwqCP985vgMp/tSxiq
	Efp0dgupOKHVpV8CdcBDBXdzznvRA9an6kmSdEEWN2yB5rg4semZ4kRB21zDh1JsW0skvnxL3Ld
	XdELP7WitJlFBmb2tkLorY7Gqe6fwnH8nBjDqpMD3GAkDOtagyhUbIz2AThXohqKv9wJgZ8sHNg
	biapwZTGHOTR8tK0yciVS8Hk9h6FkLdbK3Hg6wQf71uvwVv0JlAW3Yz/ecWEu7lik4NPylGPRSj
	KGCCTWNuosO5K0+nN5CBrObP/hWg2BMOok8fLy6ly9aRLrCv8nAHRACVFH00HO3mkHZfjjt5ibE
	gPcDX9E3aMsRYyOMglASypTo6g9mAUexdiBA2D6jrcUdr7p3pAkX6EtfXBv5MOx5mYrIgvK+HEr
	mnAIVZLW2BFwQ8kCa4VtYzsfCvzfgBCpYTEBEPby2zshEIujnTNoPvQdHK5AsWv/mOq4LncrrVP
	0Ebb2bxe08q37Tfgxx9IOfmyCBz86ucyHFHiORr0+ui89UEoqhm+19IwL3f6/ahaQAeZYim8t/4
	JVjcNJDtpqdq0BrcdzM1ViCTFDivzTAxQXpnWyEcMd9zyg0SjfPkZHOi3
X-Received: by 2002:a05:6000:2dc5:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e6e52c720mr25066663f8f.54.1793654936073;
        Mon, 02 Nov 2026 13:28:56 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b725a2sm20540521f8f.13.2026.11.02.13.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:28:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH re-send] drm/meson: add support for higher bandwidth HDMI DTDs
Date: Mon,  2 Nov 2026 22:28:43 +0100
Message-ID: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132858_284727_BA7E50B9 
X-CRM114-Status: GOOD (  16.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's a report from a user with a DELL U3415W monitor and a Khadas
VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
  DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
               Hfront   80 Hsync  32 Hback   48 Hpol P
               Vfront   28 Vsync  10 Vback    3 Vpol N

Those high clock rates are currently not supported by the meson_vclk
code as it limits the PLL OD (output divider) to a minimum of 2. The
formula to calculate the clock internally is (ignoring fractional
dividers):
  319.750MHz * 10 * od = 24MHz * m

With od = 2 this results in m = 266, which is outside the supported
range of the PLL on G12A SoCs (the driver limits m to 106..247).
Using od = 2 results in m = 133, which is supported.

Allow the driver to pick OD = 1 to gain support for modes such as
3440x1440@60Hz.

Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Re-send of [0] which seems to have slipped through.


[0] https://lore.kernel.org/linux-amlogic/20260109204836.790096-1-martin.blumenstingl@googlemail.com/


 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..c0be0b7655bf 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 				       unsigned int *frac,
 				       unsigned int *od)
 {
-	/* Cycle from /16 to /2 */
-	for (*od = 16 ; *od > 1 ; *od >>= 1) {
+	/* Cycle from /16 to /1 */
+	for (*od = 16 ; *od > 0 ; *od >>= 1) {
 		*m = meson_hdmi_pll_get_m(priv, freq * *od);
 		if (!*m)
 			continue;
@@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
 		od3 = 1;
 		if (od < 4) {
-			od1 = 2;
+			od1 = od;
 			od2 = 1;
 		} else {
 			od2 = od / 4;
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
