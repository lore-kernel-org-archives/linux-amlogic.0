Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5331DC52D71
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLbY+AgPukcr0CRil1uJ+0tYGqZJDMtw7VgtusolWFA=; b=GWAXn8Ym7V6ZLh
	gD7kl1FjvNQ2FpfcIh0EMu9p6JGxao2BNKxOr2nfO/G5d8pKezhHqpIOjkMt61CLdbsm4KVIoFZeB
	pZ7qT8cJ6XkEW01BH3E0EKl/eN8a2ZlRUzII1XSiu3Zl0EAgKdPvwq1uMcg1YNbNyWyf7sGJpFJSY
	RdQijTbkUu1dPFBVEPd5maiHARR1Ggplu6Drf0EXrIC75fOrvl588sUES4F5Axayt4P1kKQ5fom9g
	oF7DzLfgJMZrG4IHWkRrIUyZvxMCuxLiw2i1Ovf8w794YEHdMVVZIuGDqc8hXCZn2Q6345SKGvjgP
	CsNvf633TXzqpEfapfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NQ-00000007tQr-1nHS;
	Thu, 08 Aug 2024 10:28:12 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NM-00000007tKR-0E6z
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:09 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2f189a2a841so7146771fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112886; x=1723717686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOSS3fc3XJBt3dG7ljbXMabd9Wrb6fH1OeKQO8767lc=;
        b=VEcYaep6Zs8N3+XvEdxD+FyM3c3Ssg5XPIm5oH1oMuIqLRP73faVTchxr1zn5DTVOg
         3I7Jnngpw84ZlWO3oZzH60mGcV6t0hNMxgYft8L6+k8RKZmXY/ozL+gvZctvdD4IDoCl
         N5ytcTIJmRcVUq19J2vjCiM4Y71laaQHPBR61Psxy4s5ATiHxm5AW42vFQXOCg0uvOks
         JR0tCvt16GYH+DGWR3u7mv1R3TV3I3QX3WC7wIohk2KN8ZK22EkLd1xr2RQx/BuvQHQ5
         jSx8/3Ec6ej60I/jKf4sGkQT30y+K8iy4g7lga2FbWfFiHz9PQN1BgfH6vebGglAzuyz
         7HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112886; x=1723717686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOSS3fc3XJBt3dG7ljbXMabd9Wrb6fH1OeKQO8767lc=;
        b=dvzX+J8PoMefZk3ixmDD5s8D2hlJPdSxMdoIAYNunzN9McjH+l7d6e4xtrLj4Ji1F3
         vNnuaIFqn3PpyGTFFNO+mWCEu4eEwCIzt0qTH6GnfO7R9BkR07KT9/f6RKZPePQATje3
         25BiMimDoovsn3lE7B4mdlfyRjN+Vf1AlrWUt44UPvn/fnOkYX3FTci9k/iDlDPnFBlu
         n9w0whCBZX1WOETO296gSKelaEx4Px2W1/bbWK+eASar5nQEh/HKx3eKEbjA3V9ZCyoa
         SdaCvQCrVYQC4txIw4wLGmfMNzxCJp5KQPsaEilOW8eDcpPJ51nZ7afV4P06euNftsEe
         ob9g==
X-Forwarded-Encrypted: i=1; AJvYcCVLGnSZoyUpQ3YH7sSEIqRNvbAe4YzMkvXJtepgT+0BkN2SBfFEy+vk1wvQaGo8HJwLThVJ6qN9ml0Ns8aPx+KLHsH575Bv7tOi8ownp4EBgug=
X-Gm-Message-State: AOJu0YyJ4rKRB8Y7416GR35U1Qgu3dchPpHk+Iuses6tKVO1WORhOGYu
	tWXFQSFcs2JNJRi0YOIU2ZLKQTtGecgO93g2wzthgnvjsNq/eux7SxHorewFZeQ=
X-Google-Smtp-Source: AGHT+IFI4Eqtp43CGeBvgz1gjODE89pru0R69ELYaTYb+vmy6UxKtO66CovxVMStVbq01JgDsE81/A==
X-Received: by 2002:a2e:a595:0:b0:2ef:2c0f:283e with SMTP id 38308e7fff4ca-2f19de326d0mr11034371fa.12.1723112885800;
        Thu, 08 Aug 2024 03:28:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 6/9] reset: amlogic: add reset status support
Date: Thu,  8 Aug 2024 12:27:36 +0200
Message-ID: <20240808102742.4095904-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032808_136678_77468ABC 
X-CRM114-Status: GOOD (  14.40  )
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

Add a callback to check the status of the level reset, as done in
the reset driver of the audio clock controller.

This is done keep the functionality when the audio reset controller
get migrated to meson-reset.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 5b6f934c0265..b16d9c32adb1 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -56,8 +56,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 static int meson_reset_level(struct reset_controller_dev *rcdev,
 			    unsigned long id, bool assert)
 {
-	struct meson_reset *data =
-		container_of(rcdev, struct meson_reset, rcdev);
+	struct meson_reset *data = container_of(rcdev, struct meson_reset, rcdev);
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
@@ -68,6 +67,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
+static int meson_reset_status(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int val, offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
+
+	regmap_read(data->map, offset, &val);
+	val = !!(BIT(bit) & val);
+
+	return val ^ data->param->level_low_reset;
+}
+
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -84,6 +99,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static const struct meson_reset_param meson8b_param = {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
