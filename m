Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4A6606A336
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZA5zoA9F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H8p9O/RC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S4FUjiA4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nyuhRgzeaHOUq09Hn+SxMvffSrd2IjTFm+pkzcvRyOA=; b=ZA5zoA9Fmx4G6PBUqqyQsZ476Q
	o5W4yEp1Rv8IF/bscEjC0BndjqFXL4BY5oBM5iJWT+h7j39wswU0/1yJlKSO2xqjweZ/1PMhUxN2D
	mD9R4glEMTVI/yS18V8/nV6xy4x5cK+P3j6q27zmR2tH6AjNMGCluUBEmKMCpud9fGkpt1YVW9MZK
	cvvV0X+bimNs40/rC7mV/olaCScZRAsBDN4ISLPE9zFnsCDvbR/AsORPo0oGoFKLYwY9OInioel1V
	hRhhVd+Cq7upBTn3jl0p9qV+KH0ekikIcECKbeEMj95JI8p2KfpfuSDghUJFgKQSd3Kaq7YpxIEhr
	vUE0wG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdF-00000004hh4-1rX7;
	Tue, 27 Oct 2026 12:50:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd5-00000004hSt-3B1l
	for linux-amlogic@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=; b=H8p9O/RCSgN1y1JaLjHRqRIkO2
	U1zYKsXSjE6V2ldXfYhJGpk/Y1Ur2uUqXX/OXNA+Pajp5fKbzPWjQ+v4FodfdSCkAREYI77KPdBnA
	6zukjdcduQd0iLLFBQ5a12bxNzta4jBgq3fuPmXraLpTZ0nPoOZWfcXJLlss7iA+r0b+O1tRys09P
	Mt08bm8UDuEPaPdp/A8zCQt1YKFkp6qxEN37v39c8FOQcMJvcxO0KuaO599RwzQdcOiNVTyB2kKPL
	KqqN/VkSD9EBEjpVc00cN18XgeuSgpnMyryTZWcV1c6AAuyRK2bNfoeKE4K6jPYQjXXSAAFk3MK9A
	pF4x1rkQ==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-0000000ExwR-1cvY
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2369577e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105411; x=1793710211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=S4FUjiA48a+pF81jK6FWVe0R5e/tQBlE5o+lPdxJweglgohUqsvlXZtkHu4PB7Y6AQ
         TF+jFrYPZmdnMG6eDT537dsXS7ycdBVd+WnsrtA5F2gzRIhFGUz8QykoUbYiL5sKM/gO
         GktA1KvFd8ltrlgkTJP26ZWBDH7CLwcU22W2cdJEPDQI7EZ0IhhzjEOO+RN9giyEoEkS
         Xwyc5Fr8KqnRA0RMwZaS0nJDlVDaJC6zwGO9bvQcEVe0P0OgoibhE5DvcQX8yj7xXHr6
         PpbOGmPzGq/Dna5lj/bchoMIWS5VaHBTLw3rzfWtZSoLzOqkF+28DPwmLRHA9/BltYtV
         FAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105411; x=1793710211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=XjiBO2RuRxXLOKE8B4BGK5hmQE000t3F3ML6ihJUaXxyzIGJwSFrwIuPXvrrYenxQF
         AEJEP7QCkBR31b9EKDXcRsGkxi7n7Gv4mws+BW15TGl9XigHlCi9BsXXj8mAm30LdCD0
         o36K572EI5/w7G7hpntmsbS8vc8zx1XNWXOYcg+PZQgGPi3wjhrHjDqhBT1IrfwiMXFM
         Z3SG/4EoSlnoEu8QIhEJUEmuRrYs1MtQVUsR6vmGrkG/l9COyeawD9Vv4J1HUpieLkhJ
         AXtn2ewoRzaaMZhAy8kbLQ+JLhCPB5zOcZ0TYcYAqUMnTILt1r4TXExp62NrwZelk4c/
         ZTRA==
X-Forwarded-Encrypted: i=1; AKwUvBzC6VuIfn57PXEmhtnBUW5sWqnVnrYQTDkAMieny325JHrVVNGHl/VFUj1OghLqQaTSn4OdsIlOjZzZa2Jp@lists.infradead.org
X-Gm-Message-State: AFq9FYL2srBBUq7ktGe/C4K3iBa4I4+c916+5dVwIjmaeZJ6T9Xvdcit
	x9AqHleVHsyTc10a2iFpkkW5cBgBSiDGMuoZsxLMXcb11sp65XqSXOcy
X-Gm-Gg: AYBFou2NAnQUUey9to96QXkXkqZH9v3M5arFAC1mYKBzF6qILw66svMWpcsPnk0567m
	GHuC05b/NkPiqE+VQr9th7h9R6xNZCVFNyPCrAUgr00bB1nUHof3F42mWfj1e9MsUlk8RvCV7fj
	vKCPLTEVuWTrN8/++zyAe43OjuZyw05K8Pujil/W5lp/C4BA06J7FoJUjLigkFX5mQPdw+2kcXA
	nsQWO4l+J8ZpYZIjbQ5MdxTMltM2CeCKe2ko8jHNfUP48i9ukkVnNbAiN+WCeAR4sHxez8xeF/a
	eXat2TtSWLJ4PiaYNv2usmg3TPAu2pkJyTlMvRjjRn+/sy4eLmL6d2KpHtUMhfsQ4W8ygqZ3qdv
	CnA1tz67GrvZ6tFPbTV4Ka011iBdF1jU2FpVuQ7/YSCacx066FnB4ieWYITxqDHDkJT0xz+XDVL
	Z8E+fZXDXDrXCf37xJ64rXlcvpxH/hWmG8eOBVDKf3yamxFHdGHgMAjNEW18pvZLhlH5H38RS0t
	Z6NQyT4hybxoRTqBnmkjOhoVTz2WgDj6T+OvsIBdr8s/oRphrW7+phoDB8PtFOuirrxrc7nlF7U
	pzF8+tWTcBr/KR5Yq+Mup/a+bWA434g/wREq9DK9EWMtpKL6VFtDOEo/+iHLnqQU
X-Received: by 2002:a05:6512:3409:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfb96372f8mr3300311e87.48.1793105410585;
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
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
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event enable helpers
Date: Tue, 27 Oct 2026 14:49:53 +0200
Message-ID: <20261027124954.110697-9-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125012_542722_38D722AF 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

veml6031x00_event_enable() and veml6031x00_event_disable() call
veml6031x00_set_interrupt(), which needs irq_lock held. Their only
caller holds it, so mark both __must_hold(&data->irq_lock).

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/veml6031x00.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f6308498e422..476ac3717f8e 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_dev *iio,
 }
 
 static int veml6031x00_event_enable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
@@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x00_data *data)
 }
 
 static int veml6031x00_event_disable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
