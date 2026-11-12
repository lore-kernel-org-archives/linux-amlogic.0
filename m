Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC148606B176
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2026 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bF8yY2Ri;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zpGsydUi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V/WudGgtTHNSK3bRlR91HVfOeOwR1bx4EwIpO+ZRL+E=; b=bF8yY2Ric9Av90VK51RTxsEkRQ
	wmvqy6PeiyXYBordTVKtuNqEPWXC/QkbTFialCLKW6s58BTVH9n2c4T2NoL5Y0vfwCdopLm/nXTMO
	yPDSdxewVgiewPHsXG6l6KJ+D9cgAlvUq7mQR2MwbzF1IXmFj18nN9FjahucGY3viZDOqg8CZk5bD
	Vhzy9+PdiIwwRrOqgiigZokjeV8C9RHUxRTgkgPOa5etJtXbsIZ8q/GfvaMTqY/DgacTsKD88Je4/
	5RB/VhG7wd3F4F0LhMlHXDBkuWBgzLhxU8ywaEWDJXkXgGhXWDmsn8qj6H+W6wKdHfxgtgUiOu0Ah
	4JKFvg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdn6-0000000BDoE-3Ijw;
	Thu, 12 Nov 2026 23:01:12 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdn5-0000000BDnc-0XH5
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Nov 2026 23:01:12 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so215111d50.0
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2026 15:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524470; cv=none;
        d=google.com; s=arc-20260327;
        b=jOWSSDHOA39mcDhcb8FbFLqINeaAyX8O0VjOulQwrXcUrk/xYpsN1owAm94SYfVSSK
         YbenuqO+4WRI1fecDQ8fcp/a+i8QXnU/Mh7JGQ6C/w7np03VZWxUWrL+AUPlAhDCfWty
         aGoVGWjNm0CmR8c8suzJuAfesPf4J5WNWIz00IHvEUxRmabdC7PqYV+YeN4/GaZoSiJJ
         puVupZTZ4WKKZoZTcXXaiGscvuroYF036Ns7YoSW1UE8HLqUVaEJKZIarQWZx1EjWT7X
         mLFeyZl91RKv65v14o8sX793i62CIv8X7mwdy91NL1FX881I69yVfzg+i5cCO3MqflWw
         Km9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        fh=zs5L5aT0VChAE/Y4f/nwFVFdNxVr6Q4tc9t7GOWnjYg=;
        b=LJYy95NXyp40hQVXwx1VB0SSu8PS1NO6EhmJ+Z5goyJ+H6HjKCXX290+y5m3nTP7Vn
         +PZGrb4/kAqAytU1xPyb3s6avxsO7oEPwQwkvyW0+eoxJwrAQUkZYAm2xlLhfz7WsML9
         Yzv/wflSTY7YF21XwP3tGN3L+XKi4ltolo2YmiOyM1ezqjXCSWCu6L0/AraBZUY1EFbf
         FN7yQlwjG0MKSMWQbQ4jve/+yJdp2CjviDGngkvJ9Y2khLPL0iBBWCAawW4oBtzDpWIY
         njwz3qzGs4gI7t3gI9J8SMl5auAxrdqLr8c5fLgTxQ9JwibM2YD055H7gefJtcH2bunX
         8jgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524470; x=1795129270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=zpGsydUiyNvGPp0Ivl1PTaI5ElraHPqAt9/Ol4moidyK5yvTzJJHZLAYMgRIFTDKKB
         7+Qdukq9V/3xJ1oWcFFfO2iNMdDcPFFYzvEbajPdNP5y+QCNUcZfTydaW62x6p3zUfB3
         AtTspqKQPg77P3RE336LPF7gFJ4RLXzZjKQrawPz/7HgbkKEbtD+5AtwvTe355JrkxZp
         r+pUTlICainQtqd3s3afZROhHYz6Yx3uUb69meSJI8GJNPrE3z82iNmjqi1yIelsXhuR
         i+03PxuAX5oRYShTjn3EB+D3do48NXwSd/b2nsLVFbkQTqql+7noR/Lt2qhw+p8A5uPD
         cLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524470; x=1795129270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=VItY5BmvpGaQgDjmJTjq0palmg3Y4+3xOS3U+3IL5oTowFzAT0+l8E9K1de3FSFMOr
         lNdcz+uIYLBpBSeBMnndtJYyKC6JTQhwmO7mhmW1EubI8E9D4hjcHvAZrcIlpLY7/cex
         OTAZ1ocJdwmM3VCiIiKkQI8MY5I7A4O2aP2uv02c8p2UMAz4LsR2hhAhFlc82Lsqo5+L
         9fBbJ6l7X4EUvesaxRTINin2/LcFS/XH+gjXqeZs4sGDNUm6KyKMDXDWuasVW+cjnEkY
         uWllu8nDEx4QGoT7j6wrIFPWzkstqRPLJiZrIJ/46jNhBz4jRNyOZO5hhqzCSVG6DwCb
         qzYQ==
