Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D207C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEA060C40
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EEA060C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zf953ks+B1++HzSgNGs8gyLjJvP9/KupPwDhtP0ZLM8=; b=cqG8YaqlFqcaW0
	I3jRHELoAiZZk8xF/1c5cVXOdtaFXdz1jnIUhC6DSRaaZQ0YqYgzG2WQFxe0z5UcL4mQYm38zOY4Z
	ix/KFcVLlVWCPZpGg24e3G+RqMYm2Z96uJ34Bsze6oHpun6mrsAU/cLn77bFLVAl5jXMz94TNB1kl
	YdvLfv80/ID/I2HOjurxBEM2mi5n/NkZPNbLt1GmgheqoXb/pFDsDEfSrfV92pbcgl0r+Ii6GoJD1
	VistqPHhKul1+ONfczgmOzYKoX8mc/Xp65SDpo4bop9E/T4b+z9ksxF8T4izXOHVoT8w3HI2hZtJE
	ZyJTf6p7GEWJuw8aaRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfPLg-002Ubr-OC; Tue, 26 Oct 2021 16:30:52 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfPLd-002UbE-Ss; Tue, 26 Oct 2021 16:30:51 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Hdy451hnszQk95;
 Tue, 26 Oct 2021 18:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1635265841; bh=XLMMqsRpEv
 3FYKXiVSWZySKrY2ef63BszlImvJV17No=; b=NHYzMwx0sjVvYUaAaDZgjm6jzN
 HLZFySZmyobBs5DtvP+z3JWKCwbNtVTezncGajoEZtd8itB1lrX+3Zqyb18YmpAU
 NOWlQRpMTnPC9CbkB+ufUySovXTdB2c8A9MVwfdywELacQj13hfqJL5edU4L02U6
 md2XUx5WnDSjfj430jErkw5Z9YJXxmjOP74jwU8u9S0d18vl1ft0qo/a8liubMSi
 /P2NslMuBP24qF6QTd0dlSTCKw8rUfdCtBYzgq9LWyfIBFIo2T/uTF6Vs50/wqhW
 JTehmhdNTOhTRrye/cLz3nR40Jw1XKpRFYuW2IrLxPBdHPkeK6IG7Q6p6rjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635265843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3fWN9WaL/uoU5d1zljCLjiWKAeBvCe7TpPDdsJj9wo=;
 b=pnnqsBGt8VDhrHtdDDLjso8bfsfKP9ZErmOubLpMNBPI2eNIYOAWJ8Nb0mSegkhV1EBlMm
 8LA0//TEuUhdn2elDi6xO+02X5WMJ9/eJzNkFaUitP1Z71bbWjHH6HDFghMtjh6GyqgQuS
 iUCLiTCh8Gn0mYgXcrE5e5dIndqcOPGs/QdOwe5pDSGQ7iS74MLfyEJxa3z+icTfn0a2gV
 E+UfnbZsjYTVPmjK4eGpUkby71irluLD9RjZm4I7qYF823Q2u2sWNi3N7ZX9q/H2sAdJv+
 tBVZJwA/NGqNON5dI0ZsH9vkdfXcPXRbMM6+lH333ZYwMymVhRjGggJW3jU+jA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: sound: amlogic: t9015: Add missing
 AVDD-supply property
Date: Tue, 26 Oct 2021 18:30:38 +0200
Message-ID: <2215645.ElGaqSPkdT@natsu>
In-Reply-To: <1jilxl5ang.fsf@starbuckisacylon.baylibre.com>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
 <1jilxl5ang.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 34B181313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_093050_121938_7EFCD29C 
X-CRM114-Status: GOOD (  22.72  )
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

Hello Jerome,

Am Montag, 25. Oktober 2021, 17:53:04 CEST schrieb Jerome Brunet:
> On Sat 23 Oct 2021 at 23:48, Alexander Stein <alexander.stein@mailbox.org> 
wrote:
> > Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
> > do not match any of the regexes: 'pinctrl-[0-9]+'"
> > 
> > Fixes: 5c36abcd2621 ("ASoC: meson: add t9015 internal codec binding
> > documentation") Signed-off-by: Alexander Stein
> > <alexander.stein@mailbox.org>
> 
> Hey Alexander,
> 
> First, thanks for picking this up.
> 
> I think Rob's automated reply is because you forgot to update the
> example (if the property is required, it should be there)

Thanks for pointing that out, I noticed too that examples are validated as 
well, nice feature.

> Also, I believe this change could have been sent separately, to Marc
> (instead of Cc) and with the "ASoC" prefix.
> 
> With this changed
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Yeah, I'll split the set during v2. Thanks for the review.

Best regards,
Alexander

> 
> > ---
> > I am aware that adding required properties to bindings is frowned upon.
> > But in this case it seems acceptable for the following reasons:
> > * AVDD-supply was used from the very first driver commit
> > * All DT (g12 and gxl) using t9015 controller provide AVDD-supply
> > 
> >   already
> > 
> > But I'm ok to not add it to required properties as well. The driver uses
> > it nevertheless though.
> > 
> >  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> > b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml index
> > c7613ea728d4..5f4e25ab5af6 100644
> > --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> > +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> > 
> > @@ -34,6 +34,10 @@ properties:
> >    resets:
> >      maxItems: 1
> > 
> > +  AVDD-supply:
> > +    description:
> > +      Analogue power supply.
> > +
> > 
> >  required:
> >    - "#sound-dai-cells"
> >    - compatible
> > 
> > @@ -41,6 +45,7 @@ required:
> >    - clocks
> >    - clock-names
> >    - resets
> > 
> > +  - AVDD-supply
> > 
> >  additionalProperties: false





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
