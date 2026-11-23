Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C61606A321
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2026 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m2Rlr+KG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=p7dXzX1D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYox+SzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+6n1zk6C9NsvQXGyGJd6X0aYo0NqXn/goULeyU2xzow=; b=m2Rlr+KGgVvissuDDH7pPIGpqV
	ETruPVygL0/xU+4UKFl6esXIn6e+r5gZuVTW6pyqaPZYrG37MlFgd3Ek4qc0alVOWvxDkFR3U3qii
	Ck6X/Wv8hSxz1KSrLfqqG2ns6wQ5KIRX8kKlpOncks/2B7IB/8HrkTnrccArcHelkvfEbbRqUEzeh
	Vrd+Qd8onYFXnn74Azcp41Omzge4ExQ+nMqVSp+YNymFarZCw4a29AzcJgO/yCoSvOsx2Ai0SqxFw
	Oh1eR9w8CzY0sO2yP7qevs3TkSnUzlt8W87oh9485IxqOYQ2C1ep8jheXugDqs+dzjs/xSAiKC7A4
	MYTeg2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV09-00000003k5P-3O44;
	Mon, 23 Nov 2026 14:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV06-00000003k3s-3RP9
	for linux-amlogic@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=; b=p7dXzX1DvMgL2qjG7wVXg5qKSt
	o055IyG9CLq3Z0fd49uBGvZhSBrm1uxH2IHNt58V9zcwL1XQv/HLXCaw+FGvQRmnRgnQ/rNhaADqF
	mlJHI0UxPYWzz6qV8gVN+jyO16pXCadK8hIk7Hf/vBk10Vl4SD7LiA7Tw6IMGuWWcuHvpx7d87KS1
	AModRjX+bt+lNXIVTaoTX7QMBCH84+yPKRLL0oXptZSTe4jRYdwES1CHFfsEql+GlhreOy4oAfTYz
	cTO4jYvfhpenQzF8/Fv9OT/qvHGpRipSNrUNtRj0zRmVip9lrHnqCNd7TWTUakksap8WgvfL2L1z8
	ZUO//ywQ==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV04-00000003Efy-1XOF
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Nov 2026 14:26:33 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so23522191fa.3
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443988; x=1796048788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=qYox+SzKO1pVJPkcumDXYLuBeg0+E1a6a1H2mVOh1VGpaA73Z3aLjPD4SI560hB5bT
         GysmIhi63h+62bGE2p7TbuR/Vrbxz+c1eAT2+8Eu4IZjsWfe+HLEWBpQRz/5Na452Gek
         6Z8HgxNqwZHLx3QrxPqy75zH5XVyPu/MxbdqRiPf9RVrnCIK092AP4s8arbJjnbrlllo
         BP1uE3ouViX3+JWI/g+0PybatnH7zSGYiG6kdHNfl18roWYugysLSbHQeHpUNCryIA8k
         Y2CVh2VjfH6mTXsj8SplUg4bFtPIeuVyKhquQ4EWE4kyKikDUz2ZbtEEQuWuSQN6I8dl
         10FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443988; x=1796048788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=N2JtRAAvYTMrkNHwOjgmINfKAHQnVwWSImi1UiMJIYHONODh7soHWt4y8TBWzOZxKZ
         wqEvUzrtuwbuY+/koSDx7s01Mw3XzfUXSsdGFhab/n0LVt5o6Sa9vkeg0FUXYg0FjP1y
         NmMg5jAB04PU5qQkg0oDp/Ue6j79YeUC6vXjhwhgboi6jj2KZ/N7g/K6G7hlmOVIi7bl
         UPNxni1O+154T0dM9Ks4zMr2MpTsEOgU1PvpLluFVyGf9/IwzrpuhMXBU6cAtusfqVRp
         R9K2jMQEmK5zt4gNk0HIBs03UnFwan3lIS0h59aqyn1AzKdG7QIVwsBSKG+tUuzQcebo
         97NQ==
X-Forwarded-Encrypted: i=1; AL+hErGRCxZCJj55RGjlj1yztEm+TpdxK9ZBFQrUZBf59jtvuxBf+sONzL0oG+s5M8D6XZwwGM04KL0cmrtgZN3n@lists.infradead.org
X-Gm-Message-State: APuU4Z9K9L/3KAqbQWpCDJzIIBfP0s1hcEjVQ4XUfCBrX5bIWCI2QDsX
	0icsRFEMNkzN0dIzPjSBBKybNn0YT0RAVSGZK/viEnrD4ypuvzLLyq6W
