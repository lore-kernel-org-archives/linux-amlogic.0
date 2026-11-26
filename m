Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B25D606A338
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFMhRNez;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzsTzCif
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PWf8FpdTjYFHHIQAlv4dsUEzFYhkWQ+49Rtw9vzLKr0=; b=PFMhRNezBpWlTlReUF8CzbBfHi
	1+/xK2BuP2cMmxAgIfeQ6CylQi5J0gAjNBTQCwa9u9fSCGMSyaNN53cyC3YIFXAQMf+4D6gf5WnVF
	t02LXXR0ogcTfn4/oSXyHB/j88yGPDFt/CkYrvPCeItKvmpMtNazQjTexR7DQNENdP0+veZGuynaa
	oRNWe4+H5ePTSz87xxbndwLWJG7WfOJdK9oX4YinT7LsUVLIbit9uvz9P3/6NLyvaXf2YH+Nn6phy
	166Wcjwd/zKGSyjxTIXDSsrigNx58kQC0jr/rgTf+L7HZbztDVB2CMbI4m+Z08Bj6zoe4thRbRPys
	YMHxlFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEI-0000000EKqz-0S1e;
	Thu, 26 Nov 2026 19:34:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDl-0000000EJo5-1Wjt
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4b467581b98so71735685e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721608; x=1796326408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=YzsTzCifGll4mJy0Yr763fIeIbFtGFtSdptp/r+F9GoggfP/UjneoT2wW1S89ux1BC
         72JbyZttfKTG3B8bWPbWCSAlI/tydcJwd+2FfzJaUBe9r0heJp/36THZZsiqMKeqPhSo
         3D8hCMTzDhYdXtalp79oadeJWd5MbaHIO+YMptQfzmZoed0fdSY5iZLzgAtuDsv83Giy
         mBIV2PnMNeej9zVDhj7GkRTtvG9xw/sALSA0TDlTvmo8pMQXiTlxbValHp6L0FXWVLzX
         VNJ/Wbx4+fNnu4w95Di1xDbyKFsGkR+7gbx26zNsJylVmuqX3aPwVe/rMD4TOQHvtRu8
         X0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721608; x=1796326408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=NZWlmvFq3YiUEjPb61NILNpsfHrdNj5YR9zuhPL+Kf1F/wGGo6NNdaH7gvtroTOAVL
         VkZ3NEPuKF0mEvx0oa3yV8CKsQ5lZC5m4F/vZNKpPuAQfvxO7T58jzAz9Yk+h8l2m1FE
         cDbzO762T4ot4tCNzmhCaBS8n0w21fCzpnOspeFNGWajzvi97tUMLDLIYcQG3jsyJLkC
         01/hdoMpaBc0WijTrNDAuewVcD+p6ecLyfVZAxZH8U8DMycOkfAqRWVkh3zQI9SuafZ3
         2181N438HUpv7abTq3Ngf4QXjVaeB5vtqHzagWOHK0GvROWZj1qTZfMqw6TOr6+7CW2p
         FEWg==
X-Forwarded-Encrypted: i=1; AL+hErFdro+bsrn7GGw6MG7wULkjU5oDhJO7RwDyFXhUSzksswiNSr+gSOq2urPz8M0NI20Opb6aSbTb3lckL48q@lists.infradead.org
X-Gm-Message-State: APuU4Z9q/ck157qWS1Rzk7wCyxr5fldibx5hlLLD1YuxrYDebv4e5TBO
	7Kr80USjvAo7NHEf6rGX6YABn/PR5k5bX0fI5gBkp5EciONtemiLgf4f
X-Gm-Gg: AZFdTZcPllmn0+/Z+pI5GMdKuACBpk3hybj/st2/IwpA6/rilYC+eJo4kDIfmI0N8sZ
	Sw8JMMGGmcJigo1/U/l3Lph0W3F3IuVtQFbPLO3akA1Ro649kvoT+Mt578F9rL/mrhk8caNC6/h
	IE7iyUfYLcMdsY+HVJ6lCSDAzmbBdjd/st26nEQpF0mqp/qYq1I5+SBg09VORt7Hgbp/W+uMhF0
	BIn9qXnLJ7FTEsa2GdXWqS7MRltRnvhpljf8LnWptnimLCgA8Fqslminz/uTftbXwTnkKu16K8o
	+ALf6dti7MznVOVGDfrcTTnaHVpWaq0cJzJnqmx2t+yrXc7ociLe8Popfk/3EgQgly0X345JRyY
	Zf11LQS/MiUC8ctp26lXukWDJdkvM9XbUnMqaTKyO8hTzhjBtt4zGyZ2a42C1kSSZjRI+INCFL2
	5BuO8MRNDWmVw3pqhh15qvf0lACwKW/ADA7jICnm4YIO81pXvt2QBqjAqAUqIzmJ7XeRc+2Q18O
	sqvAfd7PwmDD2CBed/icVr/s/yPpJS98liW/4bOIqCJ1j2FekwBH6BKVRyeMzfOkR822dUKKAQO
	yuI5swpCPAR4pbStrTmxC4J8lKuV43AnsRkdLThkxxeL8A==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr465544385e9.6.1795721607669;
        Thu, 26 Nov 2026 11:33:27 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:26 -0800 (PST)
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
Subject: [PATCH v13 17/25] crypto: amlogic - Add support for A1-series
Date: Thu, 26 Nov 2026 20:32:33 +0100
Message-ID: <20261126193241.1471372-18-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113329_534579_28181CC5 
X-CRM114-Status: GOOD (  10.27  )
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

This platform data also can be used for S4 as fallback.
Tested via tcrypt module and with custom tests.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 08d89db14788..3a6bac10bb04 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -298,6 +298,14 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
+static const struct meson_pdata meson_a1_pdata = {
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
@@ -311,6 +319,14 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 		.compatible = "amlogic,axg-crypto",
 		.data = &meson_axg_pdata,
 	},
+	{
+		.compatible = "amlogic,a1-crypto",
+		.data = &meson_a1_pdata,
+	},
+	{
+		.compatible = "amlogic,s4-crypto",
+		.data = &meson_a1_pdata,
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
