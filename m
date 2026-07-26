Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8A6C531C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7k/u1KpjstzVMNV2KzQNXI7w7JNLAybiDp/tL99FGo=; b=2lC/3l3IhUBsDg
	c2Yq8ZNVTjYmloHIve/JRJc5yrRx94DF2va1c3PnjetRj1HQiTRZUGLP5f70As+NTuFDk1I59Sm4H
	oTT37L6SMTnOtIMWf4h8ZO/LdzcfYuI5z4CXcN818IcyZLsslrr9R3QPX+6JnjvCtNZ2xuae+wXIx
	1gPxVo6Z6VdFjN2TFFX56EXSzkgaRXADRa01dsZY5p+Mu/W06H0JrBb7FchpGTL3jA0xGwTOIP9kd
	ELKqOPrKBThKBXZ/PK4dpMtSxf5QQT+r/BUXPWNpLyfJTW6juP8JDdywgEEOqKINxwcMxZC/T2E2X
	QFoNgsJyZfsKZYYSSxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UM-00000001Tq5-24a8;
	Sun, 26 Jul 2026 18:22:14 +0000
Received: from mail-wm2-x04.google.com ([2a00:1450:4864:31::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UH-00000001TmB-3pP1
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:11 +0000
Received: by mail-wm2-x04.google.com with SMTP id 5b1f17b1804b1-4955f00e593so5942175e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090128; x=1785694928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=;
        b=CpWZ3E4Os/T1HqUmlL1SL4nIKOURLL1K0U88SBny5y45BlhGvsbmgM0m2czzXojWe/
         2ANGnxKZQfqTJc+GB8Hhk1feb63PhYbKYDCc7dGk2LIqZf/DDElK9MepT0FlEGA2v7Ll
         hznNVfvy6CDNjhSqp8n6tFf0lSkSG37lyNq04qEtswlioqv/K2h5H2C/7/JcZT8ZwHfG
         C5ToyZWQhPpSa9uAXxPqxWJKhSxQU8J+/E66aX0C1ByGVsH0HzwT2SqDCzW7h4LQ0QoE
         5m5yroHeMPRkJ6VaFF7EVyYP4azcNabh95VoHxY6R+Q6h3qVWSMQyAiIaPctT4fHp1oc
         6fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090128; x=1785694928;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=;
        b=FAXwcPMq4cfl5ij6KseXUm1d1PMSqQOZvsKW7TeGeCaGJeUE/mQDR0mh/ZkZloReAY
         Rh7hZJjEDkWb9eiw9y3frUQ7gLpfEw9bagw6s+QAteNoAejKiMY8zErGy9xoHtj+wZ1g
         BJkKQVqdkW92rsgUL/Op2946vz70wfCEWZRL/SUWrUxj6rZYuxAAQ6Jcu2QWfLNx0H5+
         6d0kqqfVP58EXBG3xjzr3e3FjFvlegp6BpZtvxeFO7UgVjhsksFcEcDip2tKC4LYE0//
         BD5xxlZIuVHHiHg/5JAeaMT9iL/7zUY/yYI5mgPZ9Ghb3HBU6W9whhQPK2K45OQOB92M
         cQ6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp8wZMIYt0NBIh/GpgvAdX+E4EvBBg4TErzpTIh+cT0zgAh040dsqva8c+1GRXs/AV/xwasPmruRdLacdro@lists.infradead.org
X-Gm-Message-State: AOJu0YydGnuj0wkLfeRGHKMCL5Lzczng0b1N+240j/hw8ZUgePDihR4L
	0IGgMjiN/mNlHHwHV3/E3nPtx/HV6lx/OhU1I+Vax7k4MG7I+96QiCYD
X-Gm-Gg: AR+sD12wsh2PskkjN9QnJRSmuTPuzw4IlLX5m/X47oQw8PS1cMrmQIHXrMFM7q+BAdK
	RWg6GL+6HtvjJ2LjWZVeOI9W3sZWuLfnSJABrCdkwmUCmjr3szehiHGmi77yfV0s8ud1r6komP8
	mywGrMUxcCBVQA0c8cxN9cYlvNseJTwxOEhGkwJlgNWOXJT5uv9FDnyNsjxox9ibLb09cxGPY0u
	pbXZu5JzvGDMNul4IOniaGRAVfOSBsJjZrgUWBCsbWeq1bOsFSfyz8gNHkMc3l/pK+LFo5kaj3E
	S9GV/5ilbsjct2mUJ0XDvRFno+DwLt7u9b0TxmglZx6ZRnhStSvO/Q+As2Fh0CzEkeokq3mll2I
	n6gdsHgB98lotXfX2jvvBFus01F78BKrqVi1SFkIDfXJpkHJOk3hOHWZiuWeXdWjYd5Ie3lUJuE
	Lp3KGiPciEF0xHNbYMkyEYqyXOOtNtqZJ6o9Oyvg==
X-Received: by 2002:a05:600c:45d5:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496b56c5ac6mr70333955e9.11.1785090127909;
        Sun, 26 Jul 2026 11:22:07 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:07 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Sun, 26 Jul 2026 20:21:57 +0200
Message-ID: <20260726182158.249449-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112209_965802_B5F78F9E 
X-CRM114-Status: UNSURE (   9.31  )
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
Reply-To: robazza.alberto@proton.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
