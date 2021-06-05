Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831BEC4743E
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5963860FE3
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5963860FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NO8tPoqQq4VLPW9wh+w+fqZ2SOcHJTNpEJaWveWX0w=; b=jPwfifwr7ta3Rn
	BlTIYxZ67RClLkEqxCDBgsBfKRpB+XaL71j96v93zQR3zokY2pQDcxbqIRxsQ5OezIdEB0SuIyqye
	yynkZxJNHVloMXiiBFmp9AIeLmk7RoNjvBbdl2EHhljR+dkvHNDJVlQzX06zkeWJovE395X3U+ZzO
	P7f8iGEmq8a4HqkgMv50RtUYloJuMSLEOkGQ72r+FAH8zB0UKJutNK0spGhWbgxOP0GfFMitnscoy
	dfuVUK/PpEtu1lwO3YOTgne0aKBsIFtST4/2my5/Nb/EDBNFvFF8jDW7XCefQDZKQNwPLOE9tlCZc
	OQQZdJUbNrY94Qr67SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMPM-00FsoW-Ii; Sat, 05 Jun 2021 02:51:32 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMP1-00FseU-DQ; Sat, 05 Jun 2021 02:51:13 +0000
Received: by mail-pj1-f54.google.com with SMTP id h16so6550504pjv.2;
 Fri, 04 Jun 2021 19:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2xrOsoZZxRSqy6qqxdG6tTS5Reg+2W0VGzUs3SrOYI=;
 b=AUs5oDhWOgH3j75/bYJMw3Ta5grxLtUqlXTe8f5iQOvQgFiVMw4K61XSV2d7VRWm4D
 68hzP0TORy5QlplMi39o8F/M48Ve7+b9Dwmd1e2IZgIOewHAiRE+7A9UmXjBZvKJBJX7
 LetOihzpF7Y8VPLlCwHVwr90LBQHp//6lq8B7i3EgD1SnYZfk/VeBfVTetoiFAVNnflu
 oAThQosTxdqH+la2a6STsXsGVerheUTghnJxZGT0S53/Oe1gbv+HqdZLgUzI2picxgMK
 94okBiUToyx5wtj8DzjztKJ1+4p/IBFMqLXTzQq6efoVeVl0FidpuGEeonuSsvg1jl/C
 hOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r2xrOsoZZxRSqy6qqxdG6tTS5Reg+2W0VGzUs3SrOYI=;
 b=kbZ3cqaMKmhlumwYD673VT9Ravpx1c1IOsp2xCBNvaYAyxha3IzHDFKmSe7Gdoo3Jf
 dUafMT8C8X62EGoJJ6sFVfMV3BIWUSlZxnMHVF8/7Yucdpui/2L/XxzJ7K/oyATipGG3
 dY1MPTMS7cuAat1g/LkuRGhdI6g7sox81prkiMkPcNOVJ0AkJJ/CIa89/U1jyYpEpPZ6
 ZncCA6lRnQ0/c59qc1/TBmNzNAgK131jxljibv97mg6KBtMpn/USV1j0K10Ybs5AOIye
 OrCMbXwoc/aBRujCKanOIavnrFA2rNKQYyHMPyaF4p7SdWSW7u2mN5cqrpKXagS478/Z
 5fUQ==
X-Gm-Message-State: AOAM530VI1OTaNaFhT51oaufr1XhSIs2NNL4YjNGQ+23zt6NOAC1TLIZ
 JFYd02Jt2oF7wJ5hE13ZxR4=
X-Google-Smtp-Source: ABdhPJzIWy4lPBzx8d5mV5bRpCtxADLwbvERTzzDv1SGcyRQxQ53XODgwEZmkANq0TJBXonvIH812Q==
X-Received: by 2002:a17:90a:4e0b:: with SMTP id
 n11mr8031071pjh.155.1622861410777; 
 Fri, 04 Jun 2021 19:50:10 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id g19sm2630875pfj.138.2021.06.04.19.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 19:50:10 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim2: add i2c aliases
Date: Sat,  5 Jun 2021 10:50:03 +0800
Message-Id: <20210605025003.410142-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_195111_482736_46ABEB7E 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Nick Xie <nick@khadas.com>

Add i2c aliases for Khadas VIM2.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 70488ae45876..3f3ea65df665 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -21,6 +21,8 @@ aliases {
 		serial2 = &uart_B;
 		serial3 = &uart_C;
 		serial4 = &uart_AO_B;
+		i2c0 = &i2c_A;
+		i2c1 = &i2c_B;
 	};
 
 	chosen {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
