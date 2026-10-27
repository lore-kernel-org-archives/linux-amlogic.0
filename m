Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50019606A31E
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wk6K9hN/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rm/uv9CZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=81BBSJdPJPHJB1mxPlVRsxclIJY5Y7TJcLEq9h4P5YA=; b=Wk6K9hN/FtC6GuDNwc9yT4jm4l
	rOumRwxIv+eYCeQwgv0ZC/nmuDgCTkjhHgYiti53IuiPzNriDCSUlMBkSfV/X2Z490VcW+vQETu08
	ETwM5rl9CifAlLKyQkMx1E3vAOGOGj8bKE0oZLrUeD8T9mSyvjpqew1xN0HJQUPUkQ8XGabLnLRU7
	rm1TBq1IZ5yvQ00NN2MD79A5leRjjAzVvJftBDAXHcwKcNnCr7/90BKkCxjOvxSwbZ0B/hVkZOD3H
	SA8mmE5B3zWsdKRMJswA+8x+Q7QF7nBspNgKN1fagE7HyovVwEW+hj8OJgFZ4n+NqRXoxUKfsmRHy
	qZp7OD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd2-00000004hPF-360J;
	Tue, 27 Oct 2026 12:50:12 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcy-00000004hJm-229a
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:09 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1274321e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105406; x=1793710206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=rm/uv9CZsjT7EI76BZH+CnDb8z11Uz8mXegW7oPL+FRi10LNRbAtVHCvXXCXZ+cJU9
         wlJZTH2LIQjws6T6Slc1viBL8vTyAaG6fLozFH56GPg5C8y/VvIenhEg/reOZyoQwmqz
         6eM7+S3PcOMW2sOXBziMl64gehT8wteRNRO2YGGNS7c40Qc39yHqEgRnvDbU1zghOJQ7
         OTpqTUl98wEP8UOsAR0DxTzbKL4lo+1vzEgoBYBdkAa+BXrtGYUUHXH2mck9SrgK/t77
         NYgCT2WQCLZ8nvT/bY31o4hoOYa6Hm978y7BcZOc5bVD5wQsnTtl2tF1rVOmWC7pl7se
         oTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105406; x=1793710206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5maieUrV3gg0OvUYuumtngfF5Rbt74fkE8XBQYCal3Q=;
        b=M8Y4bPGeQVLBeHtHx91unvYqb3S0537xFer7zfjCSgpcC+1jdoSpnr2CVaOg9pHd01
         Ia4kM3MDuueA7c3I24Ua081QVTHxxjvrux5Fqnbzr467gFD00EZwdw0+B95xDha+E6Tp
         QkngxJEqQ1wtUwJttzvJxUYz8kRYfmqLL3GBGn5RQf69vQ7xbP1hDuwiaaazXvaF+th+
         s6neTiAdgx7LEek5heVcwGlzrH83sanLmhXnLaVSxI4r5zHlYxbbImLwiF/fkwjQEhTn
         F0OlPH2ZmE7/s4ohtFX/EFNJvkaqzqgo9EVLsNA76zoWpSupUw3PtOhf3Nvv1b20wJ0m
         I76Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZk1dlpywdvxJdoeMgP4MBui9KD50BSBdiLybj1DSYkICagUZdWSw8aEC1zPfO4gCqd26mM7VnJvmjc3HJ@lists.infradead.org
X-Gm-Message-State: AFq9FYI0il5qK9cWgEPhR8po907c4GHq4IF4zUatmAVL7m5KXZhIUF1Y
	DKA/F5rkH3WxUzGP53T70VaMSl3APf/QA9vF382fgJ8C4ivbgUMhf2JL
X-Gm-Gg: AYBFou1GSmtUHco+pb7szyVfIZ7cJXBbnUq01VYvkbh4GmMpOL9isGzDNrYUfdlrapU
	clVKZGgBSiRC7B4KyinedpoE6uqXrIY4jQ7tOxUJa/BLXxc7Rr76O+yVI075Bysbd/S7qbELCip
	Zl470lc1dSESzcJ8f3wsjjMVS4kNh7DEgEo1lFY/CaXl1H/1kZcTXCB82CPKgFV7KVIvy35r/39
	Syk4j/ZNdU2hKjvmQ4sOZvoMETDaMsHgHOVamSNGj6iGscj7SAEudnlI7HqA9t3JSdY4siWTwkX
	oLFh1UescH/3SrseZ5bRUBXl0kZ7cRLEgdy02T0oDCuih0VI7OAhjSOAhEMahBFFow3dLyNDPWH
	pzrY2k7OsXuugcQuPcREwm5lez1Y79umN6vyGE8o9/n9udm8DrxzOtSE4Lce1mAykYCEBrn5Unj
	7i9VG/Nb9eAbuZgm6LSlexDozJFwuy4BbOaXGtu6rV4NG0Jx5JvzBQaqcYYynFgSo+Bs0Au8YwP
	qGPRhHGy6jX3xr+1ejKM3F6USUp5U5naAJWs3lNGxbTpHd+BRRmD9jZdHcIyxZJV91tK2MwfEiv
	yRctLdsHZK5BL+aQLN7gjx2yXQITplYSq0lDv7UHZFIEiCsGn+wdvF1zciNbIoc4
X-Received: by 2002:ac2:4c47:0:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bfb71c6b52mr3628166e87.29.1793105405831;
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
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
Subject: [PATCH v4 3/9] iio: core: mark the mode lock helpers __context_unsafe
Date: Tue, 27 Oct 2026 14:49:48 +0200
Message-ID: <20261027124954.110697-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_055008_540600_D3113225 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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

__iio_dev_mode_lock() and __iio_dev_mode_unlock() are declared to take
and release indio_dev, a token for the mode lock, because the mutex
itself is private to the core. Their bodies take and release the mutex
instead, which context analysis reports once it is on for the core.
Mark both definitions __context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/industrialio-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d73f2541375f..e9a5d1d905c1 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__context_unsafe(/* returns with mlock held */)
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__context_unsafe(/* releases mlock */)
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
