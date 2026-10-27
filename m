Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63B060A261C
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ijhk6Isr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aXQEVoJA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hvif4RPe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EhPsagsNpPlU8+T+8hbAju9Yd1JjkOICMiuvvKyp2nU=; b=ijhk6Isr6E4ndID9fYn6B5EOO3
	UMz7P4Ibx3TPNL4Ma5dz7X1WQ1lP39yB2NH2C8EFKTaYYdvnAj9NKpBFbxBlIh+d9vY6TczScW7QI
	jwg5hGEzzJVJRCgUZCdkDslUUAHJRpVgIQ2pRNza4OqmPSJIhnjkWw8CoS6GNU2A4sCYvekfxmDha
	ZdSuir1RwhSxY6h9t75u4Im8xb98RWbfaTvWRlv8Uav3IhQaJkotwNO1sxIJDkpf7ges2PveM3Uro
	BDaIyVXYARXtvpp0WnsfS5EGfhbsL7+dxCyYxjIixRPUeNEaJa58uwy+Od0oGEFJdkldML9Jf+0VL
	+Ql9+aSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcw-00000004hJ4-0XqI;
	Tue, 27 Oct 2026 12:50:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcu-00000004hIj-2Ho3
	for linux-amlogic@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=; b=aXQEVoJABSuiP8IRkEPGqe53Ww
	dEaZ30lJKR822sSjzNEbB0gyftjbwwmSMN8qBLCN31Nntc76Xcm9bt8EIextPareaBlsOoGuCF0SR
	xO+IU7co3jdA4CacLQF2G7dVcCAqzlccyFcbSbJdOJWbN9XnR306aaZ/17h53eJzDTJRbrY/SkO3J
	HtQOpAAk0HyyaPVhz9YCv3KmWXiaQBRtNk25SeC8H1JpSow1v7M1iOjc4xRbOC8PUlBsO4Stpqz6c
	fjUHumhk/nHcKfRGwb8NE7fi/T1ia/3ODDLD3RJLkSsGwLjIXXWZFNR9U5MY2KOhGhgxTSxQpnAcj
	avj974TQ==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcr-0000000ExrX-06um
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:03 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3a75f960be4so27155191fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105398; x=1793710198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=;
        b=hvif4RPegCx7P/zDIJEPlZtbUs8LV1TntSv1jlic7RKMnOXg4Zgh69BVDnuGxN7MOO
         vgYbdD/YORR52OlFyxTyM4jJewsrTFRwVnYdSR/Z5lVlZ7AlfGTvkweyjpH7lf3suadf
         9YMO7uokMdkaKH7gUV7q46DFnwLFT9ykqJkwAUp3HjdCacuaePLSNls1YNkD6HABgdnR
         qdHwgRzTzOSUYmhTV6u+yRRj2Smf06t2q+mAoG8M4e1XHl9CRoFuWvQzoqcAeyxO30wM
         PuyyEOm8ZQZ5qZHWIXW8XUJ13xKPsrmgopp2e4sHWtUtBwKCJluBbaJ5sMajLf416zaY
         2UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105398; x=1793710198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=;
        b=D3UTq/Qnv2SAZatOsc0YSa3YrpWlW4FfIe5idFqGmp6eR5W8oDfkenj2sKmk6ys6Xl
         y6Oqbo3Lliud1dioFq9okzevsjQS1qU7GgnDdO/fhfrrX5P0CivGM0V7KKvGjbqT6sEB
         T1g9dzHp4Qg05FG7rSMGIHEKGYMFJ2lBBqp/Zv/Fm781wRwXiRcdjXWkWMnlZHQzfQAf
         mjuhZyt4FWR4eNJowF+RQgMS0aVfWjsbZi3an7nhS8yASJkA7mJe+1GCEOJYonLaxVqm
         Z0zsZLPHKOW0OG7g3iTsC3gmSDYlSkCFFA6zFLiYoKthrQFmGIANApZxu/nZqSwI/mIM
         lMaw==
X-Forwarded-Encrypted: i=1; AKwUvBxFHH1ZCvS3T4IrO24s3aucVwg0t9BDEpK84zvbvqbT4T6Ugd1JBSnCAjPqcs5t+39tVSs8MANYNtxjLdD/@lists.infradead.org
X-Gm-Message-State: AFq9FYLYo6QSUqkbIvlM8tbwxS7wNh/FGpssTb51Nx4UuIHQ+TWp8C+t
	2s6gW5sKxAQnr1wxXmOEAlb66K2U2iBOM9sikpwC9qPDuK3kZR7pXmTI
