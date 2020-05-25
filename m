Return-Path: <SRS0=ry3l=7H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5EEC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 14:30:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C9EE206D5
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2020 14:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZANfN5Bo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOeyv6u9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C9EE206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=osabT8aFn4RqR54lPpjFOiX3FJ/E9AZ8nmNkTftRsAQ=; b=ZAN
	fN5BowOTgRW+xWoylUZk1NvkG/PIp3hzclbrxMP3I3VlLK9YNCI0F7LETIJuzX2nbS4kOYw+fESG6
	I65aaRdqm/d2li7qHpgonWHnutlTGnconO2c9P6zWf7E/tAXEOT7RzrNl+kzVKvFViKLN0sazGIPL
	BQ+POn4MEEngKcHXA+/UuOAdBv3I/pNJF2CKFC7q1pa7AFLlrKE7p3INd5AkO5xFyvCZfxoGRQKak
	fq0In7PM1lYwfkBa4rD75kxOzwiCdu8EnxfIepoOX7740Ben7Sgo8iBCPByJiDy+qjJy6FpJDkFlB
	AOEUqPrcEyFsqr5xv/RaiEGzvb+4uDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdE7Q-0005DF-Iq; Mon, 25 May 2020 14:30:20 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdE7C-0002st-T5; Mon, 25 May 2020 14:30:08 +0000
Received: by mail-ej1-x642.google.com with SMTP id x1so20649003ejd.8;
 Mon, 25 May 2020 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yMh1OLCPJYxMT3dRwDh/Pc1pXHaCVXG/hZf91AhdVB4=;
 b=BOeyv6u90esY242TIOVf8kZuHxZc7IiQ4MFI+Zqvwnzes9+xpAj9hLrHuSa2uyOBDF
 Or68NuUhIgoEg6nrhjh+IEbnG9Whd1p5tJqEWeNdAT0ST3Osy+qsjbWYmUd9upYS+BdI
 2qgI30mwbvOogfXDlMdztExw+nMndzWJd43DYd3kfgXSNP3MnD7GjZ0Xy8FkjRu7QqWk
 VUSXBMCyKF/d2KTbv5eA+/8WowJnlaEfolsh1wtKblHmFhkOjXyGM9Yf7P7h8hbeuACF
 hyKMECLKRaGsrNpU3R2oAklEG3KJhKdUdgKPm1XyKHn81exBNgBWveq1bY0yPJAdBZfJ
 PuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yMh1OLCPJYxMT3dRwDh/Pc1pXHaCVXG/hZf91AhdVB4=;
 b=pm+Ikicefb+HKc7jmOpYgWNL0xebyRVu8/qHrHFf+D1Hg7jsEyD+/L/eJ52x7E7Eo6
 ibbGwiJNT5M16Wr1UleU7lB14YUPhNNRf9+i8VY9bbNhQWei0CBQALjQC1InD58EJ5Da
 WC6Xzwpf0mRUl03nr5JNU7OzGmuaxxRK5oW0hwUmZ0wOrNXWDxxrIGFWS4HWLajW8257
 TOEJK+FYF3sOaSAUfPOU+G9xCKkd7piCMePaSDuN6LCs3FtwXA0tHMTZH+ufcY0VKNnU
 erbwKjjjyLXDt30wNq9O5FCItjW0+OHhp6irX0FL6P517e23EdL7vczVzLRfxurzl2mO
 G5iQ==
X-Gm-Message-State: AOAM531G9CXqhIxQX2njnAVrobSBlhovqWKPOW30uKvn42SfoXX9lefv
 bNLYEjvPPIlcTZOHF5DFZPQ=
X-Google-Smtp-Source: ABdhPJwpDfwq3VxDQ5PqHUh5/tPRWT5lYSDfIlEbnN3rH0SxoiirUlcrfg9jhMOb+eHRznUbsJQX/A==
X-Received: by 2002:a17:906:c7cc:: with SMTP id
 dc12mr19635108ejb.263.1590417002325; 
 Mon, 25 May 2020 07:30:02 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dfa:6900:4b6:3b49:50f6:6c03])
 by smtp.gmail.com with ESMTPSA id f10sm16642978edt.69.2020.05.25.07.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:30:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH SECOND RESEND] MAINTAINERS: adjust entries to moving CEC
 platform drivers
Date: Mon, 25 May 2020 16:29:46 +0200
Message-Id: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_073006_968419_C7EB28DD 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
directory") moved various files into a new directory structure, but did
not adjust the entries in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/platform/s5p-cec/
  warning: no file matches F: drivers/media/platform/tegra-cec/
  warning: no file matches F: drivers/media/platform/cec-gpio/
  warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
  warning: no file matches F: drivers/media/platform/meson/ao-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
  warning: no file matches F: drivers/media/platform/sti/cec/

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC platform driver moves.
 
applies cleanly on next-20200417, next-20200505 and still on next-20200525
for this second resend.

v1 send here:
https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/

v1 first resend here:
https://lore.kernel.org/lkml/20200506050744.4779-1-lukas.bulwahn@gmail.com/

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a442b48f24b..bf5cb149101b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2403,7 +2403,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
@@ -2548,7 +2548,7 @@ L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314@gmail.com>
@@ -3969,7 +3969,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd@arndb.de>
@@ -11146,8 +11146,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
@@ -15212,8 +15211,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti@gmail.com>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook@chromium.org>
@@ -16249,7 +16247,7 @@ STI CEC DRIVER
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/stih-cec.txt
-F:	drivers/media/platform/sti/cec/
+F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
