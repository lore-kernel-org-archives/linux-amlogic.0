Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDFAC43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:08:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E2E2206D5
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onA8lur/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mCUG2mke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E2E2206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwYTIR/G+Ua0kBmQgPzSJ94csslZXKeKzH5BXRkE76c=; b=onA8lur/rQsvNG
	nZf9HKVF/aQ245rYLZEY/72eVT9b5cL5HuVka2DZLqDVPQi4+RdlMgITBHQE+HuY1dLHfV7xYFK8o
	uqqYmISK2PJx6WfoMGk/L9/qbyLwlEQ8xA4y0rTYjYdNZpOGcdO/fvhcI4ZGt+Uxi5Ea6pxQil4xg
	W8YqUXIVdNa/4coCu7fRyzbKnJm8OD+Ir16itaz0sINobYFF+s7t7XXry17VzSJxL+3i8uLO0wRFX
	Jyo8LWpiwZ9mI5Wz1KH7i2YOd/P9AqGmDHVNM0G+9nCrC5x4wov8OZTnRTwavrLFDCbdJ9tPlzbm/
	QBAGCoQgJROgfFsWh/6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRCD-0004s6-1F; Mon, 09 Dec 2019 22:08:01 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRC5-0004cw-FU
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:07:54 +0000
Received: by mail-pl1-x643.google.com with SMTP id x17so1111907pln.1
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XV8tPDcRTX7RtlSDootkVo/0R7BkBqzFzuFusm8kdK8=;
 b=mCUG2mkefXUTSWgvB3xbkzIgqLcBXpg6xtwMaVhJcJn3hsuIc/8+Aptv75kjetgmYE
 sPhCvJmw3tdGhyPHcHphJ7WIGYzMB7HQtXa14FTFA4law3xUy2s6fHqDuQmuTGwAQjd/
 kYqm38zCX6wKpg0cAqIfQ1xvtT2jv/81RdI13YWhFixxkX+4WhTKkItSY/POk1qgKoJD
 YvEaxEMQJjFi0RyiKcGb+g/CUDY5dDAqWOIHMUtZS2uOqtxnKt6XwNlPDgZ6URWC4oWA
 fl0cuWe+Tk9i7biEczXXxbcRdo3WxA+mYfuxj6CUInFjbgFrHPp44atsS1kh3GEmTK4l
 x+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XV8tPDcRTX7RtlSDootkVo/0R7BkBqzFzuFusm8kdK8=;
 b=c8IbtRwQKW2uWtlu8LiRuOvGpYDGLcWTI4qErS0qHARw24Oh7b9stBoaEH5hk7n8D2
 b+E9LWW9h0a5CHW4oIOHltTR0HPgLzN4t5ijLLDZ4uDBHnPZoJZH39kBJyYihnZAo+HJ
 tOfVQx13JKyXK+8jvr4YNkK9hMitCLjPF+oFDjzjdRNXvjD4pznK170C02MEcimZ3o6O
 P5+SKl64etnyAKS3Rl7MOPgjSUzvf0smWL3+mnFpoTcyIgNmz0499RLC7C1Rdl49y0pX
 B7AA96A9rOKsab1Xyx4UQlvqVpFO6JIm2sWNj/afUTLEulIJ46NqxcTABp7W5canZgXN
 UM/Q==
X-Gm-Message-State: APjAAAXRtPyVwK3u2zicthhnelPGS+I2JuybQaul16qTtyuw/Vh2Ht6o
 q/As4sZYKiki/OZk2KDCAmgU+g==
X-Google-Smtp-Source: APXvYqzyU6Xr2TUx9phu+0FjC0f8dtT+zfBB23R48rlsA4j6FU2F18WTjQ2d+qhgny05GK+RGN86MQ==
X-Received: by 2002:a17:902:bcc8:: with SMTP id
 o8mr31506662pls.81.1575929272543; 
 Mon, 09 Dec 2019 14:07:52 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a10sm456847pfc.35.2019.12.09.14.07.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:07:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/9] drm/meson: hold 32 lines after vsync to give time
 for AFBC start
In-Reply-To: <20191021091509.3864-9-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
 <20191021091509.3864-9-narmstrong@baylibre.com>
Date: Mon, 09 Dec 2019 14:07:51 -0800
Message-ID: <7hmuc1rw3s.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_140753_512941_D7A99C98 
X-CRM114-Status: UNSURE (   4.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> When using an AFBC encoded frame, the AFBC Decoder must be resetted,

minor grammar nit: s/resetted/reset/

> configured and enabled at each vsync IRQ.
>
> To leave time for that, use the maximum lines hold time to give time
> for AFBC setup and avoid visual glitches.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

otherwise...

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
