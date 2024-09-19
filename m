Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFBBCF3962
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2024 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJTq/y5RWiyeBgOVtLOVTQLMPHQFvDi9lnqdGvYEdAA=; b=178KlYPoyGUysK
	QvADby0+vquoeOZUfkW8nXZIxAYI7Gj1YXdK34sJePHdtSSzZsmdEVDTWgKH3WkmHTofSpjtdRoGg
	RDm8ELlChosGi1ztO6jMuHmgyg9m7SmXi1bOCQI5WWtaE/0C56orYj1uHbOak/ADdAFweT+6L4lvR
	DkqjUA8qJsxn+F50jyzbHdI90kpTuzo9IQzi2iLzlE2RR6cYS0LxQ0ITDfOYK2qE+O9d7ydJPUjTy
	6XhHhq65oIo2p9mXtAEWM49wRBtA2W5aaWd11ET9IcIhU3kW3uOZy6zx+NJQBpZB7YISk8zPzDymD
	seoycAmT8ExjjBRlzyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srKBa-0000000AgiO-16Xn;
	Thu, 19 Sep 2024 16:39:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srK5l-0000000Ag5U-0pGb;
	Thu, 19 Sep 2024 16:33:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20543fdb7acso10047495ad.1;
        Thu, 19 Sep 2024 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726763596; x=1727368396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dD7ZAd80cIK9QgGYjEIVdPif7fITvc0jkxvVyO4K/Sw=;
        b=dsoCtMYMymTHGzb78va3rt+ANc5G+DkpzuimdMjnDPs9iSuZFVrQOVUb+AvjZVpUGg
         A/Up2KqrA1ihgSgix888OTGtVQJP1CJvSdhRQ/KKupAkthkXvsLFPkOpwcGFFcu/YY98
         3fUCC/49S3a5A0V4XemMbjKMNbUOoiWFCyuhVRJUqBSGbXVdOiWTz1NGQt68uqD9YRVH
         33Hp/qoel+h9JYFo9okjRB4PRIfaIwNTewMeQle3uBEnxXzDmNd2ktDtCO+yT3t5y/MH
         D7OLwhSIw2dCBbDJyLevw/cFUb7vl0th2n2kkrj3H5z4eHS3suwvMnA6hlfR4vxtnve8
         Ft6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726763596; x=1727368396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dD7ZAd80cIK9QgGYjEIVdPif7fITvc0jkxvVyO4K/Sw=;
        b=XHwn97mrV/1y1tpc4YjG4BE1db4DY1N7QzO8MmJedXAKOn6mskSzCnYqJmwEAVaPvg
         9W55zIvVTp0dEnSeaWXRXC5N+mjn1dXRLN11r7HAariEX1CbwaEKBYObO3ShjrIKXUh6
         vrZQQxfcgbvDjQwhdiw4+cNWn8KCV+MtzEnGosVt+hZwp8raV7heEop6UUPCIGTtXhuv
         8OiOIicKjjgzXKvjgvBm8V88kwLcGA70YtSpFVs1jvUzegH+sRav7wRQ/kWF4G0+C5dD
         CuFA12173tlpV3Rjg+abgDjnkjQjHISXK4NvnWXyArHzVgx8WNbzH23yoRixtt/9qUX1
         /rVw==
X-Forwarded-Encrypted: i=1; AJvYcCUEl7U8CUZMwvIaSceFi9Zm1P655PhgFwJYvAEHX0Woj+vjwGdNO1jqk4WFU0TM0NznjW9T2SW9lY4wxeEf8EMC3Q==@lists.infradead.org, AJvYcCUdO+3cJctC3Y/VgEcwSWZyqwI/E8R13NepPLZvwtrKkzfPfzLBn1pxa7QYcEw01i1wSdw/lYPE+BJPEKiG@lists.infradead.org
X-Gm-Message-State: AOJu0YwBlIKKFm0SrnCcyy5wXhyZPL5qvBnyhSnoXJSLASthrQBU2+Z1
	2G63zlMr3DIlgiGYeSFE6dYoCE/A/ly5blVFzPjLRC3j3hn/LQk/qYpkFejqjDT6fKXMNCWy9P1
	uL6eVlX2yKJ3jYISVG91EtkrYm6+KfQ==
X-Google-Smtp-Source: AGHT+IEU0APxNlhgv3ZdHwNLnDsF63SfYAQ6+7TBUScvnPkZdQTFY8GHqsE1myEcFodpaTrBXEoAgJdKAo+Ihc2AQX8=
X-Received: by 2002:a17:902:ebcd:b0:206:93e7:5845 with SMTP id
 d9443c01a7336-20782b85109mr295593555ad.59.1726763595653; Thu, 19 Sep 2024
 09:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
 <20240916174030.GA835203-robh@kernel.org> <9394d785-5954-4d44-8ad0-9b57fbecde25@linaro.org>
In-Reply-To: <9394d785-5954-4d44-8ad0-9b57fbecde25@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 19 Sep 2024 18:33:04 +0200
Message-ID: <CAFBinCAbb5rh4GZZhjFA1jSGJAPNC80vnUY+PC9AdaApLZphmA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema
To: neil.armstrong@linaro.org
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_093317_257143_50D43A6F 
X-CRM114-Status: UNSURE (   9.48  )
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

SGkgTmVpbCwKCk9uIFR1ZSwgU2VwIDE3LCAyMDI0IGF0IDk6MTPigK9BTSBOZWlsIEFybXN0cm9u
Zwo8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6ClsuLi5dCj4gPj4gKyAgICAgIHJl
ZzoKPiA+PiArICAgICAgICBkZXNjcmlwdGlvbjoKPiA+PiArICAgICAgICAgIHRoZSBzbG90IChv
ciAicG9ydCIpIElECj4gPj4gKyAgICAgICAgbWF4SXRlbXM6IDEKPiA+Cj4gPiBBcmVuJ3QgdGhl
cmUgbGltaXRzIGluIHRoZSBudW1iZXIgb2Ygc2xvdHMgdGhlIGgvdyBjYW4gc3VwcG9ydD8KPgo+
IEdvb2QgcXVlc3Rpb24sIGxldCBtZSBjaGVjawphbGxvd2VkIHZhbHVlcyBhcmU6IDAsIDEsIDIK
CkZvciB0aGUgcmVtYWluaW5nIHF1ZXN0aW9uczogSSBhbHNvIGRvbid0IGtub3cgLSBzbyBsZXQn
cyBzZWUgd2hhdApSb2IncyBzdWdnZXN0aW9uIGlzIGdvaW5nIHRvIGJlLgoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
