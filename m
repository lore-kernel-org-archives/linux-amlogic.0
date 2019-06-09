Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F327C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 156ED20673
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAdixXVQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlJsT0l/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 156ED20673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXLYWN2lRP7dJbmIh6rk60u2c8iqPiEoCT8O0vZLw5k=; b=MAdixXVQxPaDU/
	G4nRtLnDxhpbSpfbbmFDzR+r6ITuSimJmTGJKvJ/KUNG1fUB8SZ0bN/43xrqwuwrixuTEODTzYGzC
	QBxR8of5fkO2X9EXCyM/mJbO526ou2en6kXQiYS2YsFZQ9WMnxY5UX+Qwc7vzeJ55CrAzF7Iux7hz
	4NVCdkSs9sJvImP2dCApNrIhfkioTDSMGMRWHx19B+c604XYQ7IgyY/EN1cOZYYBwZvakb/NsyvFO
	WIg09nJ8aAJFeGr70/KrFod1TOSp/43ejX+2MepqBl3FT6FIl3Uptmnp8+zCiariaO0LFziLOtaiS
	CgzZmQv17qSnoWlSBNvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha5hx-0007Jy-6E; Sun, 09 Jun 2019 21:50:33 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha5hu-0007J5-4m
 for linux-amlogic@lists.infradead.org; Sun, 09 Jun 2019 21:50:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y17so5233901lfe.0
 for <linux-amlogic@lists.infradead.org>; Sun, 09 Jun 2019 14:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=He8uuSEDC/b/uWidg8RVfT3AGe4hP03AsY17X0DSxgk=;
 b=zlJsT0l/3IuyndfDS2BTaHnjJraASu525KwaMplyFARGp91fxTu7ST6SIuVl4iRefh
 Zw2rTEVnDvjnMuSCPzdUGoVDoRp8QrZ61tK4XFRB4D3Zl0L6VgXr//I766ZqEDgE17BM
 ARN60spGcN65rNvB7ab14R7DSGuQndhDP7PBCgB3CP8DrR7V+VOu1ATbAAdkQfPQj4IY
 quGE/acE6nwNwUq5m4i9HC26SOp56AoTeO2Nuk1flxiykzI9jViwQQchw1hlF1ArhsRC
 N14lVBN37nhxWkXhB1kOBhH6Fg5Nahbz9F5Ozo1lzj8nZbQmTBZ4tBPY5d9h7mtBuiCS
 cZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=He8uuSEDC/b/uWidg8RVfT3AGe4hP03AsY17X0DSxgk=;
 b=iBLenhcorbYoJkHIfKxEpUPO09PjBrV0rgeMiIdOlpky3iiUAyY2jCvWSU2W+JIV4W
 iS+i2ZRjqXyf4WgQwvr0UrnH8OOCe87s+7pkajeLijKWX7iZyV3N7lwnjp0BfBncDXCR
 E+ZH1iE5XPAD2nOwSr23YHA+aNvquXL0xDibQ6l4+8mrp5453UxcdsoH8inPGpszz4i1
 PQvQ/7EXUUpb2NcUZRgUpP9T/7LSdAO8iuRk9B4zLtc0qbceHfasWu0oLHFOgqBLhsps
 pFG3K9gFNBhmlg/SSbvakWdcsu5VlnPNY4sJczRiByqZP+uO2c+F0XijyICuMnS3bsh/
 Olig==
X-Gm-Message-State: APjAAAUF/1oBj3JuHR+N4VX6wQLpfs407du1HaOoPJWxqGh/xQLrwjIw
 PUdY6EkDDq9+mihhIc2Sr4bOJ38cF1StOr/cMc+Tsw==
X-Google-Smtp-Source: APXvYqyf2NDu19vowinqKXukK4VxadyL6zt3qyCVskmgqawUHY4dBR21FjzW4762E23uuSqmCFocFD/qpnabF+6julg=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr9951237lfg.152.1560117028189; 
 Sun, 09 Jun 2019 14:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 9 Jun 2019 23:50:21 +0200
Message-ID: <CACRpkdZCbFiUfW-qOM1Hxuj0e5TC8ViMuiz-VeVjSYP8A9sN3A@mail.gmail.com>
Subject: Re: [RFC next v1 3/5] net: stmmac: use GPIO descriptors in
 stmmac_mdio_reset
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_145030_186587_C8A1DCB4 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jun 9, 2019 at 8:06 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Switch stmmac_mdio_reset to use GPIO descriptors. GPIO core handles the
> "snps,reset-gpio" for GPIO descriptors so we don't need to take care of
> it inside the driver anymore.
>
> The advantage of this is that we now preserve the GPIO flags which are
> passed via devicetree. This is required on some newer Amlogic boards
> which use an Open Drain pin for the reset GPIO. This pin can only output
> a LOW signal or switch to input mode but it cannot output a HIGH signal.
> There are already devicetree bindings for these special cases and GPIO
> core already takes care of them but only if we use GPIO descriptors
> instead of GPIO numbers.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This is in line with how I want the gpiolib to just swallow all quirks,
so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
