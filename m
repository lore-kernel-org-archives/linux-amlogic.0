Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E080AC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWelpFORinmQWjGXP8Py8YrbRIhhJISdUE8R356Crj0=; b=4dvw08o9z63Mha
	+KKVy3oe5p8kFMnaGRG61oe4ZVgcwT2mCg6KLFPkzRLqJU9idVeLZ0pSAAVI7zludldXSjujuDOVb
	glh6S1kyNXRaShFayRmI1xEj0wRPMBwFrbZVFrMfLtjUbOmnqzUwsqxoEeBLRwwQZVXSKPgTDaoZM
	yrXTkIszGbgQuYfSjyDYwqAcaK0gcnOQ+TsDuFiKaOalNHE+rUWQvzkz4ALS5cd1bRrUR7y7hUhb6
	R0kAy1piXtKogU2V+Zl20l8asS3+Y1Oo/IYHNLmHArCXRwxhERAmKs8KtJqZWGPJUtWWy7U+2YuXy
	OyNLbUEBHwn/GSTET38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TQN-000swX-G2; Wed, 12 Jan 2022 02:31:43 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TMQ-000qa0-EG; Wed, 12 Jan 2022 02:27:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b13so4163603edn.0;
 Tue, 11 Jan 2022 18:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lwtwmf96/gMAlqBztuZshLJxZNPu7f/tp/LMHnINIs8=;
 b=b6KUy9WWAbDnyR9E/4suA0mWm75LgVPGhTPMj6f/wEsE4Ly9TnvhiOA5at1u+TM5aZ
 GEIu8XcMhyR2bX/9eGcN9OAC/9HKtvh4CSAkVqaTDCUm6s/uQYAhL/VjOgQ+5cuNxeQ2
 rzbAx+lEik+Fg1kD0cIZqDsfe9knuqTX6WxM/3vi7ciAb5fPZEJuR7ge411o09/Bt+/9
 ATjHjwd+tLLa5QZJ8UkLVAVMiWLM4M6ju8m7VNKQsNozBVoGk4A8o2gby8i+znpKMx2A
 r6HTe3RWkaCxDTOIlwI0Vt4hB/ffkdYL7+Uq9isWn3suIjx0OOd7WY/D6YMEx3Dgb41Q
 Hdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lwtwmf96/gMAlqBztuZshLJxZNPu7f/tp/LMHnINIs8=;
 b=JGmfqBFMcCa3STt7B5+TFyLYzb7pNX15qECnMfyEwN1OXcom/1xJYDYzUNVJd2M2e5
 BslT86AMGlgQTPmwCNSRwSU6ZDQiXBjO/qYkaFZ3yMbgGLgNg3Wm+gTkosv7hgR13vkX
 tEXPnub9DDjZrfIq9/MmbQfDPNZTi7A1bRuZrPZz7drgR7dI0IuGju+n+ZIJrVyEKKKW
 +2+LCFnQiovDFCU+DbDDOQw0y3AK9FmhLmRkDzDvxi6Snv+geXNOS02KUFnKIgU6y+pX
 99GXzzdOhTBkHKaB9wG24H0n9ReBzW4S3T8rLipkuP6bonb1pI1n0rPTVIeuJOYmM7vo
 /woA==
X-Gm-Message-State: AOAM533UHmlDfhx4YOHzSnShknjpBSJlgeUf+G/4962X3lIOqnHzy2Tk
 0gGKL5r1WVrAsaXOlKd77FA=
X-Google-Smtp-Source: ABdhPJyiV1tkqBjNFkt+xyLax4kDjHBpIVMJbLQUyWPB3EuYuimo8MrTjOdV6Q3l03T5D5nwzgOEGw==
X-Received: by 2002:a05:6402:291f:: with SMTP id
 ee31mr7176827edb.194.1641954456664; 
 Tue, 11 Jan 2022 18:27:36 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:36 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 8/9] dt-bindings: arm: amlogic: add H96-Max bindings
Date: Wed, 12 Jan 2022 02:27:12 +0000
Message-Id: <20220112022713.25962-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182738_511132_33A78E04 
X-CRM114-Status: GOOD (  10.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board binding for the Haochuangyi H96-Max STB device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 2027ce81a834..a073a959232c 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -177,6 +177,7 @@ properties:
               - cyx,a95xf3-air-gbit
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
+              - haochuangyi,h96-max
               - khadas,vim3l
               - seirobotics,sei610
           - const: amlogic,sm1
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
