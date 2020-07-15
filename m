Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABA3C433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:03:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFAD20658
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 16:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6t8SeM+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1DFHr94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BFAD20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nU6nj2XEKYvAKKKBeeoaxJWwI/Tslx7lf39+g6wOUhw=; b=K6t8SeM+LQY+eAIg7gpcUeXBI
	9TnJU+LrepiAOnL7EtsMwNNOZFdhMMy/ADE05C+zFPBPT4qJbbcyUmZvclhOAvjJ7dzE3axprMbnZ
	AqgaRAO1ul/HysK2Ncg1S6IkDQiLAqGY5lGPpKwEbjvXBUa98Q+0JokBJUP0K59nDl9QaJ+Oa07+M
	GMdESozDUyB+0MQ7L/1n73OXeheyt/YUB8qRmG6d/uFDJyw3zBkBYxDGkthcVFnZ48q1XYtM7ZVx1
	dwd5hAUXXjMxa7Luawea35Shsy2Ys1apHdor/CVP4uI7iVxw8CmCLA6AL2SiuA5vL30lfEHOC00oi
	69jqAKCoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvjs0-0008KH-Qr; Wed, 15 Jul 2020 16:02:56 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvjro-0008FT-Sx; Wed, 15 Jul 2020 16:02:45 +0000
Received: by mail-pj1-x1042.google.com with SMTP id md7so3186825pjb.1;
 Wed, 15 Jul 2020 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONMsXX62nreiDek2NacvQXRvDdUz5gOYMEjImyh+rKM=;
 b=b1DFHr94cTrHN8JQTkhLe4T5+9sKO7kL2Z89KtRkC6H5yCC8NnJidJ9Cbchb7m4yTq
 U/oiuabTwBC04Gi8AH2vCwx4U2Mrxdkb6PUdK26xbBLY01kywiaPyaPxR1s9BDna5SOX
 hygzbXDpavG+9Baqx12pVeCXMg4RXY0CSRLP5uADPZMqHehJcH6xeY0lXQBNoqq+1Txl
 yzRTr3ZpLznfnllWLsQxAJ5Sg7viPeTK74ZoVdVdkRbSGfJF9IhdrRfFP1ObIbyUBSF3
 y2cC/EWYVY4fOmywKF7oFEtDnNIB+LryEHnWh7L9j6DUX1lVdiF2FcZ2VDnEjydiGwcC
 p7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ONMsXX62nreiDek2NacvQXRvDdUz5gOYMEjImyh+rKM=;
 b=agE5FhyfuQrRwc8uPaQCq9TD/8xXXcrUAgQhLato19QcUDzfJqCyp3YgOqrtp0e1AL
 HCNFOiFeFrv59DeHTPoTCFEUIYewx1afRYmNNsASp6F0VSUMp1qvH2s1v+OWbjJQ/cGG
 0wpp0a3BtdfKqga1TmJeY/K8FFzs9EZ9e0H10+K7DGg7Y0YIkyoMn0/bPQZJC7rrkjV7
 BfJyCvNgw94MrLL9BRDjyi3VQs4FnlLMf3yKkTGOXMFySpWNZlEb0c7XmgkTQO7848io
 K32f2g/+WZfIgkQZ4mbtbnIVqdrP89UVMXzjiEsoTAME8ZZqmVBOz1DhX/2il6aKndDf
 O61A==
X-Gm-Message-State: AOAM530cBeGsKhyJQ6bMDVKQhwL5EuFdwQRsNJw3m6tj3ay3NbYvsNG/
 CKwPtj1DqGaCI+a7LAjW4rY=
X-Google-Smtp-Source: ABdhPJyro64eyt/drNbskWh/gd9L12mmYcHVdGkhNqWQ0dNOPgalDclPEDPxI6wC3tu/DbC0y2GsZA==
X-Received: by 2002:a17:902:8681:: with SMTP id
 g1mr110985plo.303.1594828962977; 
 Wed, 15 Jul 2020 09:02:42 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.198])
 by smtp.gmail.com with ESMTPSA id 4sm2520157pgk.68.2020.07.15.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 09:02:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 3/3] arm64: defconfig: Enable RTC devices for Amlogic boards
Date: Wed, 15 Jul 2020 16:02:09 +0000
Message-Id: <20200715160209.652-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715160209.652-1-linux.amoon@gmail.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_120244_989006_EF5406B6 
X-CRM114-Status: GOOD (  12.16  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 883e8bace3ed..a0e8d46c3d06 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -750,6 +750,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
