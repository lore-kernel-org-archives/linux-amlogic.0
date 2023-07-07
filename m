Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671BDC0015E
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 18:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXlNY4FtK4n2BHogeZV2VArTvBzG8rYoIwJtV2GoEb4=; b=p/456ZuCgN2kjX
	DcN0IzuXtUdQk8twDzEbOr1/yWLz9Ugvpmt9WtzjiDpPoVf0t6/6hNMvyiVZw/BjrdCUQAvArzt4I
	ukAt/90VVGODz88mDeU3LSwNLUhYzPGj8ygWEXv02XCBhHCOBheLLhj3X2PFkH0AbUzhhp/3FvAXP
	2iXrtmEr0Imd2xCrQMUiZt4Riid6ZDkbEVAOUsS8uTdWZwQBIV7yTKE+HxAYxYDlQnjmqhirfmKt1
	6uaArnaXj8wpS9c4UAPTFgUYaUifs7GPp53qHR8WtNFV2yUP9cwPJDWvutVfH3q8iWCMqS7kt2/K+
	WwH+HmT85eDhsO/wb9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHq9X-005Pja-1v;
	Fri, 07 Jul 2023 18:25:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHq9U-005Pic-1H;
	Fri, 07 Jul 2023 18:25:57 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso36157531fa.0;
        Fri, 07 Jul 2023 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688754354; x=1691346354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvSuPmDBRkMUtbxeFEDKBqN/HUSlNbMkBzcYBqA7WAA=;
        b=c/5XYBUfXCROSHVrq4biJN4WXZqTwmXivTq7fzg2KTCqttVnlWpgN34Wmu6cEqwcnK
         UQh/SMHYn7YOdaIWguqT3UtojTOeDyhLCRTrzLT3SiO6O6LDJXI0j2rJGGL2w9JgCaJV
         /7v2NTXwCpbYFwZGNBnNCClo3hHyBA5thKSkkvXl/DN/ic80uWVNWxqAXHRCtc78+Upt
         qhPq7/DabVuoXm2Dm/Kj6NqT3tT7a95o6Gn8iKRGJQ7hBvngAGPq7JadUTvaGAMSASOR
         UrXhziD7xZkavK3QTN23Xg4rtluy8O6lFMqRHsdUEivdgEn+quL5N4l5MbvrXQWMyjZy
         w1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688754354; x=1691346354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvSuPmDBRkMUtbxeFEDKBqN/HUSlNbMkBzcYBqA7WAA=;
        b=BTza1ytwhlc42hkx28UWAf3u2OsHycZp8E/EyFmjnDQDiGB+f2YilcGZeWFf31O4nH
         vE2atVXyt/9MeRicfhXnA0IFcoKo6iMj1kCqBG8sxkW2tnEMZ1OyoK4IdKvLg0XIXFBF
         LJzx9nWU+ScjwdVFRTK1pJJVo8Yk/ffsF9s3JOyWE3gxNHMp8fXlPWbSKiIaFlHKyrQq
         Q2jRXrb86llYg6wMllGph4CiMzi4aNGC3LHNXTRJe7A8DH1ND6BMD9T3Af2UuEh041uv
         04hJBxxFgPna4exmKxFLybZQoTjggLuaPWE5LFwdROB0Iqix/KFffUA8hdpbeb4Kpgcy
         m/eg==
X-Gm-Message-State: ABy/qLby9vVZBb9i6Q5UhCM6uw1erk/pqA0EZzD+rRItMUBIP7VVTU2E
	I1OnduUVroL5HhsY1h8oM2PjHw4H7xPqs6iHtww=
X-Google-Smtp-Source: APBJJlGuj4EgTrfcJLH8Pc0UZuGcgAEH6Y3fQwLS8xUkwJ5eWj/BMmo1okteYii023YGNDliWzcgY1LgtqFvubYZUMw=
X-Received: by 2002:a2e:9d45:0:b0:2b6:d9dd:f65f with SMTP id
 y5-20020a2e9d45000000b002b6d9ddf65fmr4102574ljj.17.1688754353772; Fri, 07 Jul
 2023 11:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230707140434.723349-1-ulf.hansson@linaro.org> <20230707140434.723349-4-ulf.hansson@linaro.org>
