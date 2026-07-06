Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F10C43602
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft514qVs4SRzVKlvgHMLqcVJmWe/bs7x39Fs7T/LvIo=; b=t2HaNjFzlJ5jVl
	0pc9QRwbE+GWBLy1u5uRavj0w0a/OjRi2h4WkH7RCqtBQW4Yn/Mc1UcDcgbg3MXPTj2Jmo/gq8yyc
	K9pfqb10gyagE5Zn9XD3kYfWwENlmDLAkZr1c42cm9tkErRozPX69F4SwVOHUzMOxljsZuYuVL0Yk
	KncQD0Ta4Tnf/y6mRuBy/Ac8qwcKx9npt7zJmKilzcZXG3GyJCC5ixKAv+eSTSxt9bcIB0ei+7Sw5
	0vw6emcIvsnUukgnddSYmLQD4GZ/OX6h7CxVIGAePjquWaMWprHCOUHRtQlmlSQnEOYDzS0WNpm7m
	kiXQLoN31XcClvwaBkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgegm-0000000BpMV-2pwH;
	Mon, 06 Jul 2026 08:28:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgegi-0000000BpJ3-0Rts
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 08:28:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641jgs3617923
	for <linux-amlogic@lists.infradead.org>; Mon, 6 Jul 2026 08:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=; b=jm0Kg9lSibJvV8Yi
	8hdJzAn4zgpP2byZ5O4vxPHA667bXVLXHofUt568kB49iHxnfwvFhctaInLtCjCZ
	sjNHRodxgeyEI+K4Sh5SeEFuH+eYubHtMfiWH/bAUEFyu7LxqpBoChobn1qyHVpZ
	1rLLI4FJJqj/Yk953HEONXVBT+N6ylBmW+SjTQeQEVhfTmxCK8O9BG8vaRt3Exir
	JXmS8JQhSMmJuTk8SMinF8d+mY+jVTVBRkY8NqkZa2/Ot0bSxasJBedLFZ9P4/jy
	oIqrv4PZJHfl9zhVgr7IHFht7qp40w3MPq61gyA4heu2IH0hVtB6bY7pBm7HdH1D
	jKj/ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nd3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 08:28:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso261213885a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326502; x=1783931302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=JQE4jGfFa+DmqViVvBr+82Q3iuwwCzULVNE9StgVbYu2SX9jGFUU0zSxJJzj3AJkDB
         rr/A0PFusvtfs7s3yPdBvOORckuB6dXpVP62b3hdXv2vQvlFyhfGio+u/UMb8nLdG6jP
         Imokp53s5cMH7Ujx3TSSKzyq8Y4An7XYgEAv0L9jgsZePjHS8EoPZ9oqRyio9Xbzp8EJ
         OEnRw90Tuejp11sGKJ99KjmLOx0xeZ9eX5nODNRaTrb73ne9YbtBnCI0X4B2Cpu21hI4
         zNl3cMxTYJMVUMEYqJ0x22JT/DTPskAXr+Lebsg0uqeoKiggDjTphWeQArzgZt+ecBEc
         pl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326502; x=1783931302;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhBIVcIgoBMwzdmQI01e6U2QYtMrrtbbOHKP8KiZ8E=;
        b=bGEDsdxeZogEXm6s1qyjwTELp3KslC+jMFs4ZIzIZWGSIIa6kxwLIEkD688cSdkAMq
         uhHZpnAU15WqL0kfHyF48w5fYZ8aem3N4nU6FXfx52TH+/Yx16Spqciuo2df4UNKE25k
         Pz9ugMPtUuI1HXxbMHX9+DHAm3AWoaudG/5oLgC5HEBXOw5B48hrHrewvzVdNJa1ETjr
         WIKZ0E85iORAVHmjqripEk34z5bZk0y0Add1L33BQe6EQ8rMKwcP89qqeWYSKm/lJDDO
         CzrYaxC1KWC1ExPXkUNXbpYlPNGLxXlI6wiaTmAfy/lwtnQ0K0mdmHFxVqmYS5HXpz7U
         WXoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNABRBG2CenkJMs3g10TxVfVu+DxV7hs+KenySWiD8fN94PsRh1N4S0oCVqkyaF02J7DI9ig3Kt1WEACbn@lists.infradead.org
X-Gm-Message-State: AOJu0YwSzEUK/Zu69BWYDIUURH6OMJQxU/oN16AZETEaFz9LF8lm8A78
	ouCUlUoZn0OxAK16cM01AeL/YB2GtyghgnH1nsCxFlwAkTnO9mpu/iuhOXnf35L0/rH7eRwFEpn
	7U8alx8UOsa6x0vkVDaR5+bugsaIzGiALA8EYMpFu6yfPxmShSyS0lVPHOOokrm55ywauh7lVjQ
	==
X-Gm-Gg: AfdE7cmuw3ejsF1tMbNiJW9vU07p3WzuLydVKfSs1dycYd2I2Bm742UIWzzTkB0TXSn
	MMk8O6T1oNuKsm8Sh0s8pP1rGJq6k+8LkxdUKrV1DNTU6RwRpJ9hOiUPT7jquPgbrIQpn2TASpb
	PIY1+rWgzo5hwlfRNg0PZ1CKwH8l+uGGNPkFmtmwUQVoSPxdQIiK1hBZdNiCxwXwBjm2r1oGaE6
	XKOLjHizoyAun1N4STgrDter43rIyN42nRc9WXImO9RgEDYwpbFnn21ujr7j73LVEXx1VsdFMia
	0Bnq0vaVyB+bNtOlnCqTpvtrfwtyNmMHli/h3Seueh5YkvjmbezECdqBQ9Jr8tGV9GLX2EmF/RZ
	pMCpP3djsgtUxEfuThFBHcFemZ8RZiE+9gQf8HlQGITzDxG7kQB1WdLBG7DPvyQ==
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294193085a.62.1783326501621;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2b84:b0:92e:47d4:b485 with SMTP id af79cd13be357-92e9a4ed0e1mr1294189385a.62.1783326501174;
        Mon, 06 Jul 2026 01:28:21 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907absm677939066b.33.2026.07.06.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:28:20 -0700 (PDT)
