Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4352EEB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 07:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mlnbXFFPH+eBqzxuJBWcXb60NDuCM098NUj+Di09MU=; b=PEKFR+4Z9dda7f
	HUeyTsAKOAD2p3C7n0cu0JPksopQuRrIYPo3Ngw5Y6EZ0F0Yy3D19VHmUJgttU+9DnSKNprEvyWaU
	cMqvUsLcfHz5I5JaAR1FNxkt/lRZo5qJospC6T/Xi6xBYGmk3Sd5FTeUfNBGH+2fl3fWD1olPOIpZ
	l6RGV4EHALnxojd2/NyG+VJVSfIYfGofF5Fx7VlcZdhg6brJcY+iAkJhC3eCxA5DdwgMAOopHCpRS
	Ex87G+ZdHG82ClFJwyhYdjOgy0g23mT91fU5fpRknPgEA8As1nwaO8yYJrFOngfpn/ZeQleByPXrb
	o1VtVnc+Fy31FMHpyMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAg-000DCH-29;
	Thu, 29 Jun 2023 07:34:30 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAe-000D9r-1q;
	Thu, 29 Jun 2023 07:34:29 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51d97ba7c01so390056a12.2;
        Thu, 29 Jun 2023 00:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688024063; x=1690616063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ4ox9zZfq6KQM/b5bg29ZlihQTwce7dLHJXfPOkyG4=;
        b=WKDpnyBba8/B1VETMs2adNrTroYe79U3NvH1K5TMbEQ3xSJ2hvptApedogtDBxL8YZ
         2XMSx6vt/iHrggoeluwQLscYiYBotUPsCXi/WwQTc7+p84nevZTce4prpEO7akLUIDPZ
         MKpXUq5eMUFl7SmJNJiP/Y/1Byz4iKk5P63QruUIx53CUYPtJzyHHqIiXmEZKaV2LWcY
         YQUebuxzsY0Tkh3wD29DtarC6KZTQ59jqQdHgpyGvrk8FaEp3GiPEMC7WtRB3F5Ksy5p
         aB6IUO5GtPDEAAHdLi5NudgKNyKsJCqhW+ddF0Wr4Ll5V5qzRWHCpC8ahEVx4OHMNHA9
         mnOQ==
X-Gm-Message-State: AC+VfDyuZ3PnukAvLZCBMeew0VI+mqo9wVQTzYIuRcFiGHIThkGVVP/L
	K46FYNdCo5xkruW75aGxhQ0=
X-Google-Smtp-Source: ACHHUZ5ZWSjPN0NrgQepSKQo3xSVhg4hRbqN5hNVmCYj7p5kdjKL+k22FpEd/8HjjJgdz7L8YI5FnQ==
X-Received: by 2002:aa7:c685:0:b0:51d:d2c7:70e3 with SMTP id n5-20020aa7c685000000b0051dd2c770e3mr1922641edq.42.1688024062591;
        Thu, 29 Jun 2023 00:34:22 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id be28-20020a0564021a3c00b0051bfb7de166sm5453716edb.39.2023.06.29.00.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 00:34:22 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/4] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
Date: Thu, 29 Jun 2023 08:34:16 +0100
Message-ID: <20230629073419.207886-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629073419.207886-1-tanure@linux.com>
References: <20230629073419.207886-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_003428_604081_9A9EEE75 
X-CRM114-Status: UNSURE (   7.14  )
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

Add bindings for the Khadas Vim4 board, using A311D2 Soc from Amlogic T7
family chip.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..f5c51dfe4281 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -211,6 +211,13 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4

+      - description: Boards with the Amlogic T7 A311D2 SoC
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
