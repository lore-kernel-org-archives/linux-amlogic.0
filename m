Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47247D2FED7
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WXNJSMr7//ym7WODTQhrDeAh+1vWx3/GGn94I7YmB5U=; b=SLkkyGmS3zdWvR
	4CVljGCUFu993mwKnuMV5Wy47IvajdArO9FIUA10QP7Z13LMtQlwosTOepVpHS2fkftB1kvohQ6R0
	Q8AG3kYeLSv1wHbX/LcxnpwLTZz8zRD1LTSP2vGfY9jAleVOniJvLyzAgZnUvpMVP4P7gI/5+Qjkf
	IVizA2KX4X2ymLm8T2Tjk7Fwd8atuCERIEdjGMC8eS1wa3iMauHvTPcApHJ0S87UXGxu0rROZQgbM
	zfeB6Imogtg16yTmeEH9qMPBuWr+cxP0XOAFtm9luvGd5kNDKfcgGpLVbxE9un8IpTNpVSzyVZFA8
	VslobMov9SBedn4V+mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknj5-0000000Eo3V-3EhH;
	Tue, 27 Jan 2026 18:23:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknj3-0000000Eo2l-3XQ3
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 18:23:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a07fac8aa1so44288845ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769538220; x=1770143020; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=;
        b=XBhV8FaM2FApmP5QfxX+7A7jdBT0IAx27ueIASoy0QHvX7pU5eBKNXIYmggM14bRuz
         W3YgxzxIagmZKEvX6NuDQyg4r8J3l9Nsk1pce9p86TAchH6GuYNJe3RC10p9LdymHr1C
         KQACzVPwUR/cLkmzAt76DY2Mb0iPknBxEtxOpNSgkn6OM3SxhVf9ek1V5xSCP76CX8n1
         6ctWnNn6f9e6NEwh1j3OBdMR9tUPkEP1YgFzTkIx6vRqPoq91uFeNitoy2vUB6779gIw
         a5rIF1OdS9EkobtjipndBozIlMmlDBSnjJfKdcutMuc/FvHA0PVkNhEbCOiNV3Ktb2oL
         gZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538220; x=1770143020;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=;
        b=vc1FodqVOGYAVq4xO+mEMt8dEFLdjHdQtLpYTjalhoSeHbHTDcWdDL9a2hoqD8Gyec
         hBi6YTFKcpRobx4TyMzfmuuuzAmnUa2AhxCKuCqeWJIWhXnDRC/eMGS22Uy6tfh1440X
         rfMDHNoiOd6fxvEdJ7seehpvGLzjTJySK+QL2R6RCbz4U69w3MSelJ0c//o7rrLtTXu+
         hqfLRZnofw+NUj8G1vvt14GCViO0GSxUoFlYe7PtlI2pjYcehIqGOa9DGcI/mCmQCFqs
         56Pej7aNQRdlC6iq8zOF9F2YSDBliXNPEZImjSHgs5xvxAQSfgbWUULe0Z9gWXoaBAe0
         inwA==
X-Gm-Message-State: AOJu0YzN6orJYLUcTDuO+5KWhkEZdnOOCvj024UiIUiHqKgPR+gbrVKx
	6+VaLgno9YyRHAvtQnLsODMJS4TYzltFvv6Jon+Lhp3/T8DPDjB5v8T4
X-Gm-Gg: AZuq6aKqDrzeHFoIJmtXm3Zhnrvz1fl5+/HjhL3AUbdFUhIBwDISz89VMieNu8MIGLH
	1hEZKvmjWI2rNsjo6agLaF/ItEKb9XylPkc6dNjx+way61XQcfAU4qsP78hRK/qiFAIKY+GC6WA
	QOUY0n6sOafZwqkzcCv+1KNqhSSQ/wGoszpunPXLddQ4e/z59xoTH4+y+/JJAUG6MeegbHfdYDv
	M5jQA4hK/3pdbqTlFnlbo/n8z4/hBgVaxYILT8EJ5o0+UHRD3o/GltryTRkxlqsqYCmRzmm7qv+
	c0ahhQgdAT5Xsubl4Q4RPioCFlg9rddo8gSlpfmxka5HWNmPzr9sO4KPCmjw6AknRE5EWhYlmBn
	B4+ICtc2Fkjhn+8S7qRpB33YVe//1QjnXmk9dtxyT6RwqQR4W1iQntzKUOOGTI0YkPvLEbeFlmp
	CsTugwvda0cpA5jYto8+kba5uj
X-Received: by 2002:a17:903:350d:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a870d5a11emr26284835ad.14.1769538220491;
        Tue, 27 Jan 2026 10:23:40 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413d16sm610135ad.25.2026.01.27.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:23:39 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 28 Jan 2026 02:23:12 +0800
Subject: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference leak
 in bank helpers
MIME-Version: 1.0
Message-Id: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI8CeWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3cTcnPz0zGRdgxQDi9Q0AwuzZIskJaDqgqLUtMwKsEnRsbW1AJ7
 T6qZZAAAA
X-Change-ID: 20260128-amlogic-0d08ef086c8b
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769538215; l=1586;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=gzYCg7eQFUgU4V294MJ/J3tLEbmiBq4eX3ZoJFJXYAI=;
 b=Q4t4AtxghLx54Bs7JL9WDYzt2BKTvug6RGwBm9/o2ji5s18HIKqk+SLQR+Uf5ULhZr/nMxqAW
 rfdWaFvBwCODzsk8RoeQjtM7lb5ct9ZqvdGk9SaGcFLGksgu179QNIQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_102341_914595_91CE294D 
X-CRM114-Status: GOOD (  10.62  )
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

of_parse_phandle_with_fixed_args() increments the reference count of the
returned device node, so it must be explicitly released using
of_node_put() after use.

Fix the reference leak in aml_bank_pins() and aml_bank_number() by
adding the missing of_node_put() calls.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ded7b218e2ec..40542edd557e 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -725,8 +725,9 @@ static u32 aml_bank_pins(struct device_node *np)
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
 					     0, &of_args))
 		return 0;
-	else
-		return of_args.args[2];
+
+	of_node_put(of_args.np);
+	return of_args.args[2];
 }
 
 static int aml_bank_number(struct device_node *np)
@@ -736,8 +737,9 @@ static int aml_bank_number(struct device_node *np)
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
 					     0, &of_args))
 		return -EINVAL;
-	else
-		return of_args.args[1] >> 8;
+
+	of_node_put(of_args.np);
+	return of_args.args[1] >> 8;
 }
 
 static unsigned int aml_count_pins(struct device_node *np)

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260128-amlogic-0d08ef086c8b

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
