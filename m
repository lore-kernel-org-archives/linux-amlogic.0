Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABE6C4706C
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Jan 2024 22:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QG+5cgDWHtxXtcg+Ccyz1MLS9Hf1FcMQFo7G2g+fMB4=; b=0Jx4BcSZEHTqt2
	dTpX3fPV1uOGkMGHLSJyKCJ5P7af9P7IiSp+KZCUlfxzCsUKbgzqtu8AN6Mlbabw/GRk/FzbuDoTS
	WTyVYkAw2/VjIEdShs89br5hV/+fjykUrLf1Lde+3cG4B4be8tU3t9YB5OKaOSDXrI1JUTj6axh15
	iYiiiK2TO5lQwUiI9NiW7C3/kKHQ78h5k3YJ2CcXEkm2anw3hM9I+47dxM9oOdK96OjwOE/vE350L
	feH31YLrbGe5DE3wZzILFxNeabqFJzp1rAt9veC/fXWUnn++2nQrZnm4vSXzO+pXbl/gFOvgYQ1Dg
	uQMkaYv6BaM9NiDMPV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOmmN-005qsg-00;
	Sat, 13 Jan 2024 22:47:03 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOmmL-005qrg-0Q
	for linux-amlogic@lists.infradead.org;
	Sat, 13 Jan 2024 22:47:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso7915233a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 13 Jan 2024 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1705186017; x=1705790817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAv5l0VtvnO1pRB8FcDO9H9jLbmc1LXe0iJC5gP0mFM=;
        b=e8cjl+I0Qe63vLhfyPOEopMv4KBOslBB0jDXaBxYFScsS4MebPKM8SWwMcjTNlt61q
         ot2UDcE3n3Ca9WcpN3uczKJSs1e225Dl5EEgFRY0w21BIZJAlTOfODp9fD8fAzLecYh3
         cZC3u2NDuQpBTzEe+Wj+c7SomB7ec85ukBQ/1DK8l2r0EuvUdw9Qq1SJzqaHTwaNEGOi
         rSB8K1aMkjMMKRzjEB4mXiNMohTDIv3ad6FdMIae35V3Ed01o1ByWc0dPri0IlvzB4pB
         QF4hm1hvc+NyKjpMtVxf/iM4d4AL9iUFmMGOnEpwk6/DUAa8NL/ATMrkDzDgjfpYDyt4
         kD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705186017; x=1705790817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAv5l0VtvnO1pRB8FcDO9H9jLbmc1LXe0iJC5gP0mFM=;
        b=u9+OgxpP4zAsdNId2MHGzkdFt2qJqHyGlqbqvT6g9Zcbx6W/MzUzi+e8+GxOTiQN5l
         1euqY4jWAph0CknIIOubrYJU2Gl1SyaB5Vfk2xTILqZulRNqkm7VjmNPfIx0egen2ot6
         hhWwCyFhUu6HkBs1sCIgrv01dRTM+llfLaKPPMDIWwFcsiIb5yTRcgl3Aunrrj6ZUBNJ
         0XFbknpXUiFVMc0yLNS5unjWlCnti/w5IXoWb0R6g6k7kV/HJQQGVGhvT3lQM8jqUFxh
         yAQ6kkqhBNh31vE2vapgJ5saP1mxyLEim3YiruI4qce9UQY+teNnmzudfsT0VaTu2aPl
         +/NA==
X-Gm-Message-State: AOJu0YwQkUNGddyeHsGA7+ZWCynBxOUOrSB9UfE+AZGsEO8hL/m1XQLU
	qLVfPb0XkuW+ncz+/FNsv8o=
X-Google-Smtp-Source: AGHT+IFg0Jc9rGZcwGGkPbHFtCvCtdIraNk6iU99Ny4eASgGfZGCe+646zfhY31ak/W99X7fBqqqPA==
X-Received: by 2002:a17:906:7c59:b0:a29:f55d:e1a6 with SMTP id g25-20020a1709067c5900b00a29f55de1a6mr1593516ejp.105.1705186016494;
        Sat, 13 Jan 2024 14:46:56 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-6fe7-c700-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:6fe7:c700::e63])
        by smtp.googlemail.com with ESMTPSA id g18-20020a170906595200b00a2d4e658132sm755409ejr.42.2024.01.13.14.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 14:46:56 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v2 0/3] regulator: pwm-regulator: Fixes for disabled PWMs at boot
Date: Sat, 13 Jan 2024 23:46:25 +0100
Message-ID: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_144701_169337_A7FD75E4 
X-CRM114-Status: UNSURE (   9.59  )
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

This is the second version of an attempt to fix booting mainline Linux
on Meson8b Odroid-C1.
This series is an update to an RFC patch that I sent some time ago [0]
and incorporates a lot of the feedback from that v1.

The main changes since v1 [0] are:
- new patch checking the voltage limits in pwm_regulator_get_voltage()
- updated calculation for disabled regulators in+
  pwm_regulator_get_voltage() utilizing above limit checking
- new pwm_regulator_init_boot_on() to preserve the output voltage when
  pwm_regulator_enable() later enables the PWM output without and
  preceding pwm_regulator_set_voltage().


[0] https://lore.kernel.org/linux-pwm/20231221211222.1380658-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (3):
  regulator: pwm-regulator: Add validity checks in continuous
    .get_voltage
  regulator: pwm-regulator: Calculate the output voltage for disabled
    PWMs
  regulator: pwm-regulator: Manage boot-on with disabled PWM channels

 drivers/regulator/pwm-regulator.c | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
