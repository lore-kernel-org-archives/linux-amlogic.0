Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AD1E77197
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2025 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZVcjTQWOSirZJ5cHU6bc2/6e/CcjLRvb0zKjva3CuE=; b=NiQ5XE/rbX3dWJ
	ei1MRb0znYIwq4eekViuotNFfiaIZB9nWjxiYsYmjmzDCBleNQ+tW2ZA2kKpiqnuoSpDS0OlOY/8t
	gf9LXns66010OAhLOPSxausgOww8c26G0gYDnRlyWejoJANvT8BakT6vNnjGmNFR80wAa0h9F9Z4Z
	m6TtjLkgL1SAENcZ/BlHOnhGqVu0Qsz7cV5ybnIf17gvveUDnNuTyHKjKNuBUSQpu8nQ4axIe12Xk
	PghShwzvNRFU5+SdkkKs6AAYFoHo4qDxXv0B3/I5nyMbE0CgOy749vKBYZ30RZLnBYYQfIBFNj0hv
	7/JXfYuIXHchn5/aUb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBLp-00000005Oy4-2Css;
	Tue, 07 Jan 2025 15:18:37 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBLj-00000005Owz-48f0
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jan 2025 15:18:35 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso163613631fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jan 2025 07:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736263110; x=1736867910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd/OIh9+XuLROZNqgy3qFc0I67rLSdyN4Q7q2BFezNE=;
        b=QDW2YrlWd+zy8ID0M0YN2WQHHC1mN+Fqhzj9w+m75Lax3hEzZHJTJT+HuUQ8YGvPI2
         oiXmjLUNkx5IosdDjPzP9G/dAACasa5rCrEux1zlQKPmIl9hYp6xbM56qJcDYbi9vO4M
         xdCnG7W14snS9/TlwbjWLaoD9XCCEH3qllBeeRv1i3ckNDAwSBERWn7Y1zBaSTvMPWJi
         3dPVDPt5D8xAAo+g3bH5/SzBOudLmZeterHcQZDu54alAbfZH/A48kbs1B5uqdb1gH3Z
         EY00TRnFyzainFRRVQYZiS+1Gmh7VF2yq5g4Qx9RiKcMylmKl98LyHiNd5hHoAzmBsDr
         bDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263110; x=1736867910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wd/OIh9+XuLROZNqgy3qFc0I67rLSdyN4Q7q2BFezNE=;
        b=WC7Ep48SoFVVtGuwXcwrbsy9G1Lqr1ktNIUyhyXGtEvjNGXgmAMoGdpSmjyIU/y2N3
         I8JN9ApKRHUu54e7bHlnXUvmmc7sHkmGofPd7UUcf2Azks3e3bAC1OLdVgbZEMvVMjIG
         HdQ3MsLorPeAg0UF5EAsyqCONM/BMsZ9kvErQFwA5Zfh5DsDbuafuy6XSklxDDIjmjfK
         DeLP3HME2dCAcmKNatkPvVA1W8jsCjacuKJWZfa4TEuk53oKcsL2eo4PKKliOfI1lkny
         xZWHL2A4XLQ/0DU0MaaWUVbK6HjOt++ZlinG/iI8zns2O0qF9E7dzVLOiZcsiLCTeHAS
         3Rlg==
X-Forwarded-Encrypted: i=1; AJvYcCUR7CVvkHWJyIZ4ctBshUS/hwExqS71fNrMiF+m5ncsQcZfAcziuGP8i9kIBqmB54pQIhvc2wf5wvsDf93/@lists.infradead.org
X-Gm-Message-State: AOJu0YzxiuVZ3X+ezxdlR7Zy+ujnv2+wpLWodFkDngJeTg+9k6TkNvyb
	c+Xa6uWy1ARwolt+M6Ngtls6OUCgfuZw74nXqqVuaQAfUtC5TEx01I1SRbQ+y5RH72zUYQW5qs7
	nKf/mUOf1dInO7fJI0AnnRY1Trg2AnBDRs0bo6g==
X-Gm-Gg: ASbGncvpV9UyA44LN4E/xEqZmbaZN4B/DHgAwtv1S6O97rlmUPZxWcS10WRw4/KILbD
	PvVcFLkWgRv7xTPfPHHS0+X1T5+hIE4+3Q79O
X-Google-Smtp-Source: AGHT+IFfSJ/IVHhrJ2qR+8hDDFjdqdHa8DoOmF81YVHP8qeEB0D4AktjBUg7IrZZHNZ63UvWGjpkKeBdKSBO3q3o3/Q=
X-Received: by 2002:a05:6512:3b08:b0:53e:39c2:f02b with SMTP id
 2adb3069b0e04-54229562a86mr17756761e87.42.1736263109745; Tue, 07 Jan 2025
 07:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com> <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2025 16:18:18 +0100
Message-ID: <CACRpkdYrUDK9RsJ0VzksUNAyZ=grdQLAkMN1_BjeqQumY8bjSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071832_032704_374FCE73 
X-CRM114-Status: UNSURE (   9.12  )
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

T24gVGh1LCBEZWMgMjYsIDIwMjQgYXQgODo1N+KAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IFdoZW4g
ZGVzY3JpYmluZyBwaW4gbXV4IGZ1bmMgdGhyb3VnaCBwaW5tdXggcHJvcGVydGl0eSwKPiBhIHN0
YW5kYXJkIEFQSSBpcyBhZGRlZCBmb3Igc3VwcG9ydC4gVGhlIHBpbm11eCBjb250YWlucyBwaW4K
PiBpZGVudGlmaWNhdGlvbiBhbmQgbXV4IHZhbHVlcywgd2hpY2ggY2FuIGluY2x1ZGUgbXVsdGlw
bGUKPiBwaW5zLiBBbmQgZ3JvdXBzIGNvbmZpZ3VyYXRpb24gdXNlIG90aGVyIHdvcmQuIERUUyBz
dWNoIGFzOgo+Cj4gZnVuYy1uYW1lIHsKPiAgICAgICAgIGdyb3VwX2FsaWFzOiBncm91cC1uYW1l
ewo+ICAgICAgICAgICAgICAgICBwaW5tdXg9IDxwaW5faWQgPDwgOCB8IG11eF92YWx1ZSk+LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIDxwaW5faWQgPDwgOCB8IG11eF92YWx1ZSk+Owo+ICAg
ICAgICAgICAgICAgICBiaWFzLXB1bGwtdXA7Cj4gICAgICAgICAgICAgICAgIGRyaXZlLXN0cmVu
Z3RoLW1pY3JvYW1wID0gPDQwMDA+Owo+ICAgICAgICAgfTsKPiB9Owo+Cj4gU2lnbmVkLW9mZi1i
eTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpUaGVyZSBhcmUgc29t
ZSBidWlsZCBlcnJvcnMsIGJ1dCBJIHJlYWxseSBsaWtlIHRoZSBwYXRoIHRha2VuIHdpdGgKdGhl
IHV0aWxpdHkgZnVuY3Rpb24gaGVyZSEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
