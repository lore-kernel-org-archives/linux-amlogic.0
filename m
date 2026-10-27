Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9A606A335
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQq50RIo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zuo8+DtT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=chNblgFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=it3RGXI+B75i3CaXUihRV4xvmTzf1ym/63B8V7EdKz0=; b=nQq50RIotdCWQefVeWxIMo3sok
	7Va5CMfRYpF5FpeJU2Nx0Y5QHWQeFGqGux4iyXB80jjJsDTmftsQ+opg9VI4qwwzDYl02DFaVBAEg
	6h6Hxw+Uy6LNluN4DXiVrgMvVJQc+2KCPAMVx+I0RjFn6IqYVZYb949VB4YeeEHr6zEkXu0bXQq76
	mUhopIbl+7UiamOk1ihRWjOZ+QkZLPyL8EIX9ukNpvXvPf3BuNSZoENhDpnnPuBiRI5SDzDa02RJL
	tFemD0LLpdEXWh62ciqDb6KnIQs5xOxYi3AdIon+CTtjnGQypeaJDIJF4FhzRkJ4R6a8He/H7+cBL
	bTgSX6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgdF-00000004hgN-0fS9;
	Tue, 27 Oct 2026 12:50:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd5-00000004hSr-2nVW
	for linux-amlogic@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=; b=Zuo8+DtT/G7chb+EYqJBSiu5yg
	urAwmyJ7zSLisMfr5Yf1T26SOxwjYehj13y7VKl5kymD7idwt28lmiuvqEo1RfWeQzbq+XRMu7tfZ
	zibOJgsJF0e35t1GteThRwwidy5Lv5Eq/Ci6Inoq3VVN6JFbjWJabW1kHPgNP/eNDR5YeKDtO3tC5
	IjMuHQaPYll6Ttga26USvqDaOo/5UZLjhxE13aa5/N1MzpmI5UGV7Tgcoe3k+dAEwO0dY7s49pNW4
	ngP7fizvjot7SVKst0qyAQgZOdukycv/WqJU8HACafh8yVvrFwOBRVizhi8QuoY3w+cH0UG0UjVjC
	uutJV+aA==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgd1-0000000ExvS-3VUY
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so2720940e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105410; x=1793710210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=chNblgFRC93SjKAmarA6LT8wcZS7/KRNFLPDCenMj5Eq5YLGPnlzw+NIj+9NPJ27DZ
         SqRtdD9bqARlR7+mr0qLkrtAUCZAn8rNuXsEGF9n295PrwtO5GYfiq1L+hjck8I/EijI
         0mVg+n9MIbG2+6l3kZB4nmB9Akk1PiQzXiIF0S2WlDLQnZpKTS9xWxKP1eEwHKPwkPeN
         sTbmJL0paeI55MkSrrkkEWK/oAdr1Gn1uX6dPHCQtk3smK52l1wP7/hL3DAndkVrGmts
         /kRt0HJACmvtZeabVeG/tsCPR1AunKVD/Aq3EkkFqfBg9YMvrL5EOK4QX+wDG8j6xuRN
         g1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105410; x=1793710210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=zfTLhEJ/VDOpCqHfZsdFKzfESlOGoDPm06zvGnxcTmByntPL1g1lDboWkv3vHl/cXs
         AxDiYiVvxd8TgawjcFmMJ9iPOvBEYMKDuLMGxbkRqOyG6dwIeQH4H8LWLPIpp5lL1Dp2
         IDs1D2BtTmLiU1mXph11DX3xnSHmb+RXdFS8biKrGHKPHdSZM2p0Hq2Oy2V/YyyzyRMA
         TNneD22C/WhL+KAvgVOWv5SyqCzLOU+IHF1jcDIEPsixKZQFvQc9N+r4M02M2Ks90hS5
         0JkRhZcX8xwuHwtl8ieWEfe+aLedyEi5LiaevJVk0I+SoJsXKy9TkuhTL2gBYl1OvKpe
         fU6g==
X-Forwarded-Encrypted: i=1; AKwUvByixNH2gP0bjD1lUXmsX/tNuOgJPS04KuRn4J814T50lhHi4ye6EPZPmuBUo3o5WFlhbGY360joPifRZspO@lists.infradead.org
X-Gm-Message-State: AFq9FYKZY0hiV88e96V+v5yaKQqrjrGsHODNkEJndHdjPU4oauHKwVXi
	jx16xiQ4jDHa8N1Kh79ZfF+9pwkssmQw5OinF3SKt4NlL+axXyH/GmH1
X-Gm-Gg: AYBFou3dZTqP/AUnW6A0KdVFRk/6ElDllnWFYIYDKlrbPhfNjoTLJqldCLkTi1bYx36
	k9qBWA980iCviqyaj9F6VlFdpLI7h+DGnFh/MlZYJVZkM+zwt8n1XOJ7RRomSwTFfZApSBf5dt8
	cYMpvm+0lwvd6iP5eoQhzYzl8QMA7jlI80ElVxUnOur/n3XMFfAr5LJhIKiKDTVVmzSvtbRi2Qt
	6O3DuM+FM/cocandQvzOagqb34KT4h4USUo58dsjuL59syIX2FMUW6bVluqufD7dEMDj5ohwPpc
	PadYL8EjD7dyPtJ8jQ1DZyg037rfizB4G10hsAEjXrCw778k7f8oG710K1EovhAw65N+QPgyOyh
	+NsJ7rXTXPanBJTAXybU1ZdE/wC9jVgsLBo2VksIe9NWWaXgA+N+qIP9hwU+FZI7yDZd7mXMFdi
	j+MW16S+uxBR2OMaw8N9PgeUJCnna7r5H4sLWVJWCGVbPrQjrmdruVJ0fs1BMhNwbsBbG5+7uRp
	3i+nCK1Cdp4wwFWHUXLLV/LtGvQItnPNaiyHZkDi/p91QDepebjeC9usJrfvkSAW9atvD6eIpIT
	lv16VojGB6O80GC7boe5D4lvncV6F+KENweeVWxF7XI3o9H5C+8I1fYF/Bacfg+Nhg==
X-Received: by 2002:a05:6512:10ca:b0:5bf:c27b:8e52 with SMTP id 2adb3069b0e04-5bfc27b8f26mr1690144e87.65.1793105409656;
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
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
Subject: [PATCH v4 7/9] iio: light: opt3001: mark the interrupt handler __context_unsafe
Date: Tue, 27 Oct 2026 14:49:52 +0200
Message-ID: <20261027124954.110697-8-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125011_943680_6FF01CC0 
X-CRM114-Status: GOOD (  10.85  )
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

opt3001_irq() takes opt->lock only when ok_to_ignore_lock is false, and
releases it under the same test. Context analysis does not follow a
lock taken and released on a condition, so mark the handler
__context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/opt3001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index a948353014ac..cfd4a0ba9bd7 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -817,6 +817,7 @@ static int opt3001_configure(struct opt3001 *opt)
 }
 
 static irqreturn_t opt3001_irq(int irq, void *_iio)
+	__context_unsafe(/* lock only taken when !ok_to_ignore_lock */)
 {
 	struct iio_dev *iio = _iio;
 	struct opt3001 *opt = iio_priv(iio);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
