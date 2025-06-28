Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93850C83027
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Jun 2025 01:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VqkwuF8F4kRQs2h/gcIQVOHT/4Kmp0nTtSKWqgCcb5Y=; b=ZgEybHiVUH0xNY
	CyhtkQ+I6D6LWp1Bgk2NgC1MATwjONI6+ZTDAPjP3vGNHxejpDcezjlMMZSAuvV2VlZDjBZbmJezc
	UFC5p5NKbkW85sPPCEhEOIqdzOAZrOMPwNZHsUDqJRWflXWJddennpPgsxrG+ypcWqc7Sh86YACbv
	qp95s4KA84KB6+oxZ4+FGFO6lR3bWkHNJBSFiCLO0WlEzFSabB8wIXTncV/xyqD34cRb8AjU+/Zmf
	aUw4nElo+6GY0hQayMnjhlc3iSZ+cOpVr/PbNm4uiwWwOrABAf6Y8Hl5869wmoakcrgwo2GYZZ9we
	+Vq4sig1vL8ayCTQqxkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVKnR-0000000GAHI-1MO5;
	Sat, 28 Jun 2025 01:56:01 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVKl7-0000000GA6E-1bds
	for linux-amlogic@lists.infradead.org;
	Sat, 28 Jun 2025 01:53:39 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7d0976776dcso41442385a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jun 2025 18:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751075616; x=1751680416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=;
        b=E0VBxT77BTKZmnn65JXGkkGzaW5t4L3qhw7rWTQOJcCfj17ctexrTk9PCSVrNgVIwI
         08tieKAIawzLJT1b2cICnT7BeXleHLtrkkGC2vkegT5cn8Ejw3uegLWr/lbp+SYkhA7v
         ZpI0fQtMTvcyTS5Zz+RHbDZRY1AyN+h2C8EYyb9jxgoBHAlzUsLukaYHjx5t8KuaZ0Vj
         eogjFOFdEUGKt4ihVgIEz27E9wXD4Oh6UX5TC0VWUz89kGZTByyAN1QCXWRePued+k4s
         4DnqlNEQc9mTiIHvdl75wQ68++IngyvGLuqIy1xNb/rtPkmdYTAojBD5TYgIOgEitpoe
         Y9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075616; x=1751680416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=;
        b=GAzkHUD53jr4QhdXwO/T/r9LspHysaSK6f4k0EAxJYHBrSQvh5y5Pd0FOLn6THjskw
         bshJL15KHbnnKKyx3xIy+LqMIXpUHbyRZOiR+0UuxikSQOpOVx+AF8sDFCgxXCsYVEri
         GlzcqABWRjIvrGWc6+2b7YGOeKLT4dQ9EOqZN42AOEZa9CR/dcAr2Ci7qhmKbnPV3Hko
         MmM1mje4fItjmoQWVEYsfQ1g8K/w6UT9TfUXP3SZdFtI2wavIkL94herEKl+r056QZqy
         p7zY2TW9ZekN3T02bQKd+SRE8pB08wWL2r30NWVrwDwLolvL3suRmIGkkyDVMo8nbp1B
         AW+A==
X-Forwarded-Encrypted: i=1; AJvYcCWsTQmHYDZSkMcZhllR99glbbCqSLqfBOWcLeRWRYWjh3dr+F+EYSuUPNjr+MJ77yjwhcUdbDnPAvdK+v8K@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq5o550B6smGvHb3c5YS06tgehsTG3Cuagmz1Vcf4tsF6kLXZA
	YiaWWvH0jcwAN5Iiwks7R0pkcoCUoZJG9PEVxNAhqp9UR7F6d/MLNBc/wf2N496FKw==
X-Gm-Gg: ASbGncsrR6K3q1PJRs0cWh36vNp86/cQkIeqloJZU1CD3jUbKTrC1NjfkAAhfOhwor0
	kiBIqrK8hKho/PR3UniZBUD1O/YnaxEsiKMQ5OtZCEt5rAp2P60fqBsXEB0wHMQI/D8aHRDJDqa
	JuJAksO4RDXSoE2CvuBykF1405DOIrML5swkNXaUg5/oHG+X+uJPlhKsk+g4JhBXr2Xckm7hZ/o
	jPrKYjyMtd3821XPbxqUDnqRiCMmZ8SprRxdaBedBNa6zoom3G0y9lIZJNbjnpZ/xqlGjhoZda8
	jCgP/LzVwffXhvRqBUd5M28gdYIM0lv9890gezNZBjlYRadP2gxAKdNIQxcczCd/s9z0Zw==
X-Google-Smtp-Source: AGHT+IHDOFs/ZbAzvN7ioQVvaBO3tKspbKCC2PmmEG/e0ea92CY3dBFRoIiyAncqYqaZi3cyXQ2vdQ==
X-Received: by 2002:a05:620a:198b:b0:7d3:f3e1:b8c4 with SMTP id af79cd13be357-7d443944e85mr816887085a.15.1751075615803;
        Fri, 27 Jun 2025 18:53:35 -0700 (PDT)
Received: from localhost ([2607:fb90:6159:6306:aa35:a456:78ca:2103])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c396sm21861621cf.50.2025.06.27.18.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:53:35 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] mmc: meson-gx-mmc: add delay during poweroff
Date: Fri, 27 Jun 2025 21:53:28 -0400
Message-Id: <20250628015328.249637-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_185337_533873_451B26B3 
X-CRM114-Status: GOOD (  10.54  )
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

Regulators controlling the SD card power need some settling time for SD
cards to fully reset from UHS modes. The regulator framework seems to
ignore falling times set in the device tree causing a few boards with the
same hardware implementation to hang on reboot because the SD card still
had some voltage and did not reset properly to be initialized again.

Add a delay sufficiently long for the voltage to drop so that the SD card
can reset properly. Otherwise the reboot will hang at missing SD card
especially with Samsung cards.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/mmc/host/meson-gx-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..a39906079d29 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -605,6 +605,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	case MMC_POWER_OFF:
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
 		mmc_regulator_disable_vqmmc(mmc);
+		msleep(50);
 
 		break;
 
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
