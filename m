Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7104DC43334
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jun 2022 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK4FN+a6Ky1zX21coV2//XAUYh0mwi+TbyVYi2EJhaM=; b=4/Dcwm2uGmUnVi
	HWEZotzp1JZSDr4ffxroMCbz5xIFq4uEy/KdJvVtLeBryLVR7dHDblK3ZVDJxew1WWfWxt+5cJFf7
	mOby6qj3MCPDiWdy0zq2IknuBU5x9SOosjlBuPoRRJqBgzq9G9nA+OeWyay5WC1fIEStW+CHXcn57
	pT7T5Pq/RPTSsLJCB8V6fgJfjySfmGWMhk+g4/sSwpCBkcqhl5EguIqoqOdKclBt6I4wT0sdHfbqc
	clkYtEryBn8sYwNNRc4dd6ihc3/l3vWlv4AxuMMW3f4cPVE0yEmi6f4s4uzPt7DhmM7Nk6p5/kxz6
	vG8sA2mrMGRBtQ22sm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3yJw-00A67Q-HB; Wed, 22 Jun 2022 11:14:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3yJs-00A65G-Du
	for linux-amlogic@lists.infradead.org; Wed, 22 Jun 2022 11:14:50 +0000
Received: by mail-wr1-x429.google.com with SMTP id s1so22890848wra.9
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Jun 2022 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
        b=z/ocsiUElwq2Ol2fF5l1HRqMMaNGMSC1/+8oQHLpQWLu429YrVBR/tnvq7KNWtwIO1
         vKJqA7rgUAiiGOKNdlwMjFurZAQLeqniaiGR74ASbDLlSriMOOzxItVhWE0QSvWSDF1z
         wnPR/hU6q/nU74KNLjXg2X84SJR1U2jxSqWO8a/x7jRbPZXjDqGeLFevtBezqUe56R1a
         7f0rlv+IRmpyGwRbiZXR3FrVvja2Yq3MOLg0mNs6za1kfz0V4uxdyGWKXZaA8ELytILx
         BDkiRFg7pp2SBYMObq/aoJYfogEZJWR+YhfycgXRStqMXxha87O37ft3cnQe33+/4mvE
         LISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PUdU9WfpnqAsGBFkVc2KUHImdcpkKUBXRwogLKDyHSY=;
        b=vLYeblI0JVirYyEmW9pc0DQEEBBgBID49bfrykvyd5Wf00VreE0E5eSdYeJBaWUrD8
         g6zMfquU1oDjtnUoBrTPPCaiulwLFAD6N54LjaMa30Zk3fqlq3awqMVQRyrikqGp5ots
         M93g7E716vI/ncBF7VF82tcNiA2XAKe1a0LphoHQ7wKzZARJzi2nc++bAsEWHFvafHYA
         1urA778VvXXjMMnI0roVFBrrWpHJFk9npDS6ww6lXHUq88cPKxKHhRdaz6Du5bYAYnE4
         2VqMlmDyrSLbIG5gVn6Cp05eLearNbmVCYkLwjspX4CCCj0nFFIS+3p375ysz+2JYZgt
         DCuw==
X-Gm-Message-State: AJIora8nDL1CuoRYB5mNHPlZhc0DnoeAd5zDesQfQUyxyzgdoFDw5wLC
	I/ZqejmiKkAlzDPPheP2MQjIMQ==
X-Google-Smtp-Source: AGRyM1v8ZhY0hH8c8n7TvnmAfbU48Dyk1bFg4uJSDokafOQgQ79E0o3w+OeeG5ifCToe2pBEDS6Ykw==
X-Received: by 2002:adf:fe81:0:b0:21a:3574:ec8e with SMTP id l1-20020adffe81000000b0021a3574ec8emr2726909wrr.410.1655896484628;
        Wed, 22 Jun 2022 04:14:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1a3a:95bd:5b55:a798? ([2001:861:44c0:66c0:1a3a:95bd:5b55:a798])
        by smtp.gmail.com with ESMTPSA id e16-20020adfdbd0000000b0021b91ec8f6esm7841714wrj.67.2022.06.22.04.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 04:14:43 -0700 (PDT)
Message-ID: <d57a6c52-a9e1-5660-cd47-6f9ba2389d86@baylibre.com>
Date: Wed, 22 Jun 2022 13:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Lars Povlsen
 <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-hwmon@vger.kernel.org,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Cercueil <paul@crapouillou.net>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Tomislav Denis <tomislav.denis@avl.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-iio <linux-iio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 =?UTF-8?Q?Andr=c3=a9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
 <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_041448_499225_223FA993 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjIvMDYvMjAyMiAxMjozNiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFR1ZSwgSnVu
IDIxLCAyMDIyIGF0IDExOjAxIFBNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4+IE9uIFR1ZSwgSnVuIDIxLCAyMDIyIGF0IDA4OjU3
OjAwUE0gKzAxMDAsIEpvbiBIdW50ZXIgd3JvdGU6Cj4gCj4gLi4uCj4gCj4+IChQcm8gdGlwcDog
VGhlIGNvbW1pdCBpbiBuZXh0IGhhcyBhIExpbms6IGZvb3Rlci4gSWYgeW91IGZvbGxvdyB0aGUK
Pj4gbGluaywgeW91IGZpbmQgdGhlIHRocmVhZCB0aGF0IHdhcyBhY3R1YWxseSBhcHBsaWVkIChp
LmUuIHY5KSBhbmQgd2hlcmUKPj4gdGhlIGZpeCBpcyBhbHNvIGNvbnRhaW5lZC4pCj4gCj4gRXZl
biBlYXNpZXIsIHlvdSBtYXkgdGFrZSBhIG1lc3NhZ2UtaWQgZnJvbSB0aGUgTGluayBhbmQgc3Vw
cGx5IHRvIGBiNGA6Cj4gCj4gICAgYjQgbWJveCAke21lc3NhZ2UtaWR9Cj4gICAgbXV0dCAtZiAk
e21lc3NhZ2UtaWR9Lm1ieCAjIG9yIHdoYXRldmVyIE1VQSB0aGF0IGhhbmRsZXMgbWJveGVzCj4g
Cj4gCj4gRHVubm8gaWYgYGI0YCBoYXMgY2FwYWJpbGl0eSB0byBwYXJzZSBMaW5rIGluc3RlYWQg
b2YgbWVzc2FnZS1pZC4KPiAKCkl0IGRvZXM6CgoKJCBiNCBtYm94IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyMjA2MTYxNDQ5MTUuMzk4ODA3MS0xLXdpbmRobEAxMjYuY29tCkxvb2tpbmcg
dXAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMDYxNjE0NDkxNS4zOTg4MDcxLTEtd2lu
ZGhsJTQwMTI2LmNvbQpHcmFiYmluZyB0aHJlYWQgZnJvbSBsb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjIwNjE2MTQ0OTE1LjM5ODgwNzEtMS13aW5kaGwlNDAxMjYuY29tL3QubWJveC5nego1IG1lc3Nh
Z2VzIGluIHRoZSB0aHJlYWQKU2F2ZWQgLi8yMDIyMDYxNjE0NDkxNS4zOTg4MDcxLTEtd2luZGhs
QDEyNi5jb20ubWJ4CgpOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
