Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA78C36010
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g20pUR177GGTnSaJch20R0EbIZ3EFg2UxxIpYApXNog=; b=nZeDpWPgHzeh7T
	XBXkgqTyM/ubK8qphilZrxRZ9FbIEM7Tm9zS1okmlDwpKqxWRYZtYET5NXBsSoNUbpuKIxeuH/BSh
	+tV6cih+ANSfM5se6COfPcAXRVY7SAy6dZtBlY+KZ+K+sMnXpf29Yw5fqdUfd4jj39gmGO0kAgnRe
	CiPtCZL24MMkRj/BFaNaaW3YcC6DLEQ8gkK+tUSr9gexOw88U7pQAw63ZfLXVwHH37jl1CYaprsqu
	XiDcUuW8JU2Euep3z6UPJVVdlif/6d9uopzE2PShd05GQ/v5itQINW7wxvMxCaeNa89LgaaLRokz5
	0crY1KbHmi0OfwghuwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0frt-0000000BdnV-3uNT;
	Fri, 04 Apr 2025 12:09:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffq-0000000BbIq-0D0G
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3912622c9c0so192237f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767845; x=1744372645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=aLS9JF8suhCoGWz73/6KniZc8jegBWsZiZLoYX0SFz6gVlXec9cmyh8LR0bcNFI7RI
         OmkiBdN/48l0VNt78i3skM/OcnEdPw0lPJZeFcxm8exwG54whTlrb7tnJIlur4sJA5KC
         vVyrWI2JiZorv3j+5shWte2wS8iF2YC2KHfYmNoRiIEAJ0bC41AvnQpSqT9ofzI0LG22
         L1ngsT6reUKeNaOsrC/HKXmtoF9IZWIPWJDkn+GJOvB8iXygNv5ieYNVuaGzFILj0ZNj
         gyBp9KGjN+qSVBhQqaxMACkXk2BclcgVkTBephLIECPJytb/ztGZwj4Kqakfb31Yns1O
         a8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767845; x=1744372645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=DlYXchcziNWVFriwKxg3vyxho+PWAol94zGwAd/IDWM3dqaafcYGkEObyEVcsBlu8W
         AJX7B5HNRH8rBQDZmuMtD2Rq7zSm4pVNS8NLO3SXJzbzdrMmOYgWVFgyKZxnXotVcO7J
         T1lh2ocev7oOdIH1G+P3Iu1xoxEUfHQrVdwITwvqo4GzYvQIiZDC+hL461/At/ZVnZqS
         fVEYELGLTelkja2zd6AkEe+tLnQXu1nhAvy7l0/0CPFqKMCDket1WAIUdV5Ewrp5+hMb
         0DpIucZomAbIj0N8Qe4OzQNOC+3WxpJ4YaG5XMuD/9nWPQ5iP3Fmcj3TWg9SdUCB9eHh
         j0mA==
X-Forwarded-Encrypted: i=1; AJvYcCUNAoc4ZMRktDWZUPoWf5PbOZqC87YFEs/4bHG0JrjiVwTuw9KMzRITr98/0ZbkXTFNTRTj9O/fL0C+Rjlb@lists.infradead.org
X-Gm-Message-State: AOJu0YyM20a/09/JX9GQSNulUPht3Z99Ml+lGRzRT6u9wMLWwkSZTOVH
	wiM7NZDG+8j5/FFVE42LZEBIpWq3VdMAf3CpYajSMUvs1mH8COxrJp/Ph08Ah24=
X-Gm-Gg: ASbGncttMJKYCPd5XP9MdsMcaqkv8wgHCz6sO3xffNdGvza/v6mfVTE/Y93lEeLqXOc
	kURoVR/EE7pcM2S4M0BIw+zOJP/2eIlKOnJ6REYNe3MToZau1nMaEMgzSU2s+9rrY8m7JCUzqZ8
	raUkWSv7G/jYka+aOY3BVMl7zK1NGIGV05nxSBAP0xOsi+vYuaQkhbXPEX55LKMvNKa+lcASjq6
	JcpDfheaS5m6sgSQz27E+WV4sAViP8CRcOzsrVo7bA09TyEi8K03xLpcifoD2jmAZcqd6YTPEPd
	00Ov4Yoh3PMX0XAur68jix4fQUp0P+jcPwAPLCoLACzGufREFHIKnQ==
X-Google-Smtp-Source: AGHT+IHBtV33JgKfAEZ/K/Z3eAGyaEe//CmaN4daL7d9M+mX3ZcQYu8+eSe3/MU83jWvj/2V41Xy8g==
X-Received: by 2002:a5d:6d81:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-39cb357b616mr910662f8f.2.1743767844740;
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:19 +0200
Message-ID: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045726_102354_5E34E63E 
X-CRM114-Status: GOOD (  10.08  )
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
 drivers/pinctrl/uniphier/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index b71c07d84662..5e3de0df756b 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_UNIPHIER
 	bool "UniPhier SoC pinctrl drivers"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on OF && MFD_SYSCON
-	default y
+	default ARCH_UNIPHIER
 	select PINMUX
 	select GENERIC_PINCONF
 
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