In-Reply-To: <20230707140434.723349-4-ulf.hansson@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jul 2023 20:25:42 +0200
Message-ID: <CAFBinCBT8yP5yZVOkQhkpQ0N83VO1Ctdm+npb91rLiv3KQz4ZQ@mail.gmail.com>
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_112556_456388_48D66A6F 
X-CRM114-Status: UNSURE (   9.93  )
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

SGkgVWxmLAoKT24gRnJpLCBKdWwgNywgMjAyMyBhdCA0OjA04oCvUE0gVWxmIEhhbnNzb24gPHVs
Zi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOgpbLi4uXQo+IC0tLSBhL2RyaXZlcnMvc29jL01h
a2VmaWxlCj4gKysrIGIvZHJpdmVycy9zb2MvTWFrZWZpbGUKPiBAQCAtMjMsNyArMjMsNiBAQCBv
YmoteSAgICAgICAgICAgICAgICAgICAgICAgICArPSBtZWRpYXRlay8KPiAgb2JqLXkgICAgICAg
ICAgICAgICAgICAgICAgICAgICs9IG1pY3JvY2hpcC8KPiAgb2JqLXkgICAgICAgICAgICAgICAg
ICAgICAgICAgICs9IG51dm90b24vCj4gIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICAr
PSBweGEvCj4gLW9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICArPSBhbWxvZ2ljLwpJIHRo
aW5rIHRoaXMgY2hhbmdlIGhhcyB0byBiZSBkcm9wcGVkIChzZWUgYmVsb3cpLi4uCgo+ICBvYmot
eSAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gcWNvbS8KPiAgb2JqLXkgICAgICAgICAgICAg
ICAgICAgICAgICAgICs9IHJlbmVzYXMvCj4gIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAg
ICArPSByb2NrY2hpcC8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvYW1sb2dpYy9NYWtlZmls
ZSBiL2RyaXZlcnMvc29jL2FtbG9naWMvTWFrZWZpbGUKPiBpbmRleCA3YjhjNWQzMjNmNWMuLmMy
NWY4MzVlNmEyNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9hbWxvZ2ljL01ha2VmaWxlCj4g
KysrIGIvZHJpdmVycy9zb2MvYW1sb2dpYy9NYWtlZmlsZQo+IEBAIC0yLDcgKzIsNCBAQAo+ICBv
YmotJChDT05GSUdfTUVTT05fQ0FOVkFTKSArPSBtZXNvbi1jYW52YXMubwo+ICBvYmotJChDT05G
SUdfTUVTT05fQ0xLX01FQVNVUkUpICs9IG1lc29uLWNsay1tZWFzdXJlLm8KPiAgb2JqLSQoQ09O
RklHX01FU09OX0dYX1NPQ0lORk8pICs9IG1lc29uLWd4LXNvY2luZm8ubwo+IC1vYmotJChDT05G
SUdfTUVTT05fR1hfUE1fRE9NQUlOUykgKz0gbWVzb24tZ3gtcHdyYy12cHUubwo+ICBvYmotJChD
T05GSUdfTUVTT05fTVhfU09DSU5GTykgKz0gbWVzb24tbXgtc29jaW5mby5vCj4gLW9iai0kKENP
TkZJR19NRVNPTl9FRV9QTV9ET01BSU5TKSArPSBtZXNvbi1lZS1wd3JjLm8KPiAtb2JqLSQoQ09O
RklHX01FU09OX1NFQ1VSRV9QTV9ET01BSU5TKSArPSBtZXNvbi1zZWN1cmUtcHdyYy5vCi4uLmFz
IGRyaXZlcnMvc29jL2FtbG9naWMgY29udGFpbnMgZHJpdmVycyB3aGljaCBhcmUgbm90IG1vdmVk
IChpbgphZGRpdGlvbiB0byB0aGUgZ2VucGQgZHJpdmVycyB0aGVyZSdzIGFsc28gU29DIGluZm8g
YW5kIGNhbnZhcwpkcml2ZXJzKS4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
