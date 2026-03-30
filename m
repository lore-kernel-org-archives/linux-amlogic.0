Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2DA1061B18
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 21:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/PaKLakfvkkZ0R+KfJ5CTGQ75CTW3GWsFWXLnE6W2k=; b=0VixqQQdJVv29u
	66C3fds8TJ2XVUreTXJbMi5dcHlhuruYabXRez7z6kHjsm6XIOusbN2NsQYIDjpvLnXIlcIwakDSE
	acTIpWRHfrhaeZ/q69VlzG9oBLTjNIyC6f7wDmjCtP3kOUBrqY6FfBYQNoDVcJDZliOW4j0c00Jbp
	0eSXwsa+2nYg8222Q4Wo15rjQUQsojSQi06zt1l+WvaQlJNH/kXHVY4Q0vfpaMmuzucpQPI0Y4acL
	EaO3iXzG/lP8TfMpr4k8AfFSWC5/+rcptldQKteoETiUM7It0RCU/a3geNMOt4wYjlcZdaONuP75Z
	gY+l/wqtbxLwUtg1w3sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Kd7-0000000BwQb-1ysH;
	Mon, 30 Mar 2026 21:58:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Kd4-0000000BwPj-2rff
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 21:58:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2b24fdac394so16812355ad.3
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 14:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907917; cv=none;
        d=google.com; s=arc-20240605;
        b=Jp2b2iJTwYw2ZR3qfKZXs6X81MlX/xTb8geniRrcmpkd8tyQFU9+2BJSVZdbw5tKVD
         zwFrt4UxWz9ECHX+Tu4G2bn9WeHP692K2s8F0oUvSX994n0TPk9V97d1/yLwrmzDJOka
         rP/k2rOJKri1+GDpef2Qf4hIFQrr3cBvbgtNZRsfArngudd/36rCWlTbuCuR6JUoeTtf
         AiQstr6ln1c84303Z+83QXqP1Nxp2B3B/NmQddw6YERlwxARETe+ihONOul0rChfAUAT
         cAEhVGWexexaiPmTTusXqjk1AeoU/oiFk3wyYgm9UtKgohIpg0BfYJpd9iYvzuuAWLUA
         M4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        fh=ulwFole5w9cpz2qh/AWGPVqd5iUZREL5PXEe4w7vCR0=;
        b=hMscPjItHYAdn58RhZAFyIZdoIy+7Awzw76k4ZI2xZKGLOO0mpNypCQf8BYQ3sd3eG
         sFeTRr8RbVfjbom5Flbgj6eQvtzJmSoZ9PEc6Nkyb2sFY2w5NmWhFdhk/6UsoYicrfWv
         o5k1Z5LPkDfNiVWt0gMOhy/xrvkjXtrKvTHYuFnNPgmmg0le2OGkQs/s1OQ16O7kZJgO
         w0lwqQOOxh8sLnTNmnzs7wNFh8ox0kVYg5hemnNQy0p0RFazCVmMQCSVShZzV+3wT5LI
         SfGWgQcC+MX6wx/pj1OY9fwyiOYWTf+e+fpQ6a6O6nj65pSdbTsEDP06UQgy31ueydDw
         +d2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907917; x=1775512717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        b=TkrPrXbaVldDkjf4gL8V/SpGzgOpddx/5wBCaeoWv6v4xvuGN2NbpN1prVpmJiJ4Yd
         REWS1TPJJuajIZQyXi1gst6IW5HVeLpGXzhW49NIIwiYc4Sbhqg/nhjhV/TLfMNjY61y
         Re24f5+tStvnEncsJpdxXM2aKXo3A5Cw9HZNmIReEAmaRsQ7UVSTtz71xTKjDlDQOVi1
         2J4Q7wMTNBG8hxaEs3pqrhn1i1hmRJwF/lacmNK8QkrLfxHtAHDCZd0mk8g0CzCSmLGK
         8Sd5cDaJ4EmIRch2qRWRbKvz0RGTSyo+nW2TbiEtuqSE2TpUiW2XIXjBaLiQZPr7lqwm
         jtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907917; x=1775512717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJE8Ztq2yR97Wm+KeZdBFg3MTQmh8UlZm5qTyN3YQu0=;
        b=oeog3IcWMWALLPtLU0p0Z2KhuvkCGolXS3lYzVyKhLrYz5M2yFyevwCHNGuuQ7VuuW
         dOs8tq8kJmiWBGZkpT+vdpgP4puQTm/IRE96xoTJ9LqncqU3n/Nn+zQemNd9fqxEFy2M
         c/u7RB8xbLIAQ7/jstts3I10/+a1B6YhONeWuSMgUB+KKGS7SNb891nUGSM0I6TSZjel
         eqs2dG4ZrdkunMKvgNrfm0GtHTJMoOGsUFC1DcBR2/beDM0ESM/cwOwVlbcAU2mvLET6
         QliEA0gZba/QRp053+xUUWgELYUmyHbYpdd+d+mbKxRZ8EWhHT1ixm4V98grgO6cmM0t
         m2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5uRcv0ewYwOxn994PnNWCAjXLQbjk2fPcc713tjF3biplPQkGfqHI3VmCp2RU3c1/hUJ7fsfhljfuD2E@lists.infradead.org
