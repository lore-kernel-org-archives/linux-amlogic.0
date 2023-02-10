Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E28C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WquOgT2qpiUXX6HCNWSb+FAZTVV+JXnGQ71RSDDBpm8=; b=F/I4YAk3RqLIMi
	rI7lW3uvRcI4Jd7jbUutlDSzovjBilm4iWVwEhfgZzPgF2AhpvmpezD0+MO90IQaTjwYt6QaLVEA0
	baKvPGwOsod2uTm3pZDQcui7L5om2MS/lWS8k/PeX8t8DGt4jPCdg+cczFsWmBautT/H6arMS49Kq
	Sg6a0Z8x5dTwMN4yELJLGHHAmhZTEu72Wi3E34pEPI7pBxRhLfmT+cDkE1a7iUiQIhRPJTs0KZt+e
	dK8GufH3iPtb6Shl6mlvOVcxaa2lXMs1DuIGsViIMHe7BilwniXxdfcAnHlWqpcuXQxuTcHYOnAUD
	z+E8Jm7cdbhdlTgRHj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQR4T-005NbV-50; Fri, 10 Feb 2023 10:56:01 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQR4O-005NZO-TB
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 10:55:59 +0000
Received: by mail-il1-x12c.google.com with SMTP id f10so2005135ilc.7
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KlHNZK7Ipphoh6oQQOjJZTI5Uk+UmtoXmM8QD+p6cpA=;
        b=ZQA3F2f/vvilqXVsTDxG6KAd3wzfYF32eO+a/vCK7tgV0s8PJ8Vi1z1v0r9ctIuP7z
         L1PiH7Yv29tObke/KqdQ8+TfAXqaJjvT6whosDawT8A/6AmLzsMO1nwKBfJg2hFL0CKj
         QWQwoiVY7ZZF3dT4+/hDdK1gT3BI0H5MSJMs5P/7OtzlnRVPkN7Wx5tSzBma4n1z46OY
         KQ3EATyxlv+MYcLiM+23y3PIWcNozGb33TZXnNmWcphE33DfeGWQeEjhQ507br76yLib
         aNKOFgd103r6+UxMv+Ike+q/49xKjiAmZLJm9V9Ka9Q571yvPEoiwaEPLyk7YbNoRn9V
         QJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlHNZK7Ipphoh6oQQOjJZTI5Uk+UmtoXmM8QD+p6cpA=;
        b=B5zREudOd+w4rfiOA2zUaPOJHVj/w0OFmO7CSlorkeBXSHOwlYWl+5ssNgtv9IK6gG
         wHaYIlh3Ku06Umy/2ojt8264Z5uooC4YRT+4AwIKqoAooWfRpUREmC9Drd8gfwI+NdWp
         ocKz5Gg2YBScSV1VcQWOZKem+fdFKDdQt0CGcfoQ5xk4OWSZcEfYrccnqwJDNEhU+E17
         2ACGXlmD/NZx3aM30bGDcMWWYrUuG0/mg2oPVthgtIrPOopLUlfKBIF7Cv9rvjYYMd4U
         MIEHPP7+6kfh+Hjp9O44rti6YG5tywePcCYpmEnyef3MV8cMvWu4wfnE2Ce6j1Yaujpf
         W/pA==
X-Gm-Message-State: AO0yUKUPJGQD7uRcbrtCKFbTxbMeMHAc60GKe37vWKKISuxohtwNFSLJ
	U8xMjfBTlTWcHwl2hSTk9o/rHA==
X-Google-Smtp-Source: AK7set9gKfpf0UYsachTDlYwQ6F574rlSgQhr5a2WcPhuB2hW4zjT0pifMBEvWBvC/hsQsBDlgfG3A==
X-Received: by 2002:a92:8e4f:0:b0:30f:5f1f:8927 with SMTP id k15-20020a928e4f000000b0030f5f1f8927mr11829892ilh.20.1676026546625;
        Fri, 10 Feb 2023 02:55:46 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:5982:e253:f3:ec01])
        by smtp.gmail.com with ESMTPSA id l8-20020a922908000000b003140001a5e6sm258104ilg.83.2023.02.10.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:55:46 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 10 Feb 2023 11:55:34 +0100
Subject: [PATCH] drm/meson/meson_venc: Relax the supported mode checks
MIME-Version: 1.0
Message-Id: <20230210-relax_dmt_limits-v1-0-a1474624d530@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_025556_964497_66C834BA 
X-CRM114-Status: GOOD (  11.54  )
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

Relax a bit the supported modes list by including also 480x1920. This
was actually tested on real hardware and it works correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
drm/meson/meson_venc: Add more supported resolutions.

In particular relax the resolution checks to allow more resolutions like
480x1920.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3c55ed003359..5b3621589a9f 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -866,10 +866,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 640 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 480 || mode->hdisplay > 1920)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1200)
+	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;

---
base-commit: 38c1e0c65865426676123cc9a127526fa02bcac6
change-id: 20230210-relax_dmt_limits-355e2a1c7ccf

Best regards,
-- 
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
