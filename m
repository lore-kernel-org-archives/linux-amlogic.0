Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C43CF45C6
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A89Ztj2u+kbLXO0Zwx5m+rW6/Z7CMmBRg0Jpl2gPmTQ=; b=T06rZOncpzjIqd
	Si+bSeZ9csf5ZBqnb1yx9F/qPyYiWz4TMmk88bXw2AYyGgihZpcB/iAslZKShKbjSzvurxR+r/WaG
	wn1HtqUjhi91n6RfwA4YEY4k1tecwEaYFtGhohFGuXE/KemjOZj6TDdgmhNYBxy8QHt6Iv8KcU8R/
	ATugnXLbxx7a7pfOYuI6TbG9dY6G//1nDUr7Ky4NBcJvFDWGUle4ROlNFZF0WwrNPwpPaymxmc7vU
	1Qjh9Jee0fMT7CxtqycNCVZVcmYafgwTLtPSnVeSukmGvlq4r/0vPbuTPd9eI5Utjt8i46rCLbhHl
	KiOC2aGr7JW68YgwRFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTAi-00000006Ny1-4A4r;
	Tue, 13 Jan 2026 01:26:12 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTAg-00000006Nww-0hrd
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 01:26:11 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso2684466a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 17:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267569; x=1768872369; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EgIhIloE/N1n62OU17JhUeFzVsTf3TjVmSzCNe2pz8=;
        b=UWxfaNPlq+giLDyd5Y2Npc91o+UDoNZpG9SQgZTw00DN32b7aeWlyGBeLRAcgvh8Av
         MYpBEOpA32AUrdrxIl4Y2dWRE8GA8CeygWwRw7i/U1Tz6QyrmcIkumBvPuE/iBAMtLOu
         5cIjUk+AGJBwsscPOjnTUBaasioCmBUTmjXojxGhOmwP4G1P9lWfX5/hxi38V3/Co8A6
         3HbA9L14Cy8x7k7X7PSunM5Y0J5LkiJn0SdhKT7iqaqu/SGFSFl3pPT0PL1KlCNPf0X/
         B1rFGHLl0rmEEMr4+cS8CHxrGHxF/jnV4Np/tXLeQ7LQ3Q5puRnRPC+fc9wnu+2aFHoC
         Z3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267569; x=1768872369;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0EgIhIloE/N1n62OU17JhUeFzVsTf3TjVmSzCNe2pz8=;
        b=SZtflt3wtUkppd10UmXrDdBZUkS/GtDQDNmunnKCADmgeHR3HWJOjzs2xlcf8d9v1U
         dYMNPLxGM/Su/L9OG+Emq4Y4iNRMXcEwpIrDO52a48bcJpAFHh50G8wvvGNqueXVMt52
         qzkWXBMNl7sqJLb7TsSPAbeaPW9VBupZs8IHG+MgFIrQ23XlzBt0ONN8+RHIwJBF/FQj
         4Teiw7TeDlDz5nSbF2Rp5YLU91n/f5QidhNyhawbMbO7QyG0jH9F9+x2DiBq0GNk7RjT
         uNrZ+KPsYkecu58EOoeImJm+XlgoUYJ74PfARm6p4jfvJM62/YmSLF/WNP9O4AFy3zCJ
         60Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVIgerEng8gxJzvX6EvvDlBRGaXzMJ+/GmicB24ac1i6czN4kAXTHFy+FPC1iAORSOB6Mhl5uA08Vz9OT6O@lists.infradead.org
X-Gm-Message-State: AOJu0YxR1O1rTmnpD4i5amhrCxDk5dCkDTniGuQj0m9gwSWaTURB0J+I
	vnqL6yxyEws/jtM4sotvi1CloGKoG1YA8D8a80BZ09nQKvkBrhx2hoXZ
X-Gm-Gg: AY/fxX4s8/SSePef54AT+ffL5rttWRGat5y3AhMS7vOmt0fbYTg19C9EtVkFpyPQr4a
	nAzvPY/nfNC1TF5lNVp4s6IITjnGg4ormLg5tziY51BPKM3bPm8tCZ8bbStj5cqyTRMzPEVA79z
	xM5wKF0SeStA6e6ScFDsGEQ7SRLCbV1Ag8HPwgsIwm3zN81NZmnZi72kHlNxHTJ8VwMp/j/UCU9
	SGX8L3uhbgatY08CxdhzsOs8EhNEBoFD6ya6jiaMnnLZsfzjzi5L7oyXVjrPOMQPyHoegBqiQIA
	ZY29YnAH2iWhGyXFzKvpZRIElzKzNKj6rUz9RntiSneo8+gTHRnXhdTu+BcpH/YtmQH1Qa3wQQS
	bt0lVIv4YRe/UQSvWO6+rUb5MpTh8nGySpXCdouEE1kvITmLnfU5hVNL/kxdIRiD9xzdEagnxo5
	mXm7cAS+0=
X-Google-Smtp-Source: AGHT+IEntXnjRLs33fTPcuWIB9pCaJyDMLX3lGUH732c23QJBf8RP/3jseGvl9j1QcWwJIm0HDrGDw==
X-Received: by 2002:a17:90b:2f90:b0:34e:5516:6655 with SMTP id 98e67ed59e1d1-34f68c4f92bmr16964903a91.9.1768267568909;
        Mon, 12 Jan 2026 17:26:08 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb64bfesm18688677a91.9.2026.01.12.17.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:26:08 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nick@khadas.com
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4
Date: Tue, 13 Jan 2026 09:25:27 +0800
Message-Id: <20260113012527.40725-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_172610_230237_3CC63ACF 
X-CRM114-Status: UNSURE (   7.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add new definition for Amlogic S4 S905Y4.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 2a54ca43cd13e..dcb75baaff247 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -85,6 +85,7 @@ static const struct meson_gx_package_id {
 	{ "S905D3", 0x2b, 0x30, 0x3f },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 	{ "S805X2", 0x37, 0x2, 0xf },
+	{ "S905Y4", 0x37, 0x3, 0xf },
 	{ "C308L", 0x3d, 0x1, 0xf },
 	{ "A311D2", 0x36, 0x1, 0xf },
 	{ "A113X2", 0x3c, 0x1, 0xf },
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
