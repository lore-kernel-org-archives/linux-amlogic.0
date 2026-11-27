Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD49606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJHY+JXS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeFxbhmF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BKpqDZJNmL1X/8wJvKpgKMRd00NxGio8oMMXLrNLles=; b=uJHY+JXSqPQapL1AbCJ6r8YexD
	rbG2uQ8aJIA3trEhrPSbw6yZVd5EvDenEz8h7xyyZp9MBbfl2olivg7xw3AhiTwACXNbRNXjolA5l
	mc77YWqSsOM3tSBc2fttiW4o+PNjat6BQ+PHOoyN+TmbwT5djWfq0kEpNwC0bkaAUT/TGu3VBgJsC
	HPIhYyr47ydbYfGEZfYGZAq+J85xE+HLOhO75QKGutVlvC8ghzXobGuYaBJlyqR0yZY5XZKjsJtBp
	vYB9tnHjcYEQBxaqYCuyG9quOOL+KA4+y3s9apukL1x1u8kAcxS4tgXJjsn0A3lGXNb81r4EBtpXa
	cCdNkNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueV-0000000FwzR-2rWm;
	Fri, 27 Nov 2026 12:02:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWue9-0000000FwJV-1wGn
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:01:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so51556235e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780904; x=1796385704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=yeFxbhmFdG9rXDDQx7GfgX6buJln439Ujt+k1jgFq7UyFDe0p4BScTtTCaC7QoJJG/
         e9FVyLgqJ6dHnhwBD47ngOaTliTkM1pLRg4QcwjLg6dyyKMHDM2u5QPesDpDZQ2fusjF
         /Rt9PUY68E44dnlTDFd7Oyto42Z6ombaIcYfrYmGh/MyJYC9SYEJeQczrc3alkDSwpom
         EsYSX14n6noxbI4iYtjMMyFo/IrWgGCG5HQ7msGhTfDDrg4F4rH6SwL6S+Qxb4Bt99VF
         Gg4kM06fU7xqQtCuX9Nbdf/2jzvpishmM3C9ousG9IqKehWMgSzpZ0ht9gx8Fxb/aJ+b
         7ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780904; x=1796385704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CkraiMujrKuYrzSwo1OuAMt+g+COsPr5VU70SHz5/kg=;
        b=USjmXchKkt38Bsr4kyAlfD6r6H+FVrsDmaXy+MBUyhrYALJQTkgT+6bSKhD94/8cxz
         ea51t7oQ/0Zy9pbhFRCe5qknJzqfhj4991eHbbK6OeFXZ+jBHTcmjzQ9/4lRcLdtvHp8
         qpghXXU0HGy4q0jyJN5DAqQklYeCGedBFq4MF21sUOc1XXm7QM2iJPojNtXU4g2TMEBg
         0XgNal+da3z+ECVxKSiCwT0azMoI0THSzPPiLy3NvqQWXMXEjYLLth6tFZLc6h738IDB
         HTzCKEFgH9uUGAcVqCzI/pSslwkDwFglCd1yJfs9VpGPZf/YNNDmaF5sT9CvGgHohZNY
         CqlA==
X-Forwarded-Encrypted: i=1; AL+hErEsg5SJ70I2AUmimrajCDSGSaDTylFW18DGqJySQELSqj4Hcf+GlqvCNf/piIE3zB3xn4FBDbBPUFAvsJfB@lists.infradead.org
X-Gm-Message-State: APuU4Z+td7TbnpaAUsnDoDdgs5wejIxH1iNBTq5A5OnQ9EJJt7vNX4tk
	8hDOfQq8dnphYCAldjbeuf2rljoQY+HhdIviBc6RQC4PS74ZQwqd6wh3
X-Gm-Gg: AZFdTZc5Tme57iV5gvUG66i7jaEAwZVivhV/3oG1JoZll1dHXIE9rRHvaZMF3rop0+o
	0MbPIIPogesL8mF9g5MChyctHKMJ4JduYG23BBb8pqykfpuk1Uou6V6xDVqJTyQ5jqEoYjmYi4n
	nJr/D93HD7dJWFRtOlwVe6Rc2E7kDN81+QET4wvrDmmzLnWR6GEPdBmbwXoMfCO6MGY8gMi/mbU
	inyAY+jPVCQeJI2tOUDkVGJ0V0e3DkuJGipw+5dVn5iIYWJIvB8G09HDYbVYK299kvy/EB1uR+o
	NQBFP4ZVLmrt/T5VYsZqsVyb42kpf/j4hi/Oaf8UEIObS3EeD+tLp8lcSCOg6ezuJFmChl2Dmmq
	UPAAvZUGAv/K/rY4zyrVdNxkcH+MycY6QtkUuelQzFNibAoLVPo4ZlLY2hatQv3yKfdRtJHDTp6
	RBsRA6gnaQqVhiyHCs/rGJu0c5QI7bbuSa77PstzBpJVE9LH8kdrt/Tmnjk5tVSB+hQT8Kleolv
	pz/QRyfdFn5yOozgiUvjevCb2koreWKrbc6Y5sP26SUYV3GteCBfq7p75m5r3BSBmAbRC2JS+JZ
	OpbuN5CwODAUxi0tVJyuNvnqTah70Dt6IvDV2d2UODqzOPsW
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr505131085e9.15.1795780900684;
        Fri, 27 Nov 2026 04:01:40 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:40 -0800 (PST)
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
Subject: [PATCH v14 15/30] crypto: amlogic - Add support for G12-series
Date: Fri, 27 Nov 2026 13:00:48 +0100
Message-ID: <20261127120103.1532882-16-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040145_533060_DD59258C 
X-CRM114-Status: UNSURE (   9.34  )
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
