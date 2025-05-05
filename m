Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC88C3ABBC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8fBs2+9KtJM3YuQVPPoEQADJJfPGkoOgOmT7MYeer+o=; b=oJF48JJllnZMjh
	NZ7NU8tafFyqo3kV0YIcPpUmgxLl5hkDQ2UZ1zasPWdzBHmz2Jp2C1MVJweTevsxrmt5Y6k7TVqJ4
	MODf9wq1kWBJbZl+XP5569miUty5+iz0z6rgLegaiU0Hh/j2B8RAOeY78dUzqzB2Vi6M1u41SMwFJ
	PW5Tmcmc/lmtOC2el0ZBmd0uyZ95sHcIm2c6NmBftWwonE49zdvXBGp0sCFKbVRf40rMK143Ye6Wx
	/Eoeep02ld6umB0ciJj5vQG6XibnTJL5F9cs5+SyD1LmtYp7OqT6Bzf02ZQQyFyVKVBcIeHlsOC7Q
	wxtxgaVoE5p1fVNaLH0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0n7-00000008JhX-3cle;
	Mon, 05 May 2025 18:43:49 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0n4-00000008JgW-2nu3;
	Mon, 05 May 2025 18:43:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7399838db7fso4990177b3a.0;
        Mon, 05 May 2025 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746470626; x=1747075426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQzbmjudt+hJvG7n8NMoirGU7KRPkcRToJ0JJSw35CU=;
        b=RxO3sukTxymLh/gJGeh9dE/VCeiij0i3xv6TOVr2k94LzAh4nksTKVwEe0dd+m7z1n
         +4uQOkh9C6Tsv16Q7NV744MkTyp9popPgX0XKfxuIgf0zu0FuVEqsJutNrYTMc1hwaud
         hGyAyr/x46JyiadcOv5RaGbJ/ZYykWRTjRE6FIf9MSW/xhjK6MO9EmWwvvgagj0U5sAV
         6vqjwOdjWD49gGjmqgPDpxUL1NXY9kxzsFr2soay7YKA0zTYVOgnrM9rdT901B/DKF2q
         vHeqzbF1+jDwAajL/ag90x0yYcSb8LBzON3a2awV/Vm8f0D0DPmHCGxzwm6v4Q3ThOB1
         mB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470626; x=1747075426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQzbmjudt+hJvG7n8NMoirGU7KRPkcRToJ0JJSw35CU=;
        b=PJEpX9poX1BucNb+47ULp0Te1/63E6qZjGpIc0SMzT2Wk7NA6cFsQt0iO6oC1Qw1mq
         qlKoom72fdYv4HZk5ECV5jz/SxBmCg+U+xi/uySyJdEk3vcRpxXssTH7hEH+/6pjQYNR
         rUV/kS9I1OkkjNSLFXpZQ2QNjL++UVhNldJxPJlb0aByfhqrZMpCGomxjwH7g+mKqUK2
         PB7iRVA0Kw2R+CI11Ac8PgN3/4LmBdUhQM4+1q0ZVtZfjYZpWMOj9y+5oDPpzO2HX7SW
         D5/gs2NpAuZlhfxIeaovaRACfkXDB1g+E81FYHj1nw/+cofS8RcBN7k49vU4na2EFtS5
         vvRw==
X-Forwarded-Encrypted: i=1; AJvYcCVTC44eydzN/fO5RuQ5I8leqK2sCXbY6QzPr8ncESyL5EpXRTsyfgYd1ucV3XXBUSGsyI0EfzjcD4pJuydCH5g47Q==@lists.infradead.org, AJvYcCX1I64nqUOU+3/MngQaR/yOUIdHMJUAlj7RGCmkTXqYhPsGKc7URtEfdhahLn4kO8QNzbx9COWN/G6nsKr+@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbgTMZ8Bkyku0nb8DLEmx2DZ0SPLLIUjx8WVSwognfpPgfkoH
	hWGKsr3nXrfqiwT+h797M2vdKwqAu0OL+UisryqGNDEETkijp60i
X-Gm-Gg: ASbGncumqtUwxR6Pd79kusrmLry4l4kOItuyQs7+pcqQiu7qbxB1mKH+LmcwtF7sfWH
	Q4FqJkx9esly+Zhw+s6XRjKq7Cdnwrz/XW5+XE42QA1iDJI+IwoWTNdOTV08mNjEdC133f7eQGR
	TwTCeEbNya/dqr8FttzVzueT1wRA0vqKaG9zkQONlaym2gas3AK4FHheCMi3k5usWFk7hxbyh7P
	uTR5sXufxBe3OC4HR6PD9q1DUxJDigoChjhcttB6yroX8w83+1SFUU3LyK6/D4h5NAKcNiigVOu
	1GP3AyzkcXP4wpTEohO3UH71RIKJ0MpNB/L1MLf+V+acKw1PFT2RAgNpyV7Ao0TGJDOtkA==
X-Google-Smtp-Source: AGHT+IGMBauXSP9NfIaQaM7+UUg7ZcaSiDMXtLxYknxQzEukhYbTe1ekmAy1F/1+blL1smz9X2PsTg==
X-Received: by 2002:a05:6a00:1308:b0:73d:f9d2:9c64 with SMTP id d2e1a72fcca58-74090eb4df2mr813280b3a.10.1746470625673;
        Mon, 05 May 2025 11:43:45 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:afa:5db4:54e4:f59c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405902167csm7433788b3a.98.2025.05.05.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:43:45 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Date: Tue,  6 May 2025 02:43:38 +0800
Message-ID: <20250505184338.678540-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_114346_703916_798AFF54 
X-CRM114-Status: GOOD (  14.77  )
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

Coverity scan reported the usage of "mode->clock * 1000" may lead to
integer overflow. Use "1000ULL" instead of "1000"
when utilizing it to avoid potential integer overflow issue.

Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
	- Use 1000ULL instead of casting the type of "mode->clock"
	- Refine commit title and message
	- Fix the issue for the evaluation inside drm_mode_status
	  meson_encoder_hdmi_mode_valid() as well

Christophe,
Thanks for your review and your suggestion, I think I should add a tag
for you,too, but I'm not sure what should I add, if you would be so kind
please let me know how should I tag you in the patch.

Best regards,
I Hsin Cheng
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7752d8ac85f0..c08fa93e50a3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	unsigned long long venc_freq;
 	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock * 1000;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned long long clock = mode->clock * 1000;
+	unsigned long long clock = mode->clock * 1000ULL;
 	unsigned long long phy_freq;
 	unsigned long long vclk_freq;
 	unsigned long long venc_freq;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
