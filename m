Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD6C636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EvhwFz2p1U1Tb/S+wiM2ynqg7wa7otI06PEJazRs9Y=; b=LdGWGZiWu/G81g
	K+WsqIp8PNOx7SuLrRqL8i8DBiRcBcix7EwYlddm8rU1/CYUlNcngriziObQeQqHJqa9ewvfsbT56
	8zyWlQlbHdZsLTH6E2jRXmx95Yte91NJxlFM+KUjP3JpXU4gXBSNfw0uAxC5D47ry8JwJhUGXOUbL
	msOyTjNvdUa1dv9M6Uqho/aBvtJ4XWp3wmzb0SW5zM7HXwK9Hh6vR9Cjg4sVW+VEhLWvoluTdbr+Q
	IH2gl37c9dEWwr/foGivdUUaN03GeykB1wuZnuk4MquKD+hGhrMMZe/dSh/a0ybjZmxdG7TAdGVRx
	YlGlNcTH4vbiAkCW2eZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOMx-00CMKw-0e; Tue, 07 Feb 2023 13:50:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOMt-00CMIX-PL
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 13:50:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5712261407
	for <linux-amlogic@lists.infradead.org>; Tue,  7 Feb 2023 13:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D29C433A0
	for <linux-amlogic@lists.infradead.org>; Tue,  7 Feb 2023 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675777830;
	bh=DMSQcB2gRBiYrCLNnIJNq5P5lvWtVkLpSH0UjyUj4+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X3rJisH4D9N4h5LfmaiMiCPlCAXxUJhpyx9ew/Qn4HmiBs6tdOUxfBIzfz0Il9GJJ
	 1VPzI5KWWmjwHjSFgiaRzN+g3npE+qNoFO0ws6s69xFX2zJ2DvsnSUX5W2hgVnmA+f
	 q2caFLVBY4pxxrvmAniqU2DWA8NuV8AMfHPjP5oDCnpllUL7nJ82oCpvm4beCQ5tS2
	 wswnZswe2QOC6sNtMrUq+EDhlHdOtd1ouUVKCjDSV9Qlqwzmv4805Jt9HVu4XEpjIu
	 k3ZANYH4/7Dcvoq20Cp8nnKYgsSJ+Vr+iEalXRugEJNv+2IAy8STA/HR0tno/PAshc
	 fxjvzA/xhEn6w==
Received: by mail-vs1-f50.google.com with SMTP id g8so1043496vso.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 05:50:30 -0800 (PST)
X-Gm-Message-State: AO0yUKX/IRE6UNGxlvFspA9cyiK/6cvdQvIq3IlKjtgjnPAWnCZ/Ro7Q
	dVf0wsiwXsv1RTN8Ky84471Igz21YhwZDu92Fg==
X-Google-Smtp-Source: AK7set9Mqs4Sx0a58l7EyhlbieUTrJF9RKPUKmeczwiTxCkbvS2g0I4TZU3iyOJf9Ok5Nh88ak3V1dtUt64keTdUzkc=
X-Received: by 2002:a67:7206:0:b0:3ea:c8c:48a5 with SMTP id
 n6-20020a677206000000b003ea0c8c48a5mr659074vsc.53.1675777829362; Tue, 07 Feb
 2023 05:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20230206153449.596326-1-jbrunet@baylibre.com> <20230206153449.596326-3-jbrunet@baylibre.com>
 <167571334291.1212116.1869881432057405431.robh@kernel.org> <1j7cwt3jm1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7cwt3jm1.fsf@starbuckisacylon.baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Feb 2023 07:50:17 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+OMYwJ3_bjhOgGq--SAotqAW7fnzQfEOnHR+_cxSW1RA@mail.gmail.com>
Message-ID: <CAL_Jsq+OMYwJ3_bjhOgGq--SAotqAW7fnzQfEOnHR+_cxSW1RA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_055043_916382_7FC455B0 
X-CRM114-Status: GOOD (  17.87  )
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

On Tue, Feb 7, 2023 at 3:33 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 06 Feb 2023 at 13:59, Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, 06 Feb 2023 16:34:44 +0100, Jerome Brunet wrote:
> >> Convert the DT binding documentation for the Amlogic tdm formatters to
> >> schema.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
> >>  .../sound/amlogic,axg-tdm-formatters.yaml     | 88 +++++++++++++++++++
> >>  2 files changed, 88 insertions(+), 36 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> >>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > ./Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml:
> > Unable to find schema file matching $id:
> > http://devicetree.org/schemas/sound/component-common.yaml
>
> This is a false error because the bot does not have the patch applied
> by Mark from v1 here [0]
>
> [0]: https://lore.kernel.org/all/167543616131.928818.17902040818579023398.b4-ty@kernel.org/

State that in this patch and the bot's advanced AI capabilities will
not send the report.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
