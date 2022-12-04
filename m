Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E84CC47089
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 18:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2WmpXKgNW2Ho2Sp6W87I5utWdjIhwdSih/ryubC3UKk=; b=HmqSEVPWSMtuaw
	XHfq/81bLakTkgvOe5PY4d16b8EvfTqicLGUT8jz0xvchIKgqmZ03iRYAi5xM6PMtdnyyZkT7O5eq
	kwd1/NnrDGEDv9Dr00KjLCopeb/3QfPc7wlGMUkiWVEJjvQ+btwBGNhMNAVS6nQ/1C/R1S/O965SK
	vYj5tATbARC23aW/Cny7P4ZcwmmHVuDNjDeZEvdnFwoQqYUL3jC0ZoJKCX8o6SbURlnK/w98Kvfzn
	3hm7tiiT+pAFK0/6Datw6udODMsd6vms4BWiyO2eEt9PW06a3YkZPkXOvM/fnZtlZgEf1rRjLnoNR
	+mcChNqWiZFXPxgwUsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tnT-00AMkb-DU; Sun, 04 Dec 2022 18:33:03 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tjs-00AMF9-M4
	for linux-amlogic@lists.infradead.org; Sun, 04 Dec 2022 18:29:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id f13so15339233lfa.6
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Dec 2022 10:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w4/E18WmIhglr3OIlvmjkp6vFsJUZQRrJVlXhfNxPYU=;
        b=y/MaX5ZO0cE3OPHHfY0RQC5DkkHWNuMMXBloy+HhZpTftpttNLVdUyeJCINV3JvSkm
         IdODTo8/NmOen8XdIXzlS0GtqzXABocwgPL3d+RjX5sR47e8NTLJ/k1dbZHCN+qlHVxd
         OC9V/4qHfEOsdWeD9/qOd18cdKxMNCIVXF1Dz7govCRYD+x19nqUWDnfosZQJVaZYTxM
         /fyJR7+ngzf8VaQQm00Zmu8g/HCSbRQuNSxSm8BeJcJvvnkeJQXfZFPx+DNGQTANvzrE
         G6c0LoOryyUOWlWAxf7Nz3mRqCfY6YcwQWEoF75Tsvv6wR1PG8xatDFL9W22KjKaUZdy
         HYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4/E18WmIhglr3OIlvmjkp6vFsJUZQRrJVlXhfNxPYU=;
        b=ayz5rarF94ckH0mRubtMCEJRZYvkFB24dq+4lmIH/nbILBOJJcuyeb5ccM3pZuvJ0e
         u4C9+HZUJuYZ/9We7yQMV+xxxQt5HM0dfT0fciPU5aVhyQuA5Ye6p1oEuo3blAj8ulf7
         LqqXC+zwo/tuS7ZMYxuxhvXWyf0oY07EIJM7mQO6Qargwj85AkHfyAhdZ/InbZw88L53
         eHjsA0lchsOxWNj3DnAE3MMowmIhmPsgAvh2PqQ+iGoLrxI4XeoRfmv2KMJy9d1SPKrI
         ayg0Yazd3SIt3dYO19oMQ4FyZ3W02A/xqA5jcOxCzppDuSIca30ZNc9KZd5DM5ISUn+g
         L80Q==
X-Gm-Message-State: ANoB5plFnwE0CJe0Wu7mDM8eaBiIm8kYSvCpSQXgiz4SDzwyMsBzfO78
	l51XqLmhop9Ftf48ZDDZLKwS4A==
X-Google-Smtp-Source: AA0mqf6WLTN3NKvWlgv+itL2kG62uh3gZCbmqZYxman9U/9BXTDFucax3P9rqr2IYUaQ3fk0bdiMVQ==
X-Received: by 2002:a19:3817:0:b0:4b4:e61f:16c8 with SMTP id f23-20020a193817000000b004b4e61f16c8mr21126378lfa.377.1670178558338;
        Sun, 04 Dec 2022 10:29:18 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:17 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date: Sun,  4 Dec 2022 19:29:00 +0100
Message-Id: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_102930_006066_478128E7 
X-CRM114-Status: UNSURE (   9.14  )
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

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index 8d844f4312d1..f65c9681a9f7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/media/cec/amlogic,meson-gx-ao-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO-CEC Controller
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f3c3e53f77..07cb85cac4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13553,7 +13553,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
