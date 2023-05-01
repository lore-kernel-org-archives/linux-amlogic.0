Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36D0C77B73
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vvi5PUgkNJKL6HiANCvt1TEhMULk72KSVOLT1sWCvIo=; b=TyvOcDSy3r2yOH
	DJcfEiJ+MNcNs4vjBCk6QzERz6m3gERBrV24LK3xEeDF5w5qYhxohAtCCEn6pnK47nwgGj3Hn+mqZ
	NzJpNh1G3acyeclYoC9tJA5U0TMFpURqSTT/GLYB3cVlC1QG0h3kr/0+iNi4ei1KZWxI3h6jIBzIf
	0tf/eZLSLu1WqBtSb/gHmk+j14OMSw6UzCfMEtk1iX6YAZCbmkn44Pc/vtRmm4w+DnImbBtkcB44k
	HmNtZLhaRa38M72kBrumS4eZgTKW5pZmdIXTR3eP+eF4bMVq2ppFT8N2KtfCWkoaEGckmWo9Q7EjV
	VA/2FQz4SENI5OGcjAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYck-00GaU8-2f;
	Mon, 01 May 2023 18:51:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYci-00GaTj-1o;
	Mon, 01 May 2023 18:51:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-95316faa3a8so575832766b.2;
        Mon, 01 May 2023 11:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682967102; x=1685559102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zP0vMHwmZXieSLSNoKwDOqfsPAbGPB2SLcEW5GPdQQ=;
        b=qroS6O6kMMC6J1KDt4ywXQ/bMsQxOvCbWfZ/Z7UL9WvtneEH9hyOzLJKZSuA1XDjC2
         z8vTFN503MhQ30OdZzw+3uqIn07y95dgWsPGJ8Vqyg9tmU/MJqQ0GHtCUkTIAqvst54A
         J/LPoj2XO0Um/QW62ThpAvfq7Xj2QHWR/UVu29rhbcrfbK5w/LMXx9iyeZ80PPFfaJs2
         PiuQ0N9bhznCxeGk3c+iBVG1lJTdxhAtP1NO3Z1RsnLPjdy6hQ+VxioLQIWmCpbddvM6
         w2IEdLAalCYnNAvV/8kyXEMSz4JX8cXAP9xOpHwDq0mGbD2TS9kn+o6qSlkGpjzBu850
         iC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967102; x=1685559102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zP0vMHwmZXieSLSNoKwDOqfsPAbGPB2SLcEW5GPdQQ=;
        b=ZQ2qm/+xMUi5zyesiCWwmQUMXc09X20F/TAMnDN0NqUu8D9SgC9Tp5otl5OUwC6Ous
         sVeAuy4WP2Mn/hNlK2rKq0IByh9jhaa4THCgFZxp2Y9+vi+ZklkS+O/FT2OtiQ6W5rJ9
         peGj6ZF+jonVX9uBEA8IhO7prekuRG72oWtOia+ABW/w+R8U0h0yf9J/flzw6L00bM1A
         pn8uWNI8zAWhYIPnI8ZWPTo+9o+6Pn+FgoDfqxf8+qbq+HdlV/5eH3FEeND5CigtmlKT
         JbU+r3oH7sCJvtV267gYUwa6usWalVDfWAxwxg/09s28l4PX562gVD/x1bVnE3Tqqxj5
         5V4w==
X-Gm-Message-State: AC+VfDwzeQFOE2/1jVR0KRYf7TiimS9eV+8keEhgfgf6/ayYY8b1xroS
	ZCFLaJIv3aVBg0nW3f9xYEOXV/VtIHxa7flQm1Y=
X-Google-Smtp-Source: ACHHUZ7Me7pTW5yueWPmd5/+A3AyHpU4s8ymVXhEcf0C84hqs66/hFNO8zjhF4mjKtwXfMXaDosvgVn1TOg7qkbMEBg=
X-Received: by 2002:a17:907:7da9:b0:94e:c938:1987 with SMTP id
 oz41-20020a1709077da900b0094ec9381987mr14785122ejc.7.1682967102192; Mon, 01
 May 2023 11:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru> <20230426095805.15338-6-ddrokosov@sberdevices.ru>
In-Reply-To: <20230426095805.15338-6-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 20:51:30 +0200
Message-ID: <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_115144_599103_E7710F4C 
X-CRM114-Status: UNSURE (   9.24  )
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

SGkgRG1pdHJ5LAoKT24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9r
b3Nvdgo8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPgo+IEFkZCB0aGUgZG9jdW1l
bnRhdGlvbiBmb3IgQW1sb2dpYyBBMSBQZXJpcGhlcmFscyBjbG9jayBkcml2ZXIsCj4gYW5kIEEx
IFBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3MuCk1heWJlIGEgbmF0aXZlIEVu
Z2xpc2ggc3BlYWtlciBjYW4gY29tbWVudCBvbiB3aGV0aGVyIGl0J3MKInBlcmlwaGVyYWwiIG9y
ICJwZXJpcGhlcmFscyIuCgpbLi4uXQo+IFNpZ25lZC1vZmYtYnk6IEppYW4gSHUgPGppYW4uaHVA
YW1sb2dpYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFJva29zb3YgPGRkcm9rb3NvdkBz
YmVyZGV2aWNlcy5ydT4KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTEtY2xrYy55YW1sICAgICAg
IHwgIDczICsrKysrKysrKysrCj4gIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGExLXBsbC1j
bGtjLnlhbWwgICB8ICAgNSArLQo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
YTEtY2xrYy5oICAgfCAxMTQgKysrKysrKysrKysrKysrKysrCkkgaGF2ZSBzZWVuIHRoYXQgWXUg
VHUgbmFtZWQgdGhlIFM0IHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlcgpiaW5kaW5nIGFuZCBk
cml2ZXIgInM0LXBlcmlwaGVyYWxzLWNsa2MiIFswXS4KRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGFw
cGx5IHRoZSBzYW1lIG5hbWluZyBoZXJlIGFzIHdlbGw/CgoKQmVzdCByZWdhcmRzLApNYXJ0aW4K
CgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDIzMDQxNzA2NTAw
NS4yNDk2Ny0zLXl1LnR1QGFtbG9naWMuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