X-Forwarded-Encrypted: i=1; AL+hErFqxlhiFRtfjIwCInHqteOJWBEGUOkOfp+oISgsDC7YgvyTChOH8t8bY9QUltiM+anOKUfkZeE6pC+QL6aj@lists.infradead.org
X-Gm-Message-State: APuU4Z8sZtUiwV7ldQgnBYT3UQ+abXqjBqij+dtIPalrpGXdvMSGzYSE
	sQq2laH61tMfoL8zE4gaf3+fVSHM/kHzDE1quo+/UA8kTbgEjbl35PTNnJYyYFSz2VCskXeuBob
	ECsqLWgfQwKQ5JHFZDe2mjI8spIZWJE8=
X-Gm-Gg: AYBFou2fJAXInZORiaM0tQCCc9Z4YhV4v++PFaP4PBavFMUQsIDnmOGV6Yq+mDfyWzu
	8Woiq7HrDasj+bxJ4tvfl9ZicpCrDUgPKByd0yKTIUAeswuFa7GIwLwSgcrzBkJGtKTPlSob0Aj
	PWjNaY4s/GwUiIH9nmf/mr6XBra3iVRnzwBlcVHthfRJmtD96yiqJJ4LhnVS2BDzC15ed9HM6xt
	pXB8maBa7MhsQyH9O+k77XV8EQMax7BrLGCseArwQNeJJAi7vxfBNhQmUjM93kFezNMEw+/BOSE
	9Nkw2CnKJFtRUDd47KbtFcBhs1pcLGbu35SCuKgLl3reHPsKA74ecJAkB8wEWvvBo7aFuqWv0or
	uBoKuHu/dv7iczNR+iPg8pZ18ScglNX92a9t/xlnA/xMz3Ry4F4/3W2GDCfJqj8oLD5NbyKs=
X-Received: by 2002:a05:690e:1182:b0:67c:1eb5:48d0 with SMTP id
 956f58d0204a3-67d895a730emr587688d50.21.1794524470098; Thu, 12 Nov 2026
 15:01:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:00:59 +0100
X-Gm-Features: AclHuK_m4BWciMvBzZXogG5H22e1sIVJEt1HWBlLSLAAMEV4Eu9tlsQViR8cFLo
Message-ID: <CAFBinCB7Okxzq0cjAdpynmJb-oOuiYkGaf6w--091_nU0OJFKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held check
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_150111_179072_F2BDCDCD 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgMTE6MTLigK9BTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoZSBkb2N1bWVudGF0aW9uIG9mICdzdHJ1Y3QgZ3hf
Zm9ybWF0dGVyX29wcycgc3RhdGVzIHRoYXQKPiBmb3JtYXR0ZXIncyBjYWxsYmFja3MgZm9yIGVu
YWJsZS9kaXNhYmxlL3ByZXBhcmUgYXJlIGNhbGxlZCB3aXRoIHRoZQo+IHNwaW5sb2NrIGhlbGQu
IFZhbGlkYXRlIHRoaXMgYnkgYWRkaW5nICdsb2NrZGVwX2Fzc2VydF9oZWxkKCknIGluCj4gJ2d4
X2Zvcm1hdHRlcl9lbmFibGUnLydneF9mb3JtYXR0ZXJfZGlzYWJsZScuCj4KPiBTdWdnZXN0ZWQt
Ynk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogVmFsZXJpbyBTZXR0aSA8dnNldHRpQGJheWxpYnJlLmNvbT4K
UmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29v
Z2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
