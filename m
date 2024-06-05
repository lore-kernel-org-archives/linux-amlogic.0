Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8718C27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqAlQiMokxJ75zx0R61Kb8McGzexvYrn1UkqJMD5T5k=; b=lZtEKJeix7JSFk
	UmUPWurMHKUb3f1y2z20tGA2MkQ3mVXvWsVZwsbb3Boh+iwlycE+OSqMevwX5jXzDL8jyqiElmtm5
	6Qdwdd1xm2sV9B2B5cBOoPpKyJx0ZGp8POmiwVNjWjwxM+iL0qoRCd7MM3OBYS2pmDaFKPHwMepyY
	ySR3OKf6MiAnR0SU+WKWt/wMzWVjlIMOuv0P8AEmS1mj6m858M0CWUVm6aJgQvdqp0EWy1pEgLCSG
	DN78PrKwYp9ULwvHL2A1kkcUC1Me6JBc6zUMwM2DjUKbV0Tr0oh+F5mJhaA8lWTiA2NhId6nlcVBo
	wd57bVJrgxd04ZY++c5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn3K-00000005QvL-33QW;
	Wed, 05 Jun 2024 09:35:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn3H-00000005Qtn-0l40
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 09:35:28 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-35e0eb3efd0so1775983f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717580124; x=1718184924; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pAfV5S5bw7VmcOZQaiBRtwAwj+DrF0VVg3n0PmSaq8c=;
        b=j4GqC5MOq0pjcgoYfPkv93MzWp1zn0wB1/+1pCBa95CskizTJjVf7HmauX+1uyYSUR
         NMq5erTh9jNduE/cX07hQV1ak7YIUQmoPUhv1zg75rXSlxaknS/64Ic1aDxqSYZhSacE
         TYMWVoVm/gC2Q96txelBt6nE6E+OrVfxvS/U+EQKgZTNiGZ3TFl+79wLRT3wfDbiSceg
         cx8vk/TIP+M1ag192ccCkzpG1WdUiEpCERTccuNDZRp8UEu0p4An6X9vZOp1f0x/23FV
         LPP6bpx04qmxtVrLySfT2kWxMgk6cvHgPRJN2r/G9wvmpnh28k9/C10hpGta1zOfmj7a
         fvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580124; x=1718184924;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAfV5S5bw7VmcOZQaiBRtwAwj+DrF0VVg3n0PmSaq8c=;
        b=nvR+jnIh3Rdx/06ZUvVCZPHYDBYwNOPQ7jS4VznF/60WtMGuVWVokg9p+Ddqqsz21n
         M18DLc+62Gt7ZBzOG0IoKvzmj2iXwGH2C/HxBDLPHP9UYscQyDn6p/ZiMu8hH15mhg+N
         yP+U1cEd0zSQ4BOZ/2in6q+f6SMxNnmNQLiF6HCtUR4rF6guLN/mu3vSPPMaaXTVsGck
         MONiYJp7UBdkxMjJWAtNiVa4psEz5jtjqJ7ZLbLNc4sbTMB9rxT9+lYgWZr7h7DBDWe4
         YvAYop6DUtv/4PXAKQUcfhQ4LJJdFs7mV6BgU+yh1R5cQH8AH4pCjmyibhjusInXUcxx
         3uQw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ732FmkTJR2l5eSAktGRioUxpWVIVJwIs+HevsPXq+QCV4FJRQOVEqdMFuYW0f8CuP1giRyOSPHAoYnAMZw6nAZhrMKFSkzFbBC6v1L9qAiw=
X-Gm-Message-State: AOJu0YzfMInYNOuxtH/H8FjuE0ZXGxC6pLPS51uRV5LnPoFZsPewLYap
	aovmPQ7GLfaOxcHR6NM1YiB+sntnhLsFm8/GsZDAiaVE2tkYjGecuF0f1JxKb4g=
X-Google-Smtp-Source: AGHT+IHn40EKIrXWfqqJJZ3UuhBm0LI9UtFPoS/cvNPZ4oE31GshrOWngCCGNLR3f3TW+faaJL8RxQ==
X-Received: by 2002:a05:6000:178f:b0:355:13c:e7da with SMTP id ffacd0b85a97d-35e84071878mr1641063f8f.22.1717580124553;
        Wed, 05 Jun 2024 02:35:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062ecd3sm14148873f8f.74.2024.06.05.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:35:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 11:35:22 +0200
Subject: [PATCH] dt-bindings: nvmem: amlogic,meson-gx-efuse: add optional
 power-domains
MIME-Version: 1.0
Message-Id: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFkxYGYC/x2MSQrDMAwAvxJ0rsBZutCvlB6cSHEFtWysNCmE/
 L2mp2FgmB2Mi7DBvdmh8ComSau0pwaml9fAKFQdOtcN7uLOuKQsE/r4TqHyk20p7COOoiQaDGf
 5smFOGxekFL2ooa6RI15pdkTDbWx9D/WfC//jun88j+MH8op/M4sAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=580RvtbqBFYqzaOF2Yuuvjfr0Qlxxfz/q9to16DIzaY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYDFbAvdQ0Su97ugHNdLB7IpMr+5S2zLxEOF9UICz
 dhJSX+SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmAxWwAKCRB33NvayMhJ0T7lEA
 CYp+hTezrQux8LxXHaEE31bWN8OqspowrvYljHZCTOhYlw9oZn61K6VHgYVjtHbWBUNpx1ZpZ2ShPH
 laKuGUjxIPSG7yYYUK4hngoIIZBFMGwOJUpNZ81FiHazy3sdtN832s1Jyg0HgzHLrmZPuJTHFRqR2d
 VmE98SXLR9mjaSLda4xuKDmWBlOdrFnbMK1+InY9HfTBmoVWDkDgfnnlWGW48hCPEH+aN3WEJU1DjM
 AMBh700+t2QR3TsCpI8770gALPKPkBzKj5PGdtVZEOGuHYFwg2SiUcFa8zvBZkIU6SZ0HCgljHo9FR
 2RV63Y8fUZPDRuashBoY5tQCNkYlLBqSJbKqVqMMZoVMTDXuw6GqjhR9hzrzZA0GvTvm5MyaTwy86f
 t3W/YQdlFesYj4/6FLGreMeyQUG5VmoZceJGentGvbZiU9mP5/zN+3Ih5CCj9QJTVm0sf3bJxhxbbu
 34E+XNDO6+WKsNpguvNTmdZeraxkGwUz32bhHAlO2b7M5n5ZwPXpJq64GYVSjXp/49uSgR4X/CcXE8
 5GzL2GBcgizJGZbjKPCUM623KvM19pUYy7cPeXzcLPi3U8jjickSxyevZgnqnMsLHxbPf2wyA2NqsQ
 da9cOVl9Yfflrf/z6hAKleAtIEeN+IeEKlkIJzbJhCIzU4cY1bA9IwHQCunw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_023527_263666_A0DCD217 
X-CRM114-Status: UNSURE (   7.13  )
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

On newer SoCs, the eFuse hardware can require a power-domain to operate,
add it as optional.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
index 9801fe6f91b5..99ddc9a4af05 100644
--- a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
@@ -28,6 +28,9 @@ properties:
     description: phandle to the secure-monitor node
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-7df0dd48b1a3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
