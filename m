Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B6CCAC5BB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Oct 2025 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBRPs5vhj8zjFQEw5/6cBE0TjQclGokSw2QBtQwZ5ok=; b=xj1tnRFvaNFWq8
	dxK16IeUIIa0ZiDxq/JCbP8N8O+sc4sPq1Sd7Qm+JyhHvj3fEko77SWQdqfNhBMrTvXgkNhsQQFZz
	ZSWkyZK/H+g6WIdA/5ZrlylymoA6M8/VNIqY8YfzBXXwJLteUUVnP9mMuNUTKPtx5YJbdgiQUxia9
	PzIP7d10Lg9h8dFW1+wCZEJq926IkqKXsqh3glh/hySGg5blh0bK0ar5hjDXRIjgqEXUSV9TjEUGu
	BF2Pg+39CdlpyZMXLSiSCFi+6obws0MzRvmEfeIwYKobvIqtev2AqQQEpNLGRi5HKd4gPLPDXiUCd
	WqAWiv7L3lE5NPWW+q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58Jp-0000000DyWS-3Z1l;
	Sat, 04 Oct 2025 19:53:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58Jn-0000000DyVj-3QLS
	for linux-amlogic@lists.infradead.org;
	Sat, 04 Oct 2025 19:53:24 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b550eff972eso2361142a12.3
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Oct 2025 12:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759607603; x=1760212403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXxv9oygkgnXgXW7rGttTdR/kUrSYqtw/DdaORWAxBA=;
        b=K9NYmHWrndkwrMGiGlvGPSIE/bcC+eNFndhNRHTqBwIFqq6OLwZ2iW7FbGAzwfxvHX
         OdIG6MkVt/wz2ebqERCUpwA1SwzFH0vDObAz6PKpjWTv/z9qY0FN4f6qY3vtcoHXnsXw
         A811ZKpq6mCXpVzSXLog76kHTk9fQoYh5+b3mx/etCkhS5+OvVa2OMPKxPbGshpJRTUs
         B9JdlRZkAQuHE+LVC5BQtn6gKk9Qwmq5LrAGk8J7Q+cS826wXRtulrl7LxhuVcRopi0U
         nqevibsZ4bodEsjEPpjZh5CLGhU1LImtLGOw4yKHm1g842hu7IbNXWYr0b/ngACm7sgw
         8WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607603; x=1760212403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXxv9oygkgnXgXW7rGttTdR/kUrSYqtw/DdaORWAxBA=;
        b=h3t9Bv8pkRfsvLN7HKlacGvf3Qur7WLtPT6+860rymgP1urTKr8+BRDyuRlaiCePV3
         qI+6eKwkunoCmVI5h3EcR8jHptOPfStydIvG6IypGtpjUSTVCQdxZPOvnTsqfHR5dRUe
         AXGVZ/kdc70jrxfYDBK7JwdVFQJvTyIJIHLte8OMURgHVJ/XIzFwyxtXEL7vAWjT3e6R
         1AxF0OLyQwAsnt2gjUffO9XwYrUXcDTSxwWCWRmLQoQu9T+dH49znCof+oXBP9ehX88J
         uACQNbReFz7JGHIUzrSiZYwcA2LGFtckigxds5gO74rH/9V2d4IYt04eb0TFB0TvCYL4
         fCmw==
X-Forwarded-Encrypted: i=1; AJvYcCXQZjff4mGi7lc/OuLZW0r9LSP3ffmqKBtjxeK5pwY7a9RVMhX4s71ijQRt0pNV9hWQqo83eg2bwpPrSTK3@lists.infradead.org
X-Gm-Message-State: AOJu0YzEbubi1t1JWPZQVB9T6qOVZMu7hppsTVPVd7Szp16nJ4dvPcU6
	GbyaroUKfTVAWeAeVhaVJvkYj8QQPmBxAQmpOzx/vM32sedkFucVzxalaP4uKUdyctwk0bOT2BW
	KtqU9k1buHNzdL/Q9mPAp9/DxWO+lKqM=
X-Gm-Gg: ASbGncunFd9N9VsJglm+eEu8GJkSxPLcc8/tdCAdqp5azRc2U7IeNFdqr0IULbJGFe0
	xpv8QjcuOk6WR1LZ/C41Pcl73EIITfZhwY9DIXXZ/qhJ2vf9Afiim0Qlab0jLfzuoZXVh7KhlMg
	Jbcs/R3ZzB5g347Frb3VIfTj2E4mRlAExVVQhk379m3HOhRaSsq6nItTD8v1ARRdGVuGK0wGv31
	jPStxizThGMOZ7axs34BRb/ewLKGohOHyGzBVDHHpQrZBLSQGZC/MGOCFgnF9yf
X-Google-Smtp-Source: AGHT+IE5WgEya5mbDL6IucjMhYo+1sNVBm78MZ2ZLWglN0SEnlGhH8rggjUfNn3xPuefRUpxWKZ10+Hdl0ki7DqgsLE=
X-Received: by 2002:a17:902:e5d0:b0:282:2c52:5094 with SMTP id
 d9443c01a7336-28e9a61abb2mr80433455ad.37.1759607603021; Sat, 04 Oct 2025
 12:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250926142454.5929-1-johan@kernel.org> <20250926142454.5929-3-johan@kernel.org>
In-Reply-To: <20250926142454.5929-3-johan@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 21:53:12 +0200
X-Gm-Features: AS18NWD95pzK_qqo061ps6RQQpKquYvXdH89bYJG2uaPEGWKLOIyqhi5Q8ZyggE
Message-ID: <CAFBinCAbHR3g5QGdjDjJisdC0y4gPJJA2it9-qt016T4BigGzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: amlogic: canvas: simplify lookup error handling
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_125323_853767_4D83A9AA 
X-CRM114-Status: UNSURE (   5.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgNDoyNeKAr1BNIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBTaW1wbGlmeSB0aGUgY2FudmFzIGxvb2t1cCBlcnJvciBoYW5k
bGluZyBieSBkcm9wcGluZyB0aGUgT0Ygbm9kZQo+IHJlZmVyZW5jZSBzb29uZXIuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
