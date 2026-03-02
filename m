Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE46CEB3634
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 20:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E1p8ZVJMn3fjgXVTSfwiZQEnz0eX1OwS8zFL/K0cMk=; b=WTM50ulp+ZOO3/
	QmgEz7M/Z9pVF/PI4EedmOxEeqVcCUqLbqh1s/eWlIXf+VSP4PM17ptRInc7xv/u2KoVQYM1LjNjh
	mjj+ypIsQmiNUIf3usNObU5mPpaFGDwwFhV5BQqxHmmiIf/TUGY/nKmjKx5tZP14aPv/oaKdMNZQc
	tN9lK0hSz9vvfYMQONLDaFf/pWcZ8EtFKr+oHYgAa9CWjQUI5ITCz5JEj4mtkHbmAQY92Fq5Ly9AO
	C/9WDUWuzflwVxDv6yY7AijA44jK/fErBuHpXf1WyeI3/C0l6vySGY6t3raaSCogw4Vfk2Dp9YIgH
	td5NA7MoZcrouFGe/R6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxACg-0000000DxBI-1pJB;
	Mon, 02 Mar 2026 20:49:22 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxACd-0000000Dx8W-2FgB
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 20:49:20 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1700075a12.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 12:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772484558; cv=none;
        d=google.com; s=arc-20240605;
        b=G79GIqOVJRRQDhZOFxK1ccVHBMqa+ucbdp/QiCGcXpiSrKT1cJsBfcWynD87YVsbOi
         GDeNWyWxenbT7ml+WvVpptpqetK2pYXVEboQGBMbZruhko6SGQGNqUeCeyAuOglgRp7n
         DZfqFqS9vIRlx7fHYbowD8yqe8xrtAX/7YeVVs1VECcu5dBKSItUZCP3UigIQyqHl2Xy
         XYZL/34NC3MKhKeTD6qTIDmN35imC2KOjA1A1Zgf0qM3Bi7YrnNy69P8P2/jLLtott8x
         DqvGcJB8ujEYkHRby7aqurX0Teezn7/tvG7gEjkANqMxSWn2J816ksorCLiPirRpkqyI
         6xCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=;
        fh=kP9o2IWgghX+bPClwM3twENrYyxYK0cIugFej5hS+j4=;
        b=S0JgAQC3W7Jcp2QuYtzjQ/UbODF5e7o+ZBZK380RhOQvnbbnvckB7WRvJQnS4mHxiK
         cNHbOT8shl6fZysSHKCqSdXLjYlltzgqYYxyxvOwXULtg95LbfR84zCj7VxSWe29PwoR
         xuGYiher04qgqeLgBWwEja61fEiHiHmGLbXEgtkO88Wq5v6UofdOfubmIMXVCpqoF983
         0R46v4hFIhUWMmT2q/BjfK0YrFvKMB/bE6LvtCp5otNHoQpih16gp6oLHngb/NeiXVS6
         eeQrDga+ko1kdpKpVw6c2wtixyeFMTCuBtEfAzICitWclzje8iAqRQCEkNbCsjtkgiar
         0gDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772484558; x=1773089358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=;
        b=ULEcZjCuYfHXJknxh3FEISQfdBsJeNHjzPXJfTuIDeQNLXHcXiHYaWvdKG+AZ+dhLA
         jzw5GUzv3FNCitIKx+farO+1syCsQGLGQh4myxsYK5AHCR/GbJjaa1b6ORO1essA3rxQ
         VQS3xpOKyFMZrBWardfbYuQSXBzyeIOasY59wpllJ9+3cSRiLUrq6rfeFS7QeKtJKGPH
         TgdVNpmzyKQsJPaRfnlmtyGFroIY1P6ItiVEx3fcuAIQc4bJMjlOKYaT5g7hMa1mTTBB
         FtNocWnPNOgqTl4/aMbQgRDViGB9LKhBQQF6aOjGBMttNGgQWAjhlVMLNeXD8uQgiFVf
         S8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484558; x=1773089358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyH4XlAxExvFjyU90KL9v8Os8YItCUBGdVDa5Zw1Ozg=;
        b=MJQ/uZxxhZoius6STK/7c0eOz4udW1hDBJKvY7VVfvVSDh7e2gePWKkzq3u/KNP1Za
         Q9GcaXUAAlvjGPvmtW5zZCD0VA3xRbiO4a6tML3q0uhzetNwijprgCNWC06V+KO+CspG
         U9yyU8dwN7N5hvN0syIz8c4m0s0S/T6Vzcc+e1Ibf9lEhUN55x4Sm9uWli9j/f0q6ldk
         43ezwYVOOe38KhStTyre3LnH5ZGLwHtGfu9C8hRSkm1WotUvU5UFgZgEzs1I5WHMdAHi
         Qe0rKIfhhZAu9IVwN1LVlWphOdZ8QAeaG3N1pVkMoUqOyShd5jsfTTJ0gEhgWZC12j/o
         OqqA==
