Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A21C4321E
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+Z6H8zteugkY6FaBIEalFQJCjCLSJLeXLDTKDZA20k=; b=yu3lz6hmqEwRCQ
	nkBHxZCge2xeaTQdDEejC53HgUOAu4HSDCPiKHKqnlTECLkMGhuM+OKqsJWVcFT75Fs3mj3XKllQT
	kGUYfKpB8Pcf94WER3bGc/313sRqcKIXyRR/9wrHF9ldoKhShIA5L/gzKTKkzYaJJAxw6USLme6h2
	435Epo8xCvGnyIlfg+QfTM2F0i7p4SgaouzVDtnNbcb+sqww3KkL/FtD3aZuakB50Hxe1KlLweV6y
	h1nYINp7wg1j4ie3v68Pc89VEsTB4da2/057czMSiHwTef7w0GHWsdMG7LHN/ZFx13CG3EPXV4akS
	Tzpzw4VLeYTugCjS2/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1sBI-009rdV-2u; Sun, 04 Dec 2022 16:49:32 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1s91-009rDf-71
	for linux-amlogic@lists.infradead.org; Sun, 04 Dec 2022 16:47:12 +0000
Received: by mail-lj1-x22a.google.com with SMTP id x6so10986374lji.10
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Dec 2022 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBSaaBdFn+BP+xzbg2xAiyjV0AjU3IsjmFiKfeCqqvI=;
        b=wJTrVXJOn+oqKMcWQtvULX7ulDXWLrtPzSQaCY4aUPic6EJRnTU8lpjcSCs4NXujGa
         5B/GwS81kHr5ShQHFdRjt18fi0NXOrNAxrT32DzlDZqRkiOO5QiTijH3HjRfEmwPz/hA
         1XRsGbRqG4MCscTzmETpOCXB8HlJc04gBwdTPqQUbctpbJDffiaNKZ5OjZmS+oaGNOEw
         k4gP18xu7u1DfYB80LqsTWgMRMj2XnMS8u/wnDxGaqKvhZQc4/fOU45+Lhn+N04UZVc6
         IJlhricGMUAFHmurSmdMVqg9SwBN3M2FwtGiSoFgVVS5Ly1wTyC/jXRj8agENVJkzVw+
         KPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBSaaBdFn+BP+xzbg2xAiyjV0AjU3IsjmFiKfeCqqvI=;
        b=fljZstBO1j8NdfPm6ImHPw97YQ7M9lnprlBdcy+5SqE3DfgYL+nUwjyKQoiCbEqXNg
         L7ZB1e1izdaJcKjAY9TWASvD58vUJhXF1ZkgO7Hts43k3Z2SnSyhVj2WpQFjPIXMhd3K
         Y1d3OsIDetgR3osGp39b0IqPN8zaKVC9I5haggMChSfiw/sknLZvQT9OEGxAHOYsIEb2
         Kzj8Q/vXEPVcd88T22fSEvQiiMWkGYAd3dXhUKuOshatEc11t11DJUs5PvCyqGdC9rLn
         2ia1dKKvockQKoKLDZKu7T8RD04W6ZkNkQPUJdpO1xQoKQDdhmMt1SdCA5slN+hsSQbl
         3BCA==
X-Gm-Message-State: ANoB5plo84oNkg9veluVzu2Xjg0e2cKf84UMpbKZCEqNmKJBrGq82/IQ
	c6y9JTpJmurvZ+NjJ9MOMW3wNA==
X-Google-Smtp-Source: AA0mqf4kBdTo6SDQ4Um37LTIlSLql9Lw0iLy1FQ9H6KpXZOkmUBpkamfuV9PNogA/0JeVQ7HB2Tjjw==
X-Received: by 2002:a05:651c:1510:b0:277:75fb:1fc5 with SMTP id e16-20020a05651c151000b0027775fb1fc5mr24664380ljf.405.1670172429042;
        Sun, 04 Dec 2022 08:47:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020a0565120b8d00b004b373f61a60sm1828538lfv.96.2022.12.04.08.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 08:47:08 -0800 (PST)
Message-ID: <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
Date: Sun, 4 Dec 2022 17:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: Reference common DAI properties
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>,
 =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stephan Gerhold
 <stephan@gerhold.net>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.om>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki
 <katsuhiro@katsuster.net>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>,
 Lubomir Rintel <lkundrak@v3.sk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Matt Flax <flatmax@flatmax.com>, Ricard Wanderlof <ricardw@axis.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
 <20221203160442.69594-2-krzysztof.kozlowski@linaro.org>
 <2251607.XGVbBG2WQu@archbook>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2251607.XGVbBG2WQu@archbook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_084711_305993_09317CC0 
X-CRM114-Status: GOOD (  12.53  )
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

On 04/12/2022 17:09, Nicolas Frattaroli wrote:
> On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
>> Reference in all sound components which have '#sound-dai-cells' the
>> dai-common.yaml schema, which allows to use 'sound-name-prefix'
>> property.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> This is an output of discussion here:
>> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
>>
>> This patch supersedes previous WSA883x one.
>> ---
> 
> Hello,
> 
> for rockchip,i2s-tdm, we get some (new?) warnings with W=1:
> 
>     /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
>             From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml

I did not touch reset names, so are you sure these are not old warnings?


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
