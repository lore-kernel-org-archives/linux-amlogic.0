Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32396C3DA4B
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVlIKmLDZIE+els66MaH7ImtNWryk+VMYYbe74arcKU=; b=O6ElJeIqFd+Qko
	zRZDV4/rHHKFG7E6khHlaoanFClqVeqBaE4QV4oOOULueoQmghQQ6JbS57iOMZUNmEpL8i461nMq8
	Rv0N2bZNnRWNqmX24Aml+k3qgtbaG94NjRbEza0Ds1rxj9ubYeGQSDnOLTsLxxP4MTtTOgIbf0W20
	SZ0q/ZkiiiqQI9ewG1GkfYv9B1L4Kpf3dORkDqE6c9jtIvkmctblqX/E47vozeVpCiyAUBpA8Go4K
	7vjeo+8FY506xY0lP44SXiOGIHv6zUxgIih1UuIHZJ/jJ7qoncyWeoHbI8M7w7R2YnUjRkhb/CjWF
	NFuVvecTDaUg+NAssf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8Z-0000000B8jr-2nNW;
	Wed, 10 Jul 2024 16:25:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8T-0000000B8f7-42ih
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4265c2b602aso32484805e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628740; x=1721233540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=PQf7EFhU5yk1a4ULVdH/9n8uHDqDxsmmZOgvaQJkZTefErNp4MZ8cUpka+pJGbv67g
         R2/MMc+k+7Wufq13fH7RMYcR7SYV3vBXVY3qyIQGyiRp8AFEY+LlM2UNTJPCUdX5r2wu
         jYOxLixj+OPharmuCM/37/8Mf765bMR9eIpFhWPpRUU0WCxFqZ7/ypNfT+aeecmPMM3r
         Nzo/OtBtnS2KEbH8C/mi+UGe/+V9LHbbHflm0kWDgL7H88uhrI5+mxcvnCSaJ5YXE5RL
         8AYFnNkuSv3EJ3gP/gjApl/YqkM1n/GO1UFlJb59NpbxmFh8q0HYzPPws1ATmlmBwTK/
         m4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628740; x=1721233540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=BPSFsoB4naLiHO4P54Qudel1RruMYkss5aoYEx8jBa5HRfszGIviO6Kyxlpr4sKhsU
         uew5JEWFduaRgEeNMb7gwZ3zVKzr5ullWW0b2zW/lcnrE3VyzM6iUkb8nrSaJYDNSbcy
         k/cMjT1F9iDtCO4D3KdWdTqrVPtkzLI5Og8lUoePv8AnBIBi2cx328rLs9B6hO9jsPpi
         iF9VNOUpioA0KxFYo4mSdyLudmsmP7brJKt6os4KqXvZ3c9/Un3hUHVmxXphMCmxs55v
         339+Giv3zbolIHepJQ12QKiNEOXfLqCO0BFF24I4BB0AtpzQsH3eg39En1WOKUV5eaJq
         cABA==
X-Forwarded-Encrypted: i=1; AJvYcCXTYdG6k2w3ZNT/Y8hUPQ5H2z4vlOjUMNPqfEcVzlddjIYV7b5s2LFMRA3rqhQjGvWPKLDT4NVUM25TYm0slnL4WNrtff0uXHnTNztmNWeSihM=
X-Gm-Message-State: AOJu0YyDkL3ufiy14MvmJx7VeSJ0r6mI+o/5ammUel5uSQpqXySmhtZM
	9UjZm6aIozGIxtsFSmrGztxfUvv8CPWK7YePm1pKpYUaTYoTghS/+jb9dHssaYU=
X-Google-Smtp-Source: AGHT+IEY6Gw5O2963Scyj/oRKu7QUIVR4X1flEdWrgEg+3YfHL8aVdfzQffvR8CC//15Yu303pOoSg==
X-Received: by 2002:a05:600c:63c7:b0:426:5f0b:a49b with SMTP id 5b1f17b1804b1-426707e360fmr36598765e9.23.1720628740679;
        Wed, 10 Jul 2024 09:25:40 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/8] reset: amlogic: use reset number instead of register count
Date: Wed, 10 Jul 2024 18:25:13 +0200
Message-ID: <20240710162526.2341399-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092542_055185_DFF38817 
X-CRM114-Status: GOOD (  12.38  )
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index fec55321b52b..3e0447366ba6 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
+	unsigned int reset_num;
 	int reset_offset;
 	int level_offset;
 	bool level_low_reset;
@@ -90,7 +90,6 @@ static const struct reset_control_ops meson_reset_ops = {
 static int meson_reset_probe(struct device *dev, struct regmap *map,
 			     const struct meson_reset_param *param)
 {
-	unsigned int stride = regmap_get_reg_stride(map);
 	struct meson_reset *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -100,8 +99,7 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->param = param;
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
-	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
-		* stride;
+	data->rcdev.nr_resets = param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
@@ -109,21 +107,21 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 }
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
