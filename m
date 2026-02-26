Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E28FD9E14
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 21:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooTm252WH4pbWEvv2ZGrSFGHCP1BauogvWbmNAiYyWw=; b=cBI379y91rJ5XJ
	EJVaJ5PtKL1GMeLrjWdsTdBbQLHP4csgusbDJAHSkOFllKjz9i54pNM4di2F+BEBoD5e2IP5GMvB2
	NAs+HxfZuku+q5CkPf60dtDfMnH38ULaMvoItZk4X2ZARCK5GnkJYRV9TRSrSFk+yF8QkWT/zBhrg
	UR0U/dvysmIJ0TfyqjL4KwTtxKG/jgS0tViBqyayFUdySHRJVuRfxnRr14SWMQKve/y1iXbmFbhNB
	ubKAWxwiHpuAeUTst7QIQrDzVia7qr5VyMh8MfMd1e7sntWnvJ6KLzJfpWRn4Mrk8h5VzY7AWRdLs
	6UwOZC568IzNz2WxCDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjHo-00000007Gw2-2F0s;
	Thu, 26 Feb 2026 21:52:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjHm-00000007GvJ-0Ix5
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 21:52:43 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ad3f12a496so10363905ad.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 13:52:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772142761; cv=none;
        d=google.com; s=arc-20240605;
        b=H1abxu3Yiz+5lIDdrSllZJXQn5U6J9eHJQRojcqXaM0fWseRR+LWf6c6YijrJ6u9w1
         TaMxdljil63Dtn4jWvOn+6p3aioH4jx1gphk7pvzoc1L/Px+b/GFbL5sIvh/jPiA3iy5
         crKmyRc2lz7fkrd24I12MIj8heOqXl4ROC7jUNuYRKW2ctGwsZ2mxSXdOJfrk338piV/
         yLs7zPDy0TOAORfymKkCPsyOcKWmZMJVca4ZmXB6xfYJOLwHKNUCcEvhf4Js1MXHu/z2
         zNUAnVxbIXtW3S7wBR+TvoqywIDzIpyd4UJUt3wLBxZPg1XVxpr1N3bQYonkfX6Jmcet
         68Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=;
        fh=lPo4E41RcSK1BAYAI2fN2y7dGm2CeR480piRG/6hd30=;
        b=l17FNAJHj/AsY4NC/o+p+0oFLj3TB0JZTJmjjbIEqv6yE2aCqfXJYJsApkd9q8yGmX
         xc20DCCU6gE7zoo7TQsDuRO3+/P+xfW9hjsfvVqVHJOtjJzgDYXNu+/X5KvHbGf5QdtG
         Abo7SnlV47NLsXsrQh3BV/EiwnpfGceah22Rgsho+q8otRfidb9NKGyGiYKdjRnUvZKZ
         3ahXT2dvnnrVgINWvOrp7591g1N1hBjeekB185fBkhhOzuiYV6WPVqWTDnCUwvkSxFCf
         udmlEb+DfGqDfqKiNyDgmaOoZbOtd2e9c7aTPcmGTqdyeD67sEp26smS+oBr0J8EIxOm
         ez/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772142761; x=1772747561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=;
        b=g34GLP4CEf/Bkf9hy8f3kO4sHKRCtvZOtX74G9cD5o0sk2ZMyjRCQBuPpbQ9T514SQ
         tH8DBa0N76ygR53/WjbyE0G2FY/AfTgkl3lZW50F1fc+Er8O5hyhh3e8uJ48yWVfLotx
         Qcydn7yjJ31uVId431GAkne+raTZ4Y3WYOTJxXtO3oxTn2fc5lixpjWv7bRzYbOPKpoG
         22PvqiBrgCTy9vkboCeo9AkezdqbuCHaQ91uq8z34uLGDR1q84b81PbWTDuKdCAshtCs
         i8F40SRCdY4mlFVHB7bkYAVsKwUP2T4DUVIaz7taxtaB5N+2VTxBd0y+wUtUoXtpSsyX
         4FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772142761; x=1772747561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgWhFrJxUjCiTsRCdjaJqD9Hpa6wgKra0nSpG+3GZbQ=;
        b=rtbYCyvKN0QZQRPsWFdZa69/622z7vxKKnrfIvx1C2DBm9WjnIKo9w9n73YjkBf6p8
         2rH6vRXQC501GsfQc92SI/3nWLxSEykRbaZSAToWmA6iJQpXClltI2BWxev7aydv+iRI
         80xJE30QdvvGZh8KKCRVZpRGRQlUTNoMdHSkfw0rYfQn7ikrfuGrQMbxb7KXbEtyZc42
         vCVuipJatgXcvFQUn3HYYqg4JdIR30dqga4Ncl47kwB39HNg3DGvh7hotyqIt0V4c07O
         UkSX8OJPU+V4FJ4efFkIulXmxkYx+9dFyMPQpHORRljombZV9qsxUIQTPaUVWdfrood9
         q6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3z51HJNKjg71ZcyODJha9bzdmlQKXSkwASJFXpd5A2tXkMaNO80jlDOLObQHA9AF6dX3zUrnBKps3Ejz4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe5CEo5QhO8E81fJkAlB7XrEnCqFxoa56uFXU9yc8V46c2uiOK
	dUWnb5lCGQ6LI6LgiaXLhLUyWRH4AhLIxqHs9bk/EnPONm1YEfpXuuMLsyU20vk1L41xs1zNWUV
	ENroqcOwU5nNYYxsjdA68+DbsSObaupI=
