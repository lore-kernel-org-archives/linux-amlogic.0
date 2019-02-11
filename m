Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5AFC282CE
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 14:07:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E1521B1A
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 14:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tAeIGQ9n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QuHAGxx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E1521B1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C8/qw04yHcu0WI+UWUr90jrgv84uFHnH8g3BbxdCkig=; b=tAeIGQ9nC3iLLxPVfoheTWIFkS
	g5ENBmixlRjgdnDjJFkHwoRNmchHU50WyA0Qj2/oHGBGHTqiUzHusjypWGD2EuEpaBYG/v+FLZMZ3
	iYhd7ShyU6BJsHfK1p/F64TPon5lmQFK6sLY7emzKwOeQIPb4YSK+HmsLaTFEdUhOxBTMiOl8WCAE
	6wrlvCEZm4i4JdEc/jWz3Km93nzZVFgtQyMTfKQJ23ws50zxXQiCkMnOaIo1D8LPcSDJp5j8eyn77
	Yzi0t+ezb4G+wS4Kj7hplf14Fw7RcbUt92oWWRBHf0ysnguf7pseDx9KylTwD3IYA5FwRclPoHW8H
	m7JDQMcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtCEo-00084G-On; Mon, 11 Feb 2019 14:07:10 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtCEa-0007tM-0M
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 14:07:02 +0000
Received: by mail-ed1-x542.google.com with SMTP id 10so2744483eds.7
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 06:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=6up0/2CWLW2mHT8pB2BYsiR1F95jgx3Z8tSp/xeu/rY=;
 b=QuHAGxx0C8NpYb7B2IIFj8pXvOVbJUU98LmlerVAlK4SEzDyUf+EzsLKZwZDPHb0j7
 u52euAa/Nl5Azxyzib9EowUim8sdwTS3dHT9Qi35e2+hujzYuCfN45HTaU5cvqCrfShP
 nEA1cc8F2yKoLAolMcHjSJHuuDQlP7nZDqmAFLJg3G0wX6u629jXNaL8pQiGJ93kMo9q
 w+BIOlj3ditkPr+cJEgFP6/+z68UfHcZGoz+hITYVwuCgblRY50qqeIgLeubmAJOZ6ku
 NWDZRdnLdpumiiy3/nGuZ8+jafiQf6rLvwCZCTM4V3/PWL9UF+PvS1iTvL9A7CfgEQot
 Y/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=6up0/2CWLW2mHT8pB2BYsiR1F95jgx3Z8tSp/xeu/rY=;
 b=JB9lhKZR1kn32ZnIYpFytSSwbJTW5g3gx0j3eDIJowWtAtWyqSA+hD0wOx6YGGg9kp
 Nu5rbT/dhIBZI00UZCeeukJyR3YYSaDpvFXwldv5uHztwvf0ig2oQtX0dmaq7ABej47O
 rI3a/75kWZfa6pfV2LIO1+iMjCWiwJb9okR56z/RJt5ZzX9ZH7bHdAdjPlccZDZkH/WO
 +1AmJaYkIpXcRQcoJPeE4aw614Aaq/+GzaScPLNRKvcJKqg6y3ige7xRXPGVHjxgmtw+
 Ds4I94CKLpHtwcOOj4gdlW4+1odz9gFEBKvSwFxdIKPi75ZRJ9gA8dgOAa+rWhfcQVTF
 4IHA==
X-Gm-Message-State: AHQUAua8VERRr8XrgcBQTDTJnEIGdUjTjtawoNDpmW4Vi9K8MgtRTKZX
 yi4bPmn470ZjRgXHM2h95iqMOg==
X-Google-Smtp-Source: AHgI3IYdy6zkKwBeQYluvpgQrFC7/eqeirtldBfC4BSiFgEh4fIN7hyHUbaDgMl8civGo2+qRCRIhA==
X-Received: by 2002:aa7:d487:: with SMTP id b7mr28130054edr.256.1549894013672; 
 Mon, 11 Feb 2019 06:06:53 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:7e84])
 by smtp.gmail.com with ESMTPSA id t12sm856202ejk.37.2019.02.11.06.06.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 06:06:52 -0800 (PST)
