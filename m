Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135BDC10F0B
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 16:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4BC6217F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 16:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CcubGAQI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BAnt22Re"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4BC6217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMoXHpOnnQxR5yiHTbsKMRpQciaXsBmylk7zcwClWPI=; b=CcubGAQII7pgJH
	Af5mNiD+Osfth/fFakQKfB7NN7zms8ctzNiixvnswE5QZasMqLb9HHWpQHqFIe2VyPSZIqYogOKgA
	XuKkS6KIqPNzcxzRMAOdMOK3QwLmmn4D1PmpbYbylGDoeN2ZSTp83nzsoudsSZ5FoTl6i9mw/04n5
	iI0L3J9Vm55X0k/HlwXy/eo8Zxdo6+4awZOCCPU2suaxyvSs9d9+0AwqGvb6h44N8S15vKzgjsFXw
	BAC3R/tnjF4swSLZd63bHInx5y74Qd5NNxRFQW3IhU4jU+sWLyq5m9Mf83P/Ve/Gs/gUxgjK+vmaI
	yKdzwRwdfGUJjUSuHLoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4TMS-0002WQ-NZ; Thu, 14 Mar 2019 16:37:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4TMP-0002VX-9r
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 16:37:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id f3so3777965wmj.4
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyyOz1m96O4p/E0V0P2WXHuhjOVs41Ijnx22pgX7mwI=;
 b=BAnt22RecllUp0V+7xCOYepXPwGttiyuNcJNvDKMMkzz0QqM9GS+pfP2K+/htHQDY+
 RQixqU28hjnQsM3Y/0SH3MGRqcmFlvT+PExX1T40zyhfliqB09ZDuXKAzovTAr3TD4m5
 LJ6vje5losjhjqV/ljE0oJylp1X+7wOynqU/RXwJ9bltp/zMywHpW2VRT/LrZ8XHV89f
 eWSQ4rAokoXGtamaV7oq9ktYo3/Ys/nm3VwhFsXm7ffbmvxujYKYcjYhkyWajcJvSmbi
 61rbR9G/HKDVLWNGE36lLsHTIZKanJ2I9F/+GfXUg75vRRT76rx9vGcoUNYJFpzElY18
 ZffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyyOz1m96O4p/E0V0P2WXHuhjOVs41Ijnx22pgX7mwI=;
 b=elnSwMh1/wMZ1ygntITGoYjBjAnVeMZhBVtjcPKF+KSDdWK802JkCr+jV51Xnwdd4H
 5skL6uSnU29ZDcZKrU/syx6g0qE+4MoE3KoWfEzCf01qSIXMplMZkmjoGD3DiYj4zE5Z
 jAH76e+IGbUwQB2k3RFJqrOGtZADYrrIG9nN4+IHtjzxxyPYCWJx4zV6jtChk3pPX4JI
 RMpoEBlye9Rk0ynRF4ENkXcKaqg751EQtbfeArZOW4f1KeWRrtElvV6220HzpXkhMas7
 opsKVAeh264l54Dl94FBBo9LryzJery7K9pT4a0JUavFEA21ihMlLaW8j9QdW4or0Cyu
 JrCw==
X-Gm-Message-State: APjAAAUj/kGQ1qwDqgKjDed6fcv9ghPSDHAUX2Nc4Lp9Q3PMydwx220I
 mNylXO038s8UTqyzE/ET+xdumg==
X-Google-Smtp-Source: APXvYqxijEWMM/0WKUooC5/J8OF4N4uoAkkdb0igMiuO3TJiuY1FHQnIndwsKGAeaUD40SJCv7bPvQ==
X-Received: by 2002:a1c:2283:: with SMTP id i125mr3173986wmi.24.1552581455474; 
 Thu, 14 Mar 2019 09:37:35 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id u17sm45003315wrg.71.2019.03.14.09.37.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Mar 2019 09:37:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength property
Date: Thu, 14 Mar 2019 17:37:24 +0100
Message-Id: <20190314163725.7918-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314163725.7918-1-jbrunet@baylibre.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_093737_388719_69C69EF2 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add optional drive-strength property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..4e3d5a27c91c 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength: Drive strength for the specified pins in uA.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
