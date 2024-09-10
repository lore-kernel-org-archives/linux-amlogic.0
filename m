Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8EDEDE99A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/wVLVFIoWgkg/P9OwKqQcYwWmuvphKNVWv8buBKvTE=; b=zuHXA/E7/gi9ON
	YHWf0C15kIDAOHE5TspljA5jDx7TIOUrJkHHYPbx9h8z0Y3lisTNLnIxRFQmjN6w1pa+vPl4gNBwA
	RYX3xdGlmkmETEPdZ7tWSkb/D7SzKRgmkGTAgB5xU9UGsh9SutGqqlmm4Z7jZ+kyqPLz1eq20T1WX
	JiQCOgwKv8AfLYhcRty8BScnLhrQszlLuEufBeK2jVfD19gG4KQdOwH59hl038ZyN/BurVK3N9qGp
	yO8UCdZ+JUnftQnKGr1qB7Dg/msiRVQ7AzTbWhvX89MrGfP+vWDbCREH9jyFYYmVv0q2WCVk3UVFA
	Cp8kgDQVi7l1MZC+3s4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3uT-00000006Nnh-3zLT;
	Tue, 10 Sep 2024 16:40:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nh-00000006LFK-3z0G
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-374c180d123so3227247f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985988; x=1726590788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tSPL9hjXApUYKXuHpC3lX5106d4gltSKmV8tShxn0Y=;
        b=A6dxngggIuJ9wxMppET8hxXABE5udPPlrof/efQ3UzqyUzo40UAywiLwsXtGf7yehq
         XrBkmEZ9Uq9j8BX8iQxeABuShu6mbejb3gnRWDAWdBQRKcgBiHznYQJjJiVux/svfcuF
         QytmjqXJ0VuTlQ4KoUjgVZEFfGWI6XXg5cedC+FtfVWXzcMVk7Kx46RvJWrKShCW7Sq3
         5ZMiy+C8+CUKE3BVNE4IPM5k7qFdZyWcUtoI04/B+ZLG4bmFAzSoYGwwwOkygvJX7fnE
         R3GMUjS7RjEVkjpawZVxpBhCH6cgPxO/+0HMIhDdVQ+ZrjmfYVI1OlHZ1kz+xGTbijyX
         SM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985988; x=1726590788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tSPL9hjXApUYKXuHpC3lX5106d4gltSKmV8tShxn0Y=;
        b=a73Frb2Ta4cS+bMPHcsxYywSOyr0OWg/+mKc/5jlkoBaIiI29hUNIG06H+YYoREFT0
         t8jFW+FXScQFhehNEFtxBeyxCpB6euegehSwcCcdHUjYFtMDRVj6CF8T892kOF0ZYglJ
         g6JsU14n5nUY9BatNtmuLZ+UvXcxsr0fGA86Ue1d+5gHfbPU0hYuvygRBHceQvX5yCV5
         yM9kjQglPxi3/FRgVYPSpUqhe5GqpLXGTG+2BHcd192btmmMSl66VR74HWxBEhaOJOOt
         UM55H4Xp1H9ZGBI1uyshqeYv/darXrxS0vuZeIv90FTVpY5alIOychq35Dmv52vqh3Do
         gJig==
X-Forwarded-Encrypted: i=1; AJvYcCWJxoeUDUDJCoqyWc5PiCpgADYdfCAOqptMeyZZWNke2Rqi8+Vc4dyaG/nVzBfJANSp983nCVjgOdHBwVSy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr15liFBfjFLaK2ktM3GszJ9bOaDDnJuw0vFpi3zWVcbWI2TlL
	Jrfwi58W4sU4KWCKeI9QOToeFfchioj6cmlW99F+NXxxCnVjaHcGj4o+WnNZyZU=
X-Google-Smtp-Source: AGHT+IEAQR9BO+yAiqhladmdOuF5JjCwDfl9NeIYLrsC3j51II+i92+uH3mBlNCFN/eHNfMzuinSIQ==
X-Received: by 2002:adf:efc7:0:b0:374:c9cd:9bf4 with SMTP id ffacd0b85a97d-37894a6ac0bmr6234424f8f.52.1725985987538;
        Tue, 10 Sep 2024 09:33:07 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:48 +0200
Subject: [PATCH v5 6/9] reset: amlogic: add reset status support
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-6-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=uFpLNDx7axOqsTgkkJPsc6yBsPXI/ygS3MYpVh8ixvI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS5Os8nvAWVam3MD2aXk6qjTKElTgYwG+Kmm
 81fEj+NPRWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0uQAKCRDm/A8cN/La
 hcGoD/oDe94aoo17S/5UrJ6BEEh90EQJYvYYF5PUECrF/0sE2pzULDxN6SQSJCoos6SZRTpKJDn
 KfICwBxmuB0xw8V4/nmyQedtEXVXk1Kf70mAAJv8V4NL2iSgN1sE2sIjopMdiFIGiFMLwpMbyVW
 sfadAYSoKlovdC61RAI/KhGdJC5E5Am4Z8yfbyte3uQRta5Exc1qZW/KIQURO+SOLECgobPOWn7
 VD/YoCt4b58k+36xBVn220LxPQ2p7824F159MBmZ+jlGLyI8iZGqmfpuSH05Uw1WAy1uRBIUEw5
 TffX4O09FNQK/YCrEPOoaoW7rMgmt/i2D1X18yNSShFBaBv1wWy/cVUZoRBIUzj+WItN2gu2hxE
 OUPLhhrdIy8HHDwZ8rmy/kYc5X41OUYb4SJyVIqdZzTTuFKByz4iiAaB2o2ueh/L3/Vwk1J+TNh
 CLiKbvfCwo6fYos2qhZKgxESTmGjT+h4jPrgke7pQL4MGr/oIJa8L+EZ2zbYhOqWhY3ggWTzqYR
 VAW1PHcDfflSvfLSj/kIw4TRupXEGn1E41vRThuQOfKjnk8Bq6p5tE7f+1hMERLbHgArN/8qRyF
 ujXJXCUB+iLoIivAAWgseixWB5eGPrQ+aNaTm9Jn/lcnjHjLzlPKJpLFH+LpMdtRlmHP6fX6jTA
 RfjUTfIn8IhRhXQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093310_082740_2AE79C8A 
X-CRM114-Status: GOOD (  12.53  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index e31c1b7c9e4d..af690d3012ec 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -68,6 +68,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
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
@@ -84,6 +100,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static const struct meson_reset_param meson8b_param = {

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