X-Gm-Gg: ATEYQzyzYFL5RILcmKUKppGHMxdywz1dtqggWOdXJfXo3G0KAsHGDrNXhdP9hrXOrSG
	ObmaXDhMJbIduoel39ovuY0s95pcRo4/E0Yo7igbptahoICZhq4NpuEPUa1r2jqjxUICQNGze71
	inD/8DPHJKuqXO/V5LCU5kz4Qs8t/NH/TEuTMSuY77RpLIwZUjdjASAFJJpqwDDYALC030Thmdr
	LP+Izhv+W/xAgF5JyzM9IGwOZ1Lyg4cPoLWjtPJuPSaWhxkHNDn7rGT+t2PpjrljOTHaNZBMXvF
	kCC7jhVbPf1IZG7RtOurqJpRxbpp173RrfOsUrIHVDeOAgJSI4w=
X-Received: by 2002:a17:902:cec7:b0:2a9:616c:1716 with SMTP id
 d9443c01a7336-2ae2bbde27emr4684925ad.26.1772142760989; Thu, 26 Feb 2026
 13:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-7-nick@khadas.com>
In-Reply-To: <20260123022258.136448-7-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:52:30 +0100
X-Gm-Features: AaiRm51djimkK_UgDeDWQGfUOzE1FCcEV_pCUmahQDUWiDkluPEZvH3ufqK3qJc
Message-ID: <CAFBinCBOQv7BBzqC6vo=eEV=rV_pPD4oLCWp-WL0mS0bUENE_g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add Function key support
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_135242_116101_DB428357 
X-CRM114-Status: UNSURE (   9.37  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMzoyM+KAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gRW5hYmxlIHRoZSBTQVJBREMgY29udHJvbGxlciBhbmQgYWRkIHRoZSBh
ZGMta2V5cyBub2RlIHRvIHN1cHBvcnQKPiB0aGUgRnVuY3Rpb24ga2V5IGZvdW5kIG9uIHRoZSBL
aGFkYXMgVklNMVMgYm9hcmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFhpZSA8bmlja0BraGFk
YXMuY29tPgpBcHBseWluZyB0aGlzIHBhdGNoIHdpbGwgcmVxdWlyZSB0aGUgcHJldmlvdXMgb25l
IHRvIGJlIHVwZGF0ZWQgd2l0aAp0aGUgY29tcGF0aWJsZSBzdHJpbmcuCkV2ZW4gd2hlbiB0aGUg
Y29tcGF0aWJsZSBzdHJpbmcgY2hhbmdlcyAoaW4gbWVzb24tczQuZHRzaSkgdGhpcyBwYXRjaAp3
aWxsIHN0aWxsIGJlIGdvb2QsIHNvIHBsZWFzZSBhZGQgbXk6ClJldmlld2VkLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
