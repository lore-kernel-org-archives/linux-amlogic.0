Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8518CC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1LGdVegvzo2002WX31EMGzVcn8AZsKuXmgGt4460IY=; b=kkvO0CsBVlLlzo
	ImhDTWsnHNCHlTgcfGGvSK3COaW9CgETcL/8bj9i5+r7oDrNPrrH+2nf44tX6mrThroc54VviS2dt
	BKDRsCMIYZR89PAB2z5t/b0yDS3j8C5i8A4XacEok3oxUWHUEkm7C4nd8lr58oN/0wrOdxH/M+zG6
	npdYV+XkKdN6oVGheS5LQZkowNssfskfNoS7EWF+XzBHYQjqbmTUt+i2QHfZKiThDTGpD7msFLBqM
	wBv8BT8iwcmqQAjHBt5oIVi2HvoQro9xbWe1VQ1x1tf6UE6m3jqepGXNDhMh86AdZxww61Zfnghnx
	FAB4+0nrH+wXLUcI+S+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwHJ-003i9h-MR; Tue, 30 Nov 2021 06:06:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwGj-003hws-D4; Tue, 30 Nov 2021 06:05:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id w1so82243004edc.6;
 Mon, 29 Nov 2021 22:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SaBbQQ+iVbFLZv+bV3xyo+jBT6xEtsPziI/bR6Dx7EU=;
 b=LdMmUWzQUwpgiYB3Jsqofrz70Mg2+hjUZwX1PkeP+snslr299u4zFJKsCmwy3BlKPH
 XmOFMDr13mdTffrafupY7dFnZ9xzBNoj1q1mBcQ6lgkbfN0uyMbIn4x6iWtDAss7p/JE
 283xiEB+XC7v/rYMC7TdnQH83Zv/G7lg69Oa8b2SsajOMqfvRgFktQA5ZbZ6DtT8Yks9
 kD8LX9GAVIEDAJKN/R/Qwtn8H5Ysr+fnVICL4hP/Lf0uodPggoPfUn6yxSAHYY+CQuOc
 SMriiQmZ2txIKEyHpLHvjrX3kKzuPo1ybDkX6mSOaQIXpBs4C2qvoyy4oG4oDA0tIZ5U
 +mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SaBbQQ+iVbFLZv+bV3xyo+jBT6xEtsPziI/bR6Dx7EU=;
 b=MkuqfRnCOB7KNH8+A/Z2MnNtNuFlJ/T/azvxSZjRj7oh6fYjm4vVL06zG2PN1Hscnr
 KOuqK4v1bbYL+fK8jXt7f3hKCvS9iiTvuupwH3NxyhbtROyQUoWOVKg08kfkM/ElgRHG
 ErfyNWrdblZI/smLHn/GZ1xEZDTN3HVXNuTczN3xL0pU0glMwe3ADmC1IAX/a/urOXd6
 uY7VAbdLFN1aSHGqD21IzdPXE6S1QSG5+pz5l/M9PkwVnt6/IPEDGlPlfsMy759s0EaG
 Ut+VjVWYGnLL9Bm7f4/Yt7KgNB4UhH/BubgkfylOkKr7RZIm14m5+Qzx3lhISLZLK01j
 wHUQ==
X-Gm-Message-State: AOAM5329G/GRUjH1ed0CKR2wxa4eSmeJZvSdDnybm/SE00Q7xoy42ONO
 UT0ANUpzO4D2CX6gq6ULG4A=
X-Google-Smtp-Source: ABdhPJxxj43H0vVQPhE//sppbw84qhdveSuHVVjiq63kNbh0ybqpHotcemBsLl8Fv+rp5NpQwqL64A==
X-Received: by 2002:aa7:c04a:: with SMTP id k10mr79507513edo.308.1638252331653; 
 Mon, 29 Nov 2021 22:05:31 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e1sm10542153edc.27.2021.11.29.22.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 22:05:31 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [RFC PATCH 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
Date: Tue, 30 Nov 2021 06:05:16 +0000
Message-Id: <20211130060523.19161-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_220533_479757_7A28183F 
X-CRM114-Status: GOOD (  11.00  )
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

Add board bindings for the Amediatech X96-AIR STB which ships with
model variants distiguished by Ethernet configuration: models using
internal 10/100 PHY have a -100 suffix, while models using external
Gigabit PHY have a -1000 suffix.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 36081734f720..e9ab0ffe8be7 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -170,6 +170,8 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
+              - amediatech,x96-air-100
+              - amediatech,x96-air-1000
               - bananapi,bpi-m5
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
