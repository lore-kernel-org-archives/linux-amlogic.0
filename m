Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B14CC369A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uPqqvkbKR9moqVgnSbKEgE1mykOCGqD0f8+ssXDavF0=; b=Ga8+PeYycf57Mm
	AWT2x3wIuJhGuu+RB60nZsbLgwMadGUvS93Zvs9uNpY+c43Vapp3h2tziBO/WaiGoo/7wdGnGL80h
	9u2TtCWfGAP4uCy4yV6jMYk8b9GL/IKPWMhtGvQlsC7gHuSaR/+g3Fi6BbYr8W6nsaD2DheZ7RZQF
	wT57s93S75s9QPkm6Y/Sxx9euv65rNe/NBDoJx6waBrBpFQUEQ9o/SRFsdbVxeDidIPAZe2ZLA1vx
	M+Ku0zu4Set9RqTj2Ekhqi0ujUPVRF/JqfxzBqWopW0iPAiqeQIpVtFLmnZaVbnRxxsTSdjApc72R
	OjV3vuyLRlbBDxRRwxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gOE-0000000BhsV-3kGr;
	Fri, 04 Apr 2025 12:43:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gKw-0000000BhVF-3fwT
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 12:39:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so189380f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743770393; x=1744375193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=;
        b=vzVrWUm6wr/Cno2Popi0wtqIYexiks6tPpbV2StsE0x3VM6b5knUGrtgHzulttkI/l
         HO4wVaC3/cpWe2LxDZJiKXHa0hhHvLlgE0fnBXSE4l+DGsWodPlSUja/VBKnKiqNCKlX
         0F23pTFLV1Ni5uRJmTl7cGMCjdYSEOCH+XlPsqKmT7KSDHxy+RWdBxHsZ8xx5mpUF9ks
         eMOwiacU8ciOuWFf3vmu/gXGnVdlnXJFPM0JbgsjyE/131UKG0R5PrlfRgjCLvjh/Wr3
         Q3UpOhXa9QgAuFqflJH7oep1dzhL6lVoTbrSH9AGYf10wOmpaDMavjLjvzL6HdCEYyRD
         XNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743770393; x=1744375193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTU9ncN4gaPvvWv2/kPgQ7Y0Lxm8sALtBZAAIO+VFQ8=;
        b=Mm8yJQtDLNaGTNuymFoY3SnDG6jHWxCvev7mJsp4ppljwu1NmVV0og9IYnvqTXq1Uf
         t/dnLpWJZSJXoeMnPmCzV6Y2hNLiUZbeEoV4sFZiVz2Y1/vhZzWR8Mf5bAsOj5tHtVLG
         31ql+4OjrW/RiOngRcBRFUclBxSVNKWuwA1VHg1Rjdn3aDlruSAlGZoMGEho04scJ87x
         Dbdzja6OipYVwKXHZQ5Xkf+vWqasN6xkqjFTs2q0hwypeq3iXZu+KTiThXu2Tzw8kxkj
         ud49iiXGxOcO48EcjLaFMB1RSwXRyvy53DpEol78fd69U9n5mlB6u97VvfeuVtl9mBbi
         BN3A==
X-Forwarded-Encrypted: i=1; AJvYcCUmm+KziRXKz/FSprtm3z5s+sl2edvqkSijjcf5Bspi8G2nIKRl7m+xVgA9L4QRFeBLReBgOwSf4VoutHW8@lists.infradead.org
X-Gm-Message-State: AOJu0YzqGEC6y5SGzvvzjhoTKgLrYffIDYqLCaT8BxXcFOU9WPgdqRM3
	SizT49i7zj/p8O76a36tN/hxS7/4O7yCE8D8lencGwYkfLL+0/JztGM0lxLf0zw=
X-Gm-Gg: ASbGnctCO2lMMt//hW/QdJJ4qjmIbNoqFIYYFZEVo7h+WzoV1gvlA8lucyIwIA5L5UZ
	w5KPW0pRgtJGwvAJhNANQBQYm86pWAcC2uUui/C0KIZTgZ0iv/0fI3eVpKwaSSgR0in6fUDWFxX
	Uk+lNisgOtnDHkBSnvx9zGJTRJg9UkOnzNkpx14mipLcz0Me5GB8lz6RW3GNJTRcW7r9AE7Fbhq
	ES6aZ+a4eJgn8xlsOuKinU2ZeJIMwPp4Fc2l9dKugrH+kzaxPWW3vkTFkMFB5yl/I09u2eCPaKc
	9AC4WK0gV31czcqpkFJensmmGQtsM9yaFW5ulowGG0RBQXnMu2EVdA==
X-Google-Smtp-Source: AGHT+IFE/BNeQcKRRWZIPVRmYBmQ1t5nK5Wr5F4lJXYDnVHNSidWI2olRFDyeW5mBZo+ZjR5fCLwxA==
X-Received: by 2002:a5d:5f44:0:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-39cb35a76e9mr962968f8f.7.1743770393235;
        Fri, 04 Apr 2025 05:39:53 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm4261898f8f.76.2025.04.04.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:39:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] firmware: meson: Do not enable MESON_SM by default during compile testing
Date: Fri,  4 Apr 2025 14:39:49 +0200
Message-ID: <20250404123949.362652-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_053954_918304_C42B58F5 
X-CRM114-Status: UNSURE (   8.86  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index f2fdd3756648..179f5d46d8dd 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -5,7 +5,7 @@
 config MESON_SM
 	tristate "Amlogic Secure Monitor driver"
 	depends on ARCH_MESON || COMPILE_TEST
-	default y
+	default ARCH_MESON
 	depends on ARM64_4K_PAGES
 	help
 	  Say y here to enable the Amlogic secure monitor driver
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
