Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1E0C433FF
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:13:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE9D2070B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzO3b0JI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OMghRo1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE9D2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShB6EhKfhWmTlQNdyNpdsBv1g4Q2KCXJYfVtjBZu/vo=; b=tzO3b0JI66IBO3
	kYrhcffFMehaBqkxa7mRyPYpwxaQKM9tGr6eJO67qXzdhgwqD8LRCDygHC7DzncBDPZ/YVCjPSF57
	bGEM5HGQDIsOA2h5Y/sgRweP2I4nafNm1R+O8P9xlt1c33xHzgE/BxCeJXcAGsjWNl3N91jUprkmW
	0DBXL8Pxzgp16jIflE6Z+duRjGuJHYCXXb4n8F/tsLs6RZypOYImRNpT3Wg8GEM2SPyMw9u3Zz5Wq
	khX3bRJZvUsxyqUgR36+dnX/Na2kO3QUrF3tTb4qICj/ztFx1C608lucBax+oMY9eEfQbHecXkOM1
	PLJmQ/kB6XlhHjVQISUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrLZU-0001ER-C5; Sat, 27 Jul 2019 12:13:08 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrLZR-0001DU-Vq; Sat, 27 Jul 2019 12:13:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id f9so56987525wre.12;
 Sat, 27 Jul 2019 05:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qILRtduAUfIHbRYJc2OqUYhBvVLfrX/ZR6fVK293Dg=;
 b=OMghRo1khsXGsH/E3U8li8QeP9nGMpoQ9pv8NdPqjMB11WNhVxf0zBgRIA5t+7cSE/
 CiL566CDiElHLOqEQkSY0JUFMUZbo+BL0oS/AAAqjq+hHV5tREnSs6Gs5rCv9g23JxQJ
 3n4dNgJ5IZrjjena3mYsGgu4L1ywaQAjFhaKaubM5KIZHt+SD4h+HtCgyNJhrlA4VlxI
 3hWTX3sFLoAsvdzLjlxs3CSjq71HDgET2c0K/RCjy3f2JKmzV1dYwWIIE5iPkxNzaWwy
 CZQiXrOyaL+p5v9lP4jPT7Cuz00G39ecfbKPyVh1O2sCsbrwelERx6vOC4WkqV1re5Ei
 C4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qILRtduAUfIHbRYJc2OqUYhBvVLfrX/ZR6fVK293Dg=;
 b=WFiCkcKr3HU1Fefgt1Xz9ne6G+t8AL66SweHymCakxd3NC4QlOfikLR6uAE0mhO2rF
 Rv+FL+Y5W6Q5emcmcMWuE6hHY7ObcnKqElz/F9BTvW7GahSyFbFn/PMASLWz75nCEqUz
 kbger7hNdF0Od9bh0vRTMxVV4Ddb0aj2ySpbE4kTDNLgJwrKfn0Mh2TwLxS76ydo9Eaj
 xWlQ0mi97+rjyUhSvHagujO6S6uIJ6SUkpdhbX0Ca5YB1t0tm+vsLfspXjYyrU8ijqjr
 OOLlxJJ3rUptVceEYNP5jtygv7p68Qry3ttXaF47w95tkI+ldvxstizH3/PVRITB86OD
 Fb5Q==
X-Gm-Message-State: APjAAAXtmbwyAyb0JmYd7R2nKVpmlZgDAzGqzukm9axU41pBVsuVTr4A
 0NIwXn1Jf1A2OdFYQD5vGwillNqp
X-Google-Smtp-Source: APXvYqwNsLsnl3W1cQVmOuElc6fGGraRV+A5W8UDKBaaQI954FwVDQ69i9eU6haQms0rDvfSR4mkLg==
X-Received: by 2002:adf:9ece:: with SMTP id b14mr59108580wrf.192.1564229584036; 
 Sat, 27 Jul 2019 05:13:04 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id
 o26sm111786569wro.53.2019.07.27.05.13.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 05:13:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 1/4] ARM: dts: meson8b: add the PWM_D output pin
Date: Sat, 27 Jul 2019 14:12:54 +0200
Message-Id: <20190727121257.18017-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
References: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_051306_023452_4D34B441 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PWM_D output is used for the VDDEE PWM regulator which supplies for
example the Mali GPU on the EC-100 and Odroid-C1 boards. Add the output
pin the VDDEE regulators can be added.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fba2c70c2fda..30fca9bb4bbe 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -361,6 +361,14 @@
 			};
 		};
 
+		pwm_d_pins: pwm-d {
+			mux {
+				groups = "pwm_d";
+				function = "pwm_d";
+				bias-disable;
+			};
+		};
+
 		uart_b0_pins: uart-b0 {
 			mux {
 				groups = "uart_tx_b0",
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
