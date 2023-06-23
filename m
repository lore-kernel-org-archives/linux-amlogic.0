Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0CEC001B0
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaXHKgS9jXvXi1ywkRwaYdfm8Ds08ig8M33z1zkc0LQ=; b=cOFJRuSFGnBykS
	SMyDCY+z3Xb7V0tR1RUn7V1qblCoqMMkLj5CRwq2QfVmi3olb3Gy4FyFYaQX4TrYiw5FAYuzkDwbT
	YLdXCf4LXg0skqjXG1wATgztgbbEsMsxmNsxtriz1CrCL9SEA0MYVHg/8gba6ZYGMhL3n8SxvLgMe
	ob1AiVjNEFEaUs4Uk3XIftUQPBnXMsGCC9us/U0Rlyt6MK/dnmHw5Deez64eZM+6SBxi6/TZzB3gf
	X4Im8Y13Z8hYAswI+0frCq82wqwqxi8prLopsyqHdXWRPH+igvEdpXkGQPX6+43p/qw/GXNiZnCAy
	zK9mGuEamSO5gV/3xsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuX-002t5h-0z;
	Fri, 23 Jun 2023 08:12:53 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuT-002t2V-0n;
	Fri, 23 Jun 2023 08:12:50 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f85966b0f2so348111e87.3;
        Fri, 23 Jun 2023 01:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507966; x=1690099966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/BXWd+aXbwkUNKUI7mfSjhHzxj8tSAcMR0CS9iLOvM=;
        b=jhCVkvZDjVsV/2bv1+AlbmpzJbXXwM25vOE0sNUVa/THSHsKf1kjCKWaNHjDJ3mv5J
         +HfjC6Aj6FTCfOM8cMW6L5Iz70N3Y2hQXthqHW8ElJniiMBksSrYzqjzVe2nF8dlBqpt
         ksjOib6QgPb2JZEoV06A+eH0rCw6Eq3FiheA3yN0K2Ve+SDe3BlEc6mpTe5MCYwdj95B
         L4428qNZ4d7xqSSjpqueMsQpKHDFzDNKuuNgAHsPG3dFMclk6E+rjhd6vS5DZAHcxsLF
         CEveMaIUwpBdgp1xqkFXmc8NbADG/+XgCQy4erSM7MaDqqOdwxXVp3kpIFpRqGTFYyF1
         SMDA==
X-Gm-Message-State: AC+VfDxM6Jl1ivP4umE5CHdlbdjLxaWsof0MK3meDjbNSu712yFrh57W
	Nuq9jjoBTEP7bi2hkyVAqu0=
X-Google-Smtp-Source: ACHHUZ4ck5IbQ01mdf/Ix/HFvSnfENX3i8B4yUMTbBumPBiunLk6yqstbrgqlT6rHg2SlJAMH3vWJw==
X-Received: by 2002:a19:7708:0:b0:4f8:770f:1b0b with SMTP id s8-20020a197708000000b004f8770f1b0bmr7889691lfc.33.1687507965493;
        Fri, 23 Jun 2023 01:12:45 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id l21-20020a7bc455000000b003f9b29ba838sm1594141wmi.35.2023.06.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 01:12:45 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
Date: Fri, 23 Jun 2023 09:12:39 +0100
Message-ID: <20230623081242.109131-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623081242.109131-1-tanure@linux.com>
References: <20230623081242.109131-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_011249_284214_549A4D06 
X-CRM114-Status: UNSURE (   7.16  )
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
