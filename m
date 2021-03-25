Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF77C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 17:38:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32D861A2A
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 17:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32D861A2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U9uFsiPqKKgNXNgJQ5G3FX6/uCO1Qos0dytEV9haW4I=; b=YjY3NR/bUWp5G/gMVRZFPyNHK
	Azb6aNk7/4PyADXsaJ72Kkg3s3EDZtB/xcmoRBgBqv2CKrbvcS1wb9qBso+smcUoC6Ueia/1SID7c
	m/oyh056bJXaZeWJkpGCsI3vdHn1ed2s1/umMa1gh+/uG4zVIq/7nFMPAq6v1Cb/PUN+2uzLyvMyE
	fcDxm2Ar4/2ISnBf9+5RPCvG6+/TtOXta8Df3rPH/1yx+0MTDSJ7qGaj2EnMRab677zDQgFHFaUZI
	GgLPSxau17kLbnPaqyHA6qwUM6ZFomLYv3fipawpj1SGgAsNpGjriRA+0eogbLqToHkrrClItPK6S
	PjVlUpxBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPTw7-001vBH-Ci; Thu, 25 Mar 2021 17:38:23 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPTvu-001v7D-0N; Thu, 25 Mar 2021 17:38:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id y6so3392654eds.1;
 Thu, 25 Mar 2021 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9q63tYJ03BknGivZ05XneXQJyIBDXfgHPnv+sgu2h0=;
 b=t7jvWs6wjvTatSQlhTTEZV62S1SFXf2SkvhIVFBxlYebdjNAjxJhiMJ/U4CdFICFe/
 jGqfU0+yfJPuT4zI0V/mgDcZWzi0KofGkQ74ESAwu6t7H0bXg7VJcbOZ0Wizgt/E7zuF
 FUfgV+JhYwjPukLw8VUP+zpbmFIvDBDXcjmS/SG4QI9zPMdxCL96gDeP1fpi03KXvrsd
 Y+PU6HkFYbtCs6o6/+uJxyZBKevTHNB9qa6gnGCwZz03y1CXW892IqvI+8ZBnzrHaf1I
 UfLJR/ySXIGj2qaC1ST1ugp8Pwyu0nYodjhG5LZQCe4ajSIYTkfqVKnAXBnfImXvxnna
 DkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9q63tYJ03BknGivZ05XneXQJyIBDXfgHPnv+sgu2h0=;
 b=jhRIG7WBY+X5AQL+gzeWkPi2RFzdC0bpUxVYBe4hRM4hd7anFSEn3DQiEm1eKL3P/x
 BMLe9UbGwlMj21znG1j7qB/Uuv8g0sxT0xgR/lAEgAWDU1/oF5mOsrRxq93OlRQGiAt4
 rh7p5GaH+LwxWGIl932Pm5b8trGIAnDN/DOA25a0IHvgt5NNRErQM5Q8C/HZdEEvX659
 vWmdawK5kvkLQNH6Zr05MeO7QP2E/BVLzlAFruZZmIMfj/Q5TJFib4tHuw36/V+A9gX5
 iUBlYNJobsyOqRtmIQUQ//pYLaEpJZ8fzLIWJl2Vz+Pm9JKUZBAQ37vTzDi7CAUkx7qg
 8Wdw==
X-Gm-Message-State: AOAM530OkoXfVQEOB5kXkv6A3cwcQ0+gvcTpbOnatMYIDjo3lI4t1Z+e
 mzfrhwMlhoRnoAvIzkZs/uYdEhSntTCgKYoLMAE=
X-Google-Smtp-Source: ABdhPJyJuaXnigXxrj2VNTfYCMQjXdN8sTCW5EW1OJFX24BuQs2VGSkwYTcJ/fG2ACrUlSpEZcUFS6W23kZPN4BKpNY=
X-Received: by 2002:aa7:cf02:: with SMTP id a2mr10325668edy.59.1616693889364; 
 Thu, 25 Mar 2021 10:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <20210325124225.2760-2-linux.amoon@gmail.com>
 <1616691361.069761.1321894.nullmailer@robh.at.kernel.org>
In-Reply-To: <1616691361.069761.1321894.nullmailer@robh.at.kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 25 Mar 2021 23:07:57 +0530
Message-ID: <CANAwSgSx0uBy3FVboTh5yiooerZKc5sH3FvAxD-6KkzTOoAhXQ@mail.gmail.com>
Subject: Re: [PATCHv1 1/6] dt-bindings: net: ethernet-phy: Fix the parsing of
 ethernet-phy compatible string
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "David S . Miller" <davem@davemloft.net>,
 devicetree <devicetree@vger.kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_173810_130215_252053B0 
X-CRM114-Status: GOOD (  21.69  )
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

Hi Rob

On Thu, 25 Mar 2021 at 22:26, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 25 Mar 2021 12:42:20 +0000, Anand Moon wrote:
> > Fix the parsing of check of pattern ethernet-phy-ieee802.3 used
> > by the device tree to initialize the mdio phy.
> >
> > As per the of_mdio below 2 are valid compatible string
> >       "ethernet-phy-ieee802.3-c22"
> >       "ethernet-phy-ieee802.3-c45"
> >
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ethernet-phy.example.dt.yaml: ethernet-phy@0: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['ethernet-phy-id0141.0e90', 'ethernet-phy-ieee802.3-c45'] is too long
>         Additional items are not allowed ('ethernet-phy-ieee802.3-c45' was unexpected)
>         'ethernet-phy-ieee802.3-c22' was expected
>         'ethernet-phy-ieee802.3-c45' was expected
>         'ethernet-phy-id0141.0e90' does not match '^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$'
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/ethernet-phy.yaml
>
> See https://patchwork.ozlabs.org/patch/1458341
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Now I have a better understanding on device tree shema in
Documentation/devicetree/bindings/net/ethernet-phy.yaml
changes it meant to parse *ethernet-phy-id0181.4400* for example
and not ethernet-phy-ieee802.3-c22 and ethernet-phy-ieee802.3-c45.

So please dicard these changes.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