X-Forwarded-Encrypted: i=1; AJvYcCW+AOya/8VG7vVb5qnx6da6HuwS8k/0v5Q5kKmJhDJz3Va2knayI8GsBEnb/Mk+r13z6vRCx6s5V42psgRg@lists.infradead.org
X-Gm-Message-State: AOJu0YxRqqcQaldp8aHRLYQi3iho6FhfBPmq8ezlz/abQR1678n0MKZ4
	NzV9xgMIgtzDG4Mxstl4swbuYzglmNtZ3E9ADdcDq1FzrQ/dnE4T9NQ2D0bD7FARpwCIfXa32nS
	i8wofOEuySKKao/5ZP+KIUR639S06O64l0bL2
X-Gm-Gg: ATEYQzxugKYzILIhxRq7w9OSF4UIf6upPHSbHiYF0F/rWx9Wf7GZWRBxQuRaNPrlwoF
	jvcwGuFeE8jiQYCX1hSZApDVmDVOVqk1uLiu4cxAQ29mRelYn4aRSu35opn4/xM+Z3skJq3YL+h
	RQEB/aIZj4jmhBUAPIyzK8ZE5HFDEBq8u8EfEzFSfmTkhYHzZ6ikPuYLi6JFvqbA9A8zwJLC4/w
	b94zH4q93HCROg8aHy4AaB3Dd1zcK6R9vZAETRR8HkdRBhNmYDdpPjaBPd3VE3ouLRLOQhrJbZi
	feqfwSoaZhIoysNMX6HStY7fs0cu3awBKEZU/czq00vXNMs/l54=
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id
 d9443c01a7336-2ae56551006mr30904985ad.21.1772484558371; Mon, 02 Mar 2026
 12:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com> <20260228-a9-baisc-dts-v2-3-47489d5cc1a8@amlogic.com>
In-Reply-To: <20260228-a9-baisc-dts-v2-3-47489d5cc1a8@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 21:49:07 +0100
X-Gm-Features: AaiRm52vtoxByONz8aPJPqxZwiZKHaI1xY4O5j-m2jy43emEUvOKpokAtRMTsc0
Message-ID: <CAFBinCBo1-at-TqZC5Gbunos4k_KTikPS_yAW5z0NLcnzpuSBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: add support for A9 based Amlogic BY401
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_124919_588289_F75F1B48 
X-CRM114-Status: UNSURE (   9.41  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgODo1NuKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBZGQg
YmFzaWMgc3VwcG9ydCBmb3IgdGhlIEE5IGJhc2VkIEFtbG9naWMgQlk0MDEgYm9hcmQsIHdoaWNo
IGRlc2NyaWJlcwo+IHRoZSBmb2xsb3dpbmcgY29tcG9uZW50czogQ1BVLCBHSUMsIElSUSwgVGlt
ZXIgYW5kIFVBUlQuCj4gVGhlc2UgYXJlIGNhcGFibGUgb2YgYm9vdGluZyB1cCBpbnRvIHRoZSBz
ZXJpYWwgY29uc29sZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
