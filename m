Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C21EB64DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H77RZuOYIArpXzGQMmHEore4sRcUJRqgDMKr1Q2ea+k=; b=vtc/jSY86hUkSK
	ZetxveruXYpbSxPYXc5Z1lLm7LLKW0Y5yvdHO5EoKxwzE/xKUK1nAinzS7O9cDtryqRdEPEpm1xWO
	ZAmsZi5b1/Mz8Hr1FdDVKN1qGnt1dBV+omN6wW8OyZ14gQc9cHQ/wABVOf6dP15EP9+zo/gm5faUr
	BsUgpv7jxWivGeSRKLI/y7oYqgzkIl6OsejaYV4K0A587AdebDLIxo7g5KMxtHqFFKldq0tfZ6RF9
	jvDl6qJBn3sMnjCW1ZYiQTOjRCONT5mZetAigUs3tp2F+ks2NqzbtK/Rzdgldx5MOkrZxXeulPb/a
	xI64aWzWUUziq3VSo+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDX1Y-008jJO-2f;
	Sun, 25 Jun 2023 21:11:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDX1W-008jIR-1m;
	Sun, 25 Jun 2023 21:11:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a1c0so6841615e9.1;
        Sun, 25 Jun 2023 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687727511; x=1690319511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzoUzU5JNLv1BoIvSxcNlVmIryUfpeznhRFS/dmU0XQ=;
        b=f3soY7SiE5lWLMYA4zBOBrr7HPGVFWMHBbiNne9cwsruoLhouTAeuoc/Lw88Q87QA2
         GJ2iHnL8I3wcV0f3M8pSBf7hnt1yYFcJpX8lYcd/byYG0pW+lBEXh1+eSi16Xve+GgRx
         Z0TQyaZOYw1VGiQYdyNltUQ86jQLQsJqNmbJWHHaCwVm3YfzVs5+liXGRTv2y1Vh+Fu1
         ark4vBKsW5szlJCcrLs2zmVYPdMgMTBfRuFd+jxUYmggi9g6mhfoXXmBWmkFMwcjaIwe
         1A1HR6uDNz+Q1aYdiGkg+LcED9PlMSB++YpCfP4PWrRckdV5CBqcrROKmjpttglv++IX
         o6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687727511; x=1690319511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzoUzU5JNLv1BoIvSxcNlVmIryUfpeznhRFS/dmU0XQ=;
        b=byM6xlmljrcgtMC64K6DZZCc+WewT8+e6p2YgLJMNqc0CkGnyVpCk5b+5HjJrOrzSQ
         G3tdrgg3Z0NJOeawcByudtun4jgxaXc52pqXpg8UNd1OWK8UgaG9eHlCvPvk4B7iGNde
         9Azf6i6PsG6FcZ1/QevDrapMU4N7N9J/n/ZoLyMN/T9o+lVrOKCvQOIbujlaxBX0ET8F
         yVIddWc9yc+Gj5ohEZImfGzW8SUlghePksrNI3COKvItfgwRszvsf/xLVcBC6hYGCPzy
         INI5ti5r+rMT22rRGMktJFGAxH5xpilHYiOBSjVKn0+NCIDSbWYzdG1z840Ef6pPwFni
         Ktfg==
X-Gm-Message-State: AC+VfDyUmxXOVKxnlHLell3c5VFOXBI7wW8cvchJbiH2UQafywtBkU8b
	WcQj0dwOHjFuTPy3TlXprBgkg86jM2qfbXIQThQ=
X-Google-Smtp-Source: ACHHUZ5IoXpoYLc8UZ4LjxmbBpdiAV7bkg6VF0dePcdWqFrB0RTjr5kEBzsBZAuKo+wl+DE7GhD7gDCTlKy5cAFG06k=
X-Received: by 2002:adf:efcb:0:b0:311:1cec:225a with SMTP id
 i11-20020adfefcb000000b003111cec225amr19789806wrp.15.1687727511239; Sun, 25
 Jun 2023 14:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru> <20230607201641.20982-7-ddrokosov@sberdevices.ru>
In-Reply-To: <20230607201641.20982-7-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 23:11:40 +0200
Message-ID: <CAFBinCC_g6FhzR=PNDsYwT4OZb4uAXAWYGKSe7vSX7_pWM8pNA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] arm64: dts: meson: a1: add eMMC controller and its pins
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru, 
	sdfw_system_team@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Jan Dakinevich <yvdakinevich@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_141154_586314_2DBA673D 
X-CRM114-Status: GOOD (  12.24  )
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMDoxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gRnJvbTogSmFuIERha2luZXZpY2ggPHl2ZGFr
aW5ldmljaEBzYmVyZGV2aWNlcy5ydT4KPgo+IFRoZSBkZWZpbml0aW9uIGlzIGluc3BpcmVkIGJ5
IGEgc2ltaWxhciBvbmUgZm9yIEFYRyBTb0MgZmFtaWx5Lgo+ICdzZGlvX3BpbnMnIGFuZCAnc2Rp
b19jbGtfZ2F0ZV9waW5zJyBwaW5jdHJscyBhcmUgc3VwcG9zZWQgdG8gYmUgdXNlZCBhcwo+ICJk
ZWZhdWx0IiBhbmQgImNsay1nYXRlIiBpbiBib2FyZC1zcGVjaWZpYyBkZXZpY2UgdHJlZXMuCkxl
dCdzIHdhaXQgZm9yIE5laWwncyByZXNwb25zZSBvbiB0aGUgb3RoZXIgcGF0Y2ggZm9yIHRoZSBx
dWVzdGlvbgphYm91dCBwaW4gbXV4IHNldHRpbmdzCgo+ICdtZXNvbi1neCcgZHJpdmVyIGR1cmlu
ZyBpbml0aWFsaXphdGlvbiBzZXRzIGNsb2NrIHRvIHNhZmUgbG93LWZyZXF1ZW5jeQo+IHZhbHVl
ICg0MDBrSHopLiBIb3dldmVyLCBib3RoIHNvdXJjZSBjbG9ja3MgKCJjbGtpbjAiIGFuZCAiY2xr
aW4xIikgYXJlCj4gaGlnaC1mcmVxdWVuY3kgYnkgZGVmYXVsdCwgYW5kIHVzaW5nIG9mIGVNTUMn
cyBpbnRlcm5hbCBkaXZpZGVyIGlzIG5vdAo+IGVub3VnaCB0byBhY2hpZXZlIHNvIGxvdyB2YWx1
ZXMuIFRvIHByb3ZpZGUgbG93LWZyZXF1ZW5jeSBzb3VyY2UsCj4gcmVwYXJlbnQgInNkX2VtbWNf
c2VsMiIgY2xvY2sgdXNpbmcgJ2Fzc2lnbmVkLWNsb2NrcycgcHJvcGVydHkuCkV2ZW4gaWYgdGhl
IHBpbmN0cmwgcGFydCBzaG91bGQgYmUgcG9zdHBvbmVkIHRoZW4gSSB0aGluayBpdCdzIHdvcnRo
CmFkZGluZyAmc2RfZW1tYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
