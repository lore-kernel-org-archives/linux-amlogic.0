Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B150BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5pcJAUVjI+XXjfuMQ6NUjhXKt16LRIzlIOdS2aFYcU=; b=1vdXoUkFbPNxywaQ1vpoDb10ZH
	JP7fAHHFH9vwAuofBoBlFqTuYfcyDMI8Kau94EeyAKOhPgw1wA9cPuprOnJ22EL/f19nWfkw5y4lB
	ph4QHH9Aji6K1fGSLaFX6K8gAsmb1UkQme9fn2Xiu3JN4p4+BOkb2ZUE3bS8oDFahY1sOw9S+Lqx7
	ZkoyGjgbBXfCDPQZJQNDFe69Ead6qL78y08l4EPJAt46aLH5zARoVDMdksADaNnAfqisSnE6yxpGZ
	QWeEecxQYp4GkT7l1zkMzVJPWypLQEMpKshGgKAGg8FfA4jUdiB0GLcCG42gndnFx5HwFen3m22ow
	lxDwuJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMW4D-009s2E-5m; Tue, 22 Feb 2022 14:23:01 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMW41-009ryE-Vc; Tue, 22 Feb 2022 14:22:51 +0000
Received: by mail-oi1-f175.google.com with SMTP id s5so14631793oic.10;
 Tue, 22 Feb 2022 06:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=rD5aOaysoX7AXKi/miKBCGc1jjVI4baaQQsU/wovaeg=;
 b=ptFp21SNTpuIDGc/17zy4mVOan1FBQAXxcPJ4fFV5UPB/eNTeAei1nhySvJWAne5U1
 pxwMdoIlRKOLzKv3qFO40/P2enRyyVmiW4oNE4V1TKmvQspFqqRLV0xxQXIYbCku7cPT
 WqgRHldEuElpidR0Tqyv8VUjJkYeQ6PauCR2qcAESRoTgZRoMoU/nnVqwLasD322HgB7
 sXzn8mFIRGk4+wa8yvyOqLSJjki0jKC7QklIFXV0nIv4bvlEqoQPjGpEkwfyW90jMnp5
 19yreTNI+qQzEAO+R+X/YuqGl30KyUkFCe3k5IX9ho74feLDemcqPGhSBDIDVIEaqwva
 2bkw==
X-Gm-Message-State: AOAM533sb37sFCtFUHvo5Z2SDF784QVsyx16kXhmDOsP7IbuGsIo/7mL
 DwsbCK69l3s3kz261wuFZcl7tILw5A==
X-Google-Smtp-Source: ABdhPJwVon8hc/Aiatn3KQ49ftntGD1o45JbfKv8M5qfLueMW864329WvIdvFp+I4R2VvQVOUJgEtQ==
X-Received: by 2002:aca:2112:0:b0:2d4:653d:82b8 with SMTP id
 18-20020aca2112000000b002d4653d82b8mr1921220oiz.126.1645539768672; 
 Tue, 22 Feb 2022 06:22:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bf13sm7569801oib.32.2022.02.22.06.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:22:47 -0800 (PST)
Received: (nullmailer pid 3016156 invoked by uid 1000);
 Tue, 22 Feb 2022 14:22:43 -0000
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <39d61ddb-4b54-4a13-fbb2-c0f88d9bf017@gmail.com>
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <39d61ddb-4b54-4a13-fbb2-c0f88d9bf017@gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Date: Tue, 22 Feb 2022 08:22:43 -0600
Message-Id: <1645539763.080061.3016155.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_062250_061193_F228BF48 
X-CRM114-Status: GOOD (  13.46  )
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
Content-Type: multipart/mixed; boundary="===============5924480722478547093=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============5924480722478547093==
Content-Type: text/plain

On Mon, 21 Feb 2022 21:23:18 +0100, Heiner Kallweit wrote:
> Add a YAML schema binding for TM1628 auxdisplay
> (7/11-segment LED) controller.
> 
> This patch is partially based on previous RFC work from
> Andreas Färber <afaerber@suse.de>.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - (re-)add Andreas' SoB
> - fix YAML errors reported by Rob
> ---
>  .../bindings/auxdisplay/titanmec,tm1628.yaml  | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.example.dt.yaml: led-controller@0: 'spi-3-wire', 'spi-lsb-first', 'spi-max-frequency' do not match any of the regexes: '^.*@[1-7],([1-9]|1[0-6])$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1595730

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.



--===============5924480722478547093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5924480722478547093==--
