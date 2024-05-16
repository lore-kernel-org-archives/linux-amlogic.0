Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88A2C25B74
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGGLzhQr5Z+GRqrh3Xc2CrUvqWfy6YjxY+0UGmt/bkE=; b=HZJ/IWzNDe1hwH
	M62Qxns6j4xh3kanL8hyFTt8LWOHHnSWkcuRhbeDswQcwMdoVmHHJRRqawo4R4lpV/kW2FG3jAXrf
	hybWK0Y/W4vFmToDSvJrK6j9H2cc1mx8hF3PIhirXZz0sMiYn/eJFfjkb85/i7p5bdvsztHxsPM1z
	6EFbt6tie+M4ukdKnNFk981LAxS1EDY7ZjnC9oWUfl1tqDhVMUJw8ZXDPmZpgiHCG+BsuAyEfFi2b
	0S9wsKd4z6if0MR1yXbveD0kYZDmhy0i8GTUsGGkl78Fto+cF30UDjvyqpZn1qzponM6wqG4WJxXZ
	KcaxRsg9AxZzFxLDNnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjH-00000005Fxr-3PHL;
	Thu, 16 May 2024 15:09:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj0-00000005Fn5-1bld
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:09:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4202ca70270so6535305e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872132; x=1716476932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKLxWZMdcIpvnKpiYpSqkgcStnHEt9yT8sCcERiOd18=;
        b=WyGQv5fQl3vtgVLm3LjjjEwEgEgtM0Oyhf7HSbdypOBQrF+UXliakKlzLv+4YZKu30
         XFpNC+wDmFC7B/+jCEkXsru2nSQ7yw2/iV2CQVIZ+0c41ZqN+r2DmdqGF10SWc3Av1EV
         40SPisvFOdMttCWAbGEWS6AvhcKtz4FALjrRHYiMp5LWe6tfWogN7MkeiHhUGkY2OZ2Y
         JPAG+sbxOD3UwBn0AEt9K7Vsi5h9hdNJbJXk7CMQtLetitsIYBepAhqxm8PDpI3uYP0t
         MPqJaPN604sPzbjiFzcS0ZKzrWsddnAirv1twKIbc73E0h3OffvYujgk4FQ6z5FS2pet
         lwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872132; x=1716476932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKLxWZMdcIpvnKpiYpSqkgcStnHEt9yT8sCcERiOd18=;
        b=BoaFsoshXJm60T+Lv7+re7bNxv84z7cC1jPiJC2HjRk1WGh9fRQHV+7lZsnB/zkccl
         8247dqSEXIbpQqGVex5NI+d7oOv9FfRMoSmnSBIG1HBxF8nQEG/ESyn62bC2fXBg01qr
         hBJ2T28dXPB16lLImXnz6Aq0s4x9mGQPhZfB8eFswZA5HpqDoDkL6MqzfqvHSwm1I053
         OEYHuu0XnzxYDZT6rgZM7IbxHb3GOh7Bux+80vYXVxNy4NtgKsPic41CbMcMwfCruCa2
         sujFB0fnCFvGNPktoeSOFhG9/3yk755LUqHO7XHRKS6//Un5uRXzt7EYOJrupMDm+GbN
         irWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb/+on7ntfSDmae1SCj6t/KULUVBmd8pq/n3y9Go7ZhZgYFHUlOELuO1kM6pgYaZis7LgNIowIuXatuqPtWRXV27HeNoFOmngyyoa+wJedqYs=
X-Gm-Message-State: AOJu0YzykR8ob5PooeBUY9eihR2U7JOVVV0iPc41QYNC0vjUpiHB+eIv
	09Mc3EjLHvfhGdtVzX2/MWjOMmXobfuTDdWBtxlRS8pwJWKK0ug3131pQhmPizw=
X-Google-Smtp-Source: AGHT+IG/ykFXrbe/CvlsHN4du9qU8bGGEbwc+8VNXOgZYoQoZ5vQI4mqtGU2dnI3Uc7WqDGAtugK6A==
X-Received: by 2002:a05:600c:3594:b0:41f:e10f:88b1 with SMTP id 5b1f17b1804b1-41feac55eccmr187308155e9.27.1715872132571;
        Thu, 16 May 2024 08:08:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 5/9] reset: amlogic: add reset status support
Date: Thu, 16 May 2024 17:08:35 +0200
Message-ID: <20240516150842.705844-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080854_497353_21D3200E 
X-CRM114-Status: GOOD (  11.25  )
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

Add the callback to check the status of the level reset, as done in
the reset driver of the audio clock controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 3e0447366ba6..65ba9190cb53 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -69,6 +69,23 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
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
+
+	return val ^ data->param->level_low_reset;
+}
+
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -85,6 +102,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static int meson_reset_probe(struct device *dev, struct regmap *map,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