X-Gm-Message-State: AOJu0YyfzOeWBfXDOAeTTV74sCYKn90ioKFrXA4cQZO9M+sHeAtACWnE
	muI7ezAOkHGhZFUpl6GLSlb9HdQkco9xkedGK4qhVrCMKpgqkd8eiFzLra0zqnsJhdDwQpu6NZE
	DZ4I9xjdwYGBvMbgdwH1tF9RBfFnEyQY=
X-Gm-Gg: ATEYQzwONs3BNw1psERm2nQfPBsX0pep56x9OdewPxz8BFqlciCpTV+dse+vqhJohQF
	rhLJxQOAs1kOW84WZU2UppQNcTHPhOw1UuGnwQ4Xgoe208xjwIHh4GzpJz5avoQJmDT11qXinHF
	llxAg7dpPkIGIAdd6swGfLnkBa9llCPmzzIacM54m6LeqHr3BHsk6XDGLjeDgiOObH70jSL92a6
	qohXqnRfH9J+S1ecT5NAaQuOPUoBgEknjSzYsDIEWZrbgCYwa3zTidUVBlZMyNdmVsXJ2YgKiin
	CqLR5WQFQr7YW4g/4FR46etzrR2RZzI5NLeNFzKlH5EL9Vzx6Ww=
X-Received: by 2002:a17:902:ef44:b0:2b2:58c7:2cd6 with SMTP id
 d9443c01a7336-2b258c73377mr34992175ad.5.1774907917613; Mon, 30 Mar 2026
 14:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com> <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:58:26 +0200
X-Gm-Features: AQROBzC9sJkgJfCVL7Eb0aOMXTr94-EjxC4gSLY0i2t4mSqOPphK9W4gxOQsQKg
Message-ID: <CAFBinCDOd_Xp3DqqFNDUEfJPq0U=f9FazNAh_=k2B2eOcUeu+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Junyi Zhao <junyi.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_145838_723772_1A4C9B14 
X-CRM114-Status: UNSURE (   8.06  )
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

T24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgNzozNeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogSnVueWkgWmhhbyA8anVueWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IEFtbG9naWMg
UzcvUzdEL1M2IGRpZmZlcmVudCBmcm9tIHRoZSBwcmV2aW91cyBTb0NzLCBhIGNvbnRyb2xsZXIK
PiBpbmNsdWRlcyBvbmUgcHdtLCBhdCB0aGUgc2FtZSB0aW1lLCB0aGUgY29udHJvbGxlciBoYXMg
b25seSBvbmUKPiBpbnB1dCBjbG9jayBzb3VyY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdW55aSBa
aGFvIDxqdW55aS56aGFvQGFtbG9naWMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhh
byA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgpXaXRoIHRoZSB0d28gc3VnZ2VzdGlvbnMgZnJv
bSBLcnp5c3p0b2YgYWRkZWQ6ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
