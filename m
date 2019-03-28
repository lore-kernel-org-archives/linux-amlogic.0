Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1954C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C9020823
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eb2F/LnP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Lr+SGaAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C9020823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gG3rBhJLs/yZnqTrX9UCkdtqqGtTmaTwgKz2WVABoQ=; b=Eb2F/LnPlhcKnl
	7heVktB81xnTbvl4E8D/4tzScMoH4c9wBe2u0PX/f6aTGLQ/BC38U5/bkqYfZUa5QEgq2qxx4sZn2
	lAIAOka6QSa7wS/RbIIpJ5h2NBumxoIezd76qCpijFo62q8XWfKKN/PbDRkGEMJgy7FZJOEAX9SdW
	4d/anxdy43TW9FvOJlLFft/pz92KAFqpnKKJV+xFtu+4Y7c0pIDuNRShS9BMGHysGxfyJGNNnNtEE
	aALbPieQPr4bbrxbd7VnQMGDRTIy7c6j8HYmkX/+moZ2+9xvDToS+55ZXQknZDhDOs37i5SR+42gq
	7mV4TKdG4jcUxrD35DiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9c0F-00072w-2R; Thu, 28 Mar 2019 20:51:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9c06-0006tJ-R7; Thu, 28 Mar 2019 20:51:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id h18so314516wml.1;
 Thu, 28 Mar 2019 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRINBXOdsguAhW1lpNf0zzWQ04z0gK/+bA+ikvUAsbc=;
 b=Lr+SGaAwV1LdP1i7z1M9LtYXP+qnw3USKe+qZBb0lQYqUtkB8s8OHsJX/AMh/1C76w
 aZnxTc68qZ13bZ8dd8xZZhtlVOBevfOsxfHNEfJriY0jajluPueGcEhGNAlJuPq6kwMh
 RvL4R8+BDePLUQrMaNLnxlSUP6V9ixiMFkd2lhskEGad0zNOm7AE59YoqVzWSP1NKfIg
 QAE65Hak5joKFek+M9MUpwTAVF/zkGBDGMt7NX2GVOkj0AAjIV0ls/92EJyK/v6cDi39
 EDSho2P7Elu4Ow5TkucJQDFXfFp6xKsAOa0UzhArjvnkHAd2cfdTB2qfLpQxQDxRCyr5
 bx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRINBXOdsguAhW1lpNf0zzWQ04z0gK/+bA+ikvUAsbc=;
 b=o5RqYRbRoQ4kakMs10hCS8IWx2gHLTw1WpBXNe9XkEb3Pzvhvsx63Hmm+4EduoYAqF
 32k6yEusxb+UWSgKVgRcVAv8SgVmx66/o1Zc/kwe+5J2ZC7htk9Gm29d/KBqBXPeOa55
 cLkiTIExSkbS7B3wf/OYplRjD/q+ouonMPCPAdwnhO7KD/E1yoGWcMUDvC6W9MAMziLW
 qE7BF9KO69KbQUPQ6akHu8I3HbJpUWkjwUsoz1homV+9grn9cDbyr+rPIDIFaTXTJ2fi
 cbow0GtjtRe48cqsY0DXjaeQNhFIULrdAkwSfIYEFcpjw8Jc6h9ABr/a74tW8CVsr7G7
 y4tA==
X-Gm-Message-State: APjAAAXmFnWm7Y13d8SXXFrin6LfKqeQS4IdbnuP2cNVj1P2bqmKg5Fu
 C+B77Kq8uC4l6zv+f1exAQ4DbJhq
X-Google-Smtp-Source: APXvYqyZ6gqUSyeG4LWVaS0KscFbkPFC14RiljD2DJ4F5E6PGRrdlQHxSFQj6crx69hA2pMl+yNfFw==
X-Received: by 2002:a1c:c68e:: with SMTP id w136mr1206916wmf.111.1553806308566; 
 Thu, 28 Mar 2019 13:51:48 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73999007CF185662A5FF671.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:7cf1:8566:2a5f:f671])
 by smtp.googlemail.com with ESMTPSA id c10sm94375wrt.65.2019.03.28.13.51.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 13:51:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] ARM: multi_v7_defconfig: enable the Amlogic Meson ADC and
 eFuse drivers
Date: Thu, 28 Mar 2019 21:51:22 +0100
Message-Id: <20190328205122.27092-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190328205122.27092-1-martin.blumenstingl@googlemail.com>
References: <20190328205122.27092-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_135150_873981_DB87EF02 
X-CRM114-Status: GOOD (  10.67  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

With the SAR ADC driver ADC measurements can be taken though the IIO
framework. Additionally the SAR ADC has a channel which is connected to
an internal temperature sensor. The calibration data for this internal
temperature sensor is stored in the eFuse.

Enable the SAR ADC driver and the eFuse driver for the 32-bit Amlogic
Meson SoCs so we can expose the chip temperature to userspace through
the IIO hwmon driver (whose config option is already enabled:
CONFIG_SENSORS_IIO_HWMON=y).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c75051b9392c..11d0395f3f0c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -925,6 +925,7 @@ CONFIG_AT91_SAMA5D2_ADC=m
 CONFIG_BERLIN2_ADC=m
 CONFIG_CPCAP_ADC=m
 CONFIG_EXYNOS_ADC=m
+CONFIG_MESON_SARADC=m
 CONFIG_STM32_ADC_CORE=m
 CONFIG_STM32_ADC=m
 CONFIG_STM32_DFSDM_ADC=m
@@ -979,6 +980,7 @@ CONFIG_PHY_UNIPHIER_USB2=y
 CONFIG_OMAP_USB2=y
 CONFIG_TI_PIPE3=y
 CONFIG_TWL4030_USB=m
+CONFIG_MESON_MX_EFUSE=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
