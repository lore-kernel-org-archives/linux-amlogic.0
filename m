Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D003C3ABA3
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLa2csipd7kunP/6O6JAKRDMD+0YCiGFOBntg7E1IeU=; b=lXTEsFPrBcS+Le
	K9lW9sI6cA4M9yejwAIpdKu5T8jF2dsOyZXQmyYbLl6YQ8YWEBW+nHAml3wRUH5mUW75Ujf8ks8Ud
	XYPJsuCqVVfZUiKMmA1n32gmnL9DdzjhIQdCZCm8HABq7sfrOzOU75wIK99APN3d8Zt6p7S997RCB
	jbr24Ul0saDpbyyfJVPosDq+gIUsebkbgG0kxTB5S2/NIzwo1bOV+o/w4Hk/eyXt739owkP2Yo4yJ
	BfCIx9BgQj38MHs5pSCvMc99eAuNuXyBM9qM58tGz+S/93gl/V7jAOk8JuqeGO/zHK5JVp9VNd/gj
	ia3scLD8+xvHybMdUftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spul8-00000002Yhe-1vFM;
	Sun, 15 Sep 2024 19:18:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spujg-00000002YVW-2l8l;
	Sun, 15 Sep 2024 19:16:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2053616fa36so44728825ad.0;
        Sun, 15 Sep 2024 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726427800; x=1727032600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bISzRPoZuznX6FBm87E7EImUCqRsCXU+FTidvkRew4=;
        b=VuVWROYSuBLbDvApG+DeIJ6o49ei5C9ODBWM4+fTD29MamHVfs6lAZxFne5WvXKCPY
         EMtTfvmRWlDgtUxPVyoNKtuwRSdcNd26tfI1VNlYNMMViPhxg5kWgGY6Em2PZgvGMmt/
         CQ3YXPDygxCW3pyF6QdHA2rhmUWCUWIeNVt+9/YJdkIUR5J2hJP7l9hYGKoacEy2Zy7j
         fPvGatHduCZYv4xPH5llj7QJV/iGVhcFbuG+l7dai0I5jtFKW3Yh7JHW456EXTjsmV54
         HXKJdgjckMamJVSyy3zym93Kjno7Nde6Vl/sIZplonfR8jRdutaJmXtO8ppskZF2RZ3R
         TODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427800; x=1727032600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bISzRPoZuznX6FBm87E7EImUCqRsCXU+FTidvkRew4=;
        b=TqSZo90RYvLfo8Alpg4mwfXpK/Rsw89SY+ITfEvZB4mr9BWZpI3A/ZJJj8Qf/qvgRD
         AcvDfjgQVVznJl2htIsK7nOwOeA92sz+MzDv3QqjifvAqfk22FzBUSlJnc+iU4uf9/Ve
         82se7XDN5y8ILO9e6N0BN+qzA9KzTD0aElesx8knoD4QkJVdGQBQ0gRgAIVxVteA56KW
         /ibN8HVuBJgZPwqperylSScYrS/lq77nZwt3SIKsuUtbgESYOn0Fk5ijme8eiUhcbAkw
         RMVbtTZBoLPRWCOiNjE5xRjYGJGdHwo//Q+uD3SPMrnyicXBEJ/Fk/bXj78mpp03hb7T
         nxVw==
X-Forwarded-Encrypted: i=1; AJvYcCUa9hvKuHxPx9642vM3zDOKu/TDgDrqfYvVgpYKbuKIn12wtoxLADCY/4EiUaMuzjnvhBbip9goCShgmKM7kS05Ag==@lists.infradead.org, AJvYcCXam59JfBILm72vYTnBohmax5l9Y5DUozfY9eqJNEIzc1hMDTWgiALav/SsrcjMqNTJ9zKMqjyCYxcSoata@lists.infradead.org
X-Gm-Message-State: AOJu0YxLXttA+JYfwKQ1EkWcRj3wZ6uD15pxgdunJS6AufEkDfBeBowe
	EZjes3nqrOUBanQ26V48yJmTObp048hA4KQbrbfCr6ZylwuSdzuIKbHCK7E62jvP4HC7AlFvvtT
	dmVhGU5OsEsP61sWH6SyEhvIQQTqBgd/Q
X-Google-Smtp-Source: AGHT+IGKsOtUpIMhmuXU2ajV4HfqdCOucfhKlteJOKWh9G0QI2ecr3Wg/AUo4NExUndPm6QvKcwhbJFZp8UVHmKZG9A=
X-Received: by 2002:a17:903:249:b0:205:3e68:7367 with SMTP id
 d9443c01a7336-2076e34760dmr190006195ad.21.1726427799915; Sun, 15 Sep 2024
 12:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:16:29 +0200
Message-ID: <CAFBinCABU5mM_==zfMxETAAxM8j1qXGYJhDj87-Qwvjc+NJPvg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_121640_713395_29D2F801 
X-CRM114-Status: UNSURE (   8.55  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgNToyNOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoZSBBbWxvZ2ljIE1lc29uOGIgU29DIGhh
cyA4MyBDQlVTIEdQSU9zLCB0aHVzIGxvd2VyIHRoZSBtaW5JdGVtcwo+IGZvciBncGlvLWxpbmUt
bmFtZXMgdG8gYWNjb3VudCBmb3IgaXQsIGZpeGluZyBEVEJzIGNoZWNrIG9uIE1lc29uOGIKPiBi
YXNlZCBib2FyZHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
