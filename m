Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43166C47092
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:02:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A3A610C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A3A610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lOzWhISKCj/qmzlOiXx4rPw+INbqD4mOmsfJ9Qvw/M=; b=kqSJmA9j2kdR5J
	KyuVuwHtX7w/mlSiwgw+92YkAFzFr3ewj2XdeDyf26eDKEle7o1zOhwBKeiOsFJramQYqOyFBpqNb
	4UTTZlxQS31KHaD55CRUF0ieR3zEELR+QYYOGbpZQnKf8+5XFsxEKR+S9tmHWGw3H7fmV9O54lZgI
	zg8ZFJ6J4IRYq4AlC0/fkTcqOHq/kxECCyKOydq+hxpA7bZJ/NTaG1DdIWoRpU0m53GJLquotXXJ2
	8t4iZn8J579ubcIsoBtZJwYK2W5ATzzesdqnq6gFZj99W6I9JK4WLJCq1D1tHPVkTBaYlVLG7MEGA
	elC1U66BsseTYp4i0ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0I9-00FUCu-8S; Tue, 01 Jun 2021 09:02:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0HY-00FTzE-4o
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id h3so7666021wmq.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8v8K0WEFQXEEpVnmTau1yLxHgljrFOj3yQnNjaehaA=;
 b=iFUIAErs8JLqTNy9uNleZtAnAx0vA6v+e75ppi6rvwxT93N87zBXVJTvl6lcU+0fU1
 ufFccw6XOvN31uymyqoPTIZmZHOhGocNwkBqunbMytlNf4R9allT16yw0hxyMHEZeEGw
 iF1NK8nYAB96iVymjwI4bpLWRDfXeiuP5wCfjBpqbYG9olK7mhw/4xIqE7FUJiyjeb8U
 OyJ6zHh2ez8RJQ52LcF9JHKE2DRbC42md67fIB0ZaTAKe8c1n5KonbIK4ufgKcFqFIow
 i8bdSrSLVfxIeN+xRw7mfMmSqwYiY/8Whm7VK+dpRFMPVYQeV7ldPU29G2WDJC8YKfzL
 9HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8v8K0WEFQXEEpVnmTau1yLxHgljrFOj3yQnNjaehaA=;
 b=HBT6St1aCNxnckEM9ozF5UNvUMThoP4mTq9wK3KKMcAGXH9sJak5raS3LIaFmrkgq2
 Z/ymdsxcQLQ68n5K+BdJb+DIEkJyN09mxh4PyPWfQ6xurO9lnb5LIeRy5ZFQkaG4peA+
 RhC4+MwM568EbjGoQcOzSWMk4YML8LgYdkumqvP0Vq4CEFb38tejn3/Zcj+9yInANln8
 iqhJYLy+mg+asboP80u+u/RWy8Kpob1XbTWRSAJqfKj3cX+SKVYPgwV9YnkYqYjXOuXw
 2nlMjIBOuJ1dvzXXYhUr15seE+sH+WdGfTeDeZWbFh+1ztgo4R7R9WofhPLEHlnWSirk
 0Ong==
X-Gm-Message-State: AOAM533xrJkhOIGy6V37sKnZ96O+u3Q6VMzaMa+yPPwHP/t7R2HjKfsn
 BFRtUwkquLYCNQ0aGRcafaAVQw==
X-Google-Smtp-Source: ABdhPJxDNxuOkjVgNefIggbTpiKRLLV2xHre6tqn1iyIf9M+pn1DShFD1K8iVmz/2E5qaPEyNU+uQQ==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr25507536wmk.97.1622538108830; 
 Tue, 01 Jun 2021 02:01:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/6] arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as
 open source
Date: Tue,  1 Jun 2021 11:01:36 +0200
Message-Id: <20210601090140.261768-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601090140.261768-1-narmstrong@baylibre.com>
References: <20210601090140.261768-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=998; h=from:subject;
 bh=9yMaHLPwe3jWkljS8fsiiW3t+WKkLEJUslG1TXLuy7Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc7olCqrUutdL0HKLAMaFWLCLUomQM2i5k6iVcw
 BQqPhYSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3OwAKCRB33NvayMhJ0XmVD/
 9C1zwhHGaNkdYGhxO1DNFGEv78p5VHlsBqsd2cZvaA1vpZQm9TjTjfaB1psyZFNF+VP/9F3Ut6IuZF
 NtU2wmoKvv4P4tqlwikpghwd9hnYc0vcVtzpLrJL9pDjqTApqPXSuzQrtmFpnMlWNgEaMSXXITTEE+
 M2DPho0YxlX9nRwP9YVSkLk6rSNhznxUSYbevCgWBVkgUGZFJfAYFQgmBzWbBVypJpjMGIkIOA51ww
 X1wMq4wZT7NwqdWFx6FYPoeOV4IHNTr3zuHESCSz/CcTCodaf81EZQt+O1TorioBrJUpERgimsakhA
 MAa2fIhPXg3ggJYx3lwsqfkyzjNBCv0K0DjGZaN6xOrmgzeR2cAFX5Yx0njg+Qi1A47zCNuPaJBFcD
 2yFU0W6Ft6f18ZxWwrtsC9VVvwRb6UJMHmC4JIHOe6U1qDE8/AfeHYWg/GiIDkholWzJT34I5LJmRa
 dog0tVFUai1GRV2jSPTtxmi6Hy8BG8YM/Bdw2N6EbxWGVBFWJd0fZ5JIT1OC+BCOsKgn0XOq5h2qLj
 NQ8ryQ9MVNqIgvA3M+0tpe2x2MCz+uUCVcm3yAZ6LcDlRGAlKdfHgWadi5PD7KmxuO05wp7Q0x3PVV
 ebrd5YGquacK19hGE18LZjGqWyRW5A8y81Y4DBUvuTNRHKgZxHS06ESN7ceA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020152_201173_457E10C8 
X-CRM114-Status: GOOD (  11.88  )
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

According to Odroid-C4 & HC4 Schematics, the TF_3V3N_1V8_EN can be in Hi-Z for 3v3,
and since it's the default GPIOAO_6 mode at reset, let switch this GPIO as Open-Source
to drive for 1, and input for 0.

Fixes: 88d537bc92ca ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index af40ba461074..e64359163331 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -52,7 +52,7 @@ tf_io: gpio-regulator-tf_io {
 		enable-active-high;
 		regulator-always-on;
 
-		gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ao GPIOAO_6 GPIO_OPEN_SOURCE>;
 		gpios-states = <0>;
 
 		states = <3300000 0>,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
