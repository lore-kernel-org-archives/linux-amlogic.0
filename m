Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78663C31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:46:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FEFC206C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uw/+CHVT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lT00zEWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FEFC206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW7AEhkeNxQuxDk/vY4N3wmLwGorzh4gZ3xp19Q6r+M=; b=Uw/+CHVT22gsHX
	rTpJ+M6Iyipiyk8/RmJYiFq2S7saGhgPlk+eL6878+Iq0PqLhfvjFAFbvb/3v2ut8FLucDJ17jctA
	1GAxw8qd/seDFKpY2Mb7HLNjmZYSKFJOqKwt84ZJQ2CdT4Y3UIVHD28XItiQqNOCP0BOnUDmCpO8a
	Fpx69S0gUmMKJ8cxOoyvBs6riUbvutD9vh4nKXJBsTfzmT0b2ZcKpZo8DZHlXWyaQQXL83hcBdIeP
	LUqMVajFXPgzivafl25vHsOur9TRDP7BOLe78mY+yC0rzbDW5YqvpbGvjCvt9G9K1oVQzjW69Fxz/
	5glDwdvy2nUSm/Lvtqqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haNQj-0003om-Uk; Mon, 10 Jun 2019 16:45:57 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haNQU-0003Xk-5W; Mon, 10 Jun 2019 16:45:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id c2so9884181wrm.8;
 Mon, 10 Jun 2019 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nahDfB+sETBKegXKfy/SodtmY1BLud+5qo+bYwVBnVw=;
 b=lT00zEWQBKTcIrdf1DSG77zx3wzE+5oMxUfbuyi2w9rk7Bh7REl+ToPUKJaxy4vL7z
 AqIWtzDYPCsA+cXDkybh0W8egNZ+BfklMhL4EMKjhXt/xATwOhBE2BHH8UQK71dGRYKR
 bafdZRPL3D/QHr+jqKY6gxaqmNNKdp631kykqe1agrXyqRi0epe/4jUNfLdAaz7ijFvq
 8fhpgFhME9k7nOnYNU1k6bXaGECR9WsgvbdtCR3jAEaOuN17y2AfyJbTPhmd7j+4jkAf
 lMttQxi++m8IWT2/3EOc4N8rNDjrsh5XfUBtpQHl/G8fKQ30R+lakY5550yVloGUL+zu
 5soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nahDfB+sETBKegXKfy/SodtmY1BLud+5qo+bYwVBnVw=;
 b=YVs9vSX7T643L50gn3VhkY7TbcNIfrFZtQ9gv+6ofWc3hOUZIoM6plXNHdL7t+wFW/
 dGS3KRcf7KoDL/oM6re9xpSYHJ5/CK230S29a1b8D4+u/G3uQ/G07Rl56/fvcdZhRyzu
 dRpO2baClaQMfWlcweUNCa/rsOzRAspmGL5oSD4U28GFSzLMBa3On1aM8AzaQd2lSFYR
 LZkt9FMg8DuSv601POwL95MQ1Y+xcny2ZcVLx9iziJLtUFlJQHvmpEeYalo6l2ONcb+W
 obYT8ShLkg/3bmzDIVD6HAUrgj9Ggv5peCuY2L1R3GOH26UVMbxBD+j+YoRgZj3dGGw9
 ggOg==
X-Gm-Message-State: APjAAAWnylYrK4JN2BLjaoBbxpUeldSXMvqG076GHUOHi/kyYSSuA84z
 POTbCf3ClVvvWmKTDtVw7NI3vB6k
X-Google-Smtp-Source: APXvYqx0x0tmbODDCfYeLJWzIheIC7aPsNOI9HSuYlsJi+GMqfDcrpthcsLlQSlsn/njQXUotdTv4w==
X-Received: by 2002:adf:f041:: with SMTP id t1mr1446704wro.74.1560185140616;
 Mon, 10 Jun 2019 09:45:40 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id g17sm11441158wrm.7.2019.06.10.09.45.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:45:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/2] arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY
 interrupt line
Date: Mon, 10 Jun 2019 18:45:30 +0200
Message-Id: <20190610164531.8303-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190610164531.8303-1-martin.blumenstingl@googlemail.com>
References: <20190610164531.8303-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_094542_204785_22160F90 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

The interrupt line of the RTL8211F PHY is routed to the GPIOZ_14 pad.
Describe this in the device tree so the PHY framework doesn't have to
poll the PHY status.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 0d9ec45b8059..8c9535880007 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -190,6 +190,10 @@
 		reset-assert-us = <10000>;
 		reset-deassert-us = <10000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_14 */
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
