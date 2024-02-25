Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F58C47DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Feb 2024 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybpOE+xwS1GavD3Rfwqt8BQzPOjkn8REXJcwD0hXDKc=; b=Ym5lAfjAqzeVMw
	/JvLqf22ywmG8ngC/6xjduMM5Hos/WJzbNkQoiljmjoasXu/esErF6j8P5Xh3na5TjMxJ97www+XQ
	s3kcWNMVh4H844WPk+8BOiC0hROTbtTxGwr0ZT0xhWbgANdPeBQjN7uoOUk0fTOQYFP0iwrj7VV/2
	i45oDJ5xZNtGHzj8paNvXPX/9Wxxldqi/MFkZRFut+Wrv7HDM7MqCg82BnDr74DFESwgGN9lrnw1N
	Db20TRHk+cGIGyOAb5sQKrM+OtOqPHqHRwf6bYMxl/MXjkvcUU+zRD4tuMnjkkqeYa3eC7GlrK3FJ
	xCR/vRUqmWaKpVLfbEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCZ-0000000F9As-2ygk;
	Sun, 25 Feb 2024 15:14:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCV-0000000F97L-0bZA;
	Sun, 25 Feb 2024 15:14:00 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so2158784a12.0;
        Sun, 25 Feb 2024 07:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708874033; x=1709478833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVg8Vc6dakvWYwVma+prJnPaDG1VK36u81Rqo7/s+Y4=;
        b=DuvKNXfFQPNlD85sK+t4D05axJk8jXVAwaUE5s5xDCH9b7L3dfaojXQ3/wa/PUiJHz
         /WejhyoB8eJNsDjvX2DGNSnqLPQuaOCLeryvoctFGbUjPtzQNU5iRCpegMVxonwbJu3P
         84+uiRfaZpUAg8N+zN5mLnf/ZHqCiDKv6ZLmUG4AOyY1j+w2cz/9zWrPyFZP2hid57hg
         cehh5Vlxt1SYgrpbbQYHcFP+qPV1YqORkMXVUvWrBkCEVm1lAZamoCbkS9O7K/IH5+S/
         JhW4gwTSmd5XBNyyC8EQOTFH77UhtZs0ul5aAzt5WiEkNVtJ5H4clxM+ioMpTtrsr9R4
         jYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708874033; x=1709478833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVg8Vc6dakvWYwVma+prJnPaDG1VK36u81Rqo7/s+Y4=;
        b=kltckbS9tGEzuyf5v/hVvN3CeEufNAvwdqeH6H2KZM0JhGwnGcNrMpaqPqz1iZI9X5
         HH5xEzFtszefexwjNXSBelH3U9/YJvvG0v/T/eRpE3JES+U7uc9G8aMafqtPS+J5xzBF
         CaKDLWJIplzmzMDWwrXwQTc1fSP8OUPmOFJM5k3lceuE8BM7lB81pWLIB2CuRus06prd
         7sUmEaHeKaErH7j7bh5kW4J4Bfgw/89PjFwgETnB5Ifk4h0FTcsTwQWGA41W2XsveH3y
         Kg6Bu78TXXQzJfyxgcwf+3Wj9If4we7n/bPI0E0K+Rbryjduxkl97Ac0XeKl7oU5PAH3
         wE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHINmUmCh70KeQNnyl0Q8IUEpcYBbFYPRfXPoi9JX4je05+yC9mbLNRejmxON6A2GTK94krIj7QxVX+bVAe9bLFSecdceWWQkKURYdr010NPg=
X-Gm-Message-State: AOJu0Yztf1DA13cEen5dUTi7dwJKzmKx2diXbSC4cgdO+LwQAyNfngA2
	SWBIZbBmOdR+huNVRr0PnKcTyCn+DEVsuvz7/OuaHa08osGcF6Nn5C0+Zjsz
X-Google-Smtp-Source: AGHT+IGCQo1yS8w8bgkVLKkBxnJVTPr3dCB3UxKhw9znfmTVz8F0ktG+O+xtCQOlZnIFn6o8EhslAw==
X-Received: by 2002:a05:6402:7c5:b0:565:92b:ae77 with SMTP id u5-20020a05640207c500b00565092bae77mr3271019edy.12.1708874032625;
        Sun, 25 Feb 2024 07:13:52 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-94e3-d600-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:94e3:d600::e63])
        by smtp.googlemail.com with ESMTPSA id f5-20020a50d545000000b005651ae4ac91sm1588450edj.41.2024.02.25.07.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 07:13:52 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/3] clocksource/drivers/arm_global_timer: Three improvements
Date: Sun, 25 Feb 2024 16:13:33 +0100
Message-ID: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_071359_236602_A663C2AC 
X-CRM114-Status: UNSURE (   9.70  )
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

These are three improvements / fixes for the arm_global_timer driver.

Changes from v2 at [1]:
- add patches 1 and 2 (which is why this is now a series instead of a
  single patch) as in the code review process more issues have been
  spotted that need fixing
- remove "psv < 0" check from patch 3 (as this check is now impossible
  as patch 2 makes the variable in question an unsigned long with a
  check for zero and returning before decrementing psv).

Changes from v1 at [0]:
- use FIELD_FIT() to check whether psv overflows the register
- update the description accordingly


[0] https://lore.kernel.org/lkml/20240221214348.2299636-1-martin.blumenstingl@googlemail.com/
[1] https://lore.kernel.org/lkml/20240224213529.2601333-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (3):
  clocksource/drivers/arm_global_timer: Make gt_target_rate unsigned
    long
  clocksource/drivers/arm_global_timer: Guard against division by zero
  clocksource/drivers/arm_global_timer: Simplify prescaler register
    access

 drivers/clocksource/arm_global_timer.c | 31 ++++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
