Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FDC3A5A7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6n9bPNXuRpeTtcxAvJP+LHOC/W1OBEJaO4jLjVtKgo=; b=CqYTgYzuZiXUjP
	H6paEo8lx5JX/Gzm0Fad8KRvJflRcIEmVg+fIc9UjeSsi7+UqDsY+DOEcInPje9mbaVCihXNKFD18
	ShK5W5Sa6ZDs1/0oV2WEMBL8DEcGqBK1416B7lmeiGO62NG8tMAb2znf7SFUgemT5+bXjI4sfdRHo
	KSyjHWiQdKG7mHI55iPSJexPm8f2Z7tBbLlciDZ6Tig3o/ZskuzA8lNGC6wYD1rYVHwRSIb7G5/P3
	uRrn9ZRUcmI5SuadOU2I1M++NffN0G8OaFPYfdxFs4i619pdKSyMJdwHd00Jb408eZ36bSlqnHWFw
	tdIoQoVJoaNPFPXwvepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ECL-00Cc8g-Iq; Thu, 08 Dec 2022 10:32:13 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBh-00Cb86-SY
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:36 +0000
Received: by mail-lj1-x22a.google.com with SMTP id b9so1085719ljr.5
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=XywpUyuyrTrwqePpx3XTlRujHvxMG+3pHb7ngR6jGsuAw17y9EdMWUKEnsrcCgoxup
         KDM1Vt/cmizDvcsSL7I+sKHZBVKGDYgZCMNuijXhVBmYPHiR/fzlyt4HnlxF3tY3a1JQ
         eWxKI/1J12krckmCiQqdM6mH7GzKnmLMLqfWXO6VHIEu9l+ehdecyfQG9ejCyIbil09n
         t86W3++/+Ncep9rUYuZd/fpMZzsKyS/HqVsagE98tdZBcKpUPCVjnDeHICHIzeIg+WZE
         xB/Fi4wZuJKEjiTLOJRGXC+imy390973op4N+9LKjDKhbWsbBGt0sUSGR+4zgepkfZ0a
         Sw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=vL80kgtMj+USqswfCBss/mbFBXNnQ87puBKU0SA3BhIBt/t0zGMic+j6dYm3ImHaHu
         7/zRnodTG1SADjY1RdCN2cYg4oP3d7ZDZzBqE3A5sVcpBvuS7IsXRP98BogBa7K+aYwn
         8o5pnGFPbVdrajEFd9NCS5aLXzBE1EvWN955+XQGbjunYh6xv6cFxxaxt8EtIDYViChy
         1vwRNgwSlUVkGzSUPxj9taJnA8LeMQ/TasFso7G+l1SNI6vZuDlARdiHEzD5pxsfduBh
         m7VYd5kj2mu90SXqneiVMNx5yG5aZvQRJJlkuNhtwFGpyyCP+77JJk0M8Ki6ypB0cNrb
         9aLQ==
X-Gm-Message-State: ANoB5pkdhEBtgsDV+Y4v47bTnw2rYDIxHaN1tzMFlRoZICR4MK4Vkypo
	aJxRlsyxTb2pZkv/ja+tinh+qg==
X-Google-Smtp-Source: AA0mqf6XKX5jq957jK+woicXsTTntfBxeoK2aGNS6zdyv/C4XbbAHE+MqylJi7c6xm66RFaiQKFCiQ==
X-Received: by 2002:a2e:b526:0:b0:26e:494a:de3f with SMTP id z6-20020a2eb526000000b0026e494ade3fmr29828870ljm.85.1670495489928;
        Thu, 08 Dec 2022 02:31:29 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date: Thu,  8 Dec 2022 11:31:08 +0100
Message-Id: <20221208103115.25512-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_023133_927441_C3A2A570 
X-CRM114-Status: UNSURE (   8.71  )
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

Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
"bindings" in the title.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/st,stm32-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 77144cc6f7db..2314a9a14650 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$id: http://devicetree.org/schemas/media/cec/st,stm32-cec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics STM32 CEC bindings
+title: STMicroelectronics STM32 CEC
 
 maintainers:
   - Yannick Fertre <yannick.fertre@foss.st.com>
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
