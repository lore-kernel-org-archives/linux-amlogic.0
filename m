Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FB1C41513
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Jul 2023 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m25GN4BcvKuB/zfHGtwBN7dYC9QzdgExsywQcoW9yj8=; b=5CTMlXP3eur7lg
	5jGcfKPCELpF2ujgnubX8baiu8FPHm2WFLxcR7+oQNZhimIF0EoHweWQJeYNAP5ppUoQ5dUGcAS4Z
	AT0zj4jQMXQhTatm/x7KC0GvKZKN3xLehaxnEcepfCP0DKT0HLPx1PMHdq6eOL1Thf9C7lWS8UAib
	N4HhCwDbBpTTg8d21HJZiQpgr8+DXPe4DwCPoKNQsM4tF+2IFwxrfCmGqHBF1j8/iTjmXYAGTRGBL
	6Q7+adLYRfaYhddSBEMzX4J2YmaaikUagcSr59082m3m5WTW0+VIQWtIBsluG3bxP3qPXdFvR6Gph
	MPRqnzSJl+cM/A3+NhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPpCU-008ZgD-2n;
	Sat, 29 Jul 2023 19:02:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPpCS-008ZdV-0E;
	Sat, 29 Jul 2023 19:02:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99b9161b94aso485282666b.1;
        Sat, 29 Jul 2023 12:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690657316; x=1691262116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JewjP4gzG3wPRwk+PPYrVv5BM6h635y61OQNgYt1XdI=;
        b=nVdFgNkc3aXFNGd0myraj19Xcf0QZrKaVxz6cZ82aeOXKko/LDNNJQrs/W/Q1Rbv/s
         0ja+W6xk6g8p+Yft/PAQ299/y16MC/HpA57dH0uJFC+SvLAL7MVyP2N17YYXrcwFMWFu
         ZblCZLAlevbNmxt5VrxIbSvVdQkoYQI3eEFIexKNJNPEi/Xd9aIakMLqNY8Jxy8dlKAK
         eWf4QW4RwkkQkXGmxND9pn3ZB4VXaaMiTaY+T5RU8eWBwqeuYybV8kp5ND8soSkOO4u8
         5Dxqxeh3yl9e64lH2QvCed5RE+ohp8C08cw2G5+n++P1zVThOVbqrg9wLrBFGRce/wq0
         gkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690657316; x=1691262116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JewjP4gzG3wPRwk+PPYrVv5BM6h635y61OQNgYt1XdI=;
        b=SkwIibfGvWxlQcniiq5Z2ZeEcEsP3e+PF9XHJQZJi7XyJNb59ClbCjcPIV+leiOGH5
         mQi9fPGDhSVgDXxXE0wco8F0/QPYV+1MzHI1ep5aRev3aYnnTl0zIX9u44U7qcTOrIL+
         07F1HGspAzFkoWu29BFoJvXA/KyPFkVsAiXewY+8+egj1/Ftke9FXvssVMthW2AUOAqK
         08vSMzypHlKV2m/fiaJIPZUDNbzEAbp36VqWd8J3YYdBnm5tXirfe1GFnPBH+TlY0ZbM
         tXWHLoFOM7q2uusZkYOCLrpeuu/9++MhXrqhhNQ7BDFX8SOwfgm9DFXq/x32McyioUEN
         nSlQ==
X-Gm-Message-State: ABy/qLZ9WOAvd2x6gOXFUdkburIqqvLHpyuNp+uRu/kj9xIFSi9Jw7oS
	R3HOgljqGTEqukK/yxjlZ8RHj5uRmEw4x75SALVbdm+OJZc=
X-Google-Smtp-Source: APBJJlG4NN3fQvdelfE4Q81DIoY9sNO3XeylwBPfNevJI2muL57EuCWEkWM0QqzsfOyfSeiefwPBM4E53iHhNAzLT+k=
X-Received: by 2002:a17:906:8a63:b0:99b:f4df:dd56 with SMTP id
 hy3-20020a1709068a6300b0099bf4dfdd56mr3407340ejc.6.1690657315332; Sat, 29 Jul
 2023 12:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230727070051.17778-1-frank.li@vivo.com> <20230727070051.17778-19-frank.li@vivo.com>
In-Reply-To: <20230727070051.17778-19-frank.li@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Jul 2023 21:01:44 +0200
Message-ID: <CAFBinCBS+hrSSRU-BQU0sgx044X-Rap_r_-9GBsf+S14xXNgzQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/62] mmc: meson-gx: Convert to platform remove
 callback returning void
To: Yangtao Li <frank.li@vivo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_120200_104887_8F3D0824 
X-CRM114-Status: GOOD (  11.48  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgOTowMeKAr0FNIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZp
dm8uY29tPiB3cm90ZToKPgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0g
ZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9ycyB3
cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4gcmV0
dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIChtb3N0
bHkpIGlnbm9yZWQKPiBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEKPiBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMKPiBxdWVzdCBh
bGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSBy
ZXR1cm5zCj4gdm9pZC4KPgo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVyIGZyb20gYWx3
YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBjYWxsYmFjayB0byB0aGUgdm9pZCBy
ZXR1cm5pbmcgdmFyaWFudC4KPgo+IENjOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5rLmxp
QHZpdm8uY29tPgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
