Return-Path: <SRS0=8QoF=PM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EAAC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Oct 2021 14:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B9060F9C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Oct 2021 14:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22B9060F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ck7J1NKVVAOgZ+ex/ev4z6sShF+TSb8fcbsUVWmZsac=; b=mOZfmG2r3qhqD+
	GxxRQ8Dm60CU9qbLRV43PMtk2SgHrX9eXtp75xB7A7yrWPPIuJf+qVlWAjL/IcLn3gZ4IuHuJ9afN
	4+5mU7R+mYvTDt0YAP7iQ3IgSH66S3kzboPUMMKQK2eUtTeGNInTUEAXtLYXPCmoHB68l3fSBlBqD
	9R/fARiSylEhZBOdTDxWOuEPGbUykkUZZqKfJPA4T+6DuttcqXrZuzV0930e4YWofrPa792Cza/r5
	dhcip3EwM4hgpzr5a8lUvgR6EAdlwgxPL8T5Dg4K0KfU/4OsDecfi1PM/I4M8zJzwjM+EyTulYNgP
	OkBt23SQXhGkiJ6KAVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meeTG-00E6bA-By; Sun, 24 Oct 2021 14:27:34 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meeTD-00E6aH-Bo; Sun, 24 Oct 2021 14:27:32 +0000
Received: by mail-oi1-f172.google.com with SMTP id o204so11901431oih.13;
 Sun, 24 Oct 2021 07:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=bac1EHQkBLbZ51/7v+VmRY1SXZprPbhYfUmFnr47AYA=;
 b=MsERPZ/qvMCx0w3xHKStjY8+uAAtxis7ChIhWyFf4UC1Q40F31CjCphCXlnQdSPgRZ
 xx97tmqxiO0cIjGjmj4ZxObNmxUwnEzQ+ASCVmUKS8WhIi6yhbUBZZqwzyiHvYsSmtbK
 /+a8SJhy/hiM70pwXFrxpNcUC668YFR/egk+TWtL/TUnhkFdQ3bs48yvrH4DKWjjPEm1
 PTHMHRJJOjf9BiGntyzdCdxOkTRnHVesD+JRysEtfFSZ7E07SSrvU/Sp22NpGbrQZQSe
 bG+LIKrzAoaVy/zibyETVhBNMo5WgyRCy9xf15ZukeGvRLEF6Mje/b3R5ObF1CsKE58r
 m25A==
X-Gm-Message-State: AOAM533RzouzifI1HuwmfF8GaKoM3GiOQn6CIiR01/swl3FPeetI7XNr
 12uE0PpFQP6qHWK2oAWg/iaS6dVd9Q==
X-Google-Smtp-Source: ABdhPJxYwzxyZCJKOPBY4JfmuFSFDzmeL5qYzRCwPxWHNonbQ5oo5VIUj+rpOFZQ7OPfF3t4+vLmKw==
X-Received: by 2002:a05:6808:d49:: with SMTP id
 w9mr8037183oik.61.1635085649754; 
 Sun, 24 Oct 2021 07:27:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l10sm2919143otj.9.2021.10.24.07.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 07:27:29 -0700 (PDT)
Received: (nullmailer pid 2015036 invoked by uid 1000);
 Sun, 24 Oct 2021 14:27:27 -0000
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20211023214856.30097-1-alexander.stein@mailbox.org>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
Subject: Re: [PATCH 1/4] dt-bindings: sound: amlogic: t9015: Add missing
 AVDD-supply property
Date: Sun, 24 Oct 2021 09:27:27 -0500
Message-Id: <1635085647.937250.2015034.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_072731_432348_574C0FF6 
X-CRM114-Status: GOOD (  14.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 23 Oct 2021 23:48:53 +0200, Alexander Stein wrote:
> Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
> do not match any of the regexes: 'pinctrl-[0-9]+'"
> 
> Fixes: 5c36abcd2621 ("ASoC: meson: add t9015 internal codec binding documentation")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> I am aware that adding required properties to bindings is frowned upon. But in
> this case it seems acceptable for the following reasons:
> * AVDD-supply was used from the very first driver commit
> * All DT (g12 and gxl) using t9015 controller provide AVDD-supply
>   already
> But I'm ok to not add it to required properties as well. The driver uses
> it nevertheless though.
> 
>  Documentation/devicetree/bindings/sound/amlogic,t9015.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/amlogic,t9015.example.dt.yaml: audio-controller@32000: 'AVDD-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545246

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
