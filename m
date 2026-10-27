Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A07606A327
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TiDaHAdp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3wmuS3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vLrpFFdk7As3uo5f+zqt+WxJmxjzYYueUQcB/bkjg8I=; b=TiDaHAdpziRl8ZV53w7q5Iedzp
	8qS7MzrqEMZSo4hzQhdv7VUw9/1Zi2BD7dOEjb87UlcNzBvvNF+CKMyD8ZV8sNL5Tn4X+JKjOkGio
	YJThQKhQJ52rKMLrwTCng/5FWFIsZQkzFDRTqYRDpMkINRBIeZQA+8ffFiA6WylCCDz8DXUWxNtWT
	IcZSmuGL4nJ7zXtDhKEmz1bVTO6eqJUOYRmeQBpvzZr4STXfHLwaU2WQ0hhbNuVOrcABYa0VqZgDx
	iEUE4g3dfTevEAzwBkOBARC58nR3s6b/NllJudbJQ7/h+a9Z81qCumtCuI8h5U/EUVYvA8foedr2a
	UJ3jmYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd0-00000004hMQ-1N6w;
	Tue, 27 Oct 2026 12:50:10 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcw-00000004hJ0-44zJ
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:08 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3426115e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105404; x=1793710204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=P3wmuS3qvbYP5ziSmCq3iNgsnyD3gkdsfqLrNi/DnCffBq4lYIvA+p8WyX1F5X+sVb
         9CBnxet6o1LYYCOwvW6+6C4rmgFvPwqNslAaRr45XYRwkRAr9AojGNnbgFzwIOpDLX+n
         gG3UN+vmdrPUFpDxWD4StxcSSwqgVvYhD+IL+vVYT9Qn0SZBVoZIiDSokU2xB3Cn3C2f
         XZyrbhdTzRIdL3WmhK997pouZ7j/0zWYittaFx2/qyA0rfxXGEvyriR6vTDW3lc29ifW
         cM+EEvTZWXyu11VOYyWYTQG7gVsbbRstVGIZ4qZD7EoI57qk5Jos7JFmnd4PFULS8r2h
         eUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105404; x=1793710204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=kFRvqEk4pbNjU1WE0jvM8ZB8gyrV/Tj1oAKQD883/8bsmB8kgCGaiBooGb1WYWCAHu
         iX5NmzST9IMEm5MhbQnRmfms5p/El477SGfncyoTKX2LEm1PD5kAbBiEgSZrjHai44hk
         qDGCrItVN/yJtodA0Q5Xec4cEdZ441sGO6IFdIxUv6lNqsCKSkVF7K2+tBJxjoiRlYjY
         4vcXgtGipkZq+jsiVgxcacKoH8C1lwWahSAmtLYP5i0LEbxAQZ/vWNLAPQiSQv9QcVz/
         Ehaavg9ylHqP7u0ptXKCh7glIHEbQ3k2aZxSwlM9UB5NRUU2L6a34oxHL2VCPKTZAfG4
         cmyA==
X-Forwarded-Encrypted: i=1; AKwUvByG1JPQE7AqA5Uf/duJSKfKQvqE4NJbRqxzYRBsQDXZbV3j8yIrZ0cADbnVe5Z+IUkp94o1jClM48PVUYBr@lists.infradead.org
X-Gm-Message-State: AFq9FYJkwM4QBCZZ0Li+KiHQYdMDdrGZZzbf8eGFjgpXMVtRagK3wDRI
	nRYLkbUj0R1OTRhyipgwTDyz7AcAxTZI/rxDnu2FP1bify1QvUvCropv
X-Gm-Gg: AYBFou2R4gcLm1Y6xkeNhit0llK+Cnwd5O/xHDkoJwG9fUtp1Oc34cMHqkH0mNDcusC
	UxfK5riVAQtwIEuIub+kgSjb969qjM9Msbz5zm2luA4bJeQt0Ijvgbwz7OWFP6JhQ862totuUG2
	BcDIS6EnvHw/RK5bw6t6ARAPJFfi0W+Mr5LhqrqAHlgQG0rjhWz1ZaF/lzKyXlK2XjHy/wPxrbv
	PnUTqjDC0CJX1Q5jzAeL8LXQUqlB0PFooHB39+OEqM+QtSpdLkiCcs93XbvyhPFJOMRt2C9HdYH
	2ttAfTYHDjO6/iKEINc2h9OCAHrJ21KesmMZRYT6vbd510wHzKyOW7XNbQF+cuIOKQ+G7l9GHYH
	1DFcuk/c0WPLRqWjLDa9wHODiYAa1diGHpLzumLMbyFYlgLN85e/dTRTgOAmfgLr7NSC081E0M3
	I30bsaO2uj1Bg4fBOUYJVZQI8y3nbV893WQ+ayIwjEikyWvRVyxQ3DQsjMNxDY2UnxyCfMKx0jt
	a1GXXEfNjAoFrPd2z4jJNmkNkFvY+6RWdkS7ozxzDyruVpX15WeBkpgpq1bLIu4YLTgLfuZYdna
	LlMAMJk/v4ELaldZputcQlA7b8NfMnnZhNm7mBZXBHkfxMVhPv2Rpp4lRZyS0lT5hQZcGod08Ji
	psZUtEDUSlg==
X-Received: by 2002:a05:6512:1047:b0:5bc:d9de:d75c with SMTP id 2adb3069b0e04-5bfb71e3343mr3417911e87.47.1793105403789;
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Marco Elver <elver@google.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 1/9] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Tue, 27 Oct 2026 14:49:46 +0200
Message-ID: <20261027124954.110697-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055007_065809_3769063C 
X-CRM114-Status: GOOD (  12.99  )
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

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

Name the lock through dev, the same way the bodies find it. The analysis
then also checks that the helpers really take and drop it.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v4: name the lock through dev instead of __context_unsafe() (Bart),
    now the first patch of the series that enables the analysis (Jonathan)
v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
    https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..09013c6e44a0 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__acquires(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__releases(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
