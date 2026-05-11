Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A984CD484E
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 May 2026 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKZYDPmbMZXLntpXZmK0a8QjNZeTA/x0baIx9XyrGk4=; b=U4Rt6+sAxcOfo/
	SaGV+kMY6M77Fw/pEppfgaCzEWWwBzWWwUDdkiQeHX7EpYeuSngM9oUIUktY7wX9OyfKK66pRfSSr
	Kcn9tOF0GYAT6GtWSvziFQyIkd7EJMhiWAiqWhudLBGIbRLt/Q6wMX5YmK5p5HAa3nr7I1fRZjPww
	yltLASXMBmNBtBdLRs9/75HQ/x5aOVEFtvWKmadRAzpnjv3f4kuS4HVKdME2WXfxVYB+MY68p9qs5
	mJZ6jINR8INqqavWE0PRrbX+ZfJeLMYbB6Rxl9luC727C/EpuVnXDWpOnm2Upw8G9z1ftiP7Wi0ok
	0o7ReM/YSsbpR66XNHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXCw-0000000EhxM-0D1o;
	Mon, 11 May 2026 20:26:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXCu-0000000Ehwf-3Pg6
	for linux-amlogic@lists.infradead.org;
	Mon, 11 May 2026 20:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 499836001A
	for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 20:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AC5C2BCC9
	for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 20:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531188;
	bh=p0T1y41gsuJUzACGoRDlevBaHaCBq9uhq73rg/Jmuv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LldN6Z98cIgedoQ1TaLfLMP/zwRW1yu3s8fnf+NqB5fpUaJErnQj/LdGUHUIbsrw7
	 fQJSFVSA3VbmVbWbuzpebSy3C2ayRDTjSSVskDWEdZcE5oZNLVgN3hKYpMpiwAndkm
	 njYHMEK3UlEaazRrFCPyKJGvCOsbaMUNRoAX2hc8n3Pud/3BuKD40vr4gzZqcZMnp9
	 nXDo8nlYrOMj8wD5YeGWzIox+ALVpNi8mr6c50USXyVzOVrO98I7GC9UraE9JcZaSp
	 DGGVXsYe8iMsscqoWnr798QNy375S5qz2GKMaz5KybayrdoWwTHEcEQMtNv3JA6cyA
	 JEnFk+dVB0gig==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so4573549e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 13:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/xyZH86ZMGEfjPsdnOuCnuvjgOapWe4Kyhuc7u9sPFw3650FUQX9+mR3GMaPfvhKHhGNBtJNQMTyABX+9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl0OU7aWqWOBw7Bq7QUm30YbmjF353zZtGlr3S0X08OtJM8FiQ
	qX+dDM6ozPE38H81v9ZKokQhgZPeZJxjHg/qF58KqNDrT9ZUXaGIJZqPg+nVw2qiQp9d5lOUvvP
	yadrWTmtwRI3EHcCEB84a+Tdpldl30q4=
X-Received: by 2002:a05:6512:3c9f:b0:5a7:46e6:74c4 with SMTP id
 2adb3069b0e04-5a887adfc92mr8322271e87.9.1778531186735; Mon, 11 May 2026
 13:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
In-Reply-To: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:26:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
X-Gm-Features: AVHnY4LSYvXrv4DsxJcvRd4oAMpQx2wvvbKBiUjGdIh3JcrN5btqHfX-VZZ23tw
Message-ID: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

T24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMDoyMeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBBZGQgcGluY3RybCBiaW5kaW5ncyBhbmQgZHJpdmVyIGFib3V0IGZvciBhbWxvZ2ljIGE5Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+
CgpQYXRjaGVzIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
