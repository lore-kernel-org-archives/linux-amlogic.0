Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5125CC47089
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6n9bPNXuRpeTtcxAvJP+LHOC/W1OBEJaO4jLjVtKgo=; b=hlFoC/G+Fsmsau
	l9oMfPg6P7NhwtLexqku+Xm41qTuRUqQgTPMCK0QvqOJ9eYTjxlsJfvChm3CiWBNrWgkioXWmg/KZ
	MRwjf2QfMNNUKLk8moiI0RoLq8Ge5VtwvF1RogLRDz3srvzarr3QgBc/nTJMwjF/ErfO/PoLjCRVR
	GENwpWIgB0KAxLm9sRdtlEelJOnG1MHVZ8hf7napNVlFyPR4eOXCrdSxcLqoYV+myfwtgrjYYuS8P
	XoiX9LDXa2z0ranSfOiuyzVugsKxWl30JBb/i8oB2pNX7CzbAN8deije9XCpVZv2NghSSRQLYHKwy
	o6ZBVV1kIKwK92Ft16ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rao-00HBi4-Ix; Wed, 07 Dec 2022 10:23:58 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rZv-00HAcD-9A
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:09 +0000
Received: by mail-lj1-x231.google.com with SMTP id x11so20358550ljh.7
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=C9yLsR5b/Cx52mByQQifB57ckxFCXxoBQpv9fFs31Z9hQwWZdnwzn6ag5f30h5tVub
         xCF4E6N0rLWswWVuAMaOKopQCNSUkFyby4tzB7k00DtJKZ13lk32MAenHcVOz+f14Ml3
         E+Egy1LmlxDIfDRfIkZYOH3tunSAYTM2P4tLzqOocbJqHk9oNu9CevgDaXrqQcznG85P
         9PoSUkRNzDYjUa5+8FbxKphUC8GcdOo7FB/Vghu5yOAAj0BmyCdbbgiZPagZ3ud6iEwp
         NnkTIYwoiWJYzLbs1l3JPWI1eXYygn+Aeg0j+SlE2MhAo00Kf6JGWvKG3r8PjEkWISQe
         RUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=3cI4l7rLyGpBAmpv1CQK2D095Z0eDjpKUwvnrMTPnhuyug4ds+N9mErWTQD/wTc4c3
         qxy00USv70xiNzzqDpeqw1jo4rx0tXtS22lk60fN55wyCKhptEkPhjs8Q3RRvbRpPNvP
         bPvKfJ7lpPl6FJydoqMWQ5Q6POCWYozpUsTg6fisCw3VA3zrAkBxz+lzGaxVhhECtIGJ
         9d9Zoo2uj7dpC4a0ImtegyhhrwBuR7AZ6/BDE19TsxCkvW7/1VcUCW0AGTFXvPLikTP7
         mccnExOXldYNPtd6T0V6l2UpdDV9GM3ql4zb7SXdcTn7pkdyN7tJ+g7ESBYT1mjEaqqW
         L+Jg==
X-Gm-Message-State: ANoB5pnquEMx+HimOWWe6nhpbZ8dT2VjHEyCOZNOss11bWO2UXr72eLS
	iwjiQ2hzHF6fLZ9I32e6Cv33zQ==
X-Google-Smtp-Source: AA0mqf41SM4D2vM+BSmHmNdhhKcC4/vtMSw8znb1EFc9AIfv2Wzh+NgjzB/04efqO1eqlaMTQ2zZIg==
X-Received: by 2002:a2e:bcc5:0:b0:279:3851:1420 with SMTP id z5-20020a2ebcc5000000b0027938511420mr24972408ljp.265.1670408579931;
        Wed, 07 Dec 2022 02:22:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:22:59 -0800 (PST)
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
Subject: [PATCH v3 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date: Wed,  7 Dec 2022 11:22:46 +0100
Message-Id: <20221207102253.26663-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022303_344735_6AC149E7 
X-CRM114-Status: UNSURE (   9.16  )
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
