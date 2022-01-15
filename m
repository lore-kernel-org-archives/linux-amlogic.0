Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C62C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+gsByHLGaztaMvW4khNBn0aaJYiYhYga7aLyd0LKYI=; b=SFdkHdRuB1OnXV
	5mvkzbq9fnQezwxB0707KmrqJRLTg3ZN9dKqfXvO1Ndukx1cr2iF6WXJNzEwIfUPI7rt7CNba7eUX
	TObaMry4MBgI7zncntBR9agTPklhbywlDPJY63xHjGKDADE8UewHotiCpPnYW/fKs9Yqq1SK+vKh1
	hEeNjC7nlUWI5SIxzsrSvIP9i92GuC3f61ncVMcpsp8Je0K2nx9Cfnu1qc8qd74IKeW+ZFTuC0yXL
	Pg74PmFewbt9q1Go4a+5KjBuJ3MWK36WrGSJFOe7hwpahIl8p/iCTSCiuuXgJbp0+AEDD1u31n9+X
	UObWGSqwt2q0nYDRi19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlM-00BOqd-Sw; Sat, 15 Jan 2022 17:22:48 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlI-00BOoN-SG
 for linux-amlogic@lists.infradead.org; Sat, 15 Jan 2022 17:22:46 +0000
Received: by mail-oi1-f181.google.com with SMTP id y14so17049605oia.9
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 09:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=REkuop0CJkdbISl7sJMJiL6LSDlpLTosULc9yknn5L0=;
 b=K+L26I/JWUWokg6WFI5bnvkn6fYshOcEgPmM4SqZeqsLMQqIVs+QrFCto8evixjkt1
 SCjuUalrhheZKqxnGT9V3ydXew4NakqmmcRSVKo0sQqGzx3fKoqhXzfYgQSzi8XdHg3/
 ZbCFEfqpj8Wb+doMGJVNWr2NvODKx4dcM6c9GRinQUlfbiS5d8Mgam7BGVDVE28HFqBC
 uIbGgXoxue/dbR+Ul6aiU1U35ACyGli+lDnKvYcO/A8NspbQW5xbhs9DYb9VMSBrq18h
 pGSROoDB87PBTfvrr+gxMo4Zvm7EGojX5u/KYm6YqXGeOkcomSi2d5sbs/pQ4+wTsFbn
 uIDA==
X-Gm-Message-State: AOAM532n4/MtYt9l2Gby0DgAWajvQg0RQrY9KWjxqsmtgV6xxcQgyk33
 ewfLhPJJkiU+Zn/LhTUE4g==
X-Google-Smtp-Source: ABdhPJxF1ouoMEauy6JQkLG/vbGAukQX3d7F3unPgWzYjy7IBQu095z+ToPKgAA8gG8N08EvC7uDkw==
X-Received: by 2002:a05:6808:11c5:: with SMTP id
 p5mr17253604oiv.51.1642267363960; 
 Sat, 15 Jan 2022 09:22:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e69sm3266884ote.1.2022.01.15.09.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:43 -0800 (PST)
Received: (nullmailer pid 119896 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20220115093557.30498-2-alexander.stein@mailbox.org>
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <20220115093557.30498-2-alexander.stein@mailbox.org>
Subject: Re: [PATCH 2/2] ASoC: meson: axg-fifo: convert Amlogic FIFO
 controller to yaml
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.954937.119895.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092244_934601_A3A656E2 
X-CRM114-Status: GOOD (  16.41  )
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

On Sat, 15 Jan 2022 10:35:57 +0100, Alexander Stein wrote:
> Convert Amlogic FIFO controller documentation to yaml format.
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Things to note:
> First of, Jerome, sorry for adding you as maintainer, but
> 1) it's mandatory
> 2) your are the (only) author of amlogic,axg-fifo.txt
> 
> Please add your Signed-off-by if that is okay with you.
> 
> License is mandated by checkpath, not my choice.
> 
> I'm not so sure about the compatible check. Essentially it is either
> * 'amlogic,axg-frddr' OR
> * 'amlogic,g12a-frddr' + 'amlogic,axg-frddr'
>   (or 'sm1' instead of 'g12a')
> 
> Same goes for *-toddr. Is this schema correct in that regard? At least I
> got no warnings on existing device trees.
> 
>  .../bindings/sound/amlogic,axg-fifo.txt       | 34 -------
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1580333


audio-controller@100: 'reset-names' is a required property
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml

audio-controller@140: 'reset-names' is a required property
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml

audio-controller@180: 'reset-names' is a required property
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml

audio-controller@1c0: 'reset-names' is a required property
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml

audio-controller@200: 'reset-names' is a required property
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml

audio-controller@240: 'reset-names' is a required property
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dt.yaml


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
