Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEED0C3DA60
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vPDw9pWOqqnbo+NpySrsq6tIsbZiCMVp8u0citFTHc=; b=R3udzBbRjoXWYR
	MUmjPtkMtspqzxtDOrwD67Z0NT0sdI6AJAmV0SXpPcmB0pn85+71Nc6JBK3OEsBYXfxZKughTcOvf
	zrdxnUjPtdV9qiea6clBWiQ0BZeLY1K8exbm0J6CZx6hWy9zEiMk1HdUtL6HlF2NGznqHfi0jW7Tp
	neaT50v+AWs6Oh/z8mVEKiLVHJsmRuvgum/1HP8IRR0Op3RhQLBdajGyLB7wgUw1hU26sS/aZNP/e
	oB8xTRc1qUbTBX5weZmSutIn4XG8kHgrO/Ny1PSxwIcdB+ObxkGRD9TZsrCHT4RIiMkP2ZaaxTMgL
	96rnK+vy/5A4ZS4oFrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtv-0000000Gd8A-0tQe;
	Thu, 18 Jul 2024 09:58:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtp-0000000Gd35-3ZyY
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4279c924ca7so965695e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296688; x=1721901488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xcwXqNbcAcoUEX6kCiLZbJmCheMKB1aLHCgp/Pjck8=;
        b=h2w7I5wIo/iMu1t1g+6adDJPBGqLt2HxOhaiSbk2qhcEumKzP9qnU+9IDmCqL9fzh2
         5692MuGyADc7JH9MSsTvjsQpnGfGhuV7TqXwcVaJAjwNCMaOCJQOvBONJPQ7AApIw9xu
         YqoG9+4UYgILXh1qq6Ulx8tFlXDe9cseYKRysUY1iq9VmrIQ3Oc9AxSZUlEgpI3OH5Mn
         PLq77jfvwqA1mp5Ixhjl060fEl0njNvBXpIyQ9O3nmAPnxXkCf4DnytZb6XYSr7uo1B4
         L2wMdI17PLhjelEBqjRD64f/9cjoKN8EVcOudCalbgUHW2Ghd9yNJZwmhfHIjsw2Ux0U
         ZXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296688; x=1721901488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xcwXqNbcAcoUEX6kCiLZbJmCheMKB1aLHCgp/Pjck8=;
        b=JSAVXTI3a+GU+j9gGNwLZAeE0gC11xvlEs5+r3XqTdsQJzExSCD0EgEGMyJFCr+jwu
         J3ANT/UFNRorfGydRFZaO4zlc976y6XRyhblnunFXBwdfZ6TRY4I4r7q4E7JJLby/d2U
         ceqmEFDh5IHP2COo8pHugS733dhD6W7uIK7UvUWpiGyeXWDWYMWWdwv0PCTFJQScKudo
         IexiHOZFU0lYJxpWFVtk2ethFzVR+gf00qUqR1bWXShHbTgVruj+j9ZIOlnjcXRKCO6b
         c0/lQMLfSc24JD5erEO4Hppg/0TuiEe9c4DKNLfV++bzJ6hb0u3GlbhnoPxAP/VSaiwm
         CZZw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHbbeeyGk2dUtMHiMZh5qqDHbol5cHGZVmeE7DBXVpjUla4dYGoa0IC+Ro+WQLRWP2Aq+NgiF0AaYUEfEel11ifDrj1OYGfAP0nxhIW45A0Q=
X-Gm-Message-State: AOJu0YzCjVgY2B9chxoJ11N77Q9UzEEqK+Nwk0RdieYuYK32YWBn+m9p
	sI5mS0nXaYjPzXlbfIjJtPBJJKVrZL/ZXAmyhsg8akcxQ0Etemrw+crbPyWsyUjgxnVVljqkVJb
	en+Y=
X-Google-Smtp-Source: AGHT+IHUSAbObAZJT7KXYxyHY/CVrKUlSK4TOOFWbep8mWkhqc4o82VXvxTyvmakEMq8v31akCeXEQ==
X-Received: by 2002:a05:600c:4443:b0:426:686f:cb4c with SMTP id 5b1f17b1804b1-427c2cf6b1emr29425735e9.32.1721296688224;
        Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 6/9] reset: amlogic: add reset status support
Date: Thu, 18 Jul 2024 11:57:50 +0200
Message-ID: <20240718095755.3511992-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025809_922347_43F11078 
X-CRM114-Status: GOOD (  14.05  )
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
index 5a5e1c2358b6..b3ef1a1c7cf9 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -57,8 +57,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 static int meson_reset_level(struct reset_controller_dev *rcdev,
 			    unsigned long id, bool assert)
 {
-	struct meson_reset *data =
-		container_of(rcdev, struct meson_reset, rcdev);
+	struct meson_reset *data = container_of(rcdev, struct meson_reset, rcdev);
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
@@ -69,6 +68,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
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
@@ -85,6 +100,7 @@ static const struct reset_control_ops meson_reset_ops = {
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
