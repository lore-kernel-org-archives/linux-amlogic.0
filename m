Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213C8C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 16:57:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78CE2467B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 16:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKt3W0Fy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IhXA9nbg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78CE2467B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nlerol5VT/avdd1t7qEakHTPQIkvZoeX2PTPqOv9cdQ=; b=cKt3W0FyUm/v8mL80RqYF0dtRf
	pHaNzh/MURaBDd1s36ztel1wz5N15VZeMsArS1XvYMohGofOk+wfgcIlzLkNNtZp+03x9fPccV9On
	nb5OSB/VTspb2U8xxzQW9Hzfn7OMoVmPBL6RwvVAWhAey/MN7LLe/18+6YXwsAtfB7BbjH6/er0uk
	vD/meoWHA6YwuGBXbpl6c2ojm44jjWMREVQQCcFj2MLLOiVK/XDBddfbnBAbiONb3zpPnc594ZZN2
	siQQrVkOlW9y/vJnFMc4gm5x07daXSQtb0Rw3uHd4DF3scVViq9I/GMn5vymw29n0nSX3gkqrYUBt
	TM/Qk29g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7iwx-0005ld-MT; Fri, 28 Feb 2020 16:57:19 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7iwu-0005ks-6q
 for linux-amlogic@lists.infradead.org; Fri, 28 Feb 2020 16:57:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id f15so3902089wml.3
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2020 08:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=A+A25OPbN7c0Hb+kDxkLLF4o6kk9ftbHcHDjaa9bDHg=;
 b=IhXA9nbgy+q/POpe9udr4TB+ykkDxlX+HTpnb3PggnZ+4YLOovZZoyTtRYlSTpitqC
 /C5iuvnFnvdUUDhTsQYAXzs92WlPtEAJzPXRb+xNWq5QzJIdUkQJBHbUXi8m9RJV3xSj
 y2A3xkboJgJCjSN2ztwh8iB46KpzfEuToyRom2WnTCA3REa1S3R7pUdPB7d8hU20crnb
 hI4UiDmacgpsYcfEGME/3ZoS/Lv+dqZdk5hngbZ34A4rmo0OnXi0pasxyj/KAhYenPOe
 sqj+AsXgDMGWvbsac53SEtIgKhzYMUNxKBgeIrihYFMqVH73AOPiBkrmCIcISy8odjud
 BxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=A+A25OPbN7c0Hb+kDxkLLF4o6kk9ftbHcHDjaa9bDHg=;
 b=EX4TYLJaDFhCMxYDcrHWG9z30p2aCCZReAGIjMfyGo2J0G4jFp9mjizzrehh9HIV4K
 IoewTX4+efIRIEK7cbjyBFbp6FlCRHjWYSMMEUgXxX+SvtMeZniUhBz7IYkE62/G4t6S
 A+a9xwur2S0U182hV/lhSvyzFwskyUDBj8gB2jguEh3G+O2rsIbNKT5fkgmyl/lZ3STb
 YH39XtHkD6CrQiCmoU+KuEEc73iVgcDMcDqQ13/zn9YiPNLpDI4R5CrUCwLmQeUL4ZKa
 4AuTGhsClGnjZcoKBjF+Pd4cczBGjSeKpGyoryNiMDTqRLWyVbyqqP5mfbG3uji0+2ho
 OhUQ==
X-Gm-Message-State: APjAAAWjDNAzchYDYkw5lideK68/m0C2NbJQdslLoEzbmth3i0UEUhoC
 x4gJjQcKAPHJCvvK5uVRLPPUlQ==
X-Google-Smtp-Source: APXvYqy1Ur/W3S+TgCWd2fsapozAnq2RpmkzdXDsfH9HZXa0i2WSU1Rbd1rhaCVIj7olyI1mBNqiaQ==
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr5990087wmf.56.1582909033626; 
 Fri, 28 Feb 2020 08:57:13 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n2sm13817320wro.96.2020.02.28.08.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:57:12 -0800 (PST)
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-3-jbrunet@baylibre.com> <20200228155017.GA24730@bogus>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/9] ASoC: meson: convert axg tdm interface to schema
In-reply-to: <20200228155017.GA24730@bogus>
Date: Fri, 28 Feb 2020 17:57:12 +0100
Message-ID: <1jpndyejkn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_085716_391376_744A9F76 
X-CRM114-Status: GOOD (  13.43  )
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


On Fri 28 Feb 2020 at 16:50, Rob Herring <robh@kernel.org> wrote:

> On Mon, Feb 24, 2020 at 03:58:14PM +0100, Jerome Brunet wrote:
>> Convert the DT binding documentation for the Amlogic tdm interface to
>> schema.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  .../bindings/sound/amlogic,axg-tdm-iface.txt  | 22 -------
>>  .../bindings/sound/amlogic,axg-tdm-iface.yaml | 57 +++++++++++++++++++
>>  2 files changed, 57 insertions(+), 22 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>> deleted file mode 100644
>> index cabfb26a5f22..000000000000
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -* Amlogic Audio TDM Interfaces
>> -
>> -Required properties:
>> -- compatible: 'amlogic,axg-tdm-iface'
>> -- clocks: list of clock phandle, one for each entry clock-names.
>> -- clock-names: should contain the following:
>> -  * "sclk" : bit clock.
>> -  * "lrclk": sample clock
>> -  * "mclk" : master clock
>> -	     -> optional if the interface is in clock slave mode.
>> -- #sound-dai-cells: must be 0.
>> -
>> -Example of TDM_A on the A113 SoC:
>> -
>> -tdmif_a: audio-controller@0 {
>> -	compatible = "amlogic,axg-tdm-iface";
>> -	#sound-dai-cells = <0>;
>> -	clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
>> -		 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>> -		 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
>> -	clock-names = "mclk", "sclk", "lrclk";
>> -};
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
>> new file mode 100644
>> index 000000000000..5f04f9cf30a0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Audio TDM Interfaces
>> +
>> +maintainers:
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^audio-controller-.*"
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  compatible:
>> +    items:
>> +      - const: 'amlogic,axg-tdm-iface'
>> +
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 3
>> +    items:
>> +      - description: Bit clock
>> +      - description: Sample clock
>> +      - description: Master clock #optional
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 3
>> +    items:
>> +      - const: sclk
>> +      - const: lrclk
>> +      - const: mclk
>> +
>> +required:
>> +  - "#sound-dai-cells"
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>
> Add an:
>
> additionalProperties: false

I did not put that on purpose.
Most of the amlogic devices use an generic ASoC property called
"sound-name-prefix"

You may see examples of that in
arch/arm64/boot/dts/amlogic/meson-axg.dtsi.

That property is not expressed in json schema yet, and I don't
really know what is the best way to add that.

Adding 'additionalProperties: false' right now would generate a fair
amount of warning with 'make dtbs_check'

>
> With that,
>
> Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
