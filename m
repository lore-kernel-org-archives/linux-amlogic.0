Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C158C43334
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jun 2022 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7iXKDfTdG0KChUa/VyvY1h1hEVUiSNpqDLW/yUxexE=; b=zt8aF3d8MDSLca
	WceKXNvq9nHt3U3OJyWBH1Okh88JQY6n3YiC+g+gso8hJb06d9tw4eU1R/xDL30YoemxTyy7neonu
	407cUcyh/48TPGi3it2jTEt8ueOyN+T6wACRsJcbchQZ+rbXXJC3tVcscD5iC+v+7kj2dnWRD10vi
	lwmraMzVnqZjZXnjuhHATg/Kd1SYiPRIIFDhEsxCn7S/tDDwZikqjFZYhlTGXQP7g7aM8uLxGvw4x
	Kf12GWnwGd5QjR8KHDySpia9ff1OrRx7U8lgmskssVz/LWs9XsIcNc1fTqBmLu2YACYrsqkJqq6Ea
	eU5we4iGkYtG44WlxyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3xjE-009whg-2x; Wed, 22 Jun 2022 10:36:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3xj9-009wfZ-UF; Wed, 22 Jun 2022 10:36:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id e2so12330350edv.3;
        Wed, 22 Jun 2022 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
        b=C60jruRIr3l7H20jbT6Re8q4TAOBzwgoJniFeCwP9jUCkCeFfZSyKWDXzuiR3+WsFk
         iug9mCtL5f/362puhR37XxfXjPTn+feFC8tv5f+bUCGxDr5RecoUaz5WL/iKgw40h3f5
         nRLlZkcl+Cgcr2kX9I7VZkqGcpVV39vi0d4feUx7Mg7xkPeRevq2RrFsFeI4kgEh2RbO
         1N8lkUgvGsbvP6nJ0yewhGBY+YbTQLHkQCH0wrxztTUCL3jR2tFJCgJ4iW4RmvFKBM5x
         9Wx0qhacGBBsF/oQxleSmTbsTojFMMwK1Y3Znaa7mITTI9ctZr+bJEAD7fH9uR2Py1m/
         LCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
        b=SjbtgqwpnBxdlI0TIiDQIe0KBvo3yLXKTgMA8uT2Lpkt9Q5eIECFu4emOAzrLA9zSI
         6iZJN4OV88rwqKgMFl/hUDnq/b5ooIfNqxa4dlwqVqn1D86LFLF3qHqH4/5U3uXt6QGg
         dZSqpwbghqTvrZUqAhIiFA5Uv4sox/3lx+eYq6tio7Zy5T3G0y/57foU31zoa8Q+RQQR
         2b1S0/0985pLpbltNEePkzJ3xKf5cMcpntApdBHlQJGXyBhp+GDocXHru8BJ8DX4D9It
         iUqwL+vuyltMjntKWlJH7ArvXVjkG8xoq9kKctIbK5UBn3061s3uX2k2sN4gGAY//V0x
         Ttsw==
X-Gm-Message-State: AJIora9+ox3NLz4PyErV45oAQQ5Y+RaOtcib1i91nefWo61DVfs/yuKR
	sY1DLNGzirWcf/Q4VEwaNyZpeTrPfy9iRVCPCyY=
X-Google-Smtp-Source: AGRyM1tnnFr1LC7h/zRLo+HkB47D6IcosyajAFO4R/Wl+PPHAqyQruG56xeyLIJB7dGNj2Z8gyVtab2tS/XsOjguV9k=
X-Received: by 2002:a05:6402:5002:b0:435:1ff1:99ee with SMTP id
 p2-20020a056402500200b004351ff199eemr3312157eda.230.1655894208315; Wed, 22
 Jun 2022 03:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de> <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
In-Reply-To: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jun 2022 12:36:11 +0200
Message-ID: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, linux-hwmon@vger.kernel.org, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Tomislav Denis <tomislav.denis@avl.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-iio <linux-iio@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, 
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, 
	linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>, 
	Alexandru Ardelean <aardelean@deviqon.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-pwm@vger.kernel.org, 
	Sascha Hauer <kernel@pengutronix.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, 
	Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Cai Huoqing <caihuoqing@baidu.com>, linux-crypto <linux-crypto@vger.kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine <dmaengine@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_033652_082578_64704D1A 
X-CRM114-Status: GOOD (  12.81  )
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

T24gVHVlLCBKdW4gMjEsIDIwMjIgYXQgMTE6MDEgUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjEsIDIwMjIg
YXQgMDg6NTc6MDBQTSArMDEwMCwgSm9uIEh1bnRlciB3cm90ZToKCi4uLgoKPiAoUHJvIHRpcHA6
IFRoZSBjb21taXQgaW4gbmV4dCBoYXMgYSBMaW5rOiBmb290ZXIuIElmIHlvdSBmb2xsb3cgdGhl
Cj4gbGluaywgeW91IGZpbmQgdGhlIHRocmVhZCB0aGF0IHdhcyBhY3R1YWxseSBhcHBsaWVkIChp
LmUuIHY5KSBhbmQgd2hlcmUKPiB0aGUgZml4IGlzIGFsc28gY29udGFpbmVkLikKCkV2ZW4gZWFz
aWVyLCB5b3UgbWF5IHRha2UgYSBtZXNzYWdlLWlkIGZyb20gdGhlIExpbmsgYW5kIHN1cHBseSB0
byBgYjRgOgoKICBiNCBtYm94ICR7bWVzc2FnZS1pZH0KICBtdXR0IC1mICR7bWVzc2FnZS1pZH0u
bWJ4ICMgb3Igd2hhdGV2ZXIgTVVBIHRoYXQgaGFuZGxlcyBtYm94ZXMKCgpEdW5ubyBpZiBgYjRg
IGhhcyBjYXBhYmlsaXR5IHRvIHBhcnNlIExpbmsgaW5zdGVhZCBvZiBtZXNzYWdlLWlkLgoKLS0g
CldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
