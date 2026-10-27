Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972EE606A331
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qe0x4+6n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NhI6vfe5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sa12Qq0w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cYgJB7uAvm2sChDM67g3QNBKWHL71n2XnbEJvMJ8MSQ=; b=Qe0x4+6nuzTrJJZhuoKIGHJRhW
	w0efhaRvU+mbeuOb7rw55nxUEtI9IbTkVT74QdmzxUlTAToh29rXvHkO6Yh4MyJdvQ//+U0sMKOOd
	R8883tcNfZVSnQbl1OzOf3KwClBdyyu3A6tL5NnuBnoy0QwnB+zsEMBeauGY8SKGx/vGw0ZlvO3Ef
	02rXJW7bWukK7fm+IkNoipAOdvEV5uTEWA3JWCpOMC78PoZi6vjCUQ+GTdO6w1f2HVk07PUfA0f+e
	ohC/dJhp0yPxLyEMrXIrKMclaTJYQSMYmCEok6v3gK63ZQNON4/82f3BYls9O+c6lcBLms7ulnWut
	/VIiVYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdD-00000004haP-0ORu;
	Tue, 27 Oct 2026 12:50:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hNw-2YEM
	for linux-amlogic@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=; b=NhI6vfe5USD8AeeqhcLWYPukWq
	lXg1iYVsZ33Zz9FnhfzHSK1PC6KOsBcP2Mi+VNhH36gLdBmtZsMEHBwoAFZVPLvrnlfKraDz293I3
	tsiYKotNpmro6SlHICrwHTTH+igQosuoozhO4DLJ6Y/jI8FQ8Hy9bO+X+g+3xxsUSlOfblwJ95dmL
	u8QjziJMjgwLcbnHW1kxTcXH25dEIFWMVlKEfn0BXXyBNdgzPf3V9GlLec1HS8IvFUuEFEQOb2seU
	nakxkzqDDjMuXylEllpXegoqQGst4E/Q3bV+F8HIswrVaNBm+VkuTbbSW2DNW6XrguGVwEWQmX2Mk
	VPUKfbyg==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcx-0000000Exto-0wpm
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:09 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so9634231fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105405; x=1793710205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=Sa12Qq0wt5Zwa7pXK8J9C8el/gvbXhIxdpYifiO+Z5/XUnNkhfPiUqLVESfUPDxFKU
         j8bx5pYl3a44LwyrommfHTaXIQWQNS9E06XYRAbaS32iMCp88KfTBOZYDokmRxq/X3YY
         JJE/oDgt7zfROEtnU+C4tblq1U5sV/rkSMO8lPQ8S4TK52DCaUMoEFAdOLFBxQEOY/j4
         52L7+JYEKQL3Hb2yqM3BMIsSSzyEyquOespk4Sc/Nsc2TN1QcZKZrEIPix7j+iN/CQW+
         WhXEUxTX8sjbIDhO5v3inw3qgT0yPs5106/DmtCueKpa4o+k287iZK4WlLnjRTrFY4NV
         XxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105405; x=1793710205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EOmMLjMAFJxyM/LPyWQT2i9O3ojzkNgFK3nKjeDrayg=;
        b=M0xo8lDnAzZfYZjW9+YkUt0sbvxvPafxBte6zCzILdS0k8yImUmKaL7Xp26q+YR6bv
         ZAoY3WudBBpdkSMXnOiVLzom5lZuOaWiM0S2yMy6gfm3oyjsxSQa1FnTzabHJANwhLPO
         4SXh+ImLyhYIeh6iMCJga2qUz8R0f3WjcI1WCunuvwnoxl6geRj+uQHO8d7XecBynUyf
         RLoWs3XnOzQjBN18udGxVeHNENcM5+dxwMvBQtIqpEWYUqCdUohgSDIn7pJK8l3GJfkn
         Dwc9MEEz+YoKpluYATB6WUHwMSuo7LU9RNtac8zW5tdq8IwFnl9tpiKH02BTHrNayt6c
         oFZw==
X-Forwarded-Encrypted: i=1; AKwUvBxgiyVLJJl2wItAoQfefJ8KPFbRlgoLBFDIzfKyrX5QEZb3KE6Z/7eWUQTGgHMgfXGuxQIWoG0uBcAg5ZN/@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5CH6+wCuib6tco+eHHcvSNhTWzWvz2spQYxcEhXNParkRrMOO
	CeeZxF8HdGBIwqlGJcjb3REvS/vCcDvemYGNYA8JmQK2w5+7D/8/kfKF
X-Gm-Gg: AYBFou3YN4qLNnfrHMO1REHsv01hqUWK7xS/5bwLPbRMa8/mlIAEX/cD8uA64So47iH
	vAy8B8Dbu2r4W5y9wrpdk4Wu1XH+LjzvJ3kcAazFRm+mPvx+mg7AOBMPQTZ+msfMbiplsp8JGWG
	LlSs/krW3Z/Vp1DUHGO/HSyNyWvilpGz2qxUw+FCpRZ+tVFGXYccINIsw+arHeVE27B+KNSG5Um
	XxlSxHrhiQEIg8eKLP9qZ35R9Ac4remKr4PB3GLE2ekhcbMEAsyHwbzCUM2wQ0wOWLdc1J7+0df
	f3a3kjTruM7ycqWbff2rsc7hMw236F43PbjjvGk8uvkXAbiQnu5EawdoXNW/h1W4me76nVMhCir
	08MQS/UlZ4oYktfUG0eb6MJd8gWVhqMNrTR4tVCq01HLU+vKWlQ6YfEo91twvYkK+gTx2ZQbpqR
	KxK+qwGQcPqPpLC2/o6smL6teX21+JdMU6+ydlZJtcCs7bAm8jpNY0xgWcf2tIIdY50VsmAN+h6
	lIVtBUmof1+3G/ECgmAv/fhPctgDeQcgb0WyNfhYcAGfidIK9D0ja4fQdEmD3kjqtVU0pb7PxcC
	mnlFlrcQT+F5yacMyFg1gHzLRjdMY1Gv7mr2TDpstsfr61wMQoEiU6IwUfVticRe
X-Received: by 2002:a2e:a883:0:b0:3a9:7c85:a16d with SMTP id 38308e7fff4ca-3ac908e3716mr5518161fa.5.1793105404928;
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:04 -0700 (PDT)
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
Subject: [PATCH v4 2/9] iio: core: annotate the conditional mode claims
Date: Tue, 27 Oct 2026 14:49:47 +0200
Message-ID: <20261027124954.110697-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125007_397428_A06793E4 
X-CRM114-Status: GOOD (  10.54  )
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

iio_device_claim_direct() and iio_device_try_claim_buffer_mode() hold
the mode lock only when they return true, but carry no annotation. With
context analysis on, each caller that releases the claim is reported
for releasing a lock it never took.

Mark both __cond_acquires(true, indio_dev), the token that
__iio_dev_mode_lock() acquires. Sparse no longer reads these
annotations, so drop the comment about it.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 include/linux/iio/iio.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 9b63785d5aec..ca91f5a64626 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -707,13 +707,6 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
 void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
 
-/*
- * Helper functions that allow claim and release of direct mode
- * in a fashion that doesn't generate many false positives from sparse.
- * Note this must remain static inline in the header so that sparse
- * can see the __acquires() and __releases() annotations.
- */
-
 /**
  * iio_device_claim_direct() - Keep device in direct mode
  * @indio_dev:	the iio_dev associated with the device
@@ -726,6 +719,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
@@ -760,6 +754,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
