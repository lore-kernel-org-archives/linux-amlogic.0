Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3635C3F2D2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 15:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1622469F
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 15:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C4+9p387"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1622469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CbnkGHaI3Byy/g29nPdmxi8LkFEcbXVsNZeOFYaX+Q=; b=C4+9p387uwwREI
	wqageV1ASdFmBhVBWEtoJbnkVXc1CqT6UpLy7XYHl6L6u8ype93prnbQv3r9YGVIqIXjjmlYvc3Yw
	f7/Y1nVVRel65137ilCzuXNc2bqU8wyQT/7QimXu4opa0BHQ5hO0Q34gCsx4jZPMC/+5CHb0WK97g
	W0CCxhXkdmWqUWiEXU/AxbbgMDBtEf39BxTI2UEFEfI/g2RgubbnzPtZKkp5mUAmx7Mnul3Z5oXfL
	jji0p9V7s3nM9ClpNQDvXDcpj2q3PO/dwKzpk7av/vYBGWlL5O3xxlldUXlzqw7h4mcmQpymCnoMy
	sJeYSC0hlu2/EakzW2vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7huK-0002at-2L; Fri, 28 Feb 2020 15:50:32 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7huG-0002a7-NK
 for linux-amlogic@lists.infradead.org; Fri, 28 Feb 2020 15:50:30 +0000
Received: by mail-ot1-f67.google.com with SMTP id b3so2993841otp.4
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2020 07:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wojIa6rVa31vXzIE/lHtQ3suG/pesMoWRIYn0QkiXJQ=;
 b=li2yi8neotmjYuoOXvAUw4UG/pE5DeNsfyaCKzKrd8EA+APHbe65riFaKD6K/lVjUO
 jFzNiFCABTf6jQmVVrfmNYSbF/1kQvJLgeG5fY9D0Gse41nukPZGH4RxZwprE8N7/5xk
 Epf819nSthH9JKBQi7+icMaav17qJ98VZ7VzWBNCpkqkl66W1LHJtui/TPf36pAL/B15
 Uv1eyPBhY3gT4EMc5L6IM6h0Y4TLPWsQTYjv8TC6dRGzsP891/SDbYM0HM4GAta+8iIZ
 PqRSVSkRj9bDpiCX0EGsBSf9VgvcgU3JWEcfBTzrGSYRGZJ8ohrdZTqWQFwwc7YKoHXN
 aiZQ==
X-Gm-Message-State: APjAAAWN4ECM0AZg8d59F6sCOWrneqAMyMKd4RiPE5MfBQIcmsOaGn7o
 FDsLhBfxOKT04GWNuxKj2rzmCzg=
X-Google-Smtp-Source: APXvYqwt/R/pC1bGU/7oJf7NOrLG0KKZF7zg8vbj/26gV3Nsi5k0hBqYVdC8MOsZ04YH1PU4R0ebjw==
X-Received: by 2002:a9d:d06:: with SMTP id 6mr3954158oti.176.1582905019525;
 Fri, 28 Feb 2020 07:50:19 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm3271814ote.32.2020.02.28.07.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:50:18 -0800 (PST)
Received: (nullmailer pid 27282 invoked by uid 1000);
 Fri, 28 Feb 2020 15:50:17 -0000
Date: Fri, 28 Feb 2020 09:50:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/9] ASoC: meson: convert axg tdm interface to schema
Message-ID: <20200228155017.GA24730@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-3-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_075028_764900_7375DF79 
X-CRM114-Status: GOOD (  14.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Feb 24, 2020 at 03:58:14PM +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm interface to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
>  .../bindings/sound/amlogic,axg-tdm-iface.yaml | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
> deleted file mode 100644
> index cabfb26a5f22..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* Amlogic Audio TDM Interfaces
> -
> -Required properties:
> -- compatible: 'amlogic,axg-tdm-iface'
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "sclk" : bit clock.
> -  * "lrclk": sample clock
> -  * "mclk" : master clock
> -	     -> optional if the interface is in clock slave mode.
> -- #sound-dai-cells: must be 0.
> -
> -Example of TDM_A on the A113 SoC:
> -
> -tdmif_a: audio-controller@0 {
> -	compatible = "amlogic,axg-tdm-iface";
> -	#sound-dai-cells = <0>;
> -	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
> -		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> -		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
> -	clock-names = "mclk", "sclk", "lrclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> new file mode 100644
> index 000000000000..5f04f9cf30a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio TDM Interfaces
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller-.*"
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    items:
> +      - const: 'amlogic,axg-tdm-iface'
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - description: Bit clock
> +      - description: Sample clock
> +      - description: Master clock #optional
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - const: sclk
> +      - const: lrclk
> +      - const: mclk
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - clocks
> +  - clock-names

Add an:

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
