Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D3EC48BC4
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=myD6qQgtUZH2ctuJ3BNmXY/kvwABByf4DUobsixGalc=; b=FS7ca50UvJ9O4H
	1WTZiSGooM4veBytv/lM1bWDZQYuZTwKQRf1N+Dz0gZUoG109mBc06C08U799Fin6y7gJpa/CN03V
	5pMhgNDvNnVvDInSYkOdCJXShQ89xLliVX20KJMW/evbs77alOna749H7QGZ0XJ5wNu/yoaygrKQ5
	rHqw4N80T+MalIpRNI9rAdnINcOLT0zJfQc/dyCczZQQr7vT9TBfCgk8N/4ASg9a8e3bxXrPyYy2G
	ncgFEq+fWlgdnOv41Jtw1eyr7FIEnNqKHceMRowO+2s0d/I0OpCOyEweLF1nrxhEiBQc6OxwuJ2Bz
	ahXo+jJsUySSwjH1MAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblAv-000000087Pf-1bvt;
	Sun, 18 Feb 2024 17:42:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblAr-000000087ON-1J22;
	Sun, 18 Feb 2024 17:41:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a3e8be8a7ddso30950566b.2;
        Sun, 18 Feb 2024 09:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708278116; x=1708882916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaCqvU53nYmBQryCKQsHvs+sWViqj1uVc9DsWMftjUA=;
        b=hg1A41r4126VPEykfLNp9gDOi6Z6PoSJJYv4m3wrbQClLLmySi/sjuFCb7OxkLP2TF
         CI1MaC1tvZoyP1X/Zf5yHd03VVCRzHOpY2CdnBe7Sc1c1mzcnJZqObDsXWyE2tj78M9Y
         W4LbQZ2oM0qK0CcucgZQOjsGeJJW0ynJpNrRvd0iZUKZbrPF9mPgII+Uk0epg/WgPspn
         bZUQHlJCnr0oc6NLV8cgf55cLs5O3op5asPnKzF86hUdEvF4d9RtiJLdTM0yUWGgYye8
         Zef6KX110I143x6BzQj8LO1XtgcdzG5rb87fWIH3hX8cwm6ZMXb7PgHNOAaYW933/ksh
         P3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708278116; x=1708882916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaCqvU53nYmBQryCKQsHvs+sWViqj1uVc9DsWMftjUA=;
        b=GNCyr53NfF3SI00nV7rSFuVHBAZUo44gibhvYTmmtwAV9BRqwtHP/8UpvgYFQZ1Dgc
         264tAIELDlbGOm03mjLJD84dyYMfKBcZBR/j3d9FLEmn3KC4+Vp3C3F6w+3DKn6N8k1Y
         a4WDFr/GWiDeY2K59vYGFEmZAxq2W29oXwx1ccVsYVWPpeXA1lX0QXuUeOpM3vPgjONj
         Li8QKI9j+K/u0DKlqRf2BhqAVsW6xQNoOlBjxclP5XqZRmSGoQ/6ro8S1UiFxu8c+X3n
         54r9dskz6gQ4EV3NVOb0p+aAjtGX/vnVzfXTtKxXWcvhEMHHV37Fn5IcwVY+I6KBk6QL
         G1mA==
X-Forwarded-Encrypted: i=1; AJvYcCUAx1K5Hbg39T965FmVt0bvP2tXkaxYlgpR0Mc0gdr7Kr5C8Zm14sbZQAHQp9Byuc2LDl56rbGXxYdnBL2yVmzDAN5PXnn/niU8dO29EFl8lbInZEe9tEEsp6M3anhm2BALiPbosG9FBVXjQkBuzTSskP/0HHVSOw==
X-Gm-Message-State: AOJu0YyF7TbKAmBx0iEu7T7Dep2S7gOzhveiEYzZ+3iiTT30SJglqaod
	qkdp8Wy7vDWYWYQsrQ+wyyw4cG4xmRTYlDwo1wydWzXewtmdbv/H
X-Google-Smtp-Source: AGHT+IFlYBT6ksVioBlVjlddbvg2wEd7d2F3dsvv5wNPPzTQReB+780t3HgaPw+jxSi5NdYGoqKG6Q==
X-Received: by 2002:a17:906:359a:b0:a3e:9353:d379 with SMTP id o26-20020a170906359a00b00a3e9353d379mr476736ejb.60.1708278115482;
        Sun, 18 Feb 2024 09:41:55 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id r16-20020a1709067fd000b00a3e88f99cf1sm412710ejs.149.2024.02.18.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 09:41:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andrea.merello@gmail.com,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/2] clocksource/drivers/arm_global_timer: Two small fixes
Date: Sun, 18 Feb 2024 18:41:36 +0100
Message-ID: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_094157_378667_F456ACCD 
X-CRM114-Status: GOOD (  10.83  )
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

This series consists of two small fixes:
1) incorrect max width (and therefore mask calculation) of the prescaler
   field in the Global Timer Control Register. The field is actually 8
   bit wide according to the Cortex-A9 MPCore Technical Reference Manual
   r3p0 [0]
2) non-function: a stray tab which is inconsistent with to the coding
   style in the driver

I don't have any ARM/STI hardware to verify the first fix. However, I
tested this on an Amlogic Meson8b board with Cortex-A5 which uses the
same Global Timer implementation as Cortex-A9 SoCs and the documentation
confirms the same register layout: [1]


[0] https://developer.arm.com/documentation/ddi0407/g/Global-timer--private-timers--and-watchdog-registers/Global-timer-registers/Global-Timer-Control-Register
[1] https://developer.arm.com/documentation/ddi0434/b/CIHJGFEA


Martin Blumenstingl (2):
  clocksource/drivers/arm_global_timer: Fix maximum prescaler value
  clocksource/drivers/arm_global_timer: Remove stray tab

 drivers/clocksource/arm_global_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
