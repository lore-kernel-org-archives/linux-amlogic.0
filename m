Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD420C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:22:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77CE2078E
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pO/tAfRO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pN1BhJbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77CE2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tc/qLazAd04WdZKi3QrJELYwj0v8yERMJlFGu20Xk8E=; b=pO/tAfRO/+wmmDLQANRjAG+ES
	m2GwVlUFmf/wXZOEIfu/QaTggSuLt/3/zC0WOPrYnEGA97vXy2M4o4LXxUuS9qffvVTwAmExTTr1E
	3VqiZFCmJqvSzHATZTjRf+A7rHUylzc9Rhu5TanvPGN12SDb5e+3fMxTda4ZdlW5QVU7Hp+hnG11F
	g7A6IussZTiIFgnjOpbt+x8KNzx2CaWfjdGwYB97O4XWGGRdimB8EL7xavCo/C6DxjzuPD6OWNFeU
	IWlzpEOSPGcZg6Hew8SsRxJKZz+f2okUURWlu1xF4o7KKaE9nRRBOpD0Oyw9I43jClBJpj7yRgcVI
	55m2LYYrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7cHD-0004Fy-11; Mon, 17 Aug 2020 10:22:03 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cGx-00044H-Fl; Mon, 17 Aug 2020 10:21:48 +0000
Received: by mail-pg1-x543.google.com with SMTP id o13so7916160pgf.0;
 Mon, 17 Aug 2020 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lty6facXqNiOm5uMHf69/sWVwYZMbpQy+5RWM2GRtIg=;
 b=pN1BhJbko63bRfN8Sp914IbopiUiqNfP1BodnjxKtgh42cd6Jc/A5kf+Ufy0DoSrSS
 QOur7EcqvNqO2Wxv/J6GcMUy5L3ZyWFkmrWeeEnAK0LT3+9ALAI01Uuzvz9NMTZehZ2s
 zBTwUWg+XxKctwLb6qIlXcFRqQJJ+YXbnP6fqXH2ONOTqS9dXRLmMqarNgJXjKc0SvRl
 awxc1ZCw5AvuYPpNNhy0Tp6OXNarmSN77P9Z3Bz6e7P7YHSw46vTDRsq5UnPaoYb6cC1
 a3Ta1okPIBj1WlczEqBJMomIM6Kpiwk+qxKDy3sOF9PsQV61RPzQtzCTLDZ5PnP2klPM
 wnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lty6facXqNiOm5uMHf69/sWVwYZMbpQy+5RWM2GRtIg=;
 b=bYuNimA8vmiwUqsAc8jC9e2o7PRUoHwiB7fI+9mtytJOueWx3O26hJz8H0OjgOZAON
 zaaWzYyeufpVHuPGOR00ZpIdQdXThEOy8qOXFSW81ZQaAHY4zapp9OovHrzcLKCoVBNs
 1dLuXYqGUOGNRPCoJhX2OexfhdKp1fCpZwwqJzasdy1dhSntko3N+A1w5jWGeg7rskoO
 kqXYKKvsCBMSyH8JOZM+zW+NqpJJkwx9pBFznj58UPlhGiliQGXPdGQcygtISbOf1a8J
 j1u3yGKZGNol1TAc8oTL+Q8Aflkcu6sIw51GSXRHLCs34GX7B/Yekd14o9W9+bPSWPMQ
 IUeA==
X-Gm-Message-State: AOAM533Z/KAQIbZ4MNrD9fpUjXRDAnMSgxySCRU4aXHjiyHJHh+6qUE2
 jRwF9+jvNmeAWPHNt33Fwlw=
X-Google-Smtp-Source: ABdhPJylJwiE+zRYuMkQNccV7+uAK/8roRhHGyenffyM530Ozi5JeiojHOGJNXKpQacb+PD6qixZxg==
X-Received: by 2002:a65:40c1:: with SMTP id u1mr9110103pgp.379.1597659705173; 
 Mon, 17 Aug 2020 03:21:45 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 03:21:44 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: defconfig: Enable RTC devices for Amlogic boards
Date: Mon, 17 Aug 2020 10:21:22 +0000
Message-Id: <20200817102122.434-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817102122.434-1-linux.amoon@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_062147_611383_ADC2CAA2 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes v2
Added Neil's ACK.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..3d9756833e0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_RV8803=m
 CONFIG_RTC_DRV_S5M=y
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
