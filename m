Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1D7C4321E
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aa423UQAabSvWyU1IlNIsdq5XfxNeQrein+Oiz6pLDw=; b=hC7yXpUmXkfQP+
	c0EZ4zBsjTivvLbsy3kLfRp24ZNJi+X/O+xp1NGsWWkW2iz8jy0bqJ1sAAIDIcAIFrTWhj3zrvMHv
	G/k7hVhR6Il8u0nOUMqfRj+ySX6HPE06PXT9TcFxibnzF/y5E519BucMjbM5MGbStqEivf3apRpP2
	nRlrwph1MCTwcjEVDpuuHnqgEQYl43jXcTrs/ztJL+4bbw/LfhDXENed/lsFOP5zkduQ9o4XkwX/y
	fv2ZrpSQBAi7ihN2ch9TXutCXVf3xoNCnQLyM4IDg04atk/9x7T0ueT2tTmYM7mOl0wVMJARNpQ7O
	RUSyezZQ+zJr9SlovQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tt3-00AO9P-F7; Sun, 04 Dec 2022 18:38:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tmx-00AMh9-I4; Sun, 04 Dec 2022 18:32:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so10281865wma.1;
        Sun, 04 Dec 2022 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cT6XsFeikKqtH1/hCcOrW6pF6YKm2yjZrCCnG8JeZLE=;
        b=YY31dTp15ts/Sd2mG4d4Znp5cd0G0qqvDj3IRWl0XuNT9Yto3NXrjJS5gszXn7RWHn
         RpjCotoEVSlLlonPHNwJP1TCiJRRkkKAcGEZ8EfBRcsG6yvbfZB1inHPervKq6osS7xm
         NJIx2owTgSqNCsFpFYl9tQejPnYMEDG2FBAY3KJnV+ZLsPiVQ4zahlOuWLRbRj4EcxRl
         6U9NUiY070rRU3dQeHmHym3VcILeTFk1q21u8fCl630Atust2KqldbbvqZwRlvHqft27
         J5n1jMlZ2Cmg94qlkwYAUJ5lo/Thj627DGaQuxdxtNNouDyvDo4QcPZbYLhaGDYxMLAh
         btNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT6XsFeikKqtH1/hCcOrW6pF6YKm2yjZrCCnG8JeZLE=;
        b=EWtnrAOSOrGyP6XWMTNll465raRWQB4gWjWmj/9t1sPRk4QxHQ4UnOw1vqsU4hfcgW
         33jkfOsbK3ayq7RMshS3WXBbJw7Cohe8IJZDv4uPmHgwYtHHUfVfKYIkOiZWraLQ/VXQ
         EvbKr+8uy1iXahIbQCjGJa2lLES95YK5dgiiKFgQQScfyADDb2m8lIum0ovRkfJWFVil
         hge8kj0bHpeN7qKm4tda3dRTlQB6aubcJHRSOmhl9rsp56tBM57ZxcKqz/7T00xONUiS
         hHbSjuc+0LMUWq7zgTs6CP527LlvxI3RFlDp6wtPyvI1UqY0kFJ1af9vV5i6vqtk6WIX
         BH6A==
X-Gm-Message-State: ANoB5pmP+aL9O+Y7xQWpYoAUqrRw9tEO3Looxy+MxYniGLM9zQ5zLxhQ
	KNAsaqhW/l/0BIxrTaBcP1I=
X-Google-Smtp-Source: AA0mqf5w9S5gt2nyROsIJ/KepCdghxD2S5KWJ22n53ipvP7a98YVBzA2u2fA7xIwo0AsFvdt9OTByA==
X-Received: by 2002:a05:600c:3590:b0:3d0:1489:78c4 with SMTP id p16-20020a05600c359000b003d0148978c4mr47437513wmq.167.1670178749708;
        Sun, 04 Dec 2022 10:32:29 -0800 (PST)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id i2-20020adff302000000b002421a8f4fa6sm12120806wro.92.2022.12.04.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:32:29 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ban Tao <fengzheng923@gmail.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Lucas Tanure <tanureal@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Fabio Estevam <festevam@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.om>, Lars-Peter Clausen <lars@metafoo.de>, 
	Bogdan Togorean <bogdan.togorean@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Maxime Ripard <mripard@kernel.org>, 
	Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>, - <patches@opensource.cirrus.com>, 
	Jayesh Choudhary <j-choudhary@ti.com>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Jee Heng <jee.heng.sia@intel.com>, 
	Lubomir Rintel <lkundrak@v3.sk>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
	Rohit kumar <rohitkr@codeaurora.org>, Derek Fang <derek.fang@realtek.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	Jose Abreu <joabreu@synopsys.com>, Andrew Davis <afd@ti.com>, Shi Fu <shifu0704@thundersoft.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Matt Flax <flatmax@flatmax.com>, 
	Ricard Wanderlof <ricardw@axis.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: Reference common DAI properties
Date: Sun, 04 Dec 2022 19:32:26 +0100
Message-ID: <13951589.OODuZ4BQiV@archbook>
In-Reply-To: <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org> <2251607.XGVbBG2WQu@archbook> <7c258f71-23d0-36bd-8abf-b227d2522267@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_103231_651668_99F1659C 
X-CRM114-Status: GOOD (  18.53  )
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

On Sonntag, 4. Dezember 2022 17:47:05 CET Krzysztof Kozlowski wrote:
> On 04/12/2022 17:09, Nicolas Frattaroli wrote:
> > On Samstag, 3. Dezember 2022 17:04:41 CET Krzysztof Kozlowski wrote:
> >> Reference in all sound components which have '#sound-dai-cells' the
> >> dai-common.yaml schema, which allows to use 'sound-name-prefix'
> >> property.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> This is an output of discussion here:
> >> https://lore.kernel.org/all/Y255C+TGNVJ9fs8A@sirena.org.uk/
> >>
> >> This patch supersedes previous WSA883x one.
> >> ---
> > 
> > Hello,
> > 
> > for rockchip,i2s-tdm, we get some (new?) warnings with W=1:
> > 
> >     /home/fratti/Projekte/linux/arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
> >             From schema: /home/fratti/Projekte/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
> 
> I did not touch reset names, so are you sure these are not old warnings?
> 
> 
> Best regards,
> Krzysztof
> 
> 

You are correct, these aren't new, I thought they were due to it now
actually checking reset-names or something. However, checking with
linux-next/master shows that these were already there. Apologies for
the noise.

For rockchip,i2s-tdm:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Acked-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Kind regards,
Nicolas Frattaroli



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
