Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF31606A331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvxGQy6W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZSln2cO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BKpqDZJNmL1X/8wJvKpgKMRd00NxGio8oMMXLrNLles=; b=uvxGQy6WflhaXiP5S8rVNhvo+m
	RF01d1d8lqEuZKLPGKqmb9/mYGzPGk8n0GT/LJqadTZD8NM6/M1U/KSzDgfqR5zvONzgZ6JSJ1rEC
	TYs/iTalq7QWi3iLKCCfinLYFK4jtThAYO1TCLoiE4hrt6tdFA7Lw6GUbllCw/TcYun8YgobrywST
	lNYL/fukn0MQpzqcaRx6w9DyQ5ekNcPk7KpgCjy0BMp6fHUdThsq6J96PjqtwkOnOqGfNvxuqkmum
	wdo4f3/sfDW02bk6c4qoNT93WfKycvlmJjqBzae3BsKYS39bzJ0hyAOaWJUKZfa/24h7IQuFedTGr
	XORe8WBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEG-0000000EKn7-2FS0;
	Thu, 26 Nov 2026 19:34:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDg-0000000EJek-1SWK
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7109465f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721603; x=1796326403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=TZSln2cOJ5GxeKH8ZQiwX3MHzCxn4DqVEZuTHoP9z2RxzHbXP23fVvStDDmdKGsDf1
         r7MEY6Gksfa/sNQnwpCP9wA9pIayAwYPZGox/K5U0tT/EO/80yzvEyHq4TpnTvxp8KoI
         sboqsuOEFqfhxs0emRb9bzCrEAsqPyPGBdLG+7KqEJR5R+BYzLjjWXFg/hYxwLvA9h9y
         rieMTupfscxG82TypylvbXeqlZzYjbdkf+kXmjFOrpzjfu4WAEMEDQycKVrdSkIF0g31
         TbTyRaBuggIxNyFHzYZEr9XZ7sN2EJ+kUL/aQg6eB7HpSrYmClZNlwTXW/U+WZ386/Tw
         FpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721603; x=1796326403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=eUFwdMJXuuScDDu+QAaNo2EL8VVmsWxIDJdg8QivAG9fAusfqmpSiBJzw0m2sCGvpY
         ExDbpjc7335tQLP7T2kcCsJW8Rql6b6xMdU1lXVfiTEKRYk7Bhh/1LC748deHyMKKhvO
         Pf+8wUi0sWMFp/BBbKeVuVi7CdDPVmYW0K1Mfj1kzdHW9BPkxttGrmPEtY4z8hMA5LSo
         FsRi7k0h+xSwPXQaeCdAWMxv2Gx+sLYyKnhuq6oAjPnB/7BZudk/MmjmRal75CJSiItG
         /clgND/yp3wtAC2mKjdCfP7hGb+C7mUj4AzH+Ji6ygF2dVxZGmgvjwIf1UdRW+Rbs/vl
         t2OA==
X-Forwarded-Encrypted: i=1; AL+hErERrUrlyblzfVny7lXIGZkSHnIg8uutng9We+fGiHsU953YLTN3vezQDYHWJYRW8Unr1ks++3X7DK7AEhyA@lists.infradead.org
X-Gm-Message-State: APuU4Z/8fBLhJEQX1h9anfMTP4JjOgpHzQCgvYN9v5HCplpXABy6VLyq
	DPf1SYN4SAtbKDbtE2y/Zc/stvKGFr4FSqWseF0yccJYLettE2B662Zh
X-Gm-Gg: AZFdTZfTyyQS53eEqMXDItmjBEAB9y+7jv1RSf9Fts95phCZUK3jZWQu53lt8H6PRoK
	w9R3wM40dGnLF8XzkfP9BKze0We9lg7VYLNjK2lWWzB3FmTdMfhQQgkcS7VQSwQdwBs74neSZgZ
	CTn5+9VoQ60Q2A2jWL+/6EaKDYD0cS5zjhu8R6RYiaY48HQa+jnjmyJOjjPVA1KZ/5GaSV1wGOn
	0kCdJePswrCmdyrPIrNQMnNnhjF7h4e1g10iEbmhpNjMhXS9S4LFmnaN1FmgxzBHdOecP4QFu8G
	DHV4GUVd/opAaD1BxBq4n8pjqCFZLGDVZCDo38dhusNQHpajlN33pxlQKUeVIK4CfKFkoEc82se
	2Xo3EmiwCFcDUAK0kQtKt6EbjZ5BwXk7rnskQBlWwo7uVzTfPwlKY2KA/TKBGtX890N4EuCgG1z
	/Ocow3JasVJge8JtbTKm0AMvb1XsEvHgF9bnBnJACVzB+AaJmCAXqTh6x7HuOBBtasuCdg8Qpkf
	4QsFypeTB0CVFTmNarj85nzCuXBSXFT9a/fi0SrL2a6EO+w2rA1QkJpkK8RXpoHvKw+EPjsFxSe
	zKdp0YlJWlVUg4k48BquItAC21ODMJPSIidE0JZoHv/KNA==
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr392936815e9.32.1795721602653;
        Thu, 26 Nov 2026 11:33:22 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:22 -0800 (PST)
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
Subject: [PATCH v13 15/25] crypto: amlogic - Add support for G12-series
Date: Thu, 26 Nov 2026 20:32:31 +0100
Message-ID: <20261126193241.1471372-16-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113324_407647_D7E3819A 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
index f530e238812e..0fb0da20e06b 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -282,11 +282,23 @@ static const struct meson_pdata meson_gxl_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_g12a_pdata = {
+	.descs_reg = 0x0,
+	.status_reg = 0x8,
+	.setup_desc_cnt = 1,
+	.hasher_supported = true,
+	.support_192bit_key = false,
+};
+
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
 		.data = &meson_gxl_pdata,
 	},
+	{
+		.compatible = "amlogic,g12a-crypto",
+		.data = &meson_g12a_pdata,
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
