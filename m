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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767E6C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:22:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414112078A
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZzyMFC0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNlBfP3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 414112078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mi4DmCVzOTvfhukPQqeOXPfCbzwWIw5L8YlQwhaC0xw=; b=UZzyMFC0jiZ2j2C+b9httSAJ+
	RRdwiIoltBbZ6vsbf7+ho5NFILmnn3YFw+InT1rFkSVWk3k//pqXBRIkx6oOLe5ihD4edO7Qs4lrX
	UV6uXLWf5YxkcbSZo2+WhH00wCmewga36odYpcDYY9uyhYOISwGJZ2bUfYKNNuPW4IuZ1vuzkrg/6
	DHaSI7ZvEPWpdNbbzV0P5mjYCaQlvgeXtg+hZGEv8AndxZrdSceXsEPSlncaPW9tKu/xzWSkwX6Ju
	bhpq3dpR0oYkMwz6UrFb9pXx2QsikeQrpwaJSsYFsbEgDHe6CNt5EsRBQ6Ag7cxlK+wAdb4Qku/ZU
	gojDXc8VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7cH1-00049M-6Z; Mon, 17 Aug 2020 10:21:51 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cGt-00042c-Jd; Mon, 17 Aug 2020 10:21:44 +0000
Received: by mail-pl1-x643.google.com with SMTP id y6so7284228plt.3;
 Mon, 17 Aug 2020 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T27zylxvpG1uKqrUR70eeURZpzCdR3pXDMNQ1pHagbA=;
 b=VNlBfP3aqV9004jXgp3H4ztvNReV0zK1OpUFaeDXTUwiRv0XGfieBxtZW3sItBlv31
 P9vWc2+6AeY880kFFgV+wuiG328ys0LfN1Ef23S4dbRvb2NWFK2vkPaucKuNBbMNDMJL
 0mrXUoAu1i1H1NFX9qtwx8ZxRwJTFIT87CvZUDfsOFsaJaQOiJlsICSyrzddkmoo1UL1
 qvGgK8Q8eZIvmE9UxVq0ncCCdykZVH+nwodWAI/mFfnevNfqzPiLarroHQFaxqk3gePX
 3GEX+OYoiqKYhdnET2s/4+OAzx413hnAahRF6ldwgEMxoThiAwhY3mwUkNFyoxPe8W2R
 +k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T27zylxvpG1uKqrUR70eeURZpzCdR3pXDMNQ1pHagbA=;
 b=OQ91hCnUBO5HcgjlSkA4A3WrM3+C+OQZ3UjcUPvVrSvt3O7q8LTQ1novLilSSwdvtd
 h9yj7Q/Dt2U+K8Y0hvh6xKwtlqduAiIJtZ1HYWnvAWg7PVvZpGwIwt79pfQT0DUF9xO1
 s31t3SKWqDFKCda3bpI5TjhtkYTsyexsMrXoyemNrp87vD8PFfHgyVQ3XDHIE1Hgd5mo
 ktjE45ONmroQSveEEhjY6TDTf0RphwXTWe44GAZ1V51X5Y/tYCdSAOI1baCWP79xRL0L
 bZ6VuDy9uMjLGX7s2wUyZvmBkOOncRMJlD+OR82t1EZVRqmsGrmXFTiKtw45RcQGRpcD
 Purg==
X-Gm-Message-State: AOAM532BAqqis0aV147hAP8SyWcO0Jy2on1aYFfcNDhJOHZc0jMykzwf
 p7p9oUSSE3p+7plXZ7KEGbOWqVa8VKI=
X-Google-Smtp-Source: ABdhPJzjP4kr8mjLNZZY23q6m/Nvpl8Mwl7NLBzr1RoFgFmBmkYWnUSsW/ucuWK+7RapTzSZyLhzOg==
X-Received: by 2002:a17:902:82c1:: with SMTP id
 u1mr10710196plz.224.1597659701482; 
 Mon, 17 Aug 2020 03:21:41 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 03:21:41 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual RTC
 driver
Date: Mon, 17 Aug 2020 10:21:21 +0000
Message-Id: <20200817102122.434-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817102122.434-1-linux.amoon@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_062143_703990_530D451F 
X-CRM114-Status: GOOD (  14.36  )
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

Disable virtual RTC node on Odroid N2,
since RTC PCF8563 support rtc wakeup.

[    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
[    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes v2
--Fix the subject and commit message.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index f08ae1b337ad..7fb952a2a35e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -642,3 +642,7 @@ &usb2_phy1 {
 	/* Enable the hub which is connected to this port */
 	phy-supply = <&hub_5v>;
 };
+
+&vrtc {
+	status = "disabled";
+};
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
