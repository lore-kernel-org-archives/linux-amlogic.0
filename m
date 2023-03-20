Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51873C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oiTLztsnVg2hUuWg8is8xwZ39ZokkoHij309gKZQeqw=; b=z/g70rJHfwdv6j
	WabbFU90CNwIyESHHJ+Hdn0oQsubxH6vuiZhMPwSOxrByQfZH/S8TsnSIn05NfO7OcPBT/mu12z0Z
	bHmkbduPQFvs3tK55DjHiMHEHFDOu75dnAWnhpI+EKBaW/lFkkyvwKswgN+9ziVa1jqestYy58Omz
	hwewy1mssdPPcdFURoZxeP/QAuamw0Z3Nu9cCWncC8dIT6kxV5WMRAzXMn6JCVfePHRa+sfTSs2qB
	IgyfbYdfaW5pJZWoMbGaZQy705cuz53X2twX9BVD+vDhs9kTg3l3QiuqZsPQ8ULoeQzM3qPLnKs+r
	kTLlhxazHUvXiamRWqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peMxJ-00AWVl-0o;
	Mon, 20 Mar 2023 21:22:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peMxG-00AWTv-0k;
	Mon, 20 Mar 2023 21:22:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id cn12so6608270edb.4;
        Mon, 20 Mar 2023 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679347321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKZyZ9UtP1ZZ748rC6wje4ZjvZJKdAV8kDbH4x8qqR8=;
        b=fOB38sbMMg7Xpl15jekHcEJ9v8TQ8siGqWnC9c3X7uj6+6zlhsGZjTasrkL8MsS8mC
         NRGmE3o6J9eIQBSoY/Gm/L5qD/B363AagucxmVfmmEUd4NG+LWtzX5lgzB0B5BaNCo6D
         RqxANucCnq42gDZoqhjJWauCKoNv4Te6+2Co4w9/vsVp2sD8kGip0qu4I93WUcc0vb8N
         cxda3Nf6t8vCHlinxft3VJmbJkthM8eynrqLX5zB44nYj4P8au3+4PHWVeiSVDP9WPqw
         mM6VEInnCGg/f0zR+rlARDJOkgIl/Uge9NZEZSPG53S+SeYuYn77fTekdIjEixoBYm/q
         r2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679347321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKZyZ9UtP1ZZ748rC6wje4ZjvZJKdAV8kDbH4x8qqR8=;
        b=DLzWC7Td/xFnIZ/SmWPssK+P1hpwRr+dxCNyuX5JiUFslb3FIEQZT76dhuoP26wlc8
         mJVdX1BOlMr9sIT65sytmwpSAu0LvUfG/uC1mi12pR/7RviQp/LfBQJ2sxMl82mSmAqF
         yw2hVIA8TPgunTuboMLgVDnOu10+24zXaxXsp5v3QvCUQAD3B012DEZGECW+EVnZNMdy
         15qVHSn4rsPihyEbI2Nd4b4c9oI0oMiVnYN/r003uPdkVKtlsHMYyRJsAld3AFaC4HLp
         g6Y/EOuaQLXz059t+0Xamdw1XusMpyvmLjZjW/foeEyvYdkv5efCluWDWfICTOj9P/5v
         NwSA==
X-Gm-Message-State: AO0yUKXVFOWNn/kxa/FDwBOcWTOyDYeVIfm4f4EEueXFVDNheefpMBtE
	UMReRa6NHKyy1XLBjsw35d4=
X-Google-Smtp-Source: AK7set8AX5IQmx37Co1yuIMYxkdQKuukCk7qo9qZ3nFRwvxpknx1JxVBWM/utdYOKjq3h+SSzncEOw==
X-Received: by 2002:a17:906:b845:b0:931:c6ba:8619 with SMTP id ga5-20020a170906b84500b00931c6ba8619mr495101ejb.72.1679347320677;
        Mon, 20 Mar 2023 14:22:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-73dd-8200-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:73dd:8200::e63])
        by smtp.googlemail.com with ESMTPSA id j30-20020a508a9e000000b004af5968cb3bsm5346622edj.17.2023.03.20.14.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 14:22:00 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-rtc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 RFC] rtc: meson-vrtc: Use ktime_get_real_ts64() to get the current time
Date: Mon, 20 Mar 2023 22:21:42 +0100
Message-Id: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_142210_286725_A1A93AF5 
X-CRM114-Status: GOOD (  16.86  )
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

The VRTC alarm register can be programmed with an amount of seconds
after which the SoC will be woken up by the VRTC timer again. We are
already converting the alarm time from meson_vrtc_set_alarm() to
"seconds since 1970". This means we also need to use "seconds since
1970" for the current time.

This fixes a problem where setting the alarm to one minute in the future
results in the firmware (which handles wakeup) to output (on the serial
console) that the system will be woken up in billions of seconds.
ktime_get_raw_ts64() returns the time since boot, not since 1970. Switch
to ktime_get_real_ts64() to fix the calculation of the alarm time and to
make the SoC wake up at the specified date/time. Also the firmware
(which manages suspend) now prints either 59 or 60 seconds until wakeup
(depending on how long it takes for the system to enter suspend).

Fixes: 6ef35398e827 ("rtc: Add Amlogic Virtual Wake RTC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/rtc/rtc-meson-vrtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 1463c8621561..648fa362ec44 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -23,7 +23,7 @@ static int meson_vrtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct timespec64 time;
 
 	dev_dbg(dev, "%s\n", __func__);
-	ktime_get_raw_ts64(&time);
+	ktime_get_real_ts64(&time);
 	rtc_time64_to_tm(time.tv_sec, tm);
 
 	return 0;
@@ -96,7 +96,7 @@ static int __maybe_unused meson_vrtc_suspend(struct device *dev)
 		long alarm_secs;
 		struct timespec64 time;
 
-		ktime_get_raw_ts64(&time);
+		ktime_get_real_ts64(&time);
 		local_time = time.tv_sec;
 
 		dev_dbg(dev, "alarm_time = %lus, local_time=%lus\n",
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
