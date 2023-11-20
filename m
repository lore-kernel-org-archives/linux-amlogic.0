Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609B6C197A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Nov 2023 20:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17BlRvfATkNxhs/eyy2evjPadKig8YQgUH1AHhJiqjY=; b=vZK/yFtw0u2AAt
	QVj9fUjIykcKSqWqIsqH0NrCz0y9uuRe3Df/5ANw4h5HutlR9u/IUmsfltHVJ2E4zhWpD2C3rQja1
	aXURam3qD35WdchbYERp4MUV/O+rW+1xBgIJtn+IKca08/WA8fqF1p91txu7htv0DknfsebMJ8ew8
	yQbzWvf8TiHdF42mNawrCXVY1M9WPVFK/eq3w5cG1Xg+j6mJQp8Qr5hmVX/2WQ+b3GWecOH0sF9pH
	+ctyy0tF08zLKGIskouV9EBKqA3u4MvYXujHMTRDwH0Bom1AJ/ADBh84dcWQRRKLKYjdKXwqAPHGj
	kVHzz6uLnCaY3ZmQkLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Agk-00Elro-1q;
	Mon, 20 Nov 2023 20:16:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Agd-00Elpy-1K;
	Mon, 20 Nov 2023 20:16:07 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50aab0ca90aso2351180e87.0;
        Mon, 20 Nov 2023 12:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1700511360; x=1701116160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN/JaGs58VC/59LNr+VTcKEJIUnlEUBkYK0zXNn4XiM=;
        b=e6KqJg8B7mdYrtSLOVGhhMDR+azmdPvBBDmgppA0QeZTz6mIrq9HRL4Mv3Xi47TJmH
         vE1bYidKntfoZxGVYYHackHHD7qIZRq4Sn3rO0+XM3scaog7ytojRGiQOUbLL9oWOlyD
         4yhIDyVIH6nG8XnIoMbjMSDEu4Zb96qWloe/YonNw3hXMYdsBPNU/Y/B9pCsnwgN/d3d
         pvGlTMfeW7s/ZaeDwJyU1QLU+gGHHqkMea3k4qXo99k9Qb91f5f3fTxGp2LBRS8gml67
         CAbyFvTfPxDIjZelj2g7a22v8bWLaCqMr4zBXFkWOsRv/u95reMQU6sBGKBk3CT0TaJM
         wcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700511360; x=1701116160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN/JaGs58VC/59LNr+VTcKEJIUnlEUBkYK0zXNn4XiM=;
        b=E8PRm95LhnL/1drJ9PXzqM1c7aw/BVjXMksLzUzXgsKba4r9xrIC/cGlFVOx6Hz+KG
         +aOFpP2AtFN+OE1Ka3gZxTKqZ9XstiZAuGDtVM7UGJBYDPIHM5X+t2EVwtoBAFiAPy0e
         g04flVchmVzIR2i7K/geLj6IO0nOd0ovPLfmgty8qWd5xFcwwwRnG228XgFFEWdfdjpJ
         M9L8sAM4x0JoIc2bopgT2i9+o2+4omx+PpYGADnQfKBmzEgg1xxoB8akR8e8lhuCIfz7
         8vnEuGbCGIskmCN1VzBIhTY3uOo8hB05kgf2tHkrpqmpH9c0yOC0F1GFPKSUKK0qf9qX
         bQTQ==
X-Gm-Message-State: AOJu0Yw7eGwjZa7p7EhoZG98ZTRhbq7BlYUIU9AMYmaoM5UQt+jqTbnz
	Y+oKUUoXptZ8ybSe8zjPZ3776++di/eT+BLK5To=
X-Google-Smtp-Source: AGHT+IEl/IXOE7od2X9WWhu+ZG0SDFd09Zq8exF4njB3w++Fo4CbFsOu9XbAGRiMyS6YdIDcYfwLVlLccZYXYBThqaE=
X-Received: by 2002:a2e:a30c:0:b0:2c5:ab3b:d676 with SMTP id
 l12-20020a2ea30c000000b002c5ab3bd676mr6035262lje.9.1700511359989; Mon, 20 Nov
 2023 12:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
 <20231114-topic-amlogic-upstream-isp-pmdomain-v1-2-f01e6fca67a0@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-2-f01e6fca67a0@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Nov 2023 21:15:49 +0100
Message-ID: <CAFBinCDe3yoEBd6SzozNZtC=zGaUHt4VeO_uhV1s5XBaWp0w1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: amlogic: meson-ee-pwrc: add support for
 G12A ISP power domain
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_121603_505349_B1A2A87B 
X-CRM114-Status: UNSURE (   7.53  )
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

SGkgTmVpbCwKCk9uIFR1ZSwgTm92IDE0LCAyMDIzIGF0IDExOjE54oCvQU0gTmVpbCBBcm1zdHJv
bmcKPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgpbLi4uXQo+ICtzdGF0aWMgc3Ry
dWN0IG1lc29uX2VlX3B3cmNfbWVtX2RvbWFpbiBnMTJhX3B3cmNfbWVtX2lzcFtdID0gewo+ICsg
ICAgICAgeyBHMTJBX0hISV9JU1BfTUVNX1BEX1JFRzAsIEdFTk1BU0soMzEsIDApIH0sCj4gKyAg
ICAgICB7IEcxMkFfSEhJX0lTUF9NRU1fUERfUkVHMCwgR0VOTUFTSygzMSwgMCkgfSwKSSBleHBl
Y3RlZCB0aGlzIHNlY29uZCBsaW5lIHRvIHVzZSBHMTJBX0hISV9JU1BfTUVNX1BEX1JFRzEgKG5v
dGUgdGhlCm51bWJlciBhdCB0aGUgZW5kOiAwIHZzIDEpCklzIHRoaXMgY29ycmVjdD8KCgpCZXN0
IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
