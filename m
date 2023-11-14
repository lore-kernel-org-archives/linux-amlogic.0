Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29426C072A2
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hv2o4Of1VB2Lsacp1l2vlxNqF9muJmRwULTkN+FedXM=; b=JSBW60e72O08dn
	len4aH2PnrjCyBL7D2fBbeo+px2JT7fR7qmLhX9+94J8amUJaRffN1qTzBBSa6LqhFOsmIYEaw540
	c1FWnu9eVr14OLiKkqJVXNKYdXuZXkos2ZD1o2wBQS0DmLNXc17JdAOr8XU4Hdo7gA572hxhpk1gQ
	F/VXrHDbm9UHOY/dO10iPkZ9egvIM++fKAG55ehSxmXBLBJGz38Tku3X905ftzfP1tOo3tAdvLc/J
	AwN5KQwG63zgkwYCxQ0o44GBMhZ4BuVq2feKoQJMLmpBaY0oAOaCM8qLMzXh1vOXh6OvZ2VF9cArv
	V5qD9M5bLTXaUT/knbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRa-00FYhv-2s;
	Tue, 14 Nov 2023 10:14:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRY-00FYgF-01
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:14:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so3737697f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699956890; x=1700561690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRDQG90whNGruPKHBuSb0fwlNjOLqK156tQl7yY601s=;
        b=Nt7szbSeoQ8X4CZbhI+BZS8qdJo96KJiGoVbTaXHoBAGnSQSMfvx+5zdCEd9CTuKM9
         +2lhPSc8Q4/kGhQeLfbrRMwlgvWDzeIaFn3x/u0WSwrAJdsiDguUDhPOmeBS3Ai5Uxaa
         nfBlZcFwlLMbwU5sgN07xhQPJcX4x2CYjovJuyoN2sxB7NR5MFEi4c0mQC6CK+aqovwV
         5EbeRd6yBQbtpcnGc812vJkxyetrypGwDQiAU+hb21RuUv/bpoEwodyqHpXd1oj/nRq/
         7MjmiE/gzSdATjtoW4mxHk3BtVxsp2ZsuW+GJ0EsLwUStGsI1qMaIru9mp3euVQKT7tm
         xeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956890; x=1700561690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRDQG90whNGruPKHBuSb0fwlNjOLqK156tQl7yY601s=;
        b=JXPJXOrZXeYl7sy8RYH98Ahh5z5flIoUOfVBX48VtfNzifL6H2jqFH7fFgXWtDE6ue
         0ic1LJtQHH6yJwE8LKnrz1KkMdJOQk/BB1tRtmOvn376lmoFjWlOSVEFraQzBZm7M7NX
         9vYZZ649J0S8jhLUdyW2bWKbVb4XagSChR98te5y7Y1fsmCYY+5mvtWPrbrc29Mmgxhx
         32BPmEJq/I+dTSazC1KY9denVpm4rvvFHppTI8pr1bJ8UdjTLIlOcaDmkP69TludWJUQ
         2boijVZGcNdmyXej8Y9UYUGMXsrzUywvseO4fNh1WDo+/b6/YzjXF6YX3B39IZf4ruXc
         ITdg==
X-Gm-Message-State: AOJu0YxQsfQN1GKt8Ov1w9H65P220eDaskMCOzfw1Z4FMO+2gFP/8QSD
	277N6JVb0rvRg7grMeUY4K6luQ==
X-Google-Smtp-Source: AGHT+IHmsBNotjLNrikShfJJvLrq11qapucSps8g7MZLwa+tjWVJJCpV7UxEKCvxDB7DcdqG+/7Vxw==
X-Received: by 2002:a05:6000:146:b0:32d:8ac4:d23f with SMTP id r6-20020a056000014600b0032d8ac4d23fmr5433225wrx.29.1699956890236;
        Tue, 14 Nov 2023 02:14:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm7335585wrq.14.2023.11.14.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:14:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Nov 2023 11:14:43 +0100
Subject: [PATCH 1/3] dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI PHY
 clock ids
MIME-Version: 1.0
Message-Id: <20231114-topic-amlogic-upstream-isp-clocks-v1-1-223958791501@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=831;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tPtJJ4m8r/duCINFRVQmq1vnhsfEoL+l4IqBBJv4OFw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0iWrW3bJixBh86isYE3uIDZg0edHMEQSNsOH/tr
 2wGdcu+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNIlgAKCRB33NvayMhJ0anlD/
 wIbIB19tLkjnhKjUpQ6bxJq1f1aWQ1KhjVUIpQ7ASlwxyFig16JMn8WUBIGhvjnLWqfSzl35us30L5
 UHO40qf3vj4ZRTwjEeJ3+3ut4Ifd1l+a/DZa/r7sLT2nO4PYBqjdoGhLCEmjywyah0a4yTosnqOl49
 uFPChwRBc+gB8t4179Ew79CaOQVsDj5V0HJ9e6YGHfprV9Nkbcb2PvTMja93Yd/aaAl6xE0Bq+TYaT
 1ZiKTkPqmERwpBQTCQObCQXk5vnK8RejXUIJ3zkn/hk65BRFDilS056YsYn9N9XePaFdwfZEc6RJEo
 xj2TwDruehIwRanthgjnlc6k1+iDL3PMLe770Ghsr1Zd2A3o28TnSVIMVX3Oy5IOPQ/BYQ61Ykc0jW
 OcgcsST7i+BXnFDHh5VBlAd3wLNq0zxB6Y0kdrUJYDmu///jxUzvauhhu+IR9f8PYqxwZ5QaAA9aSh
 SMbslJdDNd24tNIiV49IVwkkaqmpZrYznVlkPnh6cizZUoQVK9LSF465viJBIEHSHSdDeg0WTDBuEa
 roceDDkzbDqH+9M8DhE+Js0UK0ZytEyXYARScxFh5buD5wrn2reCjg2camoSUyMElS2/0mUIo6DufP
 UwBTTgQ1X/YGXn2w8rdLdKWQ3qvxkd9LKURzAVJTXPmCYaFxEAv+b/snXHGw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021452_192915_011AF9D5 
X-CRM114-Status: UNSURE (   7.84  )
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

Add MIPI ISP & CSI PHY clock ids to G12A clock bindings header

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 636d713f95ff..fd09819da2ec 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -281,5 +281,11 @@
 #define CLKID_MIPI_DSI_PXCLK			270
 #define CLKID_CTS_ENCL				271
 #define CLKID_CTS_ENCL_SEL			272
+#define CLKID_MIPI_ISP_DIV			273
+#define CLKID_MIPI_ISP_SEL			274
+#define CLKID_MIPI_ISP				275
+#define CLKID_MIPI_ISP_GATE			276
+#define CLKID_MIPI_ISP_CSI_PHY0			277
+#define CLKID_MIPI_ISP_CSI_PHY1			278
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
