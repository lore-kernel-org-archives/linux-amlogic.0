Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85516C79FAF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oUKA0Lu9IZc1lwx15iBI72Dtq87UW8i5cYPM1I/iww=; b=KN2cFaL5P9RGbQ
	cUBbRWWU4uMWfo6CgyQh8NgM3YDN1KDv8vNtnvHzNcdmVPbOmLG9qtLc6PqQUGEH5tZr2jFoFeSwB
	os5m/96TWaA5Ut4yGo2JnoYS7ddOkqo8goSctrTO2+7rCksVTBK9wjXQOqXDHpzYT1Qzg+5GNZDfS
	CSg1E+6gPYAntJ9fTM6ZR8+wsWoWvgdjyyZOpFzQrOlPuof4wqv26d8jhPZpYkf+8lWggb0Lho1R1
	3G8AGbMy7GK/H7oMcpWBKIkZjvNQID5vu72p0NM7gXGFFzsMYkD1VLxYdKaz8pATInkleOGGAoGwH
	eZKijOpTJy1H8j8QOOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoNi-0000000Bpnv-1MDF;
	Mon, 05 Jan 2026 17:28:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoNf-0000000Bpn7-2JcK
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 17:28:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a12ebe4b74so1924055ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767634114; x=1768238914; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=;
        b=R4DE8hUm5MRzgSyXzHNdU1oEnRaR6WRFUwy06DAlQ14bdq0ECFPs+altFNOFACGUiz
         vEyw84NaWuSHyAFXGhqDsXsCE5+qIe/fpzCk2RZWGOiitwrz5EqVAjx7gnTZ8U8/m64m
         71MtIUo8onrw+X/rlwlTFbAnoJ2KwJgrUcrF4ZO0E8lmrMkRZu35b6ip37gKNa7F3IWA
         mkqn7tQHY6GtCDcUY3Y/TkdB1DbrzDw5KjJtfDT7OFJz057aMm+1TEkolIOANkgjbMcd
         MYkvubOWymzYf22P8isnUA+sK4PIhK9ld2Vi4UKDgQvrFj2nYwXe6VJuylPVwrhXYRFk
         es9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767634114; x=1768238914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=;
        b=uB9S0qzbdI62tzcCMcAAmG8Y8ChLz5bxl9jW3TO6d8sAsP1D1xkJ+mlL1bh4ZwQ/Vm
         9YDi+idzTkoxW1vSqWhCmo1RNoZTbkPZcc8/VnpJT/VASAqlgN/W2X+O8hOiWsV5E9av
         FzGW6yTVAx4oaLxpEmHD05ZXrWUTt171aCoeGv3ITd35OOegL/lajSzIr2KFblWXikT2
         BR5KlURg97kwhnx0tFkSUBvnE6A3PJgQwlstZLX8mIt95sFg7t1q0KIL7LSXMiezqrbo
         Qi0O1B8aArPZwWwcvvfT+FnDhmpGdtx/kGruRF4UHKwDo9dmzH9i5q79oPhAlkskypt9
         Nmeg==
X-Forwarded-Encrypted: i=1; AJvYcCVRcIjC4+ITJq8XVII/n7YLtPH7/pPlq0eraCScpPDuFCfVj3zOwEg+d/7k6EaWaQ9vGgmuuD9Y7Tq01JVR@lists.infradead.org
X-Gm-Message-State: AOJu0YwMgWatSwLtVeilYCwrIA2Yu2r5FKhW+ZwyeR+FNyJBoJGLlayA
	xFbaxugwVRibXvY/SuBjUglw4CpuurwyUF/KfS3yHwZ0+HdKNXPn2a7cPErHXzFe9oM+L2kOhCM
	bFW72dlnonzkgJwa2+INggTxjEr0Qae4=
X-Gm-Gg: AY/fxX7PauSsOfMD4quGnd2h5MOfwfyiAoxQe5HvBFmrBS8hHLtNyF2Z49PW7zRwVMB
	VefHSSMDrLRolsmP5hcu5asg+x/1W7X3t25S5xxlf3zLTvbgFNTGheUYjW+IcIKiLsg1vUnISmQ
	xGmVWb4Ywqk+00T3qiulM9JaYX3g8E0OncPgDkYLURbkkmzE2nQTXEhkd/x4KiLjxYdn3Ct9B1/
	ARgjipXZvKte/DIdWDc5H1NTP7YHr/NI2ngTERMM3zzibTnWYWwcyq2Tot5LRtaEQz/21ipeAsY
	omjKfjitfH3FfJVqO3k7cF7kAgF/
X-Google-Smtp-Source: AGHT+IGpy3FSTV06PFzbySqT0GxE+YkHmWqyF+kpdkmaFPx4+wxyXnjiYwrYZ6SYwKhEXTYGmchl6zZMo9euRvgtVx8=
X-Received: by 2002:a17:902:d547:b0:2a0:d692:5681 with SMTP id
 d9443c01a7336-2a3e2da7892mr3742555ad.24.1767634114320; Mon, 05 Jan 2026
 09:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jan 2026 18:28:23 +0100
X-Gm-Features: AQt7F2r1mVRbDaQh2zFy4l3agObZCNqWz_Ifa4aviOfolqOQgQGGMy9JJh7ZWmA
Message-ID: <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092835_590415_EACE8807 
X-CRM114-Status: UNSURE (   7.64  )
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

SGkgQmFydG9zeiwKCk9uIE1vbiwgSmFuIDUsIDIwMjYgYXQgNDowNeKAr1BNIEJhcnRvc3ogR29s
YXN6ZXdza2kKPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Clsu
Li5dCj4gICBtdXRleF9sb2NrX25lc3RlZCsweDI0LzB4MzAKPiAgIHBpbmN0cmxfZ2V0X2Rldmlj
ZV9ncGlvX3JhbmdlKzB4NDQvMHgxMjgKPiAgIHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnKzB4NDAv
MHhkYwo+ICAgZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWcrMHgyOC8weDNjCj4gICBncGlvX2RvX3Nl
dF9jb25maWcrMHhhOC8weDE5NAokIGdpdCBncmVwIGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnIGRy
aXZlcnMvcGluY3RybC9tZXNvbi8KZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dp
Yy1hNC5jOiAgICAgLnNldF9jb25maWcKID0gZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWcsCmRyaXZl
cnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLmM6ICBwYy0+Y2hpcC5zZXRfY29uZmlnID0K
Z3Bpb2NoaXBfZ2VuZXJpY19jb25maWc7CgpwaW5jdHJsLWFtbG9naWMtYTQuYyBzdGlsbCBoYXM6
CiAgLmNhbl9zbGVlcCA9IGZhbHNlLAoKQXJlIHRoZXJlIHBsYW5zIHRvIHNlbmQgYSBzZXBhcmF0
ZSBmaXggZm9yIHBpbmN0cmwtYW1sb2dpYy1hNC5jIC0gb3IKd2FzIHRoZSBpbnRlbnRpb24gdG8g
Zml4ICJhbGwiIEFtbG9naWMgcGluIGNvbnRyb2xsZXJzIGluIHRoaXMgcGF0Y2gKKHdoaWNoIHdv
dWxkIG1lYW4gdGhhdCB0aGUgY2hhbmdlIHRvIHBpbmN0cmwtYW1sb2dpYy1hNC5jIGlzIG1pc3Np
bmcpPwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
