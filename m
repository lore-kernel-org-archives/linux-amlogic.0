Return-Path: <SRS0=dEj7=FA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA692C56202
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 05:05:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F4F2173E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2020 05:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3dVxw6i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRzUAnvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F4F2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qr2lGSGUafNdmVRoQNxWMyHzrwn4hFsR23xpEUzvkEU=; b=a3dVxw6iVUbdC2aL8db9JFvQSe
	FD9SYa5r1umNV2f9vZU11Umu5zv9yZieBeNwmdyqF/xzmAtU1cDqu9OIH4frzYycyNhehuZ3okhD5
	WsqktsBKXzFVruFSrMvI/EyXvW9p232b14UulMXwkvNBdd97uDalJMDdD1L0KiOjGEDNB2dQKovAY
	lpCHfZYWK/fo04xWPXFhGJLs4ca+K2qyLPebeXklg/M/vytsglyp+So+yv72KJiLXHEf9E29Z5wFp
	3GJnzWMX1CMDb6KGF+3YQYvAaKwdv5uM3AsUNS86KyaMFv3y4f7B11edMwu4DX4s+/UdqqUmWD9VT
	a1+bVMUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki9Si-0004Tg-EI; Thu, 26 Nov 2020 05:04:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki9Sa-0004T2-Cu; Thu, 26 Nov 2020 05:04:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id u12so718388wrt.0;
 Wed, 25 Nov 2020 21:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DZ3C1e84Q51GI7F4JZus9ZaT3v1v7zEgkxNXr+KQkIE=;
 b=qRzUAnvibDyG1v45yf4awEtyY4M41A1MkQvjh3IiaHm+2w0hZLnJ406gnL9qRv2nwh
 dtXk4A419YSZPrmyX13LGf0PkqKD/YwSwKPhq9zFHUREGjcWW6eEtkqOozWWLlOKCz/b
 SZHJOPFySoJLdh2n9e67pnJVxx2uk1yia5p010gZjVvN2i7+qHv5OJqauT1m3iqL+kqM
 f47A7pcFyA6E/MqszVcNCjYfGWc+FeuCmWEm6dNWjNcDhJoo6QPpn7fC29253t7c/g+k
 IQPA9go7CL940ZApPEhwZfpA3WjHhfLRoJdXwXRjdSC3vNowmal/p+0aHMAb7CNl03re
 j0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DZ3C1e84Q51GI7F4JZus9ZaT3v1v7zEgkxNXr+KQkIE=;
 b=fWkmiDNhl3rOphyAxCLw0ApaI3SJsCrBp5CU6TKO/zl6ql7xB4xLbbkdteE1D/Klsp
 Z+dJu0Py+6ZGUCkbhuBgRsGHXvelCr7Ib6jK9nNNojHeWXQ9OLdSpWLMx5JKYPe4GNLy
 g1qJo/qT3zkl3Nmuxd7p0D3lpEHLhl78KRJC1dFMfiYN7XmYk/m5Mv75+fug/NYukhr1
 WeuXNeTCH0VGb6AgXroukMvCeP0nZqZktuJ6uEvBTmcF2zav9QqhqPdr7qKomWrEEHZ9
 tui1cMdoZtDAmKlUj0FFR3Z4WJaDbrpX7C57XdKKzpo33aAstySTqJ0R1y03Krl+Qedj
 jbcg==
X-Gm-Message-State: AOAM533mnsfk0daMD95imgoEzkevbrjZN4kcrDaw+5tS+bfUms3YEY0T
 VkI5G7wwUpwZvbx8JrnlUoA=
X-Google-Smtp-Source: ABdhPJz5FV82f9hJOxdF8i2ckFRs3psGrGy50FNjKBTIMkp+fjjqtzNm8ST5kzQ7r7KGx185ANvUrQ==
X-Received: by 2002:adf:e444:: with SMTP id t4mr1493356wrm.152.1606367085211; 
 Wed, 25 Nov 2020 21:04:45 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id g186sm7625369wmf.2.2020.11.25.21.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 21:04:44 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add KHAMSIN IR remote node to SML5442TW
Date: Thu, 26 Nov 2020 05:04:40 +0000
Message-Id: <20201126050440.6273-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_000448_503756_06F265E6 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Set the IR keymap to the KHAMSIN remote shipped with the SML5442TW.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The rc-khamsin keymap is queued (or in the process of being picked) via the
media tree [0] so it would be nice to add this within the 5.11 cycle.

[0] https://patchwork.linuxtv.org/project/linux-media/patch/20201125161413.GA915@gofer.mess.org/

 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
index 0b95e9ecbef0..ad6d72254150 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
@@ -63,6 +63,10 @@
 	pinctrl-names = "default";
 };
 
+&ir {
+        linux,rc-map-name = "rc-khamsin";
+};
+
 /* This is connected to the Bluetooth module: */
 &uart_A {
 	status = "okay";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
