Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9977C4743D
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 01:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C5F61208
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 01:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C5F61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WBjQlj2yPNKhvyO9r4FnYw34tXrVzyPKyciEO3iX1YA=; b=c82gjHjv8hCy6j
	SEbIondmFZZM31oTttKf3BYtvZNK77V8srF/PbXDSEeQ/fwXnCt4K7SvkJCidbUv+DIyABqIm4ijT
	LG/LWMMIF/YRDD0iSlWOIN1ukJdnzNxY1UOBiUOua1pzSK4piApoW5qMm+8uFfDnc2YuToxJGFbJJ
	PESvqEfl4vI//aJfXg9wVXij//3DTRNrH7F/Opz0/eDnkIgwKxXZqVMJNmTeI4QtNSZ5dOssrMKST
	jxPJ73JTfPW4aMScJYLmV3hWEdZXyjb/NZFltDMP621ijlYyNR6FpoVYLmW2p2BxCuAVmQ+W3pWTT
	KUkoCUGoig6qDk6cDxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqn4s-00B8ga-7r; Wed, 09 Jun 2021 01:32:18 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqn4e-00B8SL-5u; Wed, 09 Jun 2021 01:32:05 +0000
Received: by mail-pj1-f52.google.com with SMTP id h16so409763pjv.2;
 Tue, 08 Jun 2021 18:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuNMncGZs3GHDbKWNjfQWlX3Vob302GR1aWzQRy79OM=;
 b=CfvIC7jYnQjz5rAmKprStBaZhx/nr7tAy99U5m6LITpLwvUcuh/EkzRqqHrYgEhXn7
 9LNNhdyneC9lMFwyWd429vLtXCQny/DIW96gbjDVyLoZWXQEaLVufMCph8HLrZ0mWy9i
 TGnhjYBPBe7nfshN1ss9FRH9m++DgtXxrJePgPf7PruZBxhl9MAUNcS4QLVpqjH7AZUe
 FkIaWSEa7REROSod+op5IYYviKnyfYuHE0QpWLS2+cL37FbNZTUBokZs1oAyFHBDEHrj
 MLtu6MCdwT/VENHDJDM90l+fgSu7DxfrlifsAIgRPMzPfmBy/cjdeuUQw+01Z630h6BI
 4J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuNMncGZs3GHDbKWNjfQWlX3Vob302GR1aWzQRy79OM=;
 b=L41uN+wR5dX/wi9s1ZBAMHTWac+B+OYYt4R7fnKSbJNM2a/pwHPD+Tb4PaYoEQv+i5
 sYcI0/4taXz9cjP4RDvv5tjb1qsD6PSyEgp2E+jvypru3O3z03ZY1FzH/R2SgDTatuCz
 L83CSf0sAqiuJWrzXkrcuTWsb3RXQBxLRtwkCaB7AKgJSBk0wAnRYq28xk8G2zqDvAdT
 kov7M6AF/gpcC0Kmzkb/DgxdQH41T/+by8RT18tm8ui8kg0rdptPKGlIHx+S5ggAE90M
 gxytKgdsME28pqbz/tHci0WlZoO4HaIJBF6RnQYW/id3rEs2277EJCj8z3CLwjas+34y
 IPkA==
X-Gm-Message-State: AOAM533DejWInqhhTC64ABwFXlmpEjMHcVdOsraxVWwD3z3fdLrB4rE+
 wKxqjYvbj9CR9nkdh9SrdA4=
X-Google-Smtp-Source: ABdhPJxGKs7mSSbDSGwey9L30wPI4VVIdKFHnVrqDnTDrV0ZhWEMLVxaqFokG5rCTR5r+O3GvJxD7Q==
X-Received: by 2002:a17:90a:fa95:: with SMTP id
 cu21mr8027656pjb.210.1623202141900; 
 Tue, 08 Jun 2021 18:29:01 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id d15sm11493714pfd.35.2021.06.08.18.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:29:01 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim3: reduce cpu thermal fan trigger
 temperature
Date: Wed,  9 Jun 2021 09:28:49 +0800
Message-Id: <20210609012849.797576-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_183204_242122_84AF66B0 
X-CRM114-Status: GOOD (  12.26  )
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

From: Nick Xie <nick@khadas.com>

Reduce the MCU FAN trigger temperature from
80 degree centigrade to 50 degree centigrade.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 66d67524b031..a9c34fee91f4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -256,7 +256,7 @@ &cecb_AO {
 &cpu_thermal {
 	trips {
 		cpu_active: cpu-active {
-			temperature = <80000>; /* millicelsius */
+			temperature = <50000>; /* millicelsius */
 			hysteresis = <2000>; /* millicelsius */
 			type = "active";
 		};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
