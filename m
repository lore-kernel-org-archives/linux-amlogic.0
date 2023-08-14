Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4668C001E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YslGFkCwQhmkfZ5Us9MvRBZRTbuHUOrV5mByXP9yUR4=; b=U6ZSgV1h2TviR3
	k/gSCCY3B+5P7Qyrf1rys1IpjvbSPx/DYLo5Rexly0vqTQ6ppO5g+pknBHEwLeYpHeXgaf04h/tUb
	fFEOrQPhehLFR1QIPTBKiov9lnypFyAiKBok9XHlLvziDvP65RB6U/rlFFIIuiTN/t+qOyiYAAcXx
	G645OnWkLzzQYh6qKOGG6etQsnvqpNpV9TWzGIX+YkwdQPb9f853n80qkuppUohbyAUcz3g09afhp
	SQ7rtfAbNQ85syL2VKaR0bJjB9UR7ciHuRJxr73LpXicDsYiA8DscHXxr5Zoa4LfthuSn6dX1XPTC
	PsWv6I2WssLG0vA0v9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSWP-00GQTG-2R;
	Mon, 14 Aug 2023 08:01:53 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSWM-00GQST-1m;
	Mon, 14 Aug 2023 08:01:51 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so5439724a12.3;
        Mon, 14 Aug 2023 01:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000107; x=1692604907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSi5X4VgjsCMeAaQPLcYj9iEMPItGUk1KSzbhdjTG3Q=;
        b=bbQv9RRG0KXuxqN3JdkXms9BcjPiojakGzXDRitpKClrMIKtPcFed6OVD1wPQLUBrf
         VKq7IBQArICSE89KoxmtJ9+FwNPT/sQrJAe+L8XzemW9/W/SJuF07JtD23vWvKGuHqVg
         erhVoAzfLJpQIW5CKDLuEyqHCACL6gr7gDgO1CZb0t5Os+0euVEY4EVVgUH/BfBO1AMt
         VBi5DmU7PdP0Ciw22b7yOwu7Cfh+gAkVCgsCbGf7CwEMMsGlaLQFGTgBj701H02KNgoj
         Rz4uSE/UjZMu3vNoUbdKc7JTnMOIIbZRJjeN7dZmc+k8CrHsQto4uYvAcPXnAF/4Bnl5
         yHxQ==
X-Gm-Message-State: AOJu0YxxPMkX4pjN0LZlG/c3vWhzHBuz/v0QNF0kd2gFDddto6Gb9SQu
	M9VQEl1PdrpFFryo0cq7k24=
X-Google-Smtp-Source: AGHT+IEaAODooEEvQc066LIoQt4jMjMo+rdKjU8jqDHOucWJHkabU02sFbYF/sNsPcVB7Z+X3fz7AQ==
X-Received: by 2002:aa7:d3d3:0:b0:522:1bdd:d41a with SMTP id o19-20020aa7d3d3000000b005221bddd41amr6651311edr.4.1692000106646;
        Mon, 14 Aug 2023 01:01:46 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s25-20020a056402165900b0052568bf9411sm678074edx.68.2023.08.14.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:01:46 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
Date: Mon, 14 Aug 2023 09:01:27 +0100
Message-ID: <20230814080128.143613-1-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_010150_609365_5CBA8DDC 
X-CRM114-Status: UNSURE (   8.74  )
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

Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add T7 compatible line for documentation.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Since v8:
 - Fix issues with git send-mail command line
Since v7:
 - Send to the correct maintainers

 .../devicetree/bindings/serial/amlogic,meson-uart.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index f1ae8c4934d9..2e189e548327 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -52,6 +52,10 @@ properties:
         items:
           - const: amlogic,meson-g12a-uart
           - const: amlogic,meson-gx-uart
+      - description: UART controller on S4 compatible SoCs
+        items:
+          - const: amlogic,t7-uart
+          - const: amlogic,meson-s4-uart
 
   reg:
     maxItems: 1
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
