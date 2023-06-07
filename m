Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A547C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpKu63XHNT6UqUGYrRKkc+rp8noeHpzqQOEtmWOJUiQ=; b=liBxB8ladRuXep
	FCL3ckvNWzlYPVPvkq1I5rT32DxD7YHdfrsnDn00Qp+dJtC52Q5hvIxSF67fuEvHmvDLGNAuT9Ql4
	rhUOeVXbWCeDvfELvJ2JkeYgKuFItO0LNFn9+Eb/HbcI1hHvdkIAqJjbfDqD+dAG94AwmgMMN3utB
	YuQ5KeToMgJA+nLEVQWTlSWwtThBeNGfG9GscujoFkis+hbyzQr//ojs7Tp7M5a4Hr1gM78rjUKK5
	9ef8M6pfEXWhzxKY+0e3kubHP82SGWgxZfhjB4KbSu7qVjDmOAvz6Mrcl+RCBIZmnCb8NQdl7QSVL
	3r8zmmrjMlNM0sdSeWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rgU-005gyc-2Y;
	Wed, 07 Jun 2023 11:50:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rgS-005gxR-1f
	for linux-amlogic@bombadil.infradead.org;
	Wed, 07 Jun 2023 11:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PgHlIp8rd/JoK3Zjsck6JfDJb4jbMhbNb4z71Qp9U50=; b=pPyX6Y8FwWmSpPqwxkMSbW/qPO
	7NcwFTl6jRE1RKTGiGdELCjX9eJe0dgIDrJ00culWXgKhgrYkS+iVuveiLtYrQBrWEo3vogwkRfoO
	fWnNbaCPafFA0BRaWVw2+OLn0motILW7diwnsjyLTZaa0kD50umNg27NctV5HseK8hyWuHGAiwxcZ
	ydkYn1llT0CB0bd4rW0uiPjJZ2h4o3D7gpdpWKeiblCIbV6w02UhgGFvqpoFqQROszd1jCAcYJSXl
	DAdBBXVVq0ZcQYczNTJ8kDEuV7twahLOLnBXmpgD22OhYutLaoD/R1pRLHhgl7kFaHkv2NILzxnhD
	HrbYOa0w==;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qqI-0057zw-1F
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:46 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30af56f5f52so5998325f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135399; x=1688727399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgHlIp8rd/JoK3Zjsck6JfDJb4jbMhbNb4z71Qp9U50=;
        b=ayjqD12N1ZsunmZ0tHTCvpj62FZC7XZ7/JoYBF0n/d+IDas0ncxLWZyNZ27P7KGH35
         k2ikCN8lYROGcg/RcERXlcgWVQB7t18IiaTXxmzTk0pY+Xej2mH1l9+xTH9Sy8cfgdrA
         /7+GY0kAA0/OytefhHhqVP5l0VqLkVenU6vrDMEe48FFbY8hjSHQHcQ5VoSkwai6H0CT
         FmLD8LQGiQWa3M+7CmKT7sBVCpWilZmoZiLj6ReUw5YA2Mqv4cupBURlBnDDDGDGyjBe
         go/HuAuTiFZt2UGXl0MhF1WSneGVINWapW+MhyPXpV83faFfDHjEaa5TA2Q0CZTuCMIx
         gL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135399; x=1688727399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgHlIp8rd/JoK3Zjsck6JfDJb4jbMhbNb4z71Qp9U50=;
        b=f019YZl7QrTHIPFD1Iac6EtlXB4Y/FzYFZbt1Ro3qwdeVRmNPEa2Pqpd1MW9GY7B+F
         dYdcS95GnyOa1hKPuh6Cz/h3zVrbgZwCWk/7XZGIFgHBl1Ajlzv6D0Mnoju5NFECAK1U
         PaEOrdkcdkCZZun91MCbxxCN226gI8x18VZV4u3/S3nnApRDVdcxEgK4U1IC7/4z3nm/
         ITKKaUrNAqWPEy0+3abCj4ukveTaXyKZSXylZ+QGLVdKA14jUfPq85+U5s/8+wgG0geJ
         GzVxEe5FhQNV+bLwz9IVF25wC6wjXIj2mj4Nf16ZXFkM8qX3tmNhIvCjbDOkyp6lPVZ5
         wjYQ==
