Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A8BC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 19:29:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B754220836
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 19:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRZyeNDN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="DtM9qYeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B754220836
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzmy/OcDDafqCH6Fu262RAvRJo7bMKHc/S3itM4SryM=; b=TRZyeNDNNxw8t4
	dCE2uet5WX5Pekex0y2edNKaTgRVxMToNMmE2NDSfjJJYKvEAnd5tzIK50zeV5APmB5WS31z6OIH9
	ZFdmTvI2Lz5+SDG2qA8gnwNalBOQ1VaYr5sBGVkn94HOB0M4dXpD4NaAnAiiTrm7SqqYqC/51GuSD
	5KJ8QLOzA+UDvFHJTc0Vq4Of9rxHMKilwMeuWoaidsD0nIzSD7DuHYhxlUQ6unP5c7qd18NJfFONu
	mylKYCx2fTUvWQkZEf3RbwNaRnmz/Cort/sTspdfcVaArvfPuo5nAYndD5nw03ZOVTcwAZagh0tUm
	OwWm8VDDWKVN93AOiAzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if7fa-0005HC-Lv; Wed, 11 Dec 2019 19:29:10 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if7el-0004Or-FQ
 for linux-amlogic@lists.infradead.org; Wed, 11 Dec 2019 19:28:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id c23so2709057pfn.5
 for <linux-amlogic@lists.infradead.org>; Wed, 11 Dec 2019 11:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=+AvX3U8tZ4b8BiNANQzx7evp/O/27ZLdKyQrn0pJXbo=;
 b=DtM9qYehCfFNg/2rDxI9xbbVLYFNzd7QNXDoduc3ewRCMVgsIBSrgdNK5ptL+U4f+2
 r67/3YrnkoLP7Kqiaz+JAnGYBbYp91kDvxX0ElG4278lRGtqmi82fxSlS+/E0HJKlCJ2
 Pxf8r+Wx2vW2j1NVRovGNlQ6d9dl9a+90t/5GtKZELnNvodiQsb9QM9G4+kICCGyWT34
 BikGd90MK2nF5sFfrxHGijgzYzgkkuRp93o8jjSmRsAr4wlMv9uTK1Col8Wpaoq82MTI
 uxNScY05gmd/DRSdPfpQ9UdSWG4SUXok6uU6aqu5cBqV2PCE4FKZHWP0rt3hpdxJsCFA
 xi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+AvX3U8tZ4b8BiNANQzx7evp/O/27ZLdKyQrn0pJXbo=;
 b=T3rpwLE9KOpd19MC29wn/QSJiKy+Sb2ZQyKhfN56g81gTTuDyECWnWxO2GiGDiEIxE
 G1lhjC4vU3r5S4LswfZGV4lKUqL7A4JvM4c4xtfqW+gspinkOeKaq2+ACNtXzP6/JO7+
 ssxeWm3JlE3LKOGrHb8BFWY9U3iMpvuXb/M2xcpsxvNsf1iitpgFlXCodBA4aq89UdMH
 ui+JTvj/sN5cl3xEnNz6nlKDLlnJawVb8YTQp5Pp3orPIyOI36DGw4uw2byz4sAJy2gI
 1JfRuhyjTWedAAVweSSwDDfSNKJE+juGX/pgONuhdWzNnMQanHC9o8m4ytBwsU/UK/Z7
 WIng==
X-Gm-Message-State: APjAAAUFOLwMKN8F4PT4rCawIhCGyHzdsticZME+eD+8mXKI6VwigSUy
 MO+9YRSV6/URMC1HAipuj+58Zqfwgu+gtXadMD9cyQ==
X-Google-Smtp-Source: APXvYqzo2ljEGvchzRcyIbUEZT9wdgSNT2CgcXIYDlIj+7NoyR/2724Q+hSDkumLb2AjZxDXvEVS1q4vfz+to4FDTj4n7g==
X-Received: by 2002:a63:d642:: with SMTP id d2mr5757128pgj.205.1576092497512; 
 Wed, 11 Dec 2019 11:28:17 -0800 (PST)
Date: Wed, 11 Dec 2019 11:27:40 -0800
In-Reply-To: <20191211192742.95699-1-brendanhiggins@google.com>
Message-Id: <20191211192742.95699-6-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH v1 5/7] crypto: amlogic: add unspecified HAS_IOMEM dependency
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 Corentin Labbe <clabbe@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_112819_616450_1643245C 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: linux-um@lists.infradead.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 davidgow@google.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Currently CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y implicitly depends on
CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
the following build error:

ld: drivers/crypto/amlogic/amlogic-gxl-core.o: in function `meson_crypto_probe':
drivers/crypto/amlogic/amlogic-gxl-core.c:240: undefined reference to `devm_platform_ioremap_resource'

Fix the build error by adding the unspecified dependency.

Reported-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/crypto/amlogic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/amlogic/Kconfig b/drivers/crypto/amlogic/Kconfig
index b90850d18965f..cf95476026708 100644
--- a/drivers/crypto/amlogic/Kconfig
+++ b/drivers/crypto/amlogic/Kconfig
@@ -1,5 +1,6 @@
 config CRYPTO_DEV_AMLOGIC_GXL
 	tristate "Support for amlogic cryptographic offloader"
+	depends on HAS_IOMEM
 	default y if ARCH_MESON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ENGINE
-- 
2.24.0.525.g8f36a354ae-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
