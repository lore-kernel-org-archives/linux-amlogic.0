Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C306AC636CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzHANfOkLTTsFbJtPEaglXqfMAxwmhskWgiWrHv2Sdw=; b=c7WRU+MZL6HByP
	UrXQf5RA9dSeYrq8BBJJeqT1+/Ic8Jk8bjalLIqUd8Q2EyI4fxjcX4xN3Tlw+9mmxYEPEEnHAzTCQ
	Qet2m6+ZK+Qs5vKg9aWti03Th0HWTsdx7fpndhBArAWQxJicyqM+llrjRw3t604UvCONasPvOOb5x
	5X6nnKdpiaVmAq8OJJnJj2ZrI1ibFEXbL3KrpdSGese/Cl4hhAHI5GmwndvDfFIXWel9RecbbTEz4
	hO4XMAOEivppkP3F+jUkssAhjAAFxktLS6d38RK00MNYh/qGLKelDZbI4wTwxRd6HhnQ9KkjRdxvh
	6HUfXLFM9WWc5Gxe2LFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOAW-0075Oj-Ct; Wed, 15 Feb 2023 20:14:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOAL-0075LN-7s; Wed, 15 Feb 2023 20:14:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso2497369wms.5;
        Wed, 15 Feb 2023 12:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=siyoi7tU1TEBf7AYDT4w7kUxYaQu0QMTjP5CxbvyWqE=;
        b=CJLkviqFRgeoVuDuTiLnXH5xRKQExPdNkt1xBaPfByUFpxZRlY/kgN5E5C4jxKqNvV
         lR3p+tiLM1ho7YRWjiJ52LhoQOCLj54zw4HpOO3J7mDxFZJb1xzZHm00guMMvP9VOVfl
         Id452drWf/XPhv7mgc5PfK8o3SzlvCYhBfqe3lKLT+Xgak44UQSMQ7si8FQqJ4M05R9U
         DYSHYQzd/cPHxHGc4tPEOCrjtJM0Nw0iFw7MgYmnpzZa6DFg9vmFL1Pz+iGDpQz+dX3T
         Heev7X/Dkv90/yv/uN6aZec+4dFyfUQJ8X48EM9gmTjUyifUb6O175rOP9pFKOhI0wdJ
         4pSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=siyoi7tU1TEBf7AYDT4w7kUxYaQu0QMTjP5CxbvyWqE=;
        b=gIud11BRqSJ/8tvM6RdnpGcAHUS3IaXfivdVjlKg7dbMPqQ6C0Xe5LlR/ZmgJk3ib9
         Z7R0x72GncMKhNHQ5aJULewcjdSFRbXeKOPykgU+TbtCRy7vN4HyhzU7Sz66zrhqp+ZP
         LQMJ5+Km+berP3NRz7rZGTqFZsPERmH8ADglWwsigQbYZN+iMI+j/SlNKxXj/VNido8e
         belvzYrEnBCrFNNSNWuqSgbASR1Q0nCsW7lcZwlx8kgjWBkXeMc2+a3Jgpl460Y8ezZ7
         tHzXwqcLXc1iHIzIK+J1IObZ/l5JpK7Bc8tgGSoLn74RPuVHYm7xj3d4VEbeMmRB4L7Q
         hCng==
X-Gm-Message-State: AO0yUKVykNxY56jNlG+dsrb35y1fgtGgdZSfpzmkRtd14aA6Srf+md8I
	Juz4xY+kbJMhFuTTTFyHzA8Ompjm9so=
X-Google-Smtp-Source: AK7set+UKuZeKxGuRmLzI8d3TbmzZ3f4l+W8PzPkj5Fd8UVTrvg/F7EoydLauGzXbji1xI30KPbGvg==
X-Received: by 2002:a05:600c:44c4:b0:3dc:eaef:c1bb with SMTP id f4-20020a05600c44c400b003dceaefc1bbmr3077358wmo.35.1676492046934;
        Wed, 15 Feb 2023 12:14:06 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9d5:9700:ccee:9a0d:2992:c73? (dynamic-2a01-0c23-b9d5-9700-ccee-9a0d-2992-0c73.c23.pool.telefonica.de. [2a01:c23:b9d5:9700:ccee:9a0d:2992:c73])
        by smtp.googlemail.com with ESMTPSA id ay1-20020a05600c1e0100b003e1fee8baacsm2994527wmb.25.2023.02.15.12.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:14:06 -0800 (PST)
Message-ID: <2553f3bc-b1e6-4af2-fb6c-def486dd99a3@gmail.com>
Date: Wed, 15 Feb 2023 21:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 1/2] mmc: core: add helpers mmc_regulator_set_ocr_vmmc_up/off
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
References: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
In-Reply-To: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_121409_330308_17445633 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

A lot of drivers use this code, therefore let's factor it out to
helpers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/mmc/host.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 812e6b583..f93fb8c7d 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -597,6 +597,23 @@ static inline int mmc_regulator_set_vqmmc(struct mmc_host *mmc,
 }
 #endif
 
+static inline int mmc_regulator_set_ocr_vmmc_up(struct mmc_host *mmc,
+						struct mmc_ios *ios)
+{
+	if (IS_ERR(mmc->supply.vmmc))
+		return 0;
+
+	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
+}
+
+static inline int mmc_regulator_set_ocr_vmmc_off(struct mmc_host *mmc)
+{
+	if (IS_ERR(mmc->supply.vmmc))
+		return 0;
+
+	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
+}
+
 int mmc_regulator_get_supply(struct mmc_host *mmc);
 
 static inline int mmc_card_is_removable(struct mmc_host *host)
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
