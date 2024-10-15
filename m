Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E2D1F9C6
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 20:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11r9A4cIt57f1CWMqdCKWuzSHoEhAZz1OZGWUlcFVys=; b=yd4WVdipdtL/bT
	0gwZtgCy7J5lxXVHwmG0PgTajJa9vafTssAYGtylo8qjE8vXBDPI5giztL1tBGucv/YXS+GnC9nLw
	g/9PfNn7YBc2D/ICWj0+dKhhzJSs8VoQhz/74kPY0BAtxZ00NDein8NzpXgd6KOglWqyYxtzEBfEz
	f2VX1al9NgO+jmgbwmK2m8ozv/B6FOdT9eiA4woen9AlYmAZ9KPxXEMAkNMTTX6nVOKvwtuMljwVJ
	siLIjuExMnPYGDKo4Xo8edI8eVeSZY6vp7jMCkKctCldIjzC86GVVMTCpmbmsUtdJmAG8zxCuyXOb
	w3o4bxHDZU+5iwpKoR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0npD-00000009Tk9-0OHR;
	Tue, 15 Oct 2024 20:07:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0nkS-00000009Sh4-0yx2;
	Tue, 15 Oct 2024 20:02:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cbcd71012so33239515ad.3;
        Tue, 15 Oct 2024 13:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1729022547; x=1729627347; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E9KrtJPra18ekGLCafFdTVcdiBBpoXvHXnrngEDQOA=;
        b=TRBNmOKvYv2E7fPK2uBSbvo4eldu2ekj/ZdhDGGmU8cf6nx6V+s3sI/7pJtTK3y7Zt
         CR86B20Oq8X4l5a654C1DsMeb+VDD/mp88l8Eg8ecVsAX1/L527a1W+/XroAApWT0vFg
         8yeE3QztWE9IY2oHX5/gydNQu/yZAkFJwtgEIMFArI7uz7AZWiDQKl436bC3QArWtuU1
         eKsW2NOAu6l7E8CAhgOyVP4BHHgpoRJvSpVvoRLVwIvkqLkGN4RgJ46WjSVyUlldBnvP
         BYhg7zpcskpWZBF9cMSiRZm/3JGUyMYjZpUQ/qIJH8MEyu3O5b3G1AQntswrrhFIWSQv
         8i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022547; x=1729627347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E9KrtJPra18ekGLCafFdTVcdiBBpoXvHXnrngEDQOA=;
        b=myKs/rVKTlkqVImLv5DP/XidCw1dumZknswKOuBukgbtLzc2IHTyyNtWCT9Wzbl8P0
         rhdqHEhctKv3DBrahm4wnSWAk6jvEj/I42OupBnco0IvJihJ96ZUlEb2wcnczgIEDme5
         Z5Tm+E5Ca6x9FrfJ04khSpyMhzAuV6I4miGHAS3EAnLjfT7suPLWbrc9rFVyyw8ZqyTs
         qjF2H1XDfF4OdIo958tG+EHB5UN87y/bAWfrnTJE6oSYpFDRASeBtCHsVVMe4A0gwGHt
         yXsV5fSNVtNNfCE9XLH3HAZGJQ3gMsW0LdzC2lfRvXNxyWuChHIbsM7jGkhrqe/yCEJV
         PHpw==
X-Forwarded-Encrypted: i=1; AJvYcCUR2M5oS0Kxgw5K+Pj7lNfYkou7Z/haTywZyeJiFlL7kf8pvJ2dkvyZvPZMx1b2KnnMhpp2KHceXF6ai0Pz@lists.infradead.org, AJvYcCVYYfLZdYLTV9WCRPowypa6mXyUd4RtMyVlnkDM4yNURE3yfyLkXEZGhkhTE4jPXuD0No+vCvHWDg/gJtPYXoN8GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKNjvehu8GgP1JMpUETZ/6c2fC6kzZtoxrHiCMO2ZgJn5poMWF
	rzbPgUHAJDCW4qZJ4r1BgszfmRNFqJi7FwGaku1WbFiWaYQJ/nubHvX8jgl2fXogEMlQRXErXho
	L+RURZ8kUrkRMy69qY8lc+QT/FqM=
X-Google-Smtp-Source: AGHT+IFdTSQzdCKXkl2sCIwJ4f6NxCKsUewi9E/3FPVpvhK23o3jahGuP0PQDNUbMudL7f8kYdk05V0AWgHhdzwY6pU=
X-Received: by 2002:a17:902:d489:b0:20b:a25e:16c5 with SMTP id
 d9443c01a7336-20cbb2a0c4emr211703075ad.53.1729022547422; Tue, 15 Oct 2024
 13:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-3-ad4eb22c2a8d@linaro.org>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-3-ad4eb22c2a8d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Oct 2024 22:02:16 +0200
Message-ID: <CAFBinCBbq2+_-z3h8r2BA0vxOTLa3qM1KSL29POBr0e9Y6ZexA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt
 to dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_130228_292828_75BB903C 
X-CRM114-Status: UNSURE (   7.24  )
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

T24gTW9uLCBPY3QgNywgMjAyNCBhdCA0OjAz4oCvUE0gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gQ29udmVydCB0aGUgQW1sb2dpYyBNZXNvbjYs
IE1lc29uOCBhbmQgTWVzb244YiBTRElPL01NQyBjb250cm9sbGVyCj4gYmluZGluZ3MgdG8gZHQt
c2NoZW1hLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
