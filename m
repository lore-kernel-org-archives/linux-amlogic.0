Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07041606A33B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ffEucbro;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XEwH/DuH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pmJVkPvG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3M7S5MBjjvdkgC8qpbKP5ukW6VWTQ4yPMIdug2tZAmk=; b=ffEucbroYNiYb7zv6hcWAyacj5
	V+RPnJpX+g6+MHHx9oCmnVJzX2QZ1G+6UI5ofFnnLnnBy9OsnAdEohauZ7RE+Eanqg21U4NWUmJlb
	hUbRgwPrOmL7uyHkMmW+93bpHxQRYfk+l3ogL5FI1GdoGxyzzMMAAgXZqtbA+QryDfUqJfXiCcJRF
	n0S16sZJna+CGZ+wXpY+Flf+7mNKCEL/fsYoLaBh33jJOCR8t3pQiPa14YgR4Epi1zb5i2JJsS5pJ
	mgW1JeqxbAUaiS+E9rVoB4/xArmDtizlJgsBbdnKdTPnVYT7xAMJVto6X4OZBmPhiSU1h4Hd60rjI
	GSu9LuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdE-00000004heQ-2N3n;
	Tue, 27 Oct 2026 12:50:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd4-00000004hRE-0ggm
	for linux-amlogic@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=; b=XEwH/DuHo7JcM0ftbWMjMmmmGw
	hFLqNHEb+FdtkSNqjhhP4lvUfYWkNsXpNUMHtF33GE9P0ZcmfTRQKv+jGbFSaaaQrJv/1c5GfnN0j
	E329mi/ukhVSl7ZOM1pMOZ89tzYMSxj0SwPd1p/riXFhbS7FT/+qPO2RtmaHZlofi4i/+ROr0+SOk
	AjINU9/yafTJJNFujdvXku//Ztej3pb8Jq4XRQjc4gSsQ2oSOl2H9ZdyDXSX9j4z9nSnkZ1ZGmbP/
	peQ6lC7mCo1yhT0Vtq63sTZggSjXziSTGSk4IaTi/RdNrpssAhGfHhkf+ciZpStJVvlGoZAsKa3Sk
	Ryppk4lA==;
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd0-0000000ExvQ-3sXA
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso8123431fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105409; x=1793710209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=pmJVkPvGS3nLZScrjvog6mousuDpMDTIv1uvc72hDRpx6GiSPxInwd+GvdkWKWKGqk
         wqRSgRn+QR8npyKadHLCqMunwxkpqq6ZQcghhXpQw2t0Cj3gqm6DcxNtOOUorYBVZTR2
         5pEMBhyVSEEuq22Dm14VZ2h+kElCkDKlUvggIUhzjswdjwVhtHkRuI2hcYy1kkbqfEd2
         0PvHKpYjX0iaPl5DvUX1RSuf2XvtTAxdE2ZjhEG74+8x9Vvp+zXhJVZvRiU9rB4ao6UY
         Gb/F/ESn7RqLh+LiIagJFOh7kXgdawY5fic8/p5R0z7Sp1UprsOljuI6MhVeEg9OAfn3
         UEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105409; x=1793710209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=fkaQ7e519j+hEWO4Qrlr49dzrwLusXmUA8GhEhHxCXXDryVKsb6zIej/KodjqjKei0
         Ti9tvXsE7yuvcpOV4apHXroewJoVpmEbxP7zvzXPgFjM8eqZOF+2qkHA9bfisdQ2500S
         BF7MaZu0OHDVUzD3Jb6Uy4TVY5A7xok/U4tTdN9vL2TRWaNcy5YE60gZq4QBnL2SYvGz
         haUfpkAbIiiwJr529SmDJN505llNbUvbxZ/r/0/SRC9fGhQTavaOEFVCZXFUqN4Cuf3W
         eQpgZisHojH8OTQvH4/Y3Tsij4usN9n2rmlKVdhAtn33+hzez5YmkMlQEVJqnDcbo+/l
         GNeA==
X-Forwarded-Encrypted: i=1; AKwUvBxYodCqYGC3Nr+QY965iuI4IVNjeVmyQFcSzUKjgY2I7GjXzaU8u0SwUQu1ayCMPnq6RXo8zZtBQO4OrRYP@lists.infradead.org
X-Gm-Message-State: AFq9FYIRxnQLYB46OUvW7/BHYIp/K6//QKg8DOoIyxnr0XytEw7CoNA/
	OrvMO1LmtSh9K+H5BQPpQAqb6RIRXMoTCRkMahTkoDl3UvBjEDeM+U2U
X-Gm-Gg: AYBFou1I+Vp4OmGbP2qAbZHhh8S0pwOBGnGVF8tNZhpHU/97b8k2s7CwrVd17waFWNW
	E+6uZjZrzvEzUmVu40ikxxs20yhJydHaSXE/fves6YNIlKyi5CSUorfN6fCioKZoWDlpv0jPT/q
	h/WpJjDEnK5ac1lN6+YLe2Z7GXc13cOzGUxnsE2jEfe5sRXAiLzmlFTlZvmdmtwdOombnfZCLSq
	MRbtQfuRaXxGkfCT38byj68r4MbCsZzB2azZzoPQ/Q97u5Wj31ub0BS+8tGqHlxocXxdMZLVGdA
	9tKyTKJKxn3MEoN5GWGC7CGuJdj1J+JVEeA1yDt7A+vQbqZnbX2J4SLkozxQ/Yo5Ciyx5klRYDC
	98I5B9BlahYFjTAL8QG1QvnLXs3oOPebQ/7vkgA4bqkLr7psECXIdDQUBNkk63QN2s5+FJWOIlg
	CXUXzGUvwWJ/Mb7UX7DGkdHxgzEpGOyFS0UQMxP8HTwb9L+j2xRNBI910+7AS60gUqy6MYBrAO6
	XQpfgUvTWoMgRRgduePKVrbzkvMn6DTFkrwf31Nq2deRAmhEViNzMLW+AqCzA0A0CdNDoHsr/3n
	lzVyVBPMA5t+s/9khnq+PGfhqW+5+CSp3eWZhWQbkZXOpvTaAskdI4mm7D26UjjNL8kbKqpTVJH
	ZoDl2phTMww==
X-Received: by 2002:a05:6512:3981:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5bfc618c82bmr832927e87.45.1793105408719;
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
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
Subject: [PATCH v4 6/9] iio: buffer-dma: annotate the queue lock helpers
Date: Tue, 27 Oct 2026 14:49:51 +0200
Message-ID: <20261027124954.110697-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125011_660801_2B8F961F 
X-CRM114-Status: UNSURE (   9.35  )
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

iio_dma_buffer_lock_queue() and iio_dma_buffer_unlock_queue() take and
release the queue lock for the core. Annotate them with that lock so
context analysis checks them.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 1daac23087a7..b42b70e9b06d 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -763,6 +763,7 @@ struct device *iio_dma_buffer_get_dma_dev(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_get_dma_dev, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+	__acquires(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
@@ -771,6 +772,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+	__releases(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