X-Gm-Gg: AYBFou1MHsFKgOK/DuHjagd00gurdb5j8xr9V1rxkQ64yM6qvqGOvFCOfzwQBqx7Nua
	/BOg3wosIVaA+jyuCTUfnblXdeEo8w+BrAhIJbEpaDylOOg+AxhVuwSFe5HWkQrDWPy1K9NIzpW
	Bwbd7Fa70MUFkazmtzBiROukLYIHOTI9kzNQbJDHKyNEioLsbv8bCzQoGpEj9xNlKEpdmU/G2U4
	7trY1Dz6ssvrX1BomHyJiuPwS9+e36Kb4L+EBVcHgUVr4/IpEAHH008CedODjos2P7irAYMtzRF
	RwyAJEPeAHbQG/jz9x74Lj9esV5gS3jPYHU6XZK1T9yR1M+UKRfoD8nomzdtR4M5JXkOPCJxMTP
	AIYqxGN3GzaHxpBU5genUrSHk3ltoGxcCkMkmT0vXzOS/o3r1l+4r11Zu8VAiOrlch4LxcTt43W
	70dL2VehWJGUQak5rsWRbi7rfJOR0L0I0+JXsbLMLFbOozcw6WYgXLzN1QSAYZT8UU3kxmKYGT6
	IYIp25ESEv4wYcNEuwuXV6CqRS+RxeUhJ8epxb0Ha6DaZGM4ur8Hf7diHCe9MG3TB4rg1IOghYl
	3hUO9wlxYl3+3UZSdS/TeCi/4yn0iSs1ikZ/JYjZAZpCjfsAPNexlqg4yk5uUdGHVO6gdAOiB9s
	yKrDB8C9gSg==
X-Received: by 2002:a05:651c:b27:b0:3a9:e428:d2f8 with SMTP id 38308e7fff4ca-3ac6fd68faamr25300931fa.29.1793105398128;
        Tue, 27 Oct 2026 05:49:58 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:49:57 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Tue, 27 Oct 2026 14:49:45 +0200