X-Gm-Message-State: AC+VfDzNYwINWxKqGzTA2u5Q7TTuR+j0jO4ym6ZmTEjcVSLD/cTyLzQr
	8qGdZYXW25p1QNI3FtwINZ7qgg==
X-Google-Smtp-Source: ACHHUZ70TJJP4SrzSnaCG86sHEDnrTnK9xZg/EAQTAkcqN4pK+IYpDzCj2A9Z/oXOAXYObUpKmjuUA==
X-Received: by 2002:a5d:65d2:0:b0:30a:f1dd:dc55 with SMTP id e18-20020a5d65d2000000b0030af1dddc55mr4380789wrw.53.1686135399201;
        Wed, 07 Jun 2023 03:56:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 07 Jun 2023 12:56:28 +0200
Subject: [PATCH 17/18] clk: meson: meson8b: move bindings include to main
 driver
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-17-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2v1ExfVoRjPSA8nhH9KXi+nhZZijoqLD9hcDzuwzg4E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJVq7uWY2TiwMErdfLhlEha1K68LCCHkbMA7gTs
 zNQFznGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiVQAKCRB33NvayMhJ0dNeD/
 4sg5Kq8ApucjxwUvHYp4Cpyg1G//MJithuQ5VrmaAYkNgw8VJjX5RZE149wz2Tam9Pa5bH115WziNY
 CPya8S1pIG07N4jKl7uQbBudLaAsbwfnrW5cmHe5Pzdm5JhjeqIqusCILVnoWmP8rpM2Ch+mZTpGQS
 dBflwJMCu+RqbOEPxd2pd3Efi1OFkDk7kKKHEQfVqE82P1FjTB8cktP+evFuKzXXR9R1RIARDj1GUF
 /7cB3CnQbPmvASsaKQav6WW85lgI/QiTnnnvPKAMHrbgdZcg6wqBYg/D1zq07U6pcRNiKtFuP1gtWX
 STHU2khMXfY6dT2bFvZxzn86G73l2hJ89gB20v3SJo2kCSKEPbJRWMADEIBba2zhFfqNb2QpdLuIff
 7hVqda8kAIrCTpxKkFws8D3yK7E6ZGag/G8pUGmCa5AZcbPwEneggZH79pbUQ4i5cquyphCoDyvn6R
 8Z6fq4SKIF/bEVkbPfpu1E6gp33XXglbEAyJOYIC70xXFRl71lxmeZyIGf5kdx0VDyjIjSlc1a6WeG
 dNCjioLmVdmLa1/CqcLvqeVx8GbbAUYu3AI/odg/KIJDfhRZEXv7JExZWV48AUb0DVuGx5gRVAGLEA
 5dlZuOeigUlhS2Da+ZqYdiwQl7OJmVtdPB72Ayf8BJvg4NM7UIfAzxuzKhvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_115644_098326_68292A70 
X-CRM114-Status: GOOD (  11.17  )
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

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/meson8b.c | 3 +++
 drivers/clk/meson/meson8b.h | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 1e1313991a68..f8fad1118472 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -21,6 +21,9 @@
 #include "clk-pll.h"
 #include "clk-mpll.h"
 
+#include <dt-bindings/clock/meson8b-clkc.h>
+#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 struct meson8b_clk_reset {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 2a9c4fe29ca2..a5b6e67eeefb 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -77,11 +77,4 @@
 #define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
 #define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
 
-/*
- * include the CLKID and RESETID that have
- * been made part of the stable DT binding
- */
-#include <dt-bindings/clock/meson8b-clkc.h>
-#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
-
 #endif /* __MESON8B_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
