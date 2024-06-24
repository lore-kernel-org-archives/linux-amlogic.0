Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B9C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBxvtc0o+udXvRc4PYX0C+F3nsbCFqxVFtYiiBP3wd0=; b=JWcL8AElj8EiJs
	fqZguS9H3gOUSgW6s6wRuS3MpCK5cxQJlFK5n1zxgZmJADDB88DGPviYd6FR1HnliW/pScfmOSqTt
	LsnwOUP9fC+4awntd8otXj92UElAre4CUljQQNcp8KmN+ONTofvon2KfZihuQzCOF2L8O8QpcU7PO
	5H1VbNu47mdVdSSVTzRDQ2Xb4YaogpTG+i+XWXJei1AUUNZUlagSrmLwIRo4ExkNAgiMOIsJntUaf
	m9yICvnqhj6NqRDr8Dr2KlORJCf6gICou9ofnw+KKFXZoj5qzHdmbEPfK/DwLddsvTOB9gq5Um+Wl
	NYtkF1ubXVSZopY948Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnXB-000000006FP-2E4Z;
	Mon, 24 Jun 2024 17:31:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLnX8-000000006E8-1vgM
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 17:31:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42499b98d4cso454805e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719250273; x=1719855073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk8NTSSg2UNwZSS0z8KuJvpBdS4vH/E8VAcTr6zFpw4=;
        b=EJ0770T7bNPTDmhWBl13fFzuAwIHV9w/OcGMIRO0GRCNF+wIrTcUVN+ftum2Wc9jQ9
         F8TIARtd9KsWXVoptTl2McX5Dfy12mZOYrvCht7HZ/zKLXixwolWkHNmkj5tYOZAAHos
         w2Z8sou/97Pqq5tmkdhl2zBBz3iXbd8WxuZpBqDShR6BTBpzCwzx2y5W5eYBbOtndYXL
         JPvQn0zq3Wr8HHdrFQTBs272KLsWeT0rMamAXEkwyH13QGRz99S7aqnJ4ImCWvf+k7M+
         auCEAm+W0YO/qzqJFVYe1BSJp3ojMDke534Br+57zAgdFs/5vwGvUJp4v9qxduVG8pwB
         q1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719250273; x=1719855073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk8NTSSg2UNwZSS0z8KuJvpBdS4vH/E8VAcTr6zFpw4=;
        b=RA7sLIuvxLQLsjHmUU3MukDoLxUakU/BBjDPSf9VWt6gR4L5zENiVnsqgUzR0bTmzI
         n/5iH28u9pXQHHCevUzEB2LPmwb/kpkYMv1CAJoOEcr7l6l+dcZyLRo76PBdf2zpPHZo
         /Lg9GkaGslht4vsx1EEJjhUjSQQzrSFL7E/WMbLBBJbtAMdsQMIasCONpNHLXQ8uHj89
         Cna6gWNC185LuU/8Eo6SDsShdQKL/ob2+WbaVGM2OGflmc/J7u8ni+gPF2wLUvPw4JHB
         Lnywnjod57QWuK24cYT1vtCmGVEUyHCqJNiCRl/w14mLnwbPCH4p5fhsZFrC4fPp4tQZ
         jYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFx3hVUYHRlA5IRiVDXIO7dWNF32VPdqtGjrk2CJCdS5gm+y/HrYI/Qti2MNJYVMpSTcfw8ObSLElZIdJxDiXbOeMv7jSSO81j0WRoIHqw0LY=
X-Gm-Message-State: AOJu0YxtwmyUEXXYiUxrumrOmr//kYzLbpYqEbxqBWTIwb5Dyw00tWc/
	2L2Tiz2NG9J45PVLutAqVfdwGjYgjNYEWC/1rhGa81ivrV870iFQzdZFrisaHU4N1B7jZX6ie4H
	vq9s=
X-Google-Smtp-Source: AGHT+IEzdlJ7HFwRpLJJZgautx8tzjBGUtxs5fy5hAahIcqiziqFJibaNlYJW9Zd5bqWuU4GuS++yg==
X-Received: by 2002:a05:600c:1ca2:b0:424:8e12:9ef3 with SMTP id 5b1f17b1804b1-4248e129f6fmr34103285e9.0.1719250272804;
        Mon, 24 Jun 2024 10:31:12 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e4ee:e6f8:8fcc:a63b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4247d210ff9sm183742385e9.39.2024.06.24.10.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 10:31:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: iio: frequency: add clock measure support
Date: Mon, 24 Jun 2024 19:31:02 +0200
Message-ID: <20240624173105.909554-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624173105.909554-1-jbrunet@baylibre.com>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_103114_523832_EE27BF70 
X-CRM114-Status: GOOD (  12.38  )
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

Introduce new bindings for the clock measure IP found Amlogic SoCs.
These new bindings help bring IIO support to AML clock measure.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 NOTE:
  #1: Splitting the register space looks odd. This is done to help support
      future SoCs. From meson8 to sm1, duty register comes first, then the
      reg space. On s4 and c3, duty comes after the reg space.
  #2: 'reg' may look like a poor choice of name. This comes from the
       documentation.
       - MSR_CLK_REGx for the 'reg' space (x being a number)
       - MSR_CLK_DUTY for the 'duty' space

 .../iio/frequency/amlogic,clk-msr-io.yaml     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml

diff --git a/Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml b/Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
new file mode 100644
index 000000000000..eeb268b4a607
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/frequency/amlogic,clk-msr-io.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic System Clock Measurer
+
+description:
+  Internal clock rate sensor within Amlogic SoCs
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson8-clk-msr-io
+      - amlogic,gx-clk-msr-io
+      - amlogic,axg-clk-msr-io
+      - amlogic,g12a-clk-msr-io
+      - amlogic,sm1-clk-msr-io
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: reg
+      - const: duty
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clk_msr: rate-sensor@18000 {
+      compatible = "amlogic,axg-clk-msr-io";
+      reg = <0x18004 0xc>,
+            <0x18000 0x4>;
+      reg-names = "reg", "duty";
+      #io-channel-cells = <1>;
+    };
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
