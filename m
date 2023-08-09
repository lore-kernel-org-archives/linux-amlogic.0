Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B7BC0015E
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qiqYoz1oKwXRSlHe/WzORtrIv1QvxCi7YPOOgANDUgM=; b=0vJxF4GJxrwcba
	46MWaqeq4OyDBntBG3IqpMVN841rcSEf/mGdJtDvAdmDT2zfQbp9vcL3q3TT8t6KpTqsAIpAcKvQK
	R0S/cQy5bZf22O85kPWVCSDly4/CB6Jdnny3/00u7aIVmpQ74qScV60dNR8eeSYLT6oze+NJSc2XF
	LtF8537jKIoQGqkNLHrbQ22EW4mSbym6p5A+AxgtBFZv4X3ablhZwOAp2oNL8zkgQyZ05rUMzGn9j
	ZInPTomuk6JjAZdxeY4Y4ldDAjyt4MUS18NEL9kaan45uwWFd47ynDGYZKSOXb3Jp1l2U4Lv5mD9s
	8q/q4ihUu28hZ9rZ/m5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmqb-005WEl-28;
	Wed, 09 Aug 2023 17:19:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTmqY-005WEP-1L
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 17:19:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe167d4a18so66560645e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691601584; x=1692206384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3XaG/agcdHHHXeqbueYhHg4bGC+O2TjD70CPDhGyhxg=;
        b=a5YViMUv3Kw4CcuwIt8Jg8uYH/DYqnPG3zt92oERud3qs7c2+bC0vDWvCZf6ZhN1q5
         Ody4StkupWi7qwHwpBi+dpYzPRwdFbWp2nM1V/wyghaS2sXMQnK0nVrI0ehjx3ehx8YG
         z4L0tw72OmXAPRyw4p0BNVolWl3gxakiswA4ujUwZWwpStU3c2All8lflbx3sxqipBZJ
         5OiSedoYnvvYNVnJSIKhgKndI0Vpchf0UzFGRb0oLSRkMaUZr86fHwPnuvsm60Q8ViU1
         2NlJnBGdZI0mrS7/LGaa/SgMpg4iBXOSNub2PkLk900WmSXLWsEv7XkAboKWpoOBVHNg
         a1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691601584; x=1692206384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XaG/agcdHHHXeqbueYhHg4bGC+O2TjD70CPDhGyhxg=;
        b=YR5nenJ4omi7mB0D2VzDO+IEE0Lon39FLQ9RN92pIHSK1qKr0uiHNi2zTU30yMPvi/
         bgb38hVnXRo9xakxSB7rul2YAmd2mtHvL2fGUAsvgDqGx45lvcd0R43tU6OkD03i5ca8
         P7/BrP+PIN5xEEKAuYN2PWiOC7HGrBzgj37ZCJo0FdSgwezToTspRf9a44KWzsG60mxW
         KbWDTh2OFC84gfJ2CH+glR8CPvym3V2H/smBqkorn5ZS6jN+S6y3KkkMUcpEjZQHMVDG
         H5RLFsN+x5GA+WvkknnZuXa0wTEbXPgVUGqdnmWbSyPxTu/qIAvOtbGB5StNjOx4vowj
         UG6w==
X-Gm-Message-State: AOJu0Yz765+7h9c3XRCnDh1pIYO9H88GW3ABoI9BT4+sE1TUo+8ohXdi
	UzFWe/yGYvFPTcvt+lyB23r7Wg==
X-Google-Smtp-Source: AGHT+IHKPGuXsPtyMe8JcF+q+kRG34gkrJFHOMtrzEff0nqGJEy7u7cLr+k+1gzH3mf8N1/atHsa1w==
X-Received: by 2002:a5d:6903:0:b0:315:9676:c360 with SMTP id t3-20020a5d6903000000b003159676c360mr14061wru.25.1691601583375;
        Wed, 09 Aug 2023 10:19:43 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:2a0f:2daa:ffb5:cc02])
        by smtp.googlemail.com with ESMTPSA id a18-20020adfeed2000000b00313f61889ecsm17335313wrp.66.2023.08.09.10.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 10:19:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: fix channel slot allocation
Date: Wed,  9 Aug 2023 19:19:31 +0200
Message-Id: <20230809171931.1244502-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_101946_639852_E70608C4 
X-CRM114-Status: GOOD (  19.94  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the tdm lane mask is computed, the driver currently fills the 1st lane
before moving on to the next. If the stream has less channels than the
lanes can accommodate, slots will be disabled on the last lanes.

Unfortunately, the HW distribute channels in a different way. It distribute
channels in pair on each lanes before moving on the next slots.

This difference leads to problems if a device has an interface with more
than 1 lane and with more than 2 slots per lane.

For example: a playback interface with 2 lanes and 4 slots each (total 8
slots - zero based numbering)
- Playing a 8ch stream:
  - All slots activated by the driver
  - channel #2 will be played on lane #1 - slot #0 following HW placement
- Playing a 4ch stream:
  - Lane #1 disabled by the driver
  - channel #2 will be played on lane #0 - slot #2

This behaviour is obviously not desirable.

Change the way slots are activated on the TDM lanes to follow what the HW
does and make sure each channel always get mapped to the same slot/lane.

Fixes: 1a11d88f499c ("ASoC: meson: add tdm formatter base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 42 ++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 9883dc777f63..63333a2b0a9c 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -30,27 +30,32 @@ int axg_tdm_formatter_set_channel_masks(struct regmap *map,
 					struct axg_tdm_stream *ts,
 					unsigned int offset)
 {
-	unsigned int val, ch = ts->channels;
-	unsigned long mask;
-	int i, j;
+	unsigned int ch = ts->channels;
+	u32 val[AXG_TDM_NUM_LANES];
+	int i, j, k;
+
+	/*
+	 * We need to mimick the slot distribution used by the HW to keep the
+	 * channel placement consistent regardless of the number of channel
+	 * in the stream. This is why the odd algorithm below is used.
+	 */
+	memset(val, 0, sizeof(*val) * AXG_TDM_NUM_LANES);
 
 	/*
 	 * Distribute the channels of the stream over the available slots
-	 * of each TDM lane
+	 * of each TDM lane. We need to go over the 32 slots ...
 	 */
-	for (i = 0; i < AXG_TDM_NUM_LANES; i++) {
-		val = 0;
-		mask = ts->mask[i];
-
-		for (j = find_first_bit(&mask, 32);
-		     (j < 32) && ch;
-		     j = find_next_bit(&mask, 32, j + 1)) {
-			val |= 1 << j;
-			ch -= 1;
+	for (i = 0; (i < 32) && ch; i += 2) {
+		/* ... of all the lanes ... */
+		for (j = 0; j < AXG_TDM_NUM_LANES; j++) {
+			/* ... then distribute the channels in pairs */
+			for (k = 0; k < 2; k++) {
+				if ((BIT(i + k) & ts->mask[j]) && ch) {
+					val[j] |= BIT(i + k);
+					ch -= 1;
+				}
+			}
 		}
-
-		regmap_write(map, offset, val);
-		offset += regmap_get_reg_stride(map);
 	}
 
 	/*
@@ -63,6 +68,11 @@ int axg_tdm_formatter_set_channel_masks(struct regmap *map,
 		return -EINVAL;
 	}
 
+	for (i = 0; i < AXG_TDM_NUM_LANES; i++) {
+		regmap_write(map, offset, val[i]);
+		offset += regmap_get_reg_stride(map);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(axg_tdm_formatter_set_channel_masks);
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
