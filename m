Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F73C30653
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNEZxL6kr/r9aA2rSTRZ3yLGv90kl4hbZjCg4HNDMaA=; b=OUFpN/M+UczA1q
	gMq5TyULut64wQqepbj+orKErROv4Mb4B42z6fYC0/pzhFp4vbB5dFvS7AEwe033arK5P6a9HPlSr
	gRf0ROFyERWJ99BU20whK7phAO44niMxMfdHasYegiUE7Kma0CW3uIcL02tTQUqKUFrEYmUaK5dQE
	dyU57Rl8jcisyh5knlw6rDXslX6hvePd9ZyuY7rRm+JUA4JUrBAXpHBOXgsXe14aJMkT8mW9tijs1
	XOrHJr/b2XUwed5XQoE/EJfJn2EhBIHTd+q3LvwVuleOAlEVxeDGXlchQUQMeK93Ye6GoniCyJe5O
	jHzXbZrGJZYFzgbCwACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOweW-00000009ce9-0I8U;
	Wed, 03 Jul 2024 09:51:52 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdK-00000009bwL-3W5X;
	Wed, 03 Jul 2024 09:50:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-58b447c519eso2548666a12.3;
        Wed, 03 Jul 2024 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000237; x=1720605037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/v+B5h2PH1m+q96jJ+7IvzomlXuROk3OZZLA8dWAec=;
        b=cJjbjQwh7GwVETxz9Bn24sajoXyKxWt/4pqD8ydQm3qXVCWYQRqE2Nwrl0odXpajSr
         RuRPdCa4Q1tsBxdnlChRj79XpdjmkgjUqQoOKi73GknkZ9ALQW8/FYSNluxMiq/FnDzC
         G9GvnOyxn/jxErH0y9jrcetp76koBM45vpNgz9paLyq1k/7470LzhdwiT8UVjslMES5v
         z8vFBDtq+aqQcheW0AXfWfpTaN/Wzzt7a0E8hF7TwApMQEWGj6drPmj9DjHTa0FqxSf/
         1AAIcwayPMCBAfaBxG7xNdhrtR1wBBCmE1CunhIlkspaevlwKbcSJ2m36FItmGyw9TN2
         n8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000237; x=1720605037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/v+B5h2PH1m+q96jJ+7IvzomlXuROk3OZZLA8dWAec=;
        b=t6awz0z6oFR7eCto1n7uJZXemv/A1aMw/iIjjpgcv98rr/dqvr6uRuG+11bl6KUuHR
         1Xb/YQNR1dEd4aybDW1HwYS5UVLnXERbiUXqmNr54ZNXnQghA7NagnK/ir0iA3tBxYqb
         2uEhM6ywONp3tLlqEQmSjneEHpVpzitlg/u+2mRUrNynjQTAV9cZ995bqUzY1fRir9i2
         tRKzVK/M+HpqGDl1YMBNFbPXKQU05ZIEWYq1ABI+ibyDocYzLWA/nHQT70snschaCOJy
         AL9+m6BG2UUsv4JZMRnoVOOY6Iihh8F27aLVmoiJ5ZbU4mSGFRtqH8s+W5QCllmx5v+l
         M1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCX1XNW9a7rpqgfx76w/QTUb7MtAH7/JHtXRgu9CMCxdt+7ZkdzgyRFe4Zpeii/9ft5Cy3R8gRgT7Cd4vLLdw+E0QENCpAnGOGQH0Z/rKEzxdMJTE/Q=
X-Gm-Message-State: AOJu0Yx2jFJbyHtFK3EpXb0flkM4RSSEvrKSaBL/kp9v91pfAk8TaSBz
	mIC/u8giVgDW4kqHZaXwp850viz3ihFpKfL6d2+8nBWSHgS6WXPM
X-Google-Smtp-Source: AGHT+IEIY4dIoxPJludnffZYVCFFdIx0eviJTJj2qywdu4egDu5miCN1B1+FWYpxH8LMM6MLKJZmaQ==
X-Received: by 2002:a05:6402:35c3:b0:58a:e810:227d with SMTP id 4fb4d7f45d1cf-58ae81f67dfmr3569556a12.21.1720000236940;
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:20 +0200
Subject: [PATCH 07/10] clk: lpc32xx: Constify struct regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-7-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=760;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=y/2i9xAdynMCIKKj977aVCl8uDEeFBvS+ERij24gH3E=;
 b=Mp1Bzj4pQqStVgM8m4kQKFq4aJg6t4Fn7Xr88JURvNcy0mwlGzsq289eVMQClPqQGE4zzTNJQ
 l76GeFFivBFAiHCY1+doTXdXhw5oYcuQ9gGfIgcLZeBm7FzaG8Rz0MV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025039_003846_71112BB1 
X-CRM114-Status: GOOD (  11.66  )
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

`lpc32xx_scb_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index d0f870eff0d6..e00f270bc6aa 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -61,7 +61,7 @@
 #define LPC32XX_USB_CLK_CTRL		0xF4
 #define LPC32XX_USB_CLK_STS		0xF8
 
-static struct regmap_config lpc32xx_scb_regmap_config = {
+static const struct regmap_config lpc32xx_scb_regmap_config = {
 	.name = "scb",
 	.reg_bits = 32,
 	.val_bits = 32,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
