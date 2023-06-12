Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EC0C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bt5t1mifgtb6uMhOq12OtqAZbuWmWZaFnjtelC1/pFc=; b=Y9MKo4Uwlr4e70
	oLWCB7QtBK7PCmrNd8VrpuYj4FDGk80HEpcWKkv7mk2Hs4V01D1htRIp48LgK0qwfFstm0isM3DbX
	j/+nXVaOk3894Sd1afhaGMMkziO5i3+lHCY1KPYtjzK+BFzh40/TP4jpRRto+3nfeFT9phMQxjLjs
	uygJX5fdMsqwQAs+9dTH3UI6T3IR4BLg67Fe63/Oue7xGFIpT78epT+edq0JqtlB62pk9NPOn09Nv
	edoRLhvqCJHDCsqxwUtju76R0aGXUEpdjEN10X+g+8M0r+q+7eFxQZCfGkUMvKjKFIPqPAflPVZ9m
	EtxkAvN+Oo3SW43x3Khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8o67-005GaW-0a;
	Mon, 12 Jun 2023 20:25:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8o62-005GYe-2a;
	Mon, 12 Jun 2023 20:25:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977c89c47bdso861230266b.2;
        Mon, 12 Jun 2023 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686601498; x=1689193498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5rGJiRfcY9q4io21i6v5+UGLN2TIvQIc+ZeIBoHNMI=;
        b=rsq5aBp+h543P3f1o3uOlrJ8+ZkTet7FJQe0k6hVEjPCXqE28A45C5qoCMSyUA6G5n
         OqpttFi85EOTuvmrZ+ZfUgEtFjNl15FF1rsJknRqFK6XivcOL9BEdGsUZtp5j41IdKES
         P1g5rhE3yY3mhyU+DeojvzCdFMoKrbu0n86CfXvZj5yWxGkNH2nRgHQjErj9oNsu8T+J
         FFnA7Rlbg8DBc6b6I3qcwaWrSTwmMbG7JkxxecO9Xwe3TMs4QOEAIjTvvI72DmTqHGGS
         /edOsT5igvHJ2n+Y7nzLroR1k5ywT5n+yfUwRVda0Kbx/fJVZZQiYD58mEMRbL9Iph1u
         ZHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686601498; x=1689193498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5rGJiRfcY9q4io21i6v5+UGLN2TIvQIc+ZeIBoHNMI=;
        b=fEJx7vvZsm3h6RhigmRB0aEKqXxtffmkRdogriHCygoDwsU3sgshsf4+Dh1Jgw7nKG
         mYqnta/8iUmyKudRJR7g8uMrS9HNeyxc9vicOvjU14vQr0U68HT1+8+Jpvavqciy5fky
         LMBzdsCo1hRf2e+KDaYh3mmkKWMIlgMSAxXjilk9TqhfoWkbIocbDUNDlLygKmpF1Ax9
         RlEc7JJ7Fv9DAnpI+a3N4b4ECw0UVYcb7FrMPTMP1oE0W96Zng3CEIhJKgg1alLf42Gf
         vprT/gTQxurwqPSnyOxO8Nja52rphMSsxpsgUHt8Kn/F4xs5/2/4pSP6MVF1bC6Jugzv
         EhDg==
X-Gm-Message-State: AC+VfDyuLF44lA7ix8m53NIwbYayIc3DpXy/iWV9FAIdbKPK01T91pP6
	9659UIhSDUqx3h8Uu8oE7EhFYmvkwhbF/MdhafU=
X-Google-Smtp-Source: ACHHUZ4E0TWnsoyvUR7I33Kr/9TqSPqf+D2KoUdwkY2FAuQN2/ySPcvpG1fooy3zg7oLEm0Lwr/W0Iinb3bBwvZut0o=
X-Received: by 2002:a17:907:60cd:b0:982:26c4:e4b0 with SMTP id
 hv13-20020a17090760cd00b0098226c4e4b0mr1806618ejc.6.1686601498264; Mon, 12
 Jun 2023 13:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jun 2023 22:24:47 +0200
Message-ID: <CAFBinCBC3Cg_1UaYTxqq21-1pQ+cnT6VfL7kmQn0+v+26hiv_w@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3-meson-g12a: Fix an error handling path in dwc3_meson_g12a_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Felipe Balbi <balbi@kernel.org>, Yue Wang <yue.wang@amlogic.com>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_132502_842910_D42FA4A0 
X-CRM114-Status: UNSURE (   7.89  )
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

T24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMzozMuKAr1BNIENocmlzdG9waGUgSkFJTExFVAo8Y2hy
aXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlOgo+Cj4gSWYgZHdjM19tZXNvbl9nMTJh
X290Z19pbml0KCkgZmFpbHMsIHJlc291cmNlcyBhbGxvY2F0ZWQgYnkgdGhlIHByZXZpb3VzCj4g
b2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBjYWxsIHNob3VsZCBiZSByZWxlYXNlZCwgYXMgYWxyZWFk
eSBkb25lIGluIHRoZQo+IGVycm9yIGhhbmRsaW5nIHBhdGguCj4KPiBGaXhlczogMWUzNTVmMjFk
M2ZiICgidXNiOiBkd2MzOiBBZGQgQW1sb2dpYyBBMSBEV0MzIGdsdWUiKQo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+ClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgoKV2Ugc2hvdWxkIG1vdmUgdG8gZGV2bV9vZl9wbGF0Zm9ybV9wb3B1bGF0ZSgp
IG1pZCB0ZXJtLgpUaGF0IHNhaWQsIHRoaXMgZml4IGlzIGdvb2QgZm9yIG5vdyBiZWNhdXNlIGl0
J3Mgc2ltcGxlIGFuZCBjYW4gYmUgYmFja3BvcnRlZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
