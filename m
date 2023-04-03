Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43747C76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTvIlT6tyPXTg2nwOOvny2ZO3/5U3ZDB+FYvmgsg6/U=; b=XeElYu4LPZLIEY
	QiDf4GWbWEHwccjSAhdQj29eEoaHi7LrY1C6q6SdgJ0R8NfzD4C1QYGTi2bGZDpTywz1imB3w9Csk
	+ViDevKiKtIgbdxYT38KtIgPvVwfSUQA42i94U/pIoqf3MXSn8FrZMXF+59rfTfB3u47bikeWahOs
	X7cGcVwJDZjkT7HDyVe+4D2w6DCdX07V7D3QSCNNwIcOcTxtqVRafXR+wylqmkePju0b+A6b+jbNf
	fFFHsHemN75k9FsMUspp/OFyrnX26GfMU32/9za74pYWe4NdPjzEqAmGD9nnhKHbdzf/dDV43m1MB
	hNqVwBhFFvoZjw98KKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRzl-00Gxma-1H;
	Mon, 03 Apr 2023 21:45:45 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjR05-00GhaN-1X;
	Mon, 03 Apr 2023 20:42:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id t10so122200837edd.12;
        Mon, 03 Apr 2023 13:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCRvFoFqM45NTDEZm3j6oGCxNdqYdLwX1AAKzWK7X6A=;
        b=CQGHWDDXwzAPbNwv0V7hwLcAI8ir7pOTdF8U+W/WO1G8AO7VJBHEPyhpnXZuMPS32K
         K+CQJB8nyVia74Nh1GNzSAk0JQcwKmRqVIzuWJELrnVcNCAAqQx3Zsd1uIIb4TRpZFV7
         sQTTFytL0ZAVf810sbGSkhguLbJoBa8AN5N5k9HKepLfdvIsY9u8/W7duxut7CU9xTUS
         XtBeLn/dFcURYZcE3xTghdUwtn4hmUk1TICIFYQD1lvDEpvQYUJHPoQfmcPdaCScqBe4
         VV4ZE5ZzK/NR2cSZSqeg4xJgZBG/3gxj+bx/pw+x2AxUIq/fNScwqJV6UX86dnPYSyMm
         wPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCRvFoFqM45NTDEZm3j6oGCxNdqYdLwX1AAKzWK7X6A=;
        b=gHsPiCyXi/UkEG36Kod8DqDD1BXFi5RBPVad7ZvnbLp86xyI5I4XPafyFbaG/3EmlN
         h9SOc0IwfA/PwdlrDzKTYvIswMzj8TvINeyzsUcpASQD5dv/MnzFEytzrsdMQ3RCJqwA
         W3jYXtiQR4fIvGEiVzmzB6lfcw9vkrc2uyhJLGkzefoH+E+kPnIEohhbvVWRNOMmUzLr
         EyzeRhD1kWD9TA/4TIn8zeF781ivXLuhCr/0UROlHEDXq058j1Yi2vxEjbkC13aVkHkG
         TFc5lVwzHdQMaAsOTQjmdIKdqjgmT1pSHyFhVL25lEPHgKj0pWFVYKO/8y3ZUc5acZ70
         Ix5w==
X-Gm-Message-State: AAQBX9cV116nj3/wBoqeqAKkBe0jfCwsASEGV7+FxYlw1CDLjB+UA1zT
	MmbWOXDHziKIAP0nAf7pF2LQkrkVj5IOncyxrU2cCQYMMcU=
X-Google-Smtp-Source: AKy350bLr9dE1NqZwo6m8yGAz/fsHnuoSBpgL2oDKYO6GD12JaoDFrn0EFxyCgwD1uLd07XPaIkW+KK1bp13KdhZOP0=
X-Received: by 2002:a17:906:3701:b0:920:da8c:f7b0 with SMTP id
 d1-20020a170906370100b00920da8cf7b0mr3132ejc.6.1680554519873; Mon, 03 Apr
 2023 13:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
In-Reply-To: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:41:49 +0200
Message-ID: <CAFBinCDJcJA=unTQ=DqkKiRGJ441BrnER7+MUK1sr08X2wVT6g@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: enable edpd tunable support
 for G12A internal PHY
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Chris Healy <cphealy@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_134201_525926_06603F03 
X-CRM114-Status: UNSURE (   9.42  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCA5OjM14oCvUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdl
aXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBFbmFibGUgRURQRCBQSFkgdHVuYWJsZSBzdXBwb3J0
IGZvciB0aGUgRzEyQSBpbnRlcm5hbCBQSFksIHJldXNpbmcgdGhlCj4gcmVjZW50bHkgYWRkZWQg
dHVuYWJsZSBzdXBwb3J0IGluIHRoZSBzbXNjIGRyaXZlci4KPgo+IFNpZ25lZC1vZmYtYnk6IEhl
aW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+CkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
