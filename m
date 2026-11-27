Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F749606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TsPmDfSC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QHQJTp2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PWf8FpdTjYFHHIQAlv4dsUEzFYhkWQ+49Rtw9vzLKr0=; b=TsPmDfSCSql2BMaqKKMHv6iiWS
	VxPWtDq6kFa968GthPEXOyvgly11dAwQo7bQ22+fM2aQW7A9zPKgwMSWkeBybDV1lJKSEA6zcnUVb
	E1gv2AkOdH+TqDAbYiA7YNEjNWhnq+04GxmUCOql/1tGc+5NuERXI8qeyPWauNJvG61VhKvfiIgsx
	opvPJZsqVjZqfLlkMWXBx79qC8EqZULxOpZwuR2bABEGlwIfOWzvWOe63yWo06Y0z3s8vS/9g9Jr3
	52zl+rE5Kfzr+CGISximORU70RRwWfplqWAnfTBGwxLw+arHtXOVETrY+j9d8pMMN307ejBhmaIja
	VbZ7qZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuex-0000000FxcB-2tEY;
	Fri, 27 Nov 2026 12:02:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueH-0000000FwVJ-3PwK
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6241525f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780912; x=1796385712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=QHQJTp2va/hdUo0pxZ+wBvmDjCmIzQUFAtNWjMvWA5ZW/1f3kUQIUwY66CT9IZO2TW
         4IqouGR+eTxDnQkyvIc5wiuEe9mT12oSvI/iR8EJkOCkDiUJEG6yhKOMbmXPfn9LXye8
         Jy3jvSjdwvsovwri6QrsBBiwxAdHovhrh5/fJnQm/tAL6cMyOR7Q+09a2zjjicTBV3SX
         FRayglBMch4dLmm32UckqKOpvoRf91KhkrVz03ytIskFDT1o4phtuEvYF5DTswt8M6ak
         Up8ItZdXRgLS9xYmdu0RG702y/Syoy+Mg6U0mKmpIyPVFFgE9VtMLzfvdFeBgbqEws8E
         kJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780912; x=1796385712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDAQR0t8kY5iGUVaxptzIa8OAS8vI1YyQp0Tt2BgYTk=;
        b=KP42hQbHKeucw/5Kxmr3cgPLls/tq2sMToWNpYB7gZRbUFTHa6oDkuj2i16MOcVvJw
         c3LPRbADYqupYaMZKPma/9HXtVMeRsoqDgp9cHaD+dgriSf6+tLVrcGwMJNuDsbIr9vD
         B1ngr0Q/Ht1rkp4IcCh03Ncj1uDogiEqDUzxTkMkhwhYjNLmDH+OMaBwQIrH8bUGi5Y3
         QQyyL1dyFQSnAFY2KfQT2dYATK/Eh2b/9VDWY+Cn5byv5ECSAKG5DbKnCsV8t9gSpUZt
         rhwMNKP6ig/YhKxGIvX06nAluTXI4hMi36jmzj37xN6LQWAyNv4ISioo56z6aO38FbA6
         Rs2Q==
X-Forwarded-Encrypted: i=1; AL+hErGMJ2TzGqvL8S8hkf9Tosp5cnbAqZgqPzS9wuhNdptR0Yu7k0T7k283BZxytg+t7d9t31DejAKd7ut8nPRB@lists.infradead.org
X-Gm-Message-State: APuU4Z+lEuENsL3S6pv6FyrXQ2yeFlX4ZClC8LwpCBbewJH3mhhH4CpW
	HcySVYCRDGTXl1F65vJIYbJ5ixPnm2SsJRbOzVr6rPkYIWBP/HFL5BI4
X-Gm-Gg: AZFdTZfa5TwP7GFjrFtTDzU6TsM1kWq5g2Pe/4/nC6QkKB6W4w9jT7XZzVhYE+OR0Ca
	nCc3UHi+CPfwWc9a6EmA+WaOzbW3yRwrEU0IyOw9yd7MPtPuBqtJsuBeX6F5ZQyW8AwX5RCcBWs
	oM47nMndB+68ESkSFBjj+pkeWoWuLEn027W9xiHUVoipa5t/2TFeS7l5/VTN+KoK+6eWRqRulRG
	nW92FYgN56RUX8/EL+a9TWTEGZr9ZY2ilwQ9TOYSAC1/ioXNMTG8A86rdBMrxNAQmWwBKqJ5WqM
	jN5j4B6vkRJgvVL/Hr6ZqAoHz+8JobJ5ra5rZtQ7xKi85wzEcAq9mV7M6IQAD2nzbiaPdQlwTDe
	Ygk7YbCWH12g2fgK/pR998WqdxvXmgQMmky+u/gleGc9jmY9jYuVpsP/FWIESwJzwJhXWaseiNS
	uVIDIYNzEyBapBXXMEoRigNhjJlPca/tWj9KvqSnucgSXdUnf09dWiOFTKuLDQqHGHoR9xDvuE1
	gbBEhWwXtXQ+0Nwt27pD8Lt1wEAkpuEvq6DDjlJ4QMKaVKGa7qnReB4g5J2B8wUrxONXKVbfn0D
	Ksqw5xar3+v045PHfFlGDrvwX1bDqqKIimIzpWavf5PXb3E=
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr475302715e9.0.1795780910582;
        Fri, 27 Nov 2026 04:01:50 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:50 -0800 (PST)
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
Subject: [PATCH v14 17/30] crypto: amlogic - Add support for A1-series
Date: Fri, 27 Nov 2026 13:00:50 +0100
Message-ID: <20261127120103.1532882-18-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040153_968156_5C0A51BC 
X-CRM114-Status: UNSURE (   9.88  )
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
