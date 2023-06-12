Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EB3C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3f0YtGRlucoXC4Qope+Vp+NsUpWzZnBpLdE/lSFuJFc=; b=RL8QJ+/Rx2vAVv
	JZknfiNYuUfySJRfCGda/1DhOwYuNVLknlKmKNA0/Tq9DNNJkl7nV+F7q6tmZXOXjheZQzIVBsA5Y
	r37hH5zzNWEuEiB4XzNuUn1wBViqP4/P9Ny2hcXZm9Fd+NgKWTH5zKuXtPeynlKadkKBcISW2Hygk
	XQAYn8sXVPYMTLUBq+jY5pT3bogF8kWIT//LXb0Tf9wdxAPkybP+TfvCNZmlDmEC+67gRBZqghEif
	ZVmDPh5N5kP1EokvjnvkcLucUX4Z1qnLz/fYi4O4hEC7vzIPp11mRj17g7UMSmbBEF1hYI7DOH0mt
	HyiYf0+5hrf/e3PStE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fHf-003gUf-24;
	Mon, 12 Jun 2023 11:00:27 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eJ1-003OaR-0r
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:52 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso42810935e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563864; x=1689155864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NrWkYN+T1PuofiMKnG6dXc8ZUYCBSKcJmUWA7/nNhc=;
        b=HaVmNbwzhpuN4CotbNXU6R1LLYIW5MoBnPU6VZXXGFuCEK9Q0AFMhK10l24Z7oE1nw
         dXFt3vHV/6QtHsHK/sjoFACpYrN7R/tACPF8XftCvHr6o+yAjbP1/T5Gb6/VziAFKSxZ
         IVN+Fs5YbwzjIXlb4+9KfNh5ZeFLyWvb8fL31GWj1HwZ22Awg5l7NJPfktBsbQxGfdNx
         xUtFNCDCffGlIp0nIJJYWYybbjU2+gfe6zVZ5mQ7X18gf2xIbO1SpHqsIMiNgbALP8SJ
         sxRK7GHPc+MGEL3jfEiB7RMyk6eP0X9Yt2HeivNuA0/HNwECYWl3JMbwOHWVobfIXqpN
         gxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563864; x=1689155864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NrWkYN+T1PuofiMKnG6dXc8ZUYCBSKcJmUWA7/nNhc=;
        b=MPc2hgDyFmu05J46VZTAXqr8s2GFcU/mTcV4/8dzzUawoIDwshIpuXz/vJfRqmgK/1
         EziBijTrFzuiyxlRKueihq+uf/d4u3hDUaD0xVXx2Vx6+LEIKQGW0llENtIiDzGMDqJB
         M1sIjYZ1+9PpA0jHNf2hoGo09GlpHkrLnaVyXRfN2lN5ASvvfMH1M+IwbvcByps8pLl0
         e1UQyiFCpo5wWFLQ1hqgUjiE6ID/dSsQvITzBPC12i3tzBr7NKfIwqg9Qnq9beI6Apon
         /qayr0nyVFgoqkFOTZtMqH+boMU2VnrtJKqYQBReKGiS9UdZXw6N9Nd5KW76cbV1ayM1
         Y4PA==
X-Gm-Message-State: AC+VfDwQWNM+CV23Qqb+J0bn0bI/53jeVVQ0pvIOpNk7XOk6IjUcNUXJ
	+Ckq+fS9hzDl33R7CE7Siacb1g==
X-Google-Smtp-Source: ACHHUZ6UbFF7XinpTrt0jXBpOVxMXkcAEgZfOmFyUIfEmeQZYaZ2yudSohukq1I9n1QgkdhoX5dpBg==
X-Received: by 2002:a05:600c:3793:b0:3f7:8fd5:567 with SMTP id o19-20020a05600c379300b003f78fd50567mr7016692wmr.2.1686563864354;
        Mon, 12 Jun 2023 02:57:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:27 +0200
