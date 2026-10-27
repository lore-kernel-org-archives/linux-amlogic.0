Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B70606A335
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGe/AODr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gQU7dLpm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owOJweco
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=duaD0Kr9xBhKgsWlBB6hJhsmbEa8jV5tqcvoSUooW2Q=; b=RGe/AODrR2z9RnLHmjnUGZk8Ue
	SZJLP8F2tjuSF9kzgx7M2JH3zgw+jbylHpeD3iKAdwGB/yVjOTc3bjQ3VS2QzwdYckLFN/76AC+lC
	k3C2fTU0wJWgGE+b96CwoFNT9Sz/JMmbmSlhAOd/B/xDxMHKQAAXN/9QVWbWtrlCBkWkMPFIZZWVJ
	oZ9gPyJwPiobNrl2YRwlbthrsDth6kVmreMcaUtQSBFrzmEhQBtYAVlq6CqOAHF4ekT8Rpb8gCylZ
	m83mVSm77jQHh4Jhs+02oCxDCD5hU7672iGz/6CIfHqXpN6yIiM/Db/qAbLTKKQwd7UNYZooIyYz6
	4s5p122Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdD-00000004hbd-29xx;
	Tue, 27 Oct 2026 12:50:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hO2-2Xk9
	for linux-amlogic@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=; b=gQU7dLpmfOVUKmfIPN2Er6irvX
	XoBnRoLQZAwZWLQt+jkWhR0vmx/jfUpfftpldh3N1eOQeO2m8e/+hUSLbhORp6S4GjPzN+49zg8na
	YRu8pMV/ywHeLbKHkTQIVCusYM9/rpwnTe1qwK6t5G0MFH4J52bKx4UCVV50lbpjsVDMCsQQIJMqH
	+Vz+l9QW17Q9Ej/6P0arZufvaklVGMcDptnyMnf2I7EUKMK6N0k8LkHsHCSSP4JuI6szjoeC7Tlpc
	7BiZfACtaEYpyg7rAvRyDMD45q/7y/h/Qozuvu9rVK9z4d0tbQHPV/87O1UDQDhnTZ5efkr23IayJ
	GNA5sgGQ==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcz-0000000Exv4-1vIy
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:11 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ab4354db11so30067191fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105408; x=1793710208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=owOJwecovPC03Z+2qdknmhyYGK3K33nLiwV4XMWLgS4JhtB8Zjibl/HhBpYX1Z6sgJ
         phLp4qXauywRmzfyKdA9yRMxoORiYlPnmBQNYQdZpL99/kd+bp0JoavNN1y0xDJfWiig
         YeSG7Vbj8DGUPzOhYuQf3+UBLVKq11Ht+2zzDLlB711GkNvGDqjMBA4HkvyIN0fAwvLE
         gHtoBHVlgnpIl5pDXW5hSYtyl0nGb6TcOLzicYTttpamncfglLVRLa2Vz4Sznz7iznjq
         v0KoeGRxxgNOcVBIOhThjHtoxtNWJaTQSdvFd0kc4TlKXoikB9M2Ly1yvxK18icpJmry
         qDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105408; x=1793710208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=B5+gHrHf0x/Bm9ghI4i4GDXM6j7G3bJ7OR5cDz+KTkXrW7D0xv4uEio0Le1D4/jXSD
         zDszJs9AGAnM2sIL9H1Vx7CGCeNfSsmy3YgjHcC0RYNLtOxGkT53JdSfYjGyFGxV90A2
         mYV6LJDD1L+2hzFucSrDA0ONkCelvZD354nFJDtWvCM1SuQvUcNtQqhWQPeK5RL6zzXF
         tD43GtY3GNYxD/WP0oSibqOZU6wkhHjrZnuyOGpPtI2FA6IcPOusBWi5Usows4dy1zl4
         RxLJD502ADX6fuhVNzJmDuoKNfHQNYAxQ2gY9yD7ZmMKOSOna47QmRS0P+vS6uoJG45P
         yVrg==
X-Forwarded-Encrypted: i=1; AKwUvBw8YG2q/10tKYUF7MuUEZA6vulh/Vy1KDEj4HHh65PVAZNxoL6SCB9wnO3CygW3lhARL6NhqyUGkLt2E7re@lists.infradead.org
X-Gm-Message-State: AFq9FYJAmMD/9KXIA1ZYEuqtmIQ0b2D8oTbjPvDj33doBpK38U/wp4Hp
	TAk2Kr58M8FP1Z8jrwpxt63qM+bx5T3RGZJfmJzAs5G301/LQOdch7ls
X-Gm-Gg: AYBFou0QSOBrk/Li9TChMcMbnBbKmDBugJwNodH5b1gVbbCYgoQwuHFNDFWGpjtc+oi
	Aeb0j5QS6cziM+rsEQN6wyVhrF+fjzggZ28p22hfnrQeWZTHyudRj2khcbvX+bEI4rCG93JGjSZ
	HQ+G5IufZuDVJp4/cZiL0BUwKsAiQqgGHPokXgQ2pgBj507/QiL9NvfUdCLrOW0zFlVk2ivgwpe
	MYD3sEBNEeiEsohRzTS3zxFU/QLP/LEjnOjs1wukhZjGtfE/5dasFEUYEPRd8ajcvRgYYrSPD5Y
	vTWfxo8iBv4dOgYL2+0nUHv6ccVqc/hvdwrD6mKxYT49QkG6lpOi/Vx3eZrs9ABxhILmOcap3IU
	i1zzDy0yFIX7Qz9uKctCHGHE7Q4IMf3HvQz4LDPuLp+cLFdTdpKE1g3C2arR+TJWgYHXT3XOxX9
	2hEX2wwFbx9D2V+3vQRm4to24A+0xA0K/KApHcloVTfh0dqqkaMEVtMn0pf8jVfvzsLdlatsjwk
	7iG1xzRGCnB2LY3qepqePzg0ApcW0PF5NBmawaAAb5N5fMn0QDYCon+V/JTvPYpA3NVqDL7eVXR
	NMzLFKKMQZLq6UulWa63ZL8YE1hVy03Cj2LbHFZq0KWRJTGR9COMehRZ3TLc/3pUAMRqvBdRnip
	XePYvSvC85g==
X-Received: by 2002:a05:651c:a331:b0:3a6:622a:2cad with SMTP id 38308e7fff4ca-3ac6fd0c2efmr24122901fa.10.1793105407711;
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
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
Subject: [PATCH v4 5/9] iio: adc: meson_saradc: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:50 +0200
Message-ID: <20261027124954.110697-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125009_734261_C4233D5B 
X-CRM114-Status: GOOD (  10.16  )
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

meson_sar_adc_lock() returns 0 with priv->lock held, and
meson_sar_adc_unlock() releases it. Annotate both so context analysis
follows the lock into the callers. Only indio_dev is in scope in the
annotation, so the lock is reached through iio_priv().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/adc/meson_saradc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2b003fd5afeb..3c1bc2274129 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -578,6 +578,7 @@ static void meson_sar_adc_stop_sample_engine(struct iio_dev *indio_dev)
 }
 
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
+	__cond_acquires(0, &((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int val, ret;
@@ -608,6 +609,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 }
 
 static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
+	__releases(&((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
