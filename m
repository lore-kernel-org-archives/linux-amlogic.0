Return-Path: <SRS0=Jpgy=HB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB7BC433DB
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jan 2021 05:40:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A8D64E06
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jan 2021 05:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A8D64E06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rni4yZZjRbsMc/XTC5AniygrczsH4f0n7bM17oGkt1c=; b=CfsnIOUDtf1iQ5BCsTr+QiyGpg
	ZiBBVqfYLTHiFiARIdtbvSiWhOvfOrHCxkoaBDzqf1eDvkYaZ5FuESRTErTjUytBqF73/cMbB0ibm
	WzJd606OSJ0mGbX5TBjSytEmuPzeu2qPiaCxxsiOIhZPz+ssNJKUlLWSaWxAlCmHnE+YsueOON2zU
	KWg/jfbeS9IVHfISWlsBGrVrlSyNoHvAaKHRruE0fzaWUbRBjEzshofE5yQws70RxCdcE6DyrordQ
	oraFykmcBkKxgdIOi0XlKP5BZmDIzpLaM+NqoBEb0csrH3PZZKkN2XjIYp+gi13WnWQVL1mnUitM8
	yStumEQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5izw-0007VG-NZ; Sat, 30 Jan 2021 05:40:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5izt-0007UZ-Ck; Sat, 30 Jan 2021 05:40:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b17so6606232plz.6;
 Fri, 29 Jan 2021 21:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YO+dTyu0Ai+JgXkbLN4mpIgMxzzbIfn+Gkh1UirZ+w0=;
 b=Ql+2kWyOoQtxwkc7Xh87pKZeIG5pnj5MbLPeUbWgtyVrkfmOGwl/+FpLlElmQdaxZi
 kGp50s4fNPeACBJdAE2+925S4nPXN6N/MUg7MxL5m/Zh8+BwykJmpqZXt2qOULjtMAH4
 A2J7rSvNmjxCXQQnEz7gMbVKvnXAEyOI+1Ql8RoC20O8VR2SZXafFusnzteAS3205ZIb
 7QWmbPnqKhaKO6zcIA1cnOWJogY6uqga+9DpoZX3d3YXEyCT8Q8hsmtRwjro4UkC1hTf
 4OY0EH0VtHvA5A28/EAIXezKfKToShwqd7TIyL37SpfejuWAn192PDHNqdPckCI1GqlP
 A6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YO+dTyu0Ai+JgXkbLN4mpIgMxzzbIfn+Gkh1UirZ+w0=;
 b=dP42Rcy/WNg7c2nIIr+yLba3Hh9xSfSddf+Ht0pv4F+b0udE29+TnJ8pJbQWJVXn3V
 jSpS/ataeLqnmO6mjg6iMnBo+gHdJb4OXLA5wwCyJ/air3QnxE5kEVq3YtQE4VfooGRD
 LoYoe/x6d1EQ1UescXkmLDQJIlGikhhXPrvMtFZrorKGE54qGA1112dRy1SrDVlNbeTn
 txo5nIk9WRwwT80qRHEWBiqyXyr3HurWTgf3mw/agCnL1/YOA1d6PyhPzijI+02UmD5f
 VUbrnTgQwBZg5CXw1TzjtaNAryZIXKIuX/1+94S3s40pyh+zCkjdJipSMqRGfINwxGKA
 JaYQ==
X-Gm-Message-State: AOAM530c1x3/8K+EWE0rxjac9XRVkIQLRa2j+DDUMe4eTBQ8mjXyllXa
 BY52YNhcgCABmOiRA9Y3iYIEaxNv3jdGjQ==
X-Google-Smtp-Source: ABdhPJxxaYBoKQANWDrm18IPWzKyIai6drc6hbwdL3dgAul+8/dCXjO9ajA6pYDTOhZLE1tjDDcNtA==
X-Received: by 2002:a17:902:9005:b029:da:f580:c5f7 with SMTP id
 a5-20020a1709029005b02900daf580c5f7mr8076247plp.85.1611985235315; 
 Fri, 29 Jan 2021 21:40:35 -0800 (PST)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id k10sm10942376pfk.0.2021.01.29.21.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 21:40:34 -0800 (PST)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH] arm64: dts: meson-gx: remove wrong reserved BL31 memory
Date: Sat, 30 Jan 2021 13:40:22 +0800
Message-Id: <20210130054022.2020338-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_004037_472137_65390ED4 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 nick@khadas.com, linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kernel boot fail on Khadas VIM1 VIM2 (meson GX) boards
SOLUTION: just remove wrong mem reservation for 0x10000000 0x200000

 ## Booting kernel from Legacy Image at 08080000 ...
   Image Name:   kernel
   Image Type:   AArch64 Linux Kernel Image (lzma compressed)
   Data Size:    4657736 Bytes = 4.4 MiB
   Load Address: 0f080000
   Entry Point:  0f080000
   Verifying Checksum ... OK
 ## Flattened Device Tree blob at 08008000
   Booting using the fdt blob at 0x8008000
   Uncompressing Kernel Image
 ERROR: reserving fdt memory region failed (addr=10000000 size=200000)
   Loading Device Tree to 000000007bf23000, end 000000007bf2d3ce ... OK

 Starting kernel ...

 bl31 reboot reason: 0xd
 bl31 reboot reason: 0x0
 system cmd  1.

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 726b91d3a..71083b89d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -32,12 +32,6 @@ hwrom_reserved: hwrom@0 {
 			no-map;
 		};
 
-		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
-		secmon_reserved: secmon@10000000 {
-			reg = <0x0 0x10000000 0x0 0x200000>;
-			no-map;
-		};
-
 		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
 		secmon_reserved_alt: secmon@5000000 {
 			reg = <0x0 0x05000000 0x0 0x300000>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
