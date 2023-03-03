Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDA1C64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIIso/SvwGx62lUHmnYY0kHqcJJPq4iW56f4qKswd0E=; b=f7OETOnULzcTzv
	nYILUKgQsVFyjqu9N8AR7aXszSl0XpKGscfa4dVSxlmj3ZAK75So3S3qf2fthHe2ftrMErUUFnxdU
	obi1h0JSzUutSh3G+GNZB/XA94oug3Bka+9RD+ttDCK6YC8Q6iTxagOy7bHIXWF3od2B101TehrFP
	2u1EzPkrOywWP7R9mZzN0RERTb7m17pUhaWfK3f8cT5UP6i44YLYpIv3W/NeH2dlb6eXp6LOwV5Sv
	N80wroq7JWRZJVfNqafFfHS9q9s1UzuaBKR7QqZ2K3hUGdJfkIFw53H8BJc2ZtopSu7Y23qDOd8rs
	znfSM8NeSee65Gme34sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY40p-006Epa-F6; Fri, 03 Mar 2023 11:55:47 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY40m-006EnH-IF
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 11:55:46 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-53cb9ac9470so38193227b3.10
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Mar 2023 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=;
        b=DRqakUUKFXRGm69WVxx9NWOsatykkvfkKUlzMq2OnyDSxa+HuTapR3hpbLFjBMU1Ch
         oO+smsduZUXVdTLTmfAPXLG2PV+/pD5wkOJUFXRjP45c2nKCPPFURmJHPArjevLQnbC7
         M2wu8VkpS73v/BuFvHXgJn7hEmaRYyzBsn00BfR/OWNvHOan3OsiAfd48cUjUsxcYDjD
         pQwV+rgMw6+vW4Vbmg5eD3vUBOWTIqXIitDhHzhusgo/C6u4I2yVSfpD/6kzCaw7wfwy
         qxYDi91GmTBUwD/olzh+a1uc2W+b+dBH77AYn4ERUY8Wi+MF2WaMmWLuGS8qMBw2JGDm
         zbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=;
        b=Fe09+M8ajQE6o1iC0R56zS+97SHIikwo6eM7Ucz5gFvB7domyou0YbUTl8Vbtw1xB9
         lqlr6h0bTs5cKpodowHMYJ8DKgvtVTTn3LwuC0EK4Sk5KdfslIDcenGqvY7VyEfjIp55
         u2V8/uG+29QsHldzfycfx+eyr/ABYUHmqOMLaGzEydpGcx1LTIOtDKsHbOqsZrW3Qcqe
         iRoVldrqCFADpjsFB0d6k6wNkz7kXJ3M8nkSjatU3QcwOap8BqsTToHVEOO1w3IieBos
         OmT7a9mFSp3BMoMSoMDxGntwNJz3JI552ceOV/4mkgWJK+d4BuZ//rTjemg1JZCDgHo5
         xFTQ==
X-Gm-Message-State: AO0yUKXEJmEb189TYt0rzJkPpys8zqh/7DIOIRuCczEbdUCwB63RqzjN
	1ljDLD4ZLeZ8Vw8Kaho76qZUuo3gcKGcPz+s8jxaiA==
X-Google-Smtp-Source: AK7set9+g7CaZKhwb6dcWYW6BTUUJXUyZuISsu0waCwptFPvO2UJ6I2OocVeB/84RPaT8roh5mWcunV6iyn3UJDp/FU=
X-Received: by 2002:a81:a783:0:b0:533:9b80:a30e with SMTP id
 e125-20020a81a783000000b005339b80a30emr736607ywh.10.1677844542703; Fri, 03
 Mar 2023 03:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org> <20230301201446.3713334-3-daniel.lezcano@linaro.org>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Mar 2023 12:55:31 +0100
Message-ID: <CACRpkdYG59p5o0Te6LWmo3KBf7=v8ARRpb4kKgtm8Khv8Yfw1Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/18] thermal/core: Use the thermal zone 'devdata'
 accessor in thermal located drivers
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Balsam CHIHI <bchihi@baylibre.com>, Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Dhruva Gole <d-gole@ti.com>, Guillaume La Roque <glaroque@baylibre.com>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, ye xingchen <ye.xingchen@zte.com.cn>, 
	Zheng Yongjun <zhengyongjun3@huawei.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>, "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, 
	Shang XiaoJing <shangxiaojing@huawei.com>, Tim Zimmermann <tim@linux4.de>, 
	Yang Li <yang.lee@linux.alibaba.com>, Jiang Jian <jiangjian@cdjrlc.com>, 
	Daniel Golle <daniel@makrotopia.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Ido Schimmel <idosch@nvidia.com>, Minghao Chi <chi.minghao@zte.com.cn>, 
	Johan Hovold <johan+linaro@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_035544_667711_756BC929 
X-CRM114-Status: GOOD (  12.22  )
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA5OjE1IFBNIERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6
Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhlIHRoZXJtYWwgem9uZSBkZXZpY2Ugc3RydWN0
dXJlIGlzIGV4cG9zZWQgdG8gdGhlIGRpZmZlcmVudCBkcml2ZXJzCj4gYW5kIG9idmlvdXNseSB0
aGV5IGFjY2VzcyB0aGUgaW50ZXJuYWxzIHdoaWxlIHRoYXQgc2hvdWxkIGJlCj4gcmVzdHJpY3Rl
ZCB0byB0aGUgY29yZSB0aGVybWFsIGNvZGUuCj4KPiBJbiBvcmRlciB0byBzZWxmLWVuY2Fwc3Vs
YXRlIHRoZSB0aGVybWFsIGNvcmUgY29kZSwgd2UgbmVlZCB0byBwcmV2ZW50Cj4gdGhlIGRyaXZl
cnMgYWNjZXNzaW5nIGRpcmVjdGx5IHRoZSB0aGVybWFsIHpvbmUgc3RydWN0dXJlIGFuZCBwcm92
aWRlCj4gYWNjZXNzb3IgZnVuY3Rpb25zIHRvIGRlYWwgd2l0aC4KPgo+IFVzZSB0aGUgZGV2ZGF0
YSBhY2Nlc3NvciBpbnRyb2R1Y2VkIGluIHRoZSBwcmV2aW91cyBwYXRjaC4KPgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlcyBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZXpjYW5v
IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBOaWtsYXMgU8O2ZGVy
bHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZT4gI1ItQ2FyCj4gQWNr
ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4gI01lZGlhVGVrIGF1eGFkYyBhbmQgbHZ0cwo+IFJldmlld2VkLWJ5OiBCYWxzYW0g
Q0hJSEkgPGJjaGloaUBiYXlsaWJyZS5jb20+ICNNZWRpYXRlayBsdnRzCj4gUmV2aWV3ZWQtYnk6
IEFkYW0gV2FyZCA8RExHLUFkYW0uV2FyZC5vcGVuc291cmNlQGRtLnJlbmVzYXMuY29tPiAjZGE5
MDYyCj4gUmV2aWV3ZWQtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGliYWJh
LmNvbT4gICNzcHJlYWQKPiBBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbT4gI3N1bjhpX3RoZXJtYWwKPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kg
PHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxp
IDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4gI0Jyb2FkY29tCj4gUmV2aWV3ZWQtYnk6IERocnV2YSBH
b2xlIDxkLWdvbGVAdGkuY29tPiAjIEszIGJhbmRnYXAKCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