Subject: [PATCH v2 10/19] dt-bindings: clk: g12a-aoclkc: expose all clock
 ids
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-10-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7gny86gEdGuVv1Xi4BFHu+2b+JlYB0+AahzkDT5GhB8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwJUlUTItdC3kUPmDRVJZidNU1HOd9NfqDOUhnU
 bzLCyWiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCQAKCRB33NvayMhJ0e6sD/
 9L2RHqJBZ/WvUasGVtJfG0CFUUkWOgmyPk/3wNkO1BBXEh3pG16D+iz8phOPtBXy4bZeoIy9yrECAg
 bFiUwZljtqSHiC2xuxI6NZZxhWtVL7a2O8REQF/c9l3Uvm6QK7QVKwAaHZ013tWz0vwXGEDwvB5vbg
 39OL+HRj3gashe6POOxBPzkHvLRVPxYJbn5ki7VXalUGOlilNXSgt96xPL3Cb7UHQGKRd2N8bpqVe0
 YFSsrd3LEVswisxTAIzkIdVYvQNtkPhH6pBRlbbI3RiaJ1N/iLU5UTF5Ryi7bd9sg5o4e4c5CGAjGI
 GnX8os6dWBlsfaZCgR9EMJr6szIRjyPlqvSN8iSeNpYdBhT7kfxhrTnRfiSIHzjVhe1Re94rzi+74H
 hOqm7JplhUOTBlT+0h5EUaUKPo9ywReTbZseoJbZbl/px/he34vURUqtFWHXi7yHVACZ+qk97hIp2n
 Z8+fa1H1gG3oAE5ebW2P19Tx0EbZDmTgT9HARMP2ryNONbEuEEq2WSSWNyZgloju8gzBB/+5TXJrf3
 XWTSI3xP1UjIxWKeBIm41DJ0iiuZl+rHFp95rfv5lEOUkR6xl8f5WbBFR6NU7aJKptewbC5ZD0bndK
 /qbPrEkrVh9LJgadhJxLHK0Fugi2baKtbZXSOL89x7kLcHpcv8G7u22wbJGQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_025747_337435_B52E354A 
X-CRM114-Status: GOOD (  12.03  )
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

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every g12a-aoclkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a-aoclk.h          | 17 -----------------
 include/dt-bindings/clock/g12a-aoclkc.h |  7 +++++++
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 077bd25b94a1..9d6eeb24ae0c 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -7,23 +7,6 @@
 #ifndef __G12A_AOCLKC_H
 #define __G12A_AOCLKC_H
 
-/*
- * CLKID index values
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/g12a-aoclkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-#define CLKID_AO_SAR_ADC_DIV	17
-#define CLKID_AO_32K_PRE	20
-#define CLKID_AO_32K_DIV	21
-#define CLKID_AO_32K_SEL	22
-#define CLKID_AO_CEC_PRE	24
-#define CLKID_AO_CEC_DIV	25
-#define CLKID_AO_CEC_SEL	26
-
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/reset/g12a-aoclkc.h>
 
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index e916e49ff288..8fe7712fb12d 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -26,10 +26,17 @@
 #define CLKID_AO_M4_FCLK	13
 #define CLKID_AO_M4_HCLK	14
 #define CLKID_AO_CLK81		15
+#define CLKID_AO_SAR_ADC_DIV	17
 #define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
 #define CLKID_AO_CTS_OSCIN	19
+#define CLKID_AO_32K_PRE	20
+#define CLKID_AO_32K_DIV	21
+#define CLKID_AO_32K_SEL	22
 #define CLKID_AO_32K		23
+#define CLKID_AO_CEC_PRE	24
+#define CLKID_AO_CEC_DIV	25
+#define CLKID_AO_CEC_SEL	26
 #define CLKID_AO_CEC		27
 #define CLKID_AO_CTS_RTC_OSCIN	28
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
