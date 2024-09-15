Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7E9C3ABA0
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHBwifFlA2CDtXD9Evnsc3pDcm+HI7YAbMlWhuLhGZA=; b=jZwb+RVSqPkt3+
	LYKXrINJpX8lDmw0PQQTjyXg0PXCJzJbL10CjuaTExX2Bn31PBiyo3YMmBc1rzJItkEVH8aKDpapr
	Qvb/b9NRdHn1jbDnFbEtVCIYnsrxoGl7pTMGR4NCtu8XkHas1IiyHeeIRi6v0FE6oINSkSUtaPK7M
	O+RazqtDNIi81QMZBYmvl3IKmsy49u6r7xgG9IR07O0FF1vu8kGlkTgYQAwfaBwepwT8t+esG69jY
	fBY5PTw8dUnawRTHmP4SzEZXxt2E7mkbDyFcUWlg5b6Qmvq2Sf9mwfIrZd/UTmphIzEqnNHsOyWmW
	V4ZBlQO/W8tLeKKqCmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spuWt-00000002WyF-3swb;
	Sun, 15 Sep 2024 19:03:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuVm-00000002Wlo-1WMQ;
	Sun, 15 Sep 2024 19:02:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-206aee40676so18411055ad.0;
        Sun, 15 Sep 2024 12:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726426937; x=1727031737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZjqU4AINP/IiVa4kPndu35gKyQ6yjWUa2bBBkDYEpo=;
        b=TRKLKJ85vpHjJywhsAepERDuxuT7SR4eDyhdSrRqLxc5mhYRvp7v1FskgkjTwQPHRe
         HzCFfMkMlB1WxfewTvpKfKhDLK99mimFYT4iKcqFo1H4M9fo8KxeADGOkikFt07xjWZM
         KzxDWV7wzzJCzxIn3EQ1gSqrQmXUw9tRSRlEHzQMNXjU6gKRs7B9RbM/mMaOg7oJE9Yo
         vrRrQb5y/EFC2rTUt3jyN4mjjEqj9aQRQUnBVINg2GXNDf4LDOCdHlMwwIaHbA2/WSEM
         iTGf3s7r9FTPmE26XPmgMvNvD91zSkMV90rJ372sXBSRAAlc8kJUfAWEvJTx9o3IhlXA
         Ptdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726426937; x=1727031737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZjqU4AINP/IiVa4kPndu35gKyQ6yjWUa2bBBkDYEpo=;
        b=QUaB8Kea4EjokhT0gnPs9G1pVQABWRf0J1eQS3Eds6HSIekGvU2TC9i6BoQfeI9STP
         jj1XKZIMTKJVKXBZAYjIjdiHvdXWBVcSLx8knjqkdc9J6Zm78F5j3NXC54qn7QyJoDAd
         zFMDCm2q/DMRXEy94MuB3geibEnefg3FeT6M9kMfhLPg4pP3bu+UesxuSRyIy239eUGv
         s4c4wyJQtNv3S0ADVQ0l/gzYO2ne49EdbiMmHp2gYEgUSuulxQEvX+4g1Vr2bboFMYN1
         v+HSGasuY8ML6GnQ0Fz+mu7IWdkGhnXmxEjQ0Q//CuSBL8HFtA3shK55PgCCkUYAAazz
         pT6w==
X-Forwarded-Encrypted: i=1; AJvYcCWrfO2kOHZmurqEV/Bp85Qk/1jxOvXoWlWl7nnp6VIrPZAxVXYUVnV+fY/tzhcWcS7GA+6chXzmoq3J0BYBbpeyjw==@lists.infradead.org, AJvYcCXkmrZRXiBMuEyi1uZF/lFIlD9ah66uTVmXjVYAlexFijbUJKyQuLqbjrdlJHUQrmZbUt+8TiV6hutCU4F+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx7f/2tSY9H8IiccwW190yBGIv3ifYyfLhQAlhC2r/LEqq5cbH
	7MNJ/YjMltyfSQSOho/ub605aiHZroIl6LJ2kGNnw3yebBfGkzxAd3yohxM6Kf7gkQrUl4VMfex
	oWgcZspV5hQrKsp5kA0o0E3Eeo+I=
X-Google-Smtp-Source: AGHT+IHe1atv/v02eHxBeLSaQupGAbcdfb73NBASPB+dRd+NN2OC/Y8NMPRVfzEtOWGS4P74u50FWjgUkjJh6E5mYEA=
X-Received: by 2002:a17:902:ce8a:b0:205:8b84:d60c with SMTP id
 d9443c01a7336-20782b642a8mr164239225ad.35.1726426936833; Sun, 15 Sep 2024
 12:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-2-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-2-feaabb45916b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:02:05 +0200
Message-ID: <CAFBinCChaq4YF2koPnRaSCJpP=qSZVpRsqCMmidnHzF-TPjX9w@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: amlogic: meson8: fix soc thermal-zone node name
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_120218_451074_D959D482 
X-CRM114-Status: UNSURE (   8.21  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTI6MTnigK9QTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2UgcHJvcGVyIG5hbWUgZm9yIHRoZSBz
b2MgdGhlcm1hbCwgZml4aW5nOgo+IHRoZXJtYWwtem9uZXM6ICdzb2MnIGRvZXMgbm90IG1hdGNo
IGFueSBvZiB0aGUgcmVnZXhlczogJ15bYS16QS1aXVthLXpBLVowLTlcXC1dezEsMTB9LXRoZXJt
YWwkJywgJ3BpbmN0cmwtWzAtOV0rJwo+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy90aGVybWFsL3RoZXJtYWwtem9uZXMueWFtbCMKPgo+IFNp
Z25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgpS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
