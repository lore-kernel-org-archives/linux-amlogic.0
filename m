Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D201FE92FFE
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zKX4xNrmYLTiEg5NplDlv4irc9irS4CSOUJbhig+WM=; b=3WzwDnjwXbzDnz
	VR2d1gok/H+eVcq67+CdWP/3yKvvY0hJ4hoxEmPYHFwwqZJIeuxevZvJiOsR5JcXUJZe9HrfSi6pZ
	p6UyEZ9ZqBQiC5Gh64CSiOV8fudoOynxrSQ7KrJbaBW36fshhzmDnLbVds0TtmOyfRk7HZ2HL9BgU
	sy+PgKliUNXPvHl4hH8vy3gzK2GBB2x1Ngngn0U4Z+vBk8gh+dusRqcfaLvGTyYyXdSd0EpVfwk4N
	36cK7JMvdXDvy+Ld/ESyzTPmWrM92I0ChYnDAbB1dwMQh1+Eg6mSk4a2IrWvi8U1m4EdJuBm6JoEo
	pr2Mh5BfJk35555+9iUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoiAr-005cuf-2X;
	Fri, 06 Oct 2023 10:35:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoiAo-005csH-0c
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 10:35:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so17236035e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696588506; x=1697193306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V91cYRIt8yJYSOx2f4FKH7CFK9UttvFj+gUpHbgWKyw=;
        b=qJ13XwKBDJJcX2kKdQSH0y5OVOZkRnfCR093cyQNEEoMr+voFPsrtf/75ne68T1mjM
         qtMOw7S+GTVV3iSp7UyhS/PCFgqWEt5C9eCo2Jbznqr94dXCpU1hRbFsEv0dCf98KEaF
         rkNMiR4lpsLc5PMkxrlkG2jwvYgPhULBOV2Tilrg1aC5H5OBmiNE4Sg9503qkp21G71l
         9bIYCjypq2ZI4We94+GTfK7XDkGq4LyhogHd0lc+4Eb41tqUmVuT8cvwz5iKAH5kvkKr
         E4Zc7kHGA3dckIXjnexZeWurWGly2HzYHU5bg86Fg9bZ+JpsbK/j37lXAaNlOTwzSk4/
         +Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696588506; x=1697193306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V91cYRIt8yJYSOx2f4FKH7CFK9UttvFj+gUpHbgWKyw=;
        b=ELXhuGV95iiEknQ4Sd+DLn/ed+8CmYTAu4WFdmiJW7bNhbNSaQeZ9+/NllwRMQ1+de
         EfnL/UStXLCckV8IVnYNUcsR3goemUJWpMlgw0aBqfTfNqC9XCApvOltDpXjJXGB/RCj
         ON1JRTwITPtUFUJNUzZsKspzjjoALXYKBRj0DaF9EQ4EZW7UJsF+8vL3jbRftI1W/I31
         L6Nga6HXMjeQebndQSg0FFXlCO7NLfCXAw6TPD9xoAfrDvms2gyMkIbEIOcdDH2VBuMj
         768Vv8JQOmvR+XkvkhEa9sh1pG0uA3iaxGuy6A8PolwQDoXaBzO2e2//A0EfqCOUfQno
         tOlg==
X-Gm-Message-State: AOJu0YyUgA7c9g8Nq1yaL3QS7MOmcZPZ9MYjbUcyYK63OBNHTKtWTDmT
	0d4v0PnGedOqULtM72TtOXpsJw==
X-Google-Smtp-Source: AGHT+IEQKHQgyycikSC7e7mcqZlld91WP9kvs3yOFJCB+Q8m/eHcWr/vhaYkfmAAiW9jIkih+kTaaw==
X-Received: by 2002:a05:600c:224a:b0:3fe:dcd0:2e32 with SMTP id a10-20020a05600c224a00b003fedcd02e32mr7104492wmm.19.1696588506308;
        Fri, 06 Oct 2023 03:35:06 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8f44:72b3:5bcb:6c6b])
        by smtp.googlemail.com with ESMTPSA id l9-20020a1c7909000000b00401b242e2e6sm5664963wme.47.2023.10.06.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:35:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add libretech cottonwood support
Date: Fri,  6 Oct 2023 12:34:59 +0200
Message-Id: <20231006103500.2015183-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006103500.2015183-1-jbrunet@baylibre.com>
References: <20231006103500.2015183-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_033510_226118_82767D9F 
X-CRM114-Status: UNSURE (   8.28  )
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

Add compatibles for the Libretech cottonwood board family

Co-developed-by: Da Xue <da.xue@libretech.co>
Signed-off-by: Da Xue <da.xue@libretech.co>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b7b0eda4164a..caab7ceeda45 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -155,6 +155,7 @@ properties:
           - enum:
               - bananapi,bpi-m2s
               - khadas,vim3
+              - libretech,aml-a311d-cc
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
@@ -196,6 +197,7 @@ properties:
               - hardkernel,odroid-hc4
               - haochuangyi,h96-max
               - khadas,vim3l
+              - libretech,aml-s905d3-cc
               - seirobotics,sei610
           - const: amlogic,sm1
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
