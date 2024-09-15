Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61150C3ABA3
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbrIp7mLtxY+O4l70U8ua7HsUo69Bd5lIAMaN1ozmvY=; b=Rm6cpTtiBPLUic
	TowtKzYZq+ABKDZeNlGkUef/9337YlOj98ZyXW9cTEpg/DO3Jd7JVTI6kw1CTQGkqGUxuaLqMNXKE
	VOijUT8bRwnbrjPMpzqFdEOh5j1oCFZ7AXHDVRpGd+wrCrg1vM9JYeO22ZvAU/doYoo+N5t7LH8BH
	b4Fhay90ZYXwojuJNEyLJzOebUh49mqhBDrmR2cBzBppUOAI2efB2ZqcymOFdyQbgrzLsYHSX8dl1
	XZutqKxt0h2bdZT3MTYPZbrzCl10Rwb3HSR7Q5MX85HpqYerJMu+XmDbIRjFpm3T84quMQfNu6t+c
	786tgIKJXm+waw+EWR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spunV-00000002Z03-1SUy;
	Sun, 15 Sep 2024 19:20:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spumP-00000002Yqg-25Y0;
	Sun, 15 Sep 2024 19:19:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2055a3f80a4so24542945ad.2;
        Sun, 15 Sep 2024 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427968; x=1727032768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id5/AGqbytBVi15XvL5fitIelC5kOd0OzYrA5y5db5E=;
        b=D2eFZ6EhkjsdGuMuCFC5g4YbjuXnkgpHdIiVGNU8gFAfeND95Bns0fniQ8dDs+kJaO
         r+M6C7xWevVFufsy/mSMZ0Vvt6DiBs0uoivaoOGF4SHLNHPxJQ8aHJhbhTTWDtl+26cR
         QGfOgETOwiZnoTIJoMN+7bMoNCvVnqXtvA9vKvv9czQu9fJeRhm7Od+8bPRXLdQ4K5bJ
         1fiU51WLSshy0CQgm36lsXWG/TZabiuj80q1HEC4WmIFsgDbAOqu4ob2w6zBHGW5YP5d
         sAxgj5IaFb/hVdhbZRQJwhd3TV/gphRaWZI3OnC6Hn/HcKS73g8oqQ+AhzYlZmZX6z6a
         ci8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427968; x=1727032768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=id5/AGqbytBVi15XvL5fitIelC5kOd0OzYrA5y5db5E=;
        b=wxdB2qMNxGux0lVAd5JECE976D5NPpIAYbyyLcGl3ko0qdVpR7knLQXe3lGZar9Y88
         sLoKcougLlA4/Dp2ap7XTBP3xCEYSexJ/BEl3hDoqbvJrl5RT7nj8kKf8/uRBZklSH4C
         njsQRliGM0wrGcYUBamL7c2V68smJBCVkp6Pj+y7UWLK0FxkxJO5GLvwNPRasgl03MMS
         ShYbXzxWM+FmMcwF2G5xklEt1TxtvVVpNhDI8HoP3Jf5/I+TAIf6Wtw4sdl/RyOtkd3t
         tQ/XDYFlzthiCNi6cNmPwFkFLH4KxPWL/lOdzSbNuVfINuC4cYszqPwA4pn/J/WKbsxW
         1aCw==
X-Forwarded-Encrypted: i=1; AJvYcCW3WeI81/jd/N1T5/fXuF0ynDzLrrz5JFclsVs79hoee21bgSvlo8zzcbbI2Cv0Kgc1ZdPhFHoJ1KYXUtx8OiHH5Q==@lists.infradead.org, AJvYcCX0j7KtiXpq5gclFphyqNQ8P8pDg+UJE0tYPkvhuObrf8Fu2xDj9Za7RfDCTjE94/FPxKMlOt1oroCckFtR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+SEuwRXx+FSTotZUh/I0sjFftp6k2jDF0x7UG/y5GDHYH6KTm
	5qvAQ6FjtTcjE3wk9lqMB4i+LsAUYTziJV37BB33zqZs/EunaSAnAqXTOAvi6P7pYwC2mEk+hjF
	j4BBCkhtr5puPjswOEMngljJAUyE=
X-Google-Smtp-Source: AGHT+IFkurQMP33FEcivDJJ8MmLrS9yGUWMN30dEY9NxYuXboTp1DuJN8lrZ8lg/1kSF+tWfwp75fP5k8hE1B5IUKXA=
X-Received: by 2002:a17:903:22c1:b0:207:3a5e:8809 with SMTP id
 d9443c01a7336-2076e43efbbmr235208145ad.49.1726427968171; Sun, 15 Sep 2024
 12:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:19:17 +0200
Message-ID: <CAFBinCAq=D4EqBODiutKjx6EoQK_KPe4x9ATjCkby3CXS8cZGA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_121929_559558_C0894F80 
X-CRM114-Status: UNSURE (   7.76  )
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

VGhhbmsgeW91IE5laWwhCgpPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCA1OjIw4oCvUE0gTmVpbCBB
cm1zdHJvbmcKPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gQ29udmVydCB0
aGUgQW1sb2dpYyBNZXNvbjYsIE1lc29uOCBhbmQgTWVzb244YiBTRElPL01NQyBjb250cm9sbGVy
Cj4gYmluZGluZ3MgdG8gZHQtc2NoZW1hLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
