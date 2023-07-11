Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E97AEB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 06:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZhj6Boitskc0331SW5MKL6IHFBweLkNqwjuvr6TiGk=; b=PqHV333pjT1ytv
	VA+h+aLxSDaUNiiEgWYfp6lPhdaTZvuwJSMJ0Seo2khzFSVACAb5yzpa8M7qRRAFT5RUj6PW69dE5
	pXWosQNeDWxWjCtZ06q5KyvGmMvRRR5RGxjqjKh//qui/56lD3OJmdxsbQxRfMnz+l5hLv/M6LHCP
	CiUhs7xbWu7uS+ndGlW7oUcEf/Aqt4V6FpYrTEQkmYshkVTHEh4ibsqNpKmgxGIQXjAjELZwICIhM
	dQKSP6NpdTpdCzz0E1t1S7f25lmNuHbLTv60QTpg7qduxwMTrK0xYTTohkxkSenkJFGCkcaMwhXT9
	Cb3OY9STM4UjNEx9jOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ71h-00Dtgb-1J;
	Tue, 11 Jul 2023 06:39:09 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ71e-00Dtg6-2T
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jul 2023 06:39:07 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b703caf344so80363871fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jul 2023 23:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689057545; x=1691649545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elXCUTOCMTi1ImRqzrKtVg2T8j1H8DoAExvbCuJEHck=;
        b=bV+lIDNS9l71GtmTn/MBxlZNwGgvjaf398QyPfvN3943weO14tRLQ04OSKDq4E8j45
         RoxlS9CnUz9ggFbi9kCa+zwZFEzsv5tl+/fDTgeblNku1WOt7ntHM0syKcT34GGJ1A4D
         fKd92zMD+hxHC9neqX2mzTTJ9PBNhPahgjJpRiJSWawwyLtBu3HuzYVsFGwh4PyiLbjC
         Zv05i8/8Hs3jI7pLMaUK8xniRgzPs38Sgi+dOVJY/i3fSN9iBHtBHBNM0UAa7jsoFnqR
         8OGXQkZSiKVtnRDHFz8mbQtba9uKQCkjzGTjDI2IMai+4qbyrguuvdi4KlQ6LZvM8YUI
         riDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689057545; x=1691649545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elXCUTOCMTi1ImRqzrKtVg2T8j1H8DoAExvbCuJEHck=;
        b=B3gPFgysOuV+ybTGntUELOQLsOdNzStTv2s2C8Dx1HPPdwoPifNs2qjGEpQC4DCM9V
         KWJ9IbFbl2XCxXSsL7dEFMILTQivQVdadrVNYbmUn6+IHv9oDljz9wwm8lCiLCkgdqll
         gFURQiJ7go65Ig0sigGly5fWgrcwdctKsL0fEPyVOGv/1H+OmAWyfRHKIJpFKezzTY65
         2WMxfnlyIl2iqvzhDZv62eAz+L0NVtOUBZOspQzpoAYbB3qW2eGuQuKERrIiXTnMuwwW
         blImqyBGPx65vFia/eIc5+2rWLz85bMCsHXD8kvVuQJFT2nqgyeJK5EyOuxzid6AMc9h
         HqHA==
X-Gm-Message-State: ABy/qLaVeCX7K32d0Bi7XVUVQG2T4lN+U3Sy4f6zrfdRoq+VlgREQ3nS
	XtlBag8i8PNwmeowC/kel26rP/Tx7fR0yICGvB8J4Q==
X-Google-Smtp-Source: APBJJlGpNNoFpy6/AS5QCL+upCPP64TZ8gxYYmR/GUA8O1+pECLM0aRmgpRHxbBfuPrk1WuweREZc/K8x0DKkDZVuPE=
X-Received: by 2002:a2e:98c7:0:b0:2b6:e2c1:9816 with SMTP id
 s7-20020a2e98c7000000b002b6e2c19816mr13629656ljj.20.1689057544922; Mon, 10
 Jul 2023 23:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org> <CAFBinCBT8yP5yZVOkQhkpQ0N83VO1Ctdm+npb91rLiv3KQz4ZQ@mail.gmail.com>
In-Reply-To: <CAFBinCBT8yP5yZVOkQhkpQ0N83VO1Ctdm+npb91rLiv3KQz4ZQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Jul 2023 08:38:28 +0200
Message-ID: <CAPDyKFpTsCtkciaNmjm5ZXqDapHGip23FphHkd9+bqBviWT07g@mail.gmail.com>
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_233906_804688_E5094E78 
X-CRM114-Status: GOOD (  11.98  )
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

