Return-Path: <SRS0=61z+=GV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A02FC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jan 2021 17:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532AD22CA0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Jan 2021 17:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532AD22CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f+jwzKzBdN2OXuH+n+G/tHckbXERRWfBhJJ7NO9niYM=; b=KIpjqkJpAA6iBqFTiRYXKU2Ox2
	2M1vMRtDjlno8TaEtdm/G1I8t3SfNjmPChBFpCX1XtyvvUkwoUCbfHWfXpx7S18EtP1K/MmEMtFVw
	tm16Rmb64UQR1jDRCHZ/+NKGgTwO4yS4voK4894phJ7j7s2tXVJ5ZpkuSZuzl6Zx3IOHwew/NmsQJ
	TynZPUh/DYt7+4pVTng576yxkN4OR4jmBlAYZ5jGywpsBHVWiOXmbgzj/X3eP3fSoJRz8lmxgZnNI
	q6ioVViuxvpkaS2flR9taOZJfg5qbyI3V0zMOoCcvXMj+jgDB+1cq5YI9dsxen2YAlrQsreB5wj+S
	7dRGDqTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1YUY-00034I-9a; Mon, 18 Jan 2021 17:39:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1YUV-00033v-7l
 for linux-amlogic@lists.infradead.org; Mon, 18 Jan 2021 17:39:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id 91so17271121wrj.7
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Jan 2021 09:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=9DsbzojBVFKuQ48xkTo4URNA+UO51ULaaDoVeAXSBBA=;
 b=P8YxMFky/mImBavbpo7nJwdUt/1ifWSE4KBf/sPnkT27LpA0jX50OVfzcgYE3urnZm
 /zIzAmTU+AffMrzt0s0DAw+P7SsU2INfZnLvfwmJLOd+Mh8CyyZdXTsXGoZnwuy72WGj
 cZXqT5I+WLIWRhIXvI6pXoAHV4BIk4byowE5X+6kRfSfrxkO5WYc9xwkQyeDKSJjrVvO
 60AicgS6UW0FTFUl5rmuHTtkW5iAY+MfSNHdfrsqgIzQa7UcxvPYqahyXujM0CfRceuX
 bECOxxao6O1vJZJaQOkXpEkHCG7Bo/m2+HidxOw1ZO+nvXEOsllmTf8zpi9D/O+vt2El
 PwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9DsbzojBVFKuQ48xkTo4URNA+UO51ULaaDoVeAXSBBA=;
 b=uErD1Uox/D1JwrCkmqU4dKqBZfrMKo+w2G3CzqCQLpUtW9ao8xT7UnqoIZjOE7A3ls
 esJXCSXnjHf920rpi/XeFopO4zs9gXrVk6iEuKwkJcsu2jxbOIlLo0eW6UKuplVaQ8KQ
 9s8jpcbwtzy1ExnFlBuBtXI2Ba3yxQhPWcM1tk0flUaewdyRyEDH7RR6TBKCr44qIQBp
 3cfeOY89R6qDlxlKSJ6Dv5ocH2uYY6dTqIjpWG0fe7pbC8Rot/Sjh/o6UpK1FM2cQ6nY
 Id5y5RmmEMiw5fZ+ZMsX5d/X7OWtfcAD2/JEOenrjJir3mkmtIdwJKXn2WocM/NBQcGf
 I6Ow==
X-Gm-Message-State: AOAM5328Iw6UQumLKP5S93vcCkR4qJxsuu4F/vq9AxwzwWmKSEp+PzER
 hCi82mHw8sUfmFsYpyIaqC/UyA==
X-Google-Smtp-Source: ABdhPJyq2aDkR1RLYe+jp7iO6xkLOP6P057ChtKd77qUmfHOQxOSPMkiPb9UzfN72DeGoGnHUzowUg==
X-Received: by 2002:a5d:4882:: with SMTP id g2mr541856wrq.273.1610991537677;
 Mon, 18 Jan 2021 09:38:57 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-148-144.adsl.proxad.net. [82.252.148.144])
 by smtp.gmail.com with ESMTPSA id o8sm30042848wrm.17.2021.01.18.09.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:38:56 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	rui.zhang@intel.com
Subject: [PATCH v2] thermal/core: Make cooling device state change private
Date: Mon, 18 Jan 2021 18:38:24 +0100
Message-Id: <20210118173824.9970-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_123859_292077_B4205F5A 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: "open list:PWM FAN DRIVER" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Kamil Debski <kamil@wypas.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "open list:KHADAS MCU MFD DRIVER" <linux-amlogic@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The change of the cooling device state should be used by the governor
or at least by the core code, not by the drivers themselves.

Remove the API usage and move the function declaration to the internal
headers.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pwm-fan.c          | 1 -
 drivers/thermal/khadas_mcu_fan.c | 1 -
 drivers/thermal/thermal_core.h   | 2 ++
 include/linux/thermal.h          | 3 ---
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..0b1159ceac9b 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -378,7 +378,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			return ret;
 		}
 		ctx->cdev = cdev;
-		thermal_cdev_update(cdev);
 	}
 
 	return 0;
diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
index 9eadd2d6413e..d35e5313bea4 100644
--- a/drivers/thermal/khadas_mcu_fan.c
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -100,7 +100,6 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
 		return ret;
 	}
 	ctx->cdev = cdev;
-	thermal_cdev_update(cdev);
 
 	return 0;
 }
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 90f9a80c8b23..86b8cef7310e 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -65,6 +65,8 @@ static inline bool cdev_is_power_actor(struct thermal_cooling_device *cdev)
 		cdev->ops->power2state;
 }
 
+void thermal_cdev_update(struct thermal_cooling_device *);
+
 /**
  * struct thermal_trip - representation of a point in temperature domain
  * @np: pointer to struct device_node that this trip point was created from
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 1e686404951b..6ac7bb1d2b1f 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -390,7 +390,6 @@ int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
 int thermal_zone_get_slope(struct thermal_zone_device *tz);
 int thermal_zone_get_offset(struct thermal_zone_device *tz);
 
-void thermal_cdev_update(struct thermal_cooling_device *);
 void thermal_notify_framework(struct thermal_zone_device *, int);
 int thermal_zone_device_enable(struct thermal_zone_device *tz);
 int thermal_zone_device_disable(struct thermal_zone_device *tz);
@@ -437,8 +436,6 @@ static inline int thermal_zone_get_offset(
 		struct thermal_zone_device *tz)
 { return -ENODEV; }
 
-static inline void thermal_cdev_update(struct thermal_cooling_device *cdev)
-{ }
 static inline void thermal_notify_framework(struct thermal_zone_device *tz,
 	int trip)
 { }
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