Message-ID: <bc697542-b1e2-41c2-af36-b708ca4aad5c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Chen Wang <chen.wang@linux.dev>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Alexey Charkov <alchark@gmail.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
 <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev> <aktWoIfY_DdO6gb4@monoceros>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <aktWoIfY_DdO6gb4@monoceros>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX76bWcMn8MCjS
 rrTbiGCm41vHpkE5QeegS5PRM+fdvn3HwuNWP/jclVUm+9fI34Tn8DhbPbIWN1dH445Bu0T5EOq
 b9TkaOMLha39m9FTg0voksht9lKgG8yYAtiOrcltCuNI/c1DTXad7jZyMhb53SHj1S3IK81vWHA
 esSIIVdsv6kEJSEAcnY4sAZoOcWN3OE1eEBdKcuXp3MDqLs4N1aVZRlFRu9ZUZWjrXSx187kVyP
 2yh+0JrzCS0L3bmQMBsArFIsLT1j/vGJUlRqJG3FDznHUdqMh3lQUfm+Brj5anF73R/xsqWU8Pp
 jfs9Zrl4hkaRk7HbEpq5AVGwW1X3ZIHj4ooeEbx65ROROGW2oK5NMT81IMnBjavkZvoGysWi9pZ
 W1qkajCIFf0Z2R3HK7RsDdSbMb9tk9R4seSPEqjdGma9emjZx74DLUzm/2J+DUYZlvKXxZgC0/1
 Ajn9EIHmPGohchLOHyA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b6726 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8pif782wAAAA:8 a=IpJZQVW2AAAA:8 a=TiEZW8bMWLlPbLH3YMsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: vnZpMNfM4ceG9nzDHo0z3JW6JvWlCrr1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX2FzilpePRe0D
 Z3Wts565w05NiM4pH6n+SMq5Nt0cNWWDdcQKbBah3pHWoBEo0kt14F/6sk3vaZ6EL2K9OKaI4rU
 KX49LyPBwYP0NjkCqm9MTAyWxmTgOdg=
X-Proofpoint-GUID: vnZpMNfM4ceG9nzDHo0z3JW6JvWlCrr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_012824_309980_71F693D1 
X-CRM114-Status: GOOD (  13.67  )
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

SGkgVXdlLAoKT24gNi83LzI2IDA5OjE5LCBVd2UgS2xlaW5lLUvDg8K2bmlnIChUaGUgQ2FwYWJs
ZSBIdWIpIHdyb3RlOgo+IEhlbGxvIENoZW4sCj4gCj4gT24gTW9uLCBKdWwgMDYsIDIwMjYgYXQg
MDg6MzM6NDdBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBPbiA3LzUvMjAyNiAxMToxNCBQ
TSwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4+PiAgICAtIFVz
ZSBhIHNpbmdsZSBzcGFjZSBpbiBhIG9mX2RldmljZV9pZCBhcnJheSB0ZXJtaW5hdG9yOyBBIHNp
bmdsZSBzcGFjZQo+Pj4gICAgICBhZnRlciB0aGUgb3BlbmluZyB7IGFuZCBiZWZvcmUgdGhlIGNs
b3NpbmcgfSBpbiBub24tZW1wdHkKPj4+ICAgICAgaW5pdGlhbGl6ZXJzOwo+Pj4gICAgLSBObyBj
b21tYSBhZnRlciBhbiBhcnJheSB0ZXJtaW5hdG9yOwo+Pj4gICAgLSBBbHNvIG5vIHRyYWlsaW5n
IGNvbW1hIGFmdGVyIGEgbmFtZWQgaW5pdGlhbGl6ZXIgaWZmIHRoZQo+PiBpZmYgLT4gaWYKPiAK
PiBUaGlzIGlzIGFjdHVhbGx5IGludGVuZGVkLiBpZmYgPSAiaWYgYW5kIG9ubHkgaWYiLCBzZWUg
ZS5nLgo+IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0lmX2FuZF9vbmx5X2lmIC4KCkkg
YWdyZWUgdGhpcyBzY2llbnRpZmljIGlkaW9tYXRpYyBleHByZXNzaW9uIGlzIG5vdCB3ZWxsIGtu
b3duCmJ5IG5vbi1uYXRpdmUgRW5nbGlzaCBzcGVha2VycywgYW5kIHVzaW5nIHRoZSBleHBhbmRl
ZCBmb3JtIGlzCmp1c3Qgc2ltcGxlciB0byByZXZpZXcgKHRoaW5raW5nIGF0IG5vbi1uYXRpdmUg
RW5nbGlzaCBzcGVha2VyCnJlYWRpbmcgeW91ciBjb21taXQgaW4gdGhlIGZ1dHVyZSkuCgo+IAo+
Pj4gICAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmln
QGJheWxpYnJlLmNvbT4KPj4KPj4gWy4uLi4uLl0KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