T24gRnJpLCA3IEp1bCAyMDIzIGF0IDIwOjI1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IEhpIFVsZiwKPgo+IE9uIEZy
aSwgSnVsIDcsIDIwMjMgYXQgNDowNOKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5h
cm8ub3JnPiB3cm90ZToKPiBbLi4uXQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvTWFrZWZpbGUKPiA+
ICsrKyBiL2RyaXZlcnMvc29jL01ha2VmaWxlCj4gPiBAQCAtMjMsNyArMjMsNiBAQCBvYmoteSAg
ICAgICAgICAgICAgICAgICAgICAgICArPSBtZWRpYXRlay8KPiA+ICBvYmoteSAgICAgICAgICAg
ICAgICAgICAgICAgICAgKz0gbWljcm9jaGlwLwo+ID4gIG9iai15ICAgICAgICAgICAgICAgICAg
ICAgICAgICArPSBudXZvdG9uLwo+ID4gIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICAr
PSBweGEvCj4gPiAtb2JqLXkgICAgICAgICAgICAgICAgICAgICAgICAgICs9IGFtbG9naWMvCj4g
SSB0aGluayB0aGlzIGNoYW5nZSBoYXMgdG8gYmUgZHJvcHBlZCAoc2VlIGJlbG93KS4uLgo+Cj4g
PiAgb2JqLXkgICAgICAgICAgICAgICAgICAgICAgICAgICs9IHFjb20vCj4gPiAgb2JqLXkgICAg
ICAgICAgICAgICAgICAgICAgICAgICs9IHJlbmVzYXMvCj4gPiAgb2JqLXkgICAgICAgICAgICAg
ICAgICAgICAgICAgICs9IHJvY2tjaGlwLwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2Ft
bG9naWMvTWFrZWZpbGUgYi9kcml2ZXJzL3NvYy9hbWxvZ2ljL01ha2VmaWxlCj4gPiBpbmRleCA3
YjhjNWQzMjNmNWMuLmMyNWY4MzVlNmEyNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc29jL2Ft
bG9naWMvTWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMvc29jL2FtbG9naWMvTWFrZWZpbGUKPiA+
IEBAIC0yLDcgKzIsNCBAQAo+ID4gIG9iai0kKENPTkZJR19NRVNPTl9DQU5WQVMpICs9IG1lc29u
LWNhbnZhcy5vCj4gPiAgb2JqLSQoQ09ORklHX01FU09OX0NMS19NRUFTVVJFKSArPSBtZXNvbi1j
bGstbWVhc3VyZS5vCj4gPiAgb2JqLSQoQ09ORklHX01FU09OX0dYX1NPQ0lORk8pICs9IG1lc29u
LWd4LXNvY2luZm8ubwo+ID4gLW9iai0kKENPTkZJR19NRVNPTl9HWF9QTV9ET01BSU5TKSArPSBt
ZXNvbi1neC1wd3JjLXZwdS5vCj4gPiAgb2JqLSQoQ09ORklHX01FU09OX01YX1NPQ0lORk8pICs9
IG1lc29uLW14LXNvY2luZm8ubwo+ID4gLW9iai0kKENPTkZJR19NRVNPTl9FRV9QTV9ET01BSU5T
KSArPSBtZXNvbi1lZS1wd3JjLm8KPiA+IC1vYmotJChDT05GSUdfTUVTT05fU0VDVVJFX1BNX0RP
TUFJTlMpICs9IG1lc29uLXNlY3VyZS1wd3JjLm8KPiAuLi5hcyBkcml2ZXJzL3NvYy9hbWxvZ2lj
IGNvbnRhaW5zIGRyaXZlcnMgd2hpY2ggYXJlIG5vdCBtb3ZlZCAoaW4KPiBhZGRpdGlvbiB0byB0
aGUgZ2VucGQgZHJpdmVycyB0aGVyZSdzIGFsc28gU29DIGluZm8gYW5kIGNhbnZhcwo+IGRyaXZl
cnMpLgoKWWVzLCB5b3UgYXJlIGNlcnRhaW5seSBjb3JyZWN0LCB0aGFua3MgZm9yIHNwb3R0aW5n
IHRoaXMhCgpLaW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
