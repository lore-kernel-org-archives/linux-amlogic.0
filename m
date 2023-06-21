Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FCAEB64DD
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaXHKgS9jXvXi1ywkRwaYdfm8Ds08ig8M33z1zkc0LQ=; b=saAhyei6DOggmY
	nFY06+/ikEeE82DR4Ch4Z0da8Oc3+S7r9ofNaCXKFzAwflwoAxNVCjY0OO4PZFpImL1t5sTKM+sRA
	3/+fS6s8cH+A1d2Id2FZuRi+1ReigkxJ0H5VltMu4O+6fBd6ZDSQyDn1yascnHmS7gv749o/tnB0h
	1e+hXn/f92jv5JE5SpUzHl6a5AP6uXeWTZ9LV84WtLJcPqna95sQBiUQ4AwIaoLQ9UYz8Lq6OCgig
	S2hbZjMr1IqcYqRu1hLfNBh/vzt0uCLYCJPz4imvM9Ca0otKRlxOdwmswT/uGRyv3hHUXUOVp10pq
	khHa088nwWh3BiENJa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxwj-00Egnk-2X;
	Wed, 21 Jun 2023 13:32:29 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBxwf-00EglS-2N;
	Wed, 21 Jun 2023 13:32:26 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-38ede2e0e69so3842203b6e.2;
        Wed, 21 Jun 2023 06:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687354344; x=1689946344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/BXWd+aXbwkUNKUI7mfSjhHzxj8tSAcMR0CS9iLOvM=;
        b=NZ8hhYMwcZuHyfmRi68LJzPw6fGgyNETxSeEY5q5PgXWj8uIfxZa/M3NVbvOzk4E+2
         BIhfG+WYWjTXurY8OI5+yE3dqqSU2UiqHzDjpMeTmMRzLlgQjmtAAIcK1WWW5Ohcj0jb
         u2GXW0sNgoe/WU3AwBXSwtVUc6uaWusRb/mfr3FLdVzwwGwTPtlygvfOScVQhCbEu/zx
         mSvpLrhlqfKwsxKfaIQlnougbZpv04cLctAqR0bJeIm7wLc9mVS5NLf8Lj6f6fTWgMYz
         5Zco78G89+qPB7FSJBdu0PFxl+EftWsM5imXTxTuey4HP84NiH430g+YyGyq7XDgpb+q
         vGqg==
X-Gm-Message-State: AC+VfDzI7t9BxQ0OtWeo90FJyVInpRVSSmxienPVsZaYFDSwhdPK8Gqa
	BynnU1BAxGTQRDqYi2DMySA=
X-Google-Smtp-Source: ACHHUZ4zZPnP3Kwl2dc4iT9x6MuYM3yLaD3z3ulFocAGM5I9b07DhZrJuBAna5D/GjgtO3RZ+DCudA==
X-Received: by 2002:a05:6808:ddf:b0:3a0:3f15:1aca with SMTP id g31-20020a0568080ddf00b003a03f151acamr3971860oic.55.1687354344688;
        Wed, 21 Jun 2023 06:32:24 -0700 (PDT)
Received: from localhost.localdomain (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id bf24-20020a056808191800b00395f2c84b81sm2114206oib.54.2023.06.21.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 06:32:24 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
Date: Wed, 21 Jun 2023 14:32:13 +0100
Message-ID: <20230621133215.109254-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621133215.109254-1-tanure@linux.com>
References: <20230621133215.109254-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_063225_803305_5D3F5617 
X-CRM114-Status: UNSURE (   8.36  )
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

Add bindings for the Khadas Vim4 board, using A311D2 soc, a Meson T7
family chip.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..8dbd65170c50 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -211,6 +211,13 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson t7 A311D2 SoC
+        items:
+          - enum:
+              - khadas,vim4
+          - const: amlogic,a311d2
+          - const: amlogic,t7
+
 additionalProperties: true
 
 ...
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
