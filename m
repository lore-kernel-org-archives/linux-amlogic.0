Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BF2E94614
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nguECWQl2FrDchaux6wU0NCNiac3siOeZzrwrDRDVh0=; b=TofNgu+HRfVfN4
	8t7qpDTqafjzYEAm70PBDpzlR00J/vSxciTsyaQ+N09BXQR5s/6h1WBgxB9SN6OhxPzAvJY2Bhdwq
	mYEHgNLXhahz9MAUwDW/p4vZTakJ15ipCk5MrVkldBOb9g4HjY3hyY4nKUHJgr/IU33IvyyoxpD3P
	Hf/S2iyRLW8UBCGgAktZ1ARQ7SNJvVCkPakbd99BQXIC9xdx8OUZ4qinlVM98jLWnDtGEJ+1yxCxV
	tz2CDYvB0eKI/diOCSOdYbqANsrtuXH9d1tvHpXdVHzEyFAtIPU6ny6jgXIv9m8fCxwZeg9mSZc0r
	jY32XwLxx8d1aif16COw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZbF-0000000G6EZ-0Qiv;
	Mon, 09 Feb 2026 22:19:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZbC-0000000G6D6-2WYR
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 22:19:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2aaf91bbcd9so8447335ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 14:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770675557; cv=none;
        d=google.com; s=arc-20240605;
        b=bwFiafFN/FyWabxZEa8wGGrjj2zFYbFge12+vRmqq1mpS8wRHT5pX93h88FBhL5DST
         uXHxAxnn6jtrCVrdzjVo7mWdys5MiU8cXOUs4D9TwWTFNMJjIg0gJroTv35KBcidGiKE
         J8TeDgg0oPxdGWamSDr5sHNy3UHnZ3Q4rmSckXDlVb6SirpZYGeS6GKIfsqMvTIjc3G4
         FTEGhE0Li+VOcch6pRT5zfjSUERGhPUG9OI0l7/iwTPQ6s6Q6N6Vh5xwBEAL+hX/0OBd
         pm2kcXvqHsYaDPZIuNr3GoaiP75XmG/osT5UgSTi3X6rqGIO1zGzVKZQc7IIijt93aRe
         u0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=;
        fh=4aUgY+j4hw/n5pOdCEPDI1rB/fyKsDJtZJyZL+7eH1A=;
        b=H0AflG/phGK4SfXyRBopttRAElzq2gD/Lr6d/IPMph6osCtFE2bnUFG7CDjAAChitr
         0hSNrxnMzK9+9wFZQcZzT6BPzbXvIWp4olhtjYtsD0OqntD3Jq3P6WWJs/DFygtT2LWT
         ve3nINfPPQpl4kXzzR7oB0LC3PijOS+O3R6FH7OS2sas6En6RpwDGW2bssKmEpiSePhS
         tKdrYCUBrp2VNTQX99vhpMN374LJQSHg70tSV/rsFEiB8eOoEHzV+X3BxBDf4h7P0OoL
         GAZ14eDVoAlfLmBrAQEj5Bi/Sd7dVwKFYvIpwCPL0Kf+di30D+8zpfNXuE63gc93mWPk
         Cu4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770675557; x=1771280357; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=;
        b=SKpAYax2xBXrP0fHe46WVwmFbkaBkwfAdc5BAivXfoA4n/5+H1KNwCZF+ZyZXHbOJ9
         UFSiGFK7Qo3P3TVkjmhuhiA8XTWefqKyn6k5GF/anacaBy306RD+XEvLpkp0vR1AQlsP
         Bu0n3imvZEgVKecy3bSJAyW1ScrOfKCTpBwNXOjLIgz2sI4oq9mJrPOd6Wyqod+C8ama
         SOiVYZtwW47JkEoVz1dS53V7uraammsGTu71bwgVqhysAo13aA4JTGrIKwMtrDm+dvY/
         HJlM9O2kWTjKan4rThNFlhcCwTFjnS433zf+rgD/2mMNz4MacHrtSegIhtVZ/Nmm20Pb
         vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770675557; x=1771280357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VggFDnvvtT1KJN/nuKTxye7oCcrAlUOoRXA6xSFetf8=;
        b=foERdwYPXwoOfHHd8OESnxz5EK4l8bUVAH0XyS2GGJbkSK/Sl13x+DMWM8iLOFdUKX
         No5l/1GxrqpRGj8Eww9dKCJQTtiH9dIqMuLPbuIyCBGS82Gk0Di5RB28yBJ38NZCTUh4
         oGlAZY2yOcvpsLwdKgyNmeyKO35bQpTGG/FNP4EJsLUxsnm20otKeFr9A5ftoTYPFBPH
         sKQOYqMsaDxIZyLVW5hY5Tua3sm23QE6Pik9s7hYJ//LX/2kRrc9E2+avLgBlzMCtYzG
         oCc82hQVTQrgQDCFhO/+XPqwhiTYdmfzDkQ0MYogfcsPHrmyTaKl/zO1nyRIRKKTzas3
         5+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKQcXt0gPPlLbgkrxMT7lVxjINE1TCDm9hPxYuF7kyEINU4Ds+wPdpLk/bk6kzeoIhopb2jA/3idOEIM+8@lists.infradead.org
