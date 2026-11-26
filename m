Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128F606A335
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v9dOLZuU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtWEh8ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oI9dClJjm40U7Y4GEGT74KIfypDtUb2yHZGv0ZSkIQU=; b=v9dOLZuUibCCyc2fEA3CiWVSdx
	Xt1zX/i7a406rIrLJ9keRiP1j2x/woB0S5H2QLP5Zlknoy7xur/xvBsue/kcGhEdLcp4H4oYk1Wo1
	aHJ7IoL2e5gTkOWJhVKhjaiYX89DHUJquCeCZeukLSb/oaLB4V9XtxRmQnQt4Ven9oFe4POA8fUP7
	CRnn9XYUjzCtc2/0FnUYUS/DthXPO0dnm6hANDi4MUX63SKzPg2XYy72h2HUF4yKeY4FUdPewqCTP
	zQD1KVrtREFvIhT5I8XBzDtGSOSwvWIveGprvDZGtdWj/k5pzsWSVfVa4iDqEvhfqvak0e3PIa6Ey
	XRnap2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEH-0000000EKoH-0pvh;
	Thu, 26 Nov 2026 19:34:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDh-0000000EJg7-2dM9
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so75637215e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721604; x=1796326404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=jtWEh8aeJTh9GscLSmQVJ7C+eoKwO4dVgNSfG25ZeSun+dVtJLr5/KwNr/Y+OUY5Od
         YkVvRXHuHFTJNoG1AXZm6zZpbkv/lgrGDKvCi+6hsyky/IRjUZeTrdzLo5KmNRZVvZ55
         nVZVLnU9ZUpaQG4TVgv2/2eh/KuLipcbscrRct6B75CRC188DuBmsCa/L7ta4oKxJq4z
         6QA9I9IaPiqejzNGxsK0D78Ln4I6bTYPZJrfy+Ia4CPo3bGUqPX6WcHI7QSd/JTI5r/F
         6/N2RYyws4SCRSttXt4EkHbltKoJMwutZGodLdyMcC7W9tIc48lHv+1mU4qEF5TWf5ck
         /fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721604; x=1796326404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ3xsoglCFbUSUZhb0QwwHkubepyifev4aez9qIahDI=;
        b=M1L86JUQnzjRIrCppQ2VUmDaz89cHvEMADmIZfD3R44RTig8PAepqWkrgZQ9WSW3H5
         4ETc5wFZ+fh2abvWnz/jrj5l0fwaY779a9mfhwJA17+nxUtLJ6edUzRrVQB0WLMSZbeP
         LbupjffLj7DVrOiGpAg3gGQR3fKseBm2oKCBDiM0+5nygdkuoB59wINa/5r5Y7HeNPZS
         XzwL1ef27XOU+qyxSBMph1HejrWLNS+QzDxPikV+RaOo6o9+e8zebRIwJjD0gZFhzfkH
         XGqnqa//yHyBhuuVf9Dn+zEVgzIBoIXUxeW1tQ83QJQfTnGmnaG1L6flUHjzIjwb+C+o
         1vZg==
X-Forwarded-Encrypted: i=1; AL+hErEwRQu4kM0mZwoUjBZhqrlO8osyWXmtSViVVgDG+8jHeQ4I/a1UBi/x0+h6v1ooW7/cnteagNhXIFSudQRG@lists.infradead.org
X-Gm-Message-State: APuU4Z9lrzfxOxuVZOEPY2SP++aeX0U4r2AGIBRcDiCQe7FKQ2Hh0gpZ
	uXVhu+qelDzr4g2RWbZAVdmlBx6eeDFPQTS8lkvG5hp7HtDlg5AVMrfg
X-Gm-Gg: AZFdTZfRkrcTMqdmLHHdV/iIzhDICSO1fEfzANxCvnlGUsCrkHKc5V4fEdyJpn1AEU3
	1X4uzRNOjcqLrJB5qp4xImtCwc0V81TFSAt68JJB6YPdDUErnOdpN5iZyQEooAxN1Oi5tEY7UC+
	VUwUi29YQpgnbO7NmUEL05p0vv4DQjmeJM3mntP+5oNTZm34DlYNxXzDGQ65jQrnvX94ePR04CV
	tGSeohNiWE80CbNzpAcc44xtMd3gghl/DAgLzCxKLOUIb6yGdI9Ppd316Hm9zEQXjl7EOeQxnkh
	REfasGsjPjYloF/Qah4YStKYMeQ30ximhfwpHq6Ji8Y7YPoftgwRWxVqMigSstTw1XFYxK9FD1a
	xSKYSESIxGAxkjwUhJ40ipwPA/kxTAfoA0wmTXBcTxK7mY2KYPDZdwhWT35SzmlCPwYben1KHIO
	FykQP1D6S61v9zqdn7/y3zc2FVkxTZcE2WUgMVCDtu/NKkarrs8c+W9L/nCfl4GR8ySLF2hBvMV
	JQeUVMAEvatzdAVGX3vtwQ6X/0XtKJLQvwuYgFSTZ2GXRQYao48Jse1MnKx1nne7WhOIC63HVw6
	nqgNlUNOScFrwcuImsNS2O6+zn7yPlUjbUgs01GZ6kW2YA==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr424253185e9.32.1795721604012;
        Thu, 26 Nov 2026 11:33:24 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:23 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 16/25] crypto: amlogic - Add support for AXG-series
Date: Thu, 26 Nov 2026 20:32:32 +0100
Message-ID: <20261126193241.1471372-17-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113325_712207_6B1A3CB5 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 0fb0da20e06b..08d89db14788 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -290,6 +290,14 @@ static const struct meson_pdata meson_g12a_pdata = {
 	.support_192bit_key = false,
 };
 
+static const struct meson_pdata meson_axg_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 3,
+	.hasher_supported = true,
+	.support_192bit_key = true,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -299,6 +307,10 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,g12a-crypto",
 		.data = &meson_g12a_pdata,
 	},
+	{
+		.compatible = "amlogic,axg-crypto",
+		.data = &meson_axg_pdata,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