X-Gm-Gg: AZFdTZcEh3VwiItM4OftXlCfIpUJISUInJvDNeg91RDQVpAobKzbhtsqo63O9SeCHiw
	Hz3/lsCM8jM4ZD0ykT91L0fATSH71IpWrRHZ5rGSXGIwVEW/qrmqrwu746aViPStm70DLzcxuEt
	dt9AReHdT3GNMyWOTWItGSQsXMV8E7yeukpVkEdgrTHB7Yv07QgzPgFUsTdmFn2VX1eKUtb8miW
	vFGI0W01JVEJCkw7EL14wPG9p1CyzzqW674qnjd8gZ2zi05jDpl6r4XhlKwlpnZgFR+xljdwN7a
	Iojf9qF8aX93DfrxzqE9wdcvBVucw7y7z0CIjZCSU9R5UXffBpNZBWKVu5wkCB6PXEMDiQ/CYQf
	5jt3WW0fMtRNDVgzQLEHFoDltfLGUQcDa4tnFK41o4UwpPT0HD2aQh+GUMynDbs0io9aJbqX/oT
	eCySIEp5C/LO7bRqDj5o8yCsQA0EAVLUr87zf2TXMEh+5s3+w8YCFhS1v1KJFpd/JhGAPtOOpnJ
	oc+0KZALXZ7VoQ+Vk6ojcDPMDQPYvXdDqBmY4jJg6SbzBQstXKjW/ypXM5zEMmhv6RhHhFueLQT
	LdEwXNXLGMIDlB0gPbZMjJQKSAaIOMgTXwZ9/0J/I5r4t74E0i87y29Aa16K+xbsiwME1HFnVE1
	/MN8A9WevPA==
X-Received: by 2002:a2e:ab0a:0:b0:3ac:e4b6:b93d with SMTP id 38308e7fff4ca-3ae7f9a072fmr31420641fa.8.1795443988058;
        Mon, 23 Nov 2026 06:26:28 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80536529sm33679491fa.27.2026.11.23.06.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:26:27 -0800 (PST)
Message-ID: <bc178673-54dd-4811-acdf-cb6327ec2417@gmail.com>
Date: Mon, 23 Nov 2026 16:26:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/17] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
 <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142632_239804_8F58992B 
X-CRM114-Status: GOOD (  10.70  )
X-Spam-Score: 0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjMvMTEvMjAyNiAxMzoxOCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gRnJvbTogVXdl
IEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+Cj4gCj4gVGhlc2UgYXJyYXlzIGFscmVhZHkgbW9zdGx5IG1hdGNoIHRoZSBtb3N0IHVz
ZWQgYW5kIGdlbmVyYWxseQo+IHJlY29tbWVuZGVkIGNvZGluZyBzdHlsZS4gVGhhdCBpczoKPiAK
PiAgIC0gbm8gY29tbWEgYWZ0ZXIgdGhlIGxpc3QgdGVybWluYXRvcjsKPiAgIC0gYSBjb21tYSBh
ZnRlciBhbiBpbml0aWFsaXplciBpZiAoYW5kIG9ubHkgaWYpIHRoZSBjbG9zaW5nIH0gaXMgbm90
Cj4gICAgIGRpcmVjdGx5IGZvbGxvd2luZzsKPiAgIC0gbm8gZXhwbGljaXQgemVyb3MgaW4gdGhl
IGxpc3QgdGVybWluYXRvcjsKPiAgIC0gYSBzcGFjZSBhZnRlciBhbiBvcGVuaW5nIHsgYW5kIGJl
Zm9yZSBhIGNsb3NpbmcgfSwgYSBzaW5nbGUgc3BhY2UgaW4KPiAgICAgdGhlIGxpc3QgdGVybWlu
YXRvcjsKPiAKPiBBZGFwdCB0aGUgb2ZmZW5kZXJzIGFjY29yZGluZ2x5Lgo+IAo+IFJldmlld2Vk
LWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnPiAjIGZvciBNYXhp
bSBNQVg3Nzc1OQo+IFJldmlld2VkLWJ5OiBDaGFybGVzIEtlZXBheCA8Y2tlZXBheEBvcGVuc291
cmNlLmNpcnJ1cy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+ICMgcmVuZXNhcwo+IFJldmlld2VkLWJ5OiBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gIyBtYXg3MzYwCj4g
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2Vu
aWdAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF6emllc2Fj
Y291bnR3QGdtYWlsLmNvbT4gIyByb2htCgotLSAKTWF0dGkgVmFpdHRpbmVuCkxpbnV4IGtlcm5l
bCBkZXZlbG9wZXIgYXQgUk9ITSBTZW1pY29uZHVjdG9yCk91bHUgRmlubGFuZAoKfn4gV2hlbiB0
aGluZ3MgZ28gdXR0ZXJseSB3cm9uZyB2aW0gdXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpoZWxwISB+
fgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
