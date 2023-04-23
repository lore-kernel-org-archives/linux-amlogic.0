Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7798FC6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VAZrow3KR4BWkCLoWUwt/aGdn11847x2h8cvQY0gTgE=; b=MVGShT9F0h9wO+
	J5S3PnsIueQIMbdKTtlY8Iq3y7k6QVWGEKrzAbgbU94U8pRx60ufZPxrabltO43u22+9/Vo6B5LOU
	hq5K02/3S4BZnsqTFVLYAPP886BplJlmu/3vpDsQvd1cnC+33xyztj/8PtxiPlcYM4XZOZY69KrnP
	EbC4CbTPntr0yVcjHT72lcEaTI1Fb3G1hDTF8iRRHT8FK8tyd0FkD/SGXH6QOkDmVHStg52yoRa6V
	4ExogiNXzy3WSMHSP7RgCZuUfiFrEAbheEFlsr2N3clttqcO/sXDhHPdKIjnRmlvRdZOpKzWoXiSW
	XAiHaLlHIjwZMXhoJ9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqb5Z-00EQzq-2O;
	Sun, 23 Apr 2023 14:53:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqb5V-00EQy3-29
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Apr 2023 14:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682261588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=brUP6Y4+fxRUO3RjcIxh9okEQNw9LLitzlIw6oM9sjU=;
	b=TJyCLN96bhb7oELolk/NjHIb/8yUcBKCIaNL633t6vL4XkDNHxgyT2HRolK+oAjZX4B1Dz
	B64teMPZsvrJEUrkMPDp61Ig03Q3VRZgQFKDwsU0D/mXbOXBK0ClZDfNAHpyI2YUEWy66f
	ZXs3gY3wABrBAg8x3z8ob78PS4AbWms=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-hBum4TvGODOoQD4cCfIeCw-1; Sun, 23 Apr 2023 10:53:05 -0400
X-MC-Unique: hBum4TvGODOoQD4cCfIeCw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3ef3323e320so42705831cf.0
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Apr 2023 07:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682261585; x=1684853585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brUP6Y4+fxRUO3RjcIxh9okEQNw9LLitzlIw6oM9sjU=;
        b=da+eguKvTFEXI/Vvjl1wE1ROrYEmJfsVZk4yeP3YDRkSEzBfQ61dkrMkn51aFm2ciJ
         Wx3rw0tbx0LnToM8SrH/bbCljmhB8Y9mQxeJiJrPAu1gPN30y8K1dxkx1BtAQX61xUUx
         xRhcDb8Gacij9JvoGsZoHJxIzy3cgh5mqATEN0NrgY+zLXjPKXgNJ0VGDetRfOd0ok/+
         g1xZMyCGQvcL9DV1dwOW1tYJcoAnHGKDvdIFXSuvxkaqgiWWAb92F05iEktl79XT3QD1
         FvA0Css9WU426qw112kqJ9aUcbh4hcyRZ1LDfp13t/oq7/J10gR9uxtZH26UPdbmiiCv
         GCbA==
X-Gm-Message-State: AAQBX9fdSECNE5SEKYqTc1VUC/BbvLvYzDGfUubm3dPtiEYUqXWU+Kf1
	1WEmyvvLzAeY/rFQsMMwMfyMgXvlOKts0NK+52hPRGRXV1uyNoK2FS/FZtdT/5AQTbBRYwq7ONq
	BvgaUeOfsyrcKhh2RFsKnpp03VEoVA7g=
X-Received: by 2002:ac8:5892:0:b0:3e3:9117:66e8 with SMTP id t18-20020ac85892000000b003e3911766e8mr19520243qta.35.1682261584965;
        Sun, 23 Apr 2023 07:53:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmzZ2YfZA9i7Lvmo/Y61N2NeOxSpRotijBmk2JHeQ07QlcP3dqMW3ponYcBCaTHnGgvtlrcg==
X-Received: by 2002:ac8:5892:0:b0:3e3:9117:66e8 with SMTP id t18-20020ac85892000000b003e3911766e8mr19520221qta.35.1682261584717;
        Sun, 23 Apr 2023 07:53:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id w24-20020a05622a191800b003ef59e2b9a6sm2358221qtc.78.2023.04.23.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:53:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: neil.armstrong@linaro.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/meson: set variables meson_hdmi_* storage-class-specifier to static
Date: Sun, 23 Apr 2023 10:53:00 -0400
Message-Id: <20230423145300.3937831-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_075313_898021_13D65B03 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

smatch has several simailar warnings to
drivers/gpu/drm/meson/meson_venc.c:189:28: warning: symbol
  'meson_hdmi_enci_mode_480i' was not declared. Should it be static?

These variables are only used in their defining file so should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index fcd532db19c1..27ef9f88e4ff 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -186,7 +186,7 @@ union meson_hdmi_venc_mode {
 	} encp;
 };
 
-union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
+static union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
 	.enci = {
 		.hso_begin = 5,
 		.hso_end = 129,
@@ -206,7 +206,7 @@ union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
+static union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
 	.enci = {
 		.hso_begin = 3,
 		.hso_end = 129,
@@ -226,7 +226,7 @@ union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
 	.encp = {
 		.dvi_settings = 0x21,
 		.video_mode = 0x4000,
@@ -272,7 +272,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
 	.encp = {
 		.dvi_settings = 0x21,
 		.video_mode = 0x4000,
@@ -318,7 +318,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
 	.encp = {
 		.dvi_settings = 0x2029,
 		.video_mode = 0x4040,
@@ -360,7 +360,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
 	.encp = {
 		.dvi_settings = 0x202d,
 		.video_mode = 0x4040,
@@ -405,7 +405,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
 	.encp = {
 		.dvi_settings = 0x2029,
 		.video_mode = 0x5ffc,
@@ -454,7 +454,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
 	.encp = {
 		.dvi_settings = 0x202d,
 		.video_mode = 0x5ffc,
@@ -503,7 +503,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
 	.encp = {
 		.dvi_settings = 0xd,
 		.video_mode = 0x4040,
@@ -552,7 +552,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -596,7 +596,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
 	.encp = {
 		.dvi_settings = 0xd,
 		.video_mode = 0x4040,
@@ -644,7 +644,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -688,7 +688,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p24 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p24 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -730,7 +730,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p24 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p25 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p25 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -772,7 +772,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p25 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -814,7 +814,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
 	},
 };
 
-struct meson_hdmi_venc_vic_mode {
+static struct meson_hdmi_venc_vic_mode {
 	unsigned int vic;
 	union meson_hdmi_venc_mode *mode;
 } meson_hdmi_venc_vic_modes[] = {
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