References: <1548693481-1162-1-git-send-email-lollivier@baylibre.com>
 <1548693481-1162-3-git-send-email-lollivier@baylibre.com>
 <20190130155016.GA26536@bogus> <20190211092251.GV4686@localhost>
User-agent: mu4e 1.0; emacs 25.3.2
From: Loys Ollivier <lollivier@baylibre.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: gnss: add mediatek binding
In-reply-to: <20190211092251.GV4686@localhost>
Date: Mon, 11 Feb 2019 15:06:50 +0100
Message-ID: <86o97iv2px.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_060656_106352_E480FD1F 
X-CRM114-Status: GOOD (  22.91  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 11 Feb 2019 at 09:22, Johan Hovold <johan@kernel.org> wrote:

> On Wed, Jan 30, 2019 at 09:50:16AM -0600, Rob Herring wrote:
>> On Mon, Jan 28, 2019 at 05:37:59PM +0100, Loys Ollivier wrote:
>> > Add binding for Mediatek-based GNSS receivers.
>> > 
>> > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> > ---
>> > 
>> > v3:
>> > Removed the I2C and SPI interfaces references.
>> > Removed the "mediatek,mt3339" compatible line.
>> > Added the optional propertied (reset, fix)
>> > Added the pin names for the optional properties.
>> > 
>> > v2:
>> > Renamed bindings from Globaltop/gtop to Mediatek/mtk.
>> > Moved current-speed as an optional propertie.
>> > Removed the status line in the example.
>> > Added "mediatek,mt3339" compatible.
>> > 
>> >  .../devicetree/bindings/gnss/mediatek.txt          | 37 ++++++++++++++++++++++
>> >  1 file changed, 37 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
>> > 
>> > diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> > new file mode 100644
>> > index 000000000000..00650d81c5c8
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
>> > @@ -0,0 +1,37 @@
>> > +Mediatek-based GNSS Receiver DT binding
>> > +
>> > +Mediatek chipsets are used in GNSS-receiver modules produced by several
>> > +vendors and can use an UART interface.
>
> s/an/a/
>
ok

>> > +
>> > +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
>> > +properties.
>> > +
>> > +Required properties:
>> > +
>> > +- compatible	: Must be
>> > +
>> > +			"globaltop,pa6h"
>> > +
>> > +- vcc-supply	: Main voltage regulator (pin name: VCC)
>> > +
>> > +Optional properties:
>> > +
>> > +- gtop,reset-gpios	: GPIO used to reset the device
>> > +  			  (pin name: RESET, NRESET)
>> 
>> reset-gpios is the standard name.
>> 
>> > +- gtop,fix-gpios	: GPIO used to determine device position fix state
>> > +			  (pin name: FIX, 3D_FIX)
>
> I'm thinking we might need a standard name for fix-gpios as well. This
> isn't a feature that is globaltop (or mediatek) specific, and other
> manufacturers provide similar functionality through pins named UI_FIX,
> or even LCKIND (lock indicator).
>
> The pin is typically used to drive an indicator LED AFAIU, but the
> characteristics of the signal varies from device to device (fw to fw),
> for example, pulse when no lock and low otherwise, or pulse when a 2d or
> 3d-fix is acquired, etc.
>

Yes most GNSS recevivers provide a similar feature even if behavior of
the line differs.

> I'm not sure how useful the pulsing would be for software, but someone
> might find a use for it in some form.
>

Well it is useful to know when you start acquiring "valid" positionning
data. I'm using this as a trigger to start recording position.

> Rob, is this something we want to keep in the binding, and if so, how
> about using a generic name such as "gnss-fix-gpios"?
>

Name "gnss-fix-gpios" sounds good to me.

Loys

> Johan


-- 
-L

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
