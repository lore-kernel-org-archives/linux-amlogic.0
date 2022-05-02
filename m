Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2056BC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfPVppejDhJtnNaEI4ZKNDabaQgmDh3DcsJ5fSsk71M=; b=mY/+Olp8EeVL1R
	vfbEPWmDrIjKnH/5ferPZujcHTG2b/EG+7L5DzsaAfE7EQXGfnm33xdKOEJJg7+1q/cWNPgE/4YBB
	MRuI7Qv9RYS5WwZ2A8JZZhfHPBxo2ucFPKHHbGUk0WSd2NTE+ZRPPiJFBSDNIT4c27FnW0mtMPS0O
	xL0CxNl0uu+GGzjFybqKIAshsZktDuBmKfeM2fo8qkGECaLFPE+ojWY3b1BjDqmHIYWmaKxaVSCFP
	fwC7ZGDDYzDaxYa5Y0aCiBmVDUj/h3Bw1ATVXNBJNWEuHud1CnadP/2Lzxx4b50ngNcuRja45PkVY
	+r20WIY5yinw5z0IMdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlTcw-000rTO-Nj; Mon, 02 May 2022 10:50:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlTcu-000rRp-Kr
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 10:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651488599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TKyHWDgC93OfXdwv3f/QQ+fWpsgCb5Bjp407TIVwrw=;
 b=DAqtLe5X0+i4+6MQPjnTWKSQZ0OB07BWxS2oSWaXHe3jciRMY1mboNGC9jF9h8IvSt7n7O
 jxrYTzmHRH18zldzu2cVGOFmIYwNUK7ebeG5X0C/C9rn1uhmHIr+GdPqRWX6hkLLkpn+0G
 MXadIZM+DSL50TqG5O/v7y5DKu8In+A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-TsKwsLTkPMOnS8xnDY0D4A-1; Mon, 02 May 2022 06:49:56 -0400
X-MC-Unique: TsKwsLTkPMOnS8xnDY0D4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so5211414wra.11
 for <linux-amlogic@lists.infradead.org>; Mon, 02 May 2022 03:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3TKyHWDgC93OfXdwv3f/QQ+fWpsgCb5Bjp407TIVwrw=;
 b=QfCPii58kUm8AOUXb0tyZieF6jQpYFQ1ATatvduRJ64gYUIG8FYkudevHa3p0VA1eo
 dPeUgrJwyCKvXWA7MLvwtnEMQBjm9ftFW4/Gdga41CiEU6yfbFHYtwUvITHZr5c4DviB
 sGbmrpq1xbKr0IJGRh3ooh848T+Fl/vCU6RLPtlO9C9a/DijH9BpaPpw3mVvr8yt90KW
 W6Gq3kPt66/FvAJ5HwnyKysChtA4OJZOlKkLdbFigtHOVc34TgAwY6/RDj+Nym4cIibj
 0AKaYbKgg9x4nyO5CIt/E2HvTSaPvIS32Xj6zHPdx519apsligaWgPstOkM3ljSD10aC
 DfRg==
X-Gm-Message-State: AOAM5326JuOzweB5L65GPl8Zv14G/uZlGZO6cu/0JL/1OXpjYCaM+fPq
 7crJo0NE4iWZhNS4Qp5If/Jk5dX/guAOr9Jei0tQ4+Q/7qXSYyj57qABWYT03ZpPZzlIJ93qIH2
 XoKO7455nQsEhTTUFIl1I5nZvumN3U4I=
X-Received: by 2002:a5d:5051:0:b0:20a:e005:cca3 with SMTP id
 h17-20020a5d5051000000b0020ae005cca3mr8676784wrt.560.1651488595403; 
 Mon, 02 May 2022 03:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznK7MTrWwTm+wtuLbm1AtWbuZrM/hnsYDFHNU2iLGSqHpPTjz/i73gvAXGyZ+XCXckc/fOrQ==
X-Received: by 2002:a5d:5051:0:b0:20a:e005:cca3 with SMTP id
 h17-20020a5d5051000000b0020ae005cca3mr8676723wrt.560.1651488595161; 
 Mon, 02 May 2022 03:49:55 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adf8bc7000000b0020c5253d8f9sm6707583wra.69.2022.05.02.03.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 03:49:54 -0700 (PDT)
Message-ID: <1d2a03f7-d4f6-66ac-6e2e-adbd2eaf7d90@redhat.com>
Date: Mon, 2 May 2022 12:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Emma Anholt <emma@anholt.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, spice-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, Nirmoy Das <nirmoy.das@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Hao Fang <fanghao11@huawei.com>, linux-aspeed@lists.ozlabs.org,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Joel Stanley <joel@jms.id.au>, Dave Airlie <airlied@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 virtualization@lists.linux-foundation.org, NXP Linux Team
 <linux-imx@nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, linux-mips@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org,
 Mario Limonciello <mario.limonciello@amd.com>, Evan Quan
 <evan.quan@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Solomon Chiu <solomon.chiu@amd.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502084830.285639-1-javierm@redhat.com>
 <c120e1c4-ac5c-afd5-8dd1-b4b51e0dcca9@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c120e1c4-ac5c-afd5-8dd1-b4b51e0dcca9@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_035000_808024_B55722BE 
X-CRM114-Status: GOOD (  16.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Thomas,

On 5/2/22 12:35, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 02.05.22 um 10:48 schrieb Javier Martinez Canillas:
>> Hello,
>>
>> This series contain patches suggested by Thomas Zimmermannas a feedback for

Ups, I missed a space here. I meant to write "Zimmermann as a feedback..."

>> "[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
>> drivers probe" [0].
>>
>> Since other changes in [0] were more controversial, I decided to just split
>> this part in a new patch-set and revisit the rest of the patches later.
>>
>> Patch #1 is just a cleanup since when working on this noticed that some DRM
>> drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
>> the value that is the default anyways.
>>
>> Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
>> 'options', and make this a multi field parameter so that it can be extended
>> later to pass other options as well.
>>
>> Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
>> so that the registered framebuffer device is also marked as firmware provided.
> 
> For the whole patchset:
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks a lot!
> 

Thanks for the prompt review!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