Message-ID: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125001_300810_E00046AE 
X-CRM114-Status: GOOD (  13.48  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jonathan asked for the qcom-spmi-adc5-gen3 fix to become the first
patch of a series that enables context analysis across IIO [1]. This
is that series.

With CONTEXT_ANALYSIS := y in every drivers/iio Makefile, testing gives
256 warnings and 2 errors in 126 files (x86_64 allmodconfig, clang
23.1).

Patch 1 fixes the two qcom errors, as v3 did, but names the lock the
way Bart suggested [2]. Patch 2 annotates the two conditional mode
claims in iio.h, which accounts for 241 of the warnings, in 120 files.
Patch 3 covers the core helpers behind them. Patches 4 to 8 annotate
lock helpers in kx022a, meson_saradc, the DMA buffer, opt3001 and
veml6031x00. None of them is a locking bug. Patch 9 enables the
analysis. The common and sensorhubs Makefiles only list subdirectories
and are left alone.

With the series applied all 726 files build without warnings, also
with W=1. bma180, ab8500-gpadc and intel_dc_ti_adc are not in
allmodconfig and were built on their own. gcc W=1 builds show no
warnings. Removing an unlock or a release is still reported, tried in
kx022a, ms5611 and veml6031x00.

Bart's thread-safety branch [3] has most of the same annotations. For
meson_saradc and the DMA buffer he uses __context_unsafe(). Here they
name the lock, so the helpers are checked, and for meson_saradc the
callers too.

Written with help from an LLM coding assistant.

v4: was a single qcom patch, now the first of nine
v3: https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/

[1] https://lore.kernel.org/linux-iio/20261025215954.73549810@jic23-hlaptop/
[2] https://lore.kernel.org/linux-iio/76bbebb4-7337-486d-8f21-a39bcb6dca93@acm.org/
[3] https://github.com/bvanassche/linux/tree/thread-safety

Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

Rupesh Majhi (9):
  iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
  iio: core: annotate the conditional mode claims
  iio: core: mark the mode lock helpers __context_unsafe
  iio: accel: kionix-kx022a: annotate the lock helpers
  iio: adc: meson_saradc: annotate the lock helpers
  iio: buffer-dma: annotate the queue lock helpers
  iio: light: opt3001: mark the interrupt handler __context_unsafe
  iio: light: veml6031x00: annotate the event enable helpers
  iio: enable context analysis for all drivers

 drivers/iio/Makefile                         | 2 ++
 drivers/iio/accel/Makefile                   | 2 ++
 drivers/iio/accel/kionix-kx022a.c            | 2 ++
 drivers/iio/adc/Makefile                     | 2 ++
 drivers/iio/adc/meson_saradc.c               | 2 ++
 drivers/iio/adc/qcom-spmi-adc5-gen3.c        | 4 ++--
 drivers/iio/addac/Makefile                   | 2 ++
 drivers/iio/afe/Makefile                     | 2 ++
 drivers/iio/amplifiers/Makefile              | 2 ++
 drivers/iio/buffer/Makefile                  | 2 ++
 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 drivers/iio/cdc/Makefile                     | 2 ++
 drivers/iio/chemical/Makefile                | 2 ++
 drivers/iio/common/cros_ec_sensors/Makefile  | 2 ++
 drivers/iio/common/hid-sensors/Makefile      | 2 ++
 drivers/iio/common/inv_sensors/Makefile      | 2 ++
 drivers/iio/common/ms_sensors/Makefile       | 2 ++
 drivers/iio/common/scmi_sensors/Makefile     | 3 +++
 drivers/iio/common/ssp_sensors/Makefile      | 2 ++
 drivers/iio/common/st_sensors/Makefile       | 2 ++
 drivers/iio/dac/Makefile                     | 2 ++
 drivers/iio/dummy/Makefile                   | 2 ++
 drivers/iio/filter/Makefile                  | 2 ++
 drivers/iio/flow/Makefile                    | 2 ++
 drivers/iio/frequency/Makefile               | 2 ++
 drivers/iio/gyro/Makefile                    | 2 ++
 drivers/iio/health/Makefile                  | 2 ++
 drivers/iio/humidity/Makefile                | 2 ++
 drivers/iio/imu/Makefile                     | 2 ++
 drivers/iio/imu/bmi160/Makefile              | 3 +++
 drivers/iio/imu/bmi270/Makefile              | 3 +++
 drivers/iio/imu/bmi323/Makefile              | 3 +++
 drivers/iio/imu/bno055/Makefile              | 2 ++
 drivers/iio/imu/inv_icm42600/Makefile        | 2 ++
 drivers/iio/imu/inv_icm42607/Makefile        | 2 ++
 drivers/iio/imu/inv_icm45600/Makefile        | 2 ++
 drivers/iio/imu/inv_mpu6050/Makefile         | 2 ++
 drivers/iio/imu/smi330/Makefile              | 3 +++
 drivers/iio/imu/st_lsm6dsx/Makefile          | 3 +++
 drivers/iio/imu/st_lsm9ds0/Makefile          | 3 +++
 drivers/iio/industrialio-core.c              | 2 ++
 drivers/iio/light/Makefile                   | 2 ++
 drivers/iio/light/opt3001.c                  | 1 +
 drivers/iio/light/veml6031x00.c              | 2 ++
 drivers/iio/magnetometer/Makefile            | 2 ++
 drivers/iio/multiplexer/Makefile             | 2 ++
 drivers/iio/orientation/Makefile             | 2 ++
 drivers/iio/position/Makefile                | 2 ++
 drivers/iio/potentiometer/Makefile           | 2 ++
 drivers/iio/potentiostat/Makefile            | 2 ++
 drivers/iio/pressure/Makefile                | 2 +-
 drivers/iio/proximity/Makefile               | 2 ++
 drivers/iio/resolver/Makefile                | 2 ++
 drivers/iio/sensorhubs/osf/Makefile          | 2 ++
 drivers/iio/temperature/Makefile             | 2 ++
 drivers/iio/test/Makefile                    | 2 ++
 drivers/iio/trigger/Makefile                 | 2 ++
 include/linux/iio/iio.h                      | 9 ++-------
 58 files changed, 121 insertions(+), 10 deletions(-)


base-commit: 7d80b4b383bc53b48abd3a30ca4a91cdab568bfa
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
