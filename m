Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE64C76190
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 19:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04051218EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 19:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PPrH/mss";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RlLIlegs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04051218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Oojxw2Cmag9d/IZ7pL17oO+Nv602aF6T3JNqsK4pMjg=; b=PPrH/mss31HDMuRvZVfcliVWLO
	eUNU2AYFENHxvoX5TVq1T12Lv1C1xCm96lq0Tfk7PKhEe/Yvdct6SZ0iuNzeVX+6IvcjmAIRCMXnV
	7htS8MP6tstVzVunjFK1wG2BZ3jv4h/FBPJ5ZaIsZFpDHdQ57l28D2fM1tL1h2Te3jMG7FzTsjWvt
	lzEZJkJJz8bu8C5CwU/tmjcQiE9k2B4CpNWGAwoAvEPY6D6fa0f/rcgGzszz3/M8l9MdXXPuoT+SD
	rEZh/ldZ+A87y2+HIbhORws1iqp5oLL5IIQnMu257JXh600+O5+O1H/62oEzkeZD6F4bn+oItpqrB
	zVjmGpQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqjea-00023s-PY; Thu, 25 Jul 2019 19:43:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqjdv-0001SG-3J
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 19:43:12 +0000
Received: by mail-wr1-x441.google.com with SMTP id n9so52077147wru.0
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 12:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rCLV7+XgVoqa77OFHC2tYmqnV175cwJKyP8wP05iwpI=;
 b=RlLIlegsq38ldfiYl5JNdHC+1z0E685X1TVdFQdFCMU1V/XLKm7JrAD2RvkbUS+6jX
 BILivk9wLP0APZgO5lmITzu4fkNC5o32dWuFHM+rifJdCmOEAitkh8jjjFybowbmh8M9
 /BkfyiGnbr+MBkZK60Cm/t5fcuMHxnea/yNrmTo5itWn9JD9WK6PBWKaJASAaw0LJ/JG
 soehhQzDJiTgZgrtbwxxGvSfkqmG2US8YOUdv8bTBv94MlMDY+ttdRrFyyyODXI6Jc3i
 XOXSQ0HRjUOZHf0HzFZXtf6pBDT5YS5QzvWqcGQBXqj2aFF69BTfnskgOd21uJc18QP/
 kPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rCLV7+XgVoqa77OFHC2tYmqnV175cwJKyP8wP05iwpI=;
 b=RetAaVTshMfd8DUt3gegGSnJ1yx7cbgvQGZ5W22QQkKvvMgepSe2gzVj+Kjud44se9
 Kf28ofLGCmlara/j14iOTFj7pEi3/7EYMMx+i5I1d0jDGKL43z7OaZuJY8R4G0JFuSGK
 5k01PRWf5XKccLaOCR4FWv3/uwbQsAxeC94kbcohkwFAf7WruK2NNJCVt70XnaeRbkVo
 IayyYYp9FhbglKGhmWG8+jUZSazShlVpBi68W3NczIlns3j5nnpAoC3+goSdSi8kqbXI
 kiYLjkzo4ebPlG3ndJSSMSsS9JecrvymAfUKptZvixl+hVNiafN0uQUjiqN+IAjR4R02
 fBYg==
X-Gm-Message-State: APjAAAXWnm05v7yKcqndC/OGEJ0eUVwRDOFrEY1HhykHaJ9J9zOjbcYC
 hJI9HDmrp4bzm2lNi51LiU6Icg==
X-Google-Smtp-Source: APXvYqyWLBlCaPGOONr/8VuVeNPBnAgDE597l7zfFJNDEyXa14Jyu2F+mFFV14v0+EMTQFwN3Z2iUA==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr56554103wrv.327.1564083789686; 
 Thu, 25 Jul 2019 12:43:09 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id
 y16sm103410662wrg.85.2019.07.25.12.43.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 25 Jul 2019 12:43:09 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org
Subject: [PATCH 3/4] MAINTAINERS: Add myself as maintainer of amlogic crypto
Date: Thu, 25 Jul 2019 19:42:55 +0000
Message-Id: <1564083776-20540-4-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_124311_143720_279C4AF5 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I will maintain the amlogic crypto driver.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93d6cae3274d..48e7fd110688 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1450,6 +1450,13 @@ F:	drivers/mmc/host/meson*
 F:	drivers/soc/amlogic/
 N:	meson
 
+ARM/Amlogic Meson SoC Crypto Drivers
+M:	Corentin Labbe <clabbe@baylibre.com>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+F:	drivers/crypto/amlogic/
+F:	Documentation/devicetree/bindings/crypto/amlogic*
+
 ARM/Amlogic Meson SoC Sound Drivers
 M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
