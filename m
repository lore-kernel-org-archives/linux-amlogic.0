Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F68CCFA18
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tV31yX0+ArA0BN8NqUklyPyhpNSHk6zm1X94KbZVnfc=; b=QUmGYF+eqQwmp5
	5h8/9c/I3fMGaJZ9huw1Iw98+OgKuqQB4I3t1uftS+DaCfflfB72MiERfgSvnKu3VIECWV7NCGvFV
	FDThQnC656U5mwnmxFtq2R4wXun23T2I3BQnjbp1Q2yoEA5RM/M2zl9M9dNZTnJYEjLtW8EZd0PX2
	wFoNvnBAIQGZ82kXoC4TElk1XecATJSZW7Y+R0tEHgSSb46fsroabUgkVHcFrpOd5FnCyt0QC2/0o
	BTwXW7R9nu7HRDBk3Xkpt1wcLE+l8ushz7HQKaNsFVq2vNKzfIm37cLawjOZf5W+WccnxyFp5o2ol
	iX0hh/+HwB8ZsukxMyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7U-00000003YRg-2Rw3;
	Sat, 08 Nov 2025 23:13:20 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7R-00000003YQT-0tep
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:19 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640f627d01dso3381272a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643595; x=1763248395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibTL9LFMoaISY8GQE81Db1c/RUt2bsWCzKF7aX8X54Q=;
        b=fuE/rkyJvoiP/S4xoQSKYMKaj5xYtEwgoRp6TLU2ZRE+cu7Tp1FbxRq6ck0nnXNs0u
         dpHWuzBuzwa3Md54l6HD9Y0RjCH2kFWVS1gTW42Yopk24Ej/dANDusZNfXzYH1HsxgcQ
         k4uc4L/Hx+ce+56gYjE8WDyGOyC4b+sMBQxTnMFd2apmfA3XtqycwtPZlCYjnDqEKwMH
         iyH/K2A9OWnnZ3z7cmpiPKuTIKgCUTmoGhfCpDFwuttoWpL/5qw2G/F6qZT5C7IaemJn
         r1Tw33FIAYgoKivqCFrox9Jp7SCdLq0yVbtUvaxNyci3FO/vIyCfAPSlFGWpt3SPHagl
         nc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643595; x=1763248395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibTL9LFMoaISY8GQE81Db1c/RUt2bsWCzKF7aX8X54Q=;
        b=ECe1fW6HPfK8DASHnNNliXpqr2zuNQWaKu9hYCnaAVLu3Uim9CBIFtkP8NCKZvpTeR
         U3Kb2tXqeD/fNKJoKxacpMxZg3c40Ck3ywJDxvoi32KIEDoGmaPO2htzzcR7NuT7kgHW
         17DW5ApFU1cO3nuJxD/dT/bjlAeP8ITjdtjxSYmYZpaB+KXYWzNlz9WW+4/MYU2iNrAI
         HLP6bKKmkiIuP3r5xrX9B8/qDNT+SMp5ZMW92Py1huv/ro/dnATT73hhAzmQ+6FdvF3Q
         Mw428YNlz+Dkv1P++jxolYbaQ8KdFnpFXRTFNpqdxLwkHud2VHGejlcaxntDuLLUy0Zy
         k/GQ==
X-Gm-Message-State: AOJu0Yx80KH5lgzI4cHn/0X5mLF7LFASBxIiEIEAOEkISjbm9sfAtwQX
	4IwRtHOS+vcbPLkFZi1i2ufeKhZfTbS7aJEz87keaMzyjB8bXdkhmIBgFUW5/w==
X-Gm-Gg: ASbGncsprS5sTKJaPP4W3rv07oA7lhzLQZcObwZrIKToOfJ9oOO7hWYNTl8D5yZ/xol
	ntn5tLqskXFhOCe7kJBY3F/7izt9iY9uo/BFuxlTnIPJHoK+NQ/9z8O/2GcXFIo35C62B+6ctVS
	7IS2GjZ7B7rFHyMzegaKMIu09f7BOj7xGnkSdT1WA38HMoi37mL4JhKMhs3/MT9RsvLRJzURi3k
	vB4IJAEBh6aZxoq3SpoQ7A0m6Rdj/l9pDOaQK+XpEtPn2J3XfRP9EDBP9IuQzSWs5JcpuI+ckW5
	ceOMUXIMJQoFDnZxHw6X8DKI9AQJiDjwVTG8boIJNJatnkxUUA/zJGq/fbAhJACDlql7ZsSj2kD
	aYrDYQ24m7R/8KvjVIOY8Ef6jiz7yhO/MW0ghrtAxihPcx3pqbowzJxDZ7uG23UvHFNcah8WPOM
	DB4+/pw5x7jrrF7f7vB5PsqpUuTnjUjUE9bPZGxLUwQP8J1sFQdnP2rBD6hBOTnxr9Bm+lUzaYd
	Mars518tF3ThHya5VZG7LFriovT5WBhVMcYacXJNek=
X-Google-Smtp-Source: AGHT+IHojjSOYkU74h70pOz5Juc0qTwy5Qm9aBj39UgCLbnQKLDh8bnfGClMfrPjx5Lm9oFsJdZQ9g==
X-Received: by 2002:a05:6402:40d1:b0:640:bc0b:887d with SMTP id 4fb4d7f45d1cf-6415dc03146mr2946757a12.2.1762643594925;
        Sat, 08 Nov 2025 15:13:14 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/7] mmc: meson-mx-sdio: Various driver improvements
Date: Sun,  9 Nov 2025 00:12:46 +0100
Message-ID: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151317_683838_5860C155 
X-CRM114-Status: UNSURE (   9.20  )
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

This series contains patches to improve / simplify the code of the
meson-mx-sdio driver by:
- using regmap for simplifying register access (patch 1)
- switching to modern clock functions/helpers (patches 2, 3) and
  make the clock code not interfere when switching to
  devm_mmc_alloc_host() (patch 3)
- making use of the devm_mmc_alloc_host (patch 4)
- using modern dev_err_probe() for better error handling (patch 5)
- indentation fix (patch 6)
- ignoring disabled mmc-slot device-tree nodes to allow describing
  all slots in device-tree, even though the driver only uses the
  first enabled slot (patch 7)


Binbin Zhou (1):
  mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper

Martin Blumenstingl (6):
  mmc: meson-mx-sdio: Switch to regmap for register access
  mmc: meson-mx-sdio: Use devm_clk_get_enabled()
  mmc: meson-mx-sdio: Refactor internal clock initialization
  mmc: meson-mx-sdio: Use dev_err_probe() where appropriate
  mmc: meson-mx-sdio: Fix indentation in meson_mx_mmc_irq_thread()
  mmc: meson-mx-sdio: Ignore disabled "mmc-slot" child-nodes

 drivers/mmc/host/Kconfig         |   1 +
 drivers/mmc/host/meson-mx-sdio.c | 339 +++++++++++++++----------------
 2 files changed, 170 insertions(+), 170 deletions(-)

-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