X-Gm-Message-State: AOJu0YzXAYun8lwyk/Za+5uANbp/JwP6Gl2TienWtQfkXBUjrVjEKSea
	rJ6a9hJJM6oRB+K9IXB/+2IO5n/gmi6Ip6TrTY/UXyFAo5ti7DQQJGltCWwmNbdSMRvxPxYnRKj
	juaUqQ7uda83GUPCSSLoa4UT7yyJuyg4=
X-Gm-Gg: AZuq6aJY5LMnZyzjY6z5emoIV+dVgxh3MSydx/Qq7Y5rrPLz+ymjZb6eKC7LJGZO6Qp
	rm4Rw3a/amCgKl9AoLATU9eVkme3SpauTeAiL01QfopJvZFH6LXViFsj69Ub0rAHvRIVN3NaNqW
	ld6KMA+wK9Rvgff3WBizrHPopntYIC0nF/5KuPcCROZSrg07UtlfH8P5/0RjXSaRO7BuMy1+vi2
	DHjloaUtnMOxs4cbV/vJ3zFjBybJeyYxXS+3Qw6h/0u41yRlN+uVllp+ShZFI4ZKFFhmHH7R7ui
	VTwJ/eF24xHb+n88KnVGnasqwdgw
X-Received: by 2002:a17:903:2d1:b0:2a2:acc5:7a42 with SMTP id
 d9443c01a7336-2a95191c8e2mr124339365ad.48.1770675557411; Mon, 09 Feb 2026
 14:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com> <20260205-a9-baisc-dts-v1-3-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-3-1212b46f95a7@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:19:06 +0100
X-Gm-Features: AZwV_Qg9LUz_u7q2Di_xKsLO42NKK9yJOVult9PsUi5OKRe5xJqGAGGc88gzm-A
Message-ID: <CAFBinCDmOG74HMTo7AtYPUhWCJu3_e0XjE=CKuDWOdwfq21ygA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: add support for A9 based Amlogic BY401
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_141918_663484_9DC6C3FA 
X-CRM114-Status: GOOD (  11.84  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCA3OjA04oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Clsu
Li5dCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE5
LWEzMTF5My1ieTQwMS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1h
OS1hMzExeTMtYnk0MDEuZHRzCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLmFkMzVhMzI5MmQ0OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hOS1hMzExeTMtYnk0MDEuZHRzCj4gQEAgLTAsMCArMSw0
MSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkKPiAr
LyoKPiArICogQ29weXJpZ2h0IChjKSAyMDI2IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KPiArICovCj4gKwo+ICsvZHRzLXYxLzsKPiArCj4gKyNpbmNsdWRlICJhbWxvZ2ljLWE5
LmR0c2kiCj4gKy8gewo+ICsgICAgICAgbW9kZWwgPSAiQW1sb2dpYyBBMzExRFkzIEJZNDAxIERl
dmVsb3BtZW50IEJvYXJkIjsKPiArICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxieTQwMSIs
ICJhbWxvZ2ljLGE5IjsKPiArICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47ClNob3Vs
ZG4ndCB0aGlzIGdvIGludG8gYW1sb2dpYy1hOS5kdHNpIChJIGNhbid0IHNlZSB3aHkgZGlmZmVy
ZW50CmJvYXJkcyBtYXkgY2hvb3NlIGEgZGlmZmVyZW50IGRlZmF1bHQgaW50ZXJydXB0LXBhcmVu
dCk/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
