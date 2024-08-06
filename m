Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4D1C52D70
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odKVxSyqaVfULUVo8ygKlMQFfbWagvaknXRXY9e9tqs=; b=icEnx5j/CXN4hF
	luTFJqqlW1oqMYp1AxUw9XDuLi8SQJghnszUe3fxTq5kZaAtnlADHLfptsjOKYc2lXAWR4rMxeSMQ
	rEa3TyHYMQhQ6rlCZY12APb1iSCYbKjk/Ww0LIlhdz8xPNeZSwoIou/xAKqk89IJoFUSa/H5NPEgQ
	EoiC90RESFuvrbFaEO80YkLt+YRjLJ53jz4jqkXjJ1wLhIFWyE+HrhjW7rvvWLi/86RNZIcCcztWL
	9QirIZo5mTyjJCItOJn54sB8G+yK9GAOwyrkVcPUewnArcdoA/d3zA7VqYM6WkPePcZfQrDrxIKLc
	u907bOBT9Y4DWsSN5lRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQpe-00000002p3K-36Oz;
	Tue, 06 Aug 2024 20:30:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQpb-00000002p2T-1k3W
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 20:30:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fec34f94abso10227275ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1722976254; x=1723581054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGjOP1lRrUIGHHfY/ucyJaa3OokEJdc3Rk3ANgx/cL4=;
        b=gJ2tRV8C6EknsWMfGuS9aEjorGoy7Jsc9+tIvgom8R3WpwEYCkWmCA4tTtOI6Hj1rk
         z/lKK1TRu0ucF5eeX7Rba2lXIHdGkwoG7vPy1r/GT8vzsiZlRFU/stDK1uhjlTWVhKb7
         6HMK+kPi8BoQz/UaKUJX0QmNmx8kL4opO0huZwd12H5KXNx992VBz46+f3MZdWAdrduo
         WUT+QZRVO3C9rx2VTHXKtz9YPle6m5VhshzUPxOsfmbe8ZghGD/irXV1nJGMnNd7DnZf
         cnZd1HPUFqyQVO+7pU8NkRTwzHW6DQOatZDZag1H3jWYXT4kyurBHeg0fUs9TskUysTi
         ryOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722976254; x=1723581054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGjOP1lRrUIGHHfY/ucyJaa3OokEJdc3Rk3ANgx/cL4=;
        b=DboL03bQPxBZUuaaQxqEbm2ca8j0oZSovoUJ/Apa3YiDpZ4CikPImQZTIlAHuo4OXa
         wxtWZnKva7PAvZujkYtQpH+f2iZBkaaMM1R1oMQo/Zaba7JtOZp/+5FGfLLPrNBD8Vza
         XcR4MjBmRxO6tdMBMAtd4ImQL0HqK/3LsLqSHMMWYMYfO8eYlnSpo/qbUCGJxHVQVxFV
         O9fQQcoV+7NgFPn5doc2PUZCL3Wsl8mIZ8ZQMOFgehm6Cr9GwN9zZ5l96XwDgdOxa+JB
         czTtQzxMf+uqYChYQ4xrjZ5RpIGZ8GU/YpOt5BihvEaIa0Mzao+eYAJUoR6DKIE6Ee8l
         nZvg==
X-Forwarded-Encrypted: i=1; AJvYcCVghUCrLQSUr5EWZ4t91U4a+oEFFPgfxvR05oVPZIckBFtJ6G5UAMa+yYcQoJRNjZsIB2q5BQDjzV37JEvtcnLGXHcvK1/jyUyPxq11iwCcMaA=
X-Gm-Message-State: AOJu0YwoUgVy9Rb1Z55ML1DysSZiJZ2ugXzYN5AsSXie15BIjuItUnXe
	YYrY9iWF8c0R4Kn51yeqjhzG7EC+8U46LUO2T2mkKjPKeJrVwJl9TJvYupmufjb3UXR4JroNmEh
	2PJub3iExzcAZXHYUzbr3YOHP/Wc=
X-Google-Smtp-Source: AGHT+IEks/oAZa8ntL5YZ2Jy/KZVr3ukaB2BFUAtpfcEpVrc9hTXXkB88UBCo3OXbZXNdpKSoeO+mLzLsyC2xIw91ds=
X-Received: by 2002:a17:903:18a:b0:1fd:9c2d:2f17 with SMTP id
 d9443c01a7336-1ff573bb69bmr145408745ad.44.1722976253993; Tue, 06 Aug 2024
 13:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com> <20240730125023.710237-5-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-5-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:30:42 +0200
Message-ID: <CAFBinCDun9kgPO9ko9seFvWxjZvHwpRO=SaPrdxT1_Yh-FzXVg@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/meson: dw-hdmi: fix incorrect comment in suspend
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_133055_478121_D0DCBB44 
X-CRM114-Status: GOOD (  10.46  )
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

T24gVHVlLCBKdWwgMzAsIDIwMjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IENvbW1lbnQgaW4gc3VzcGVuZCBzYXlzIFRPUCBpcyBw
dXQgaW4gc3VzcGVuZCwgYnV0IHRoZSByZWdpc3Rlcgo+IHBva2UgZm9sbG93aW5nIGlzIGFjdHVh
bGx5IGRlLWFzc2VydGluZyB0aGUgcmVzZXQsIGxpa2UgaW4gaW5pdC4KPgo+IEl0IGlzIGRvaW5n
IHRoZSBvcHBvc2l0ZSBvZiB3aGF0IHRoZSBjb21tZW50IHNheXMuCj4KPiBBbGlnbiB0aGUgY29t
bWVudCB3aXRoIHdoYXQgdGhlIGNvZGUgaXMgZG9pbmcgZm9yIG5vdyBhbmQgYWRkCj4gYSBGSVhN
RSBub3RlIHRvIHNvcnQgdGhpcyBvdXQgbGF0ZXIKPgo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBC
cnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0
aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KKGJhc2VkIG9uIHB1Ymxp
YyBTOTEyIGFuZCBBMzExIGRhdGFzaGVldHMpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
