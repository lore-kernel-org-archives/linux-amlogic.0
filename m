Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2DCC001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TkDbtpbPb1z49fZtB3w5msdg1MlCLRaaiefs53j26M=; b=X3R/MLAIz7283m
	8lZqInWhXh0PDhvWqkmRls//dKAgspl5Ofha3x9pGWKlZAXQuIbY64v49Bn688Bwe0n3wO+md9cmV
	C9SHxk/IW/r4ouOECkhh1AhCl6R4BSwpzvo6gT9eCqldaBUf7NqFUjO/TMdykcBfRIQxwNXei0B2I
	7PREkNhrmzWXofsxDPKgSiyG547f2EJd6u0NOF0paX45+p+Vtel8gIqVSyLKCtgwQAK0SaVELvU7E
	amVfQW0iJX4rOZSN9OLt3giE8OMQElyfe/Yhh0CfxxOUQpTyZcsRaLLO0mqXyeqpAzCGH/mIHfidR
	re1Hz6IUZT97Yk+6VtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOHT-002nIt-2Y;
	Tue, 08 Aug 2023 15:05:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOHS-002nHc-0F
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 15:05:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-317b31203c7so5057257f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Aug 2023 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691507150; x=1692111950;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=WYDOE0uAfuvMMd7frP4lQPvrrdCPX7CA5G+ozoaawe4=;
        b=yyfwrDmTHt47xQ1VIHTS2evUkJCD0CwodHL2gOERWuAFSTvIiGLsPTRPOfzzlOOzKs
         jdNOrhurdPEeEGbrmpVSNiIbKgrsUYN3dBg67kGPv4AqqZUtT5l2hp05uFWHymXb9DcT
         5dwmxjwt+n+JXOIjHqPtkfafl+5jJZt5VO+getBbe2tw1tkovtMPbpjkWRFTrU0pYabQ
         AOzG5j7DYlE2ui3EGAlDAZXomFQ6ptxPBWjzcyllfH6ql2E8CTIHK2N2xu4tZz1loSwT
         l9d+hyxTRRax/FYPUz/qpZ/dmtvXXKZEB2/Yl8q6fin2bEVr87cA4X4gt1hrO1XasBcY
         CxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691507150; x=1692111950;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYDOE0uAfuvMMd7frP4lQPvrrdCPX7CA5G+ozoaawe4=;
        b=lypLYR46v0FGZKOU6eoDdTpfmqci92wKewGanS9mcWVlFETbif1pAdeDe9MGHrsDRl
         ufOn43zjtDJA9UuBB9568mLsADEBAQxMTV2oSWhL4Ii1n7p0SRPjFiqcdCbmwZlwyCLr
         JFUlhn2ZaOmMXBLwQpYSGWYwWCgSbxHVBGN6VREa3l7KXNsuTRseuZddFO2AbnKAU2w7
         hYWfLtWdLxJQE6xkF274K+7UTjG7ii8u2GGhKeHO44zdH2EoO+ntC8TIgxg4tadfUd5a
         Ui4R6P+AI01kpMV3EtGIImB2y7cIHcLLBu4oIGhcRY0K0owouUA+bWgOuEqbDtPmLVnu
         ZR1g==
X-Gm-Message-State: AOJu0YwBl7bL72cxBdPkhKW5G12vr/b4+ZdbImprTmFcMTaPK7wOn2r1
	leJDfB+BMGLUBA/wAvkb/qnZ3w==
X-Google-Smtp-Source: AGHT+IF/sVg/Jhlijx/RE5QOgQaMgGYHCPyQMz8dSgQ4an0cId67kpg37dk0nwOSpbyiFJyhIGgAng==
X-Received: by 2002:adf:fa4a:0:b0:315:9de4:92f0 with SMTP id y10-20020adffa4a000000b003159de492f0mr8496109wrr.5.1691507150251;
        Tue, 08 Aug 2023 08:05:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:efd4:f3df:2c50:1776])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b003144b50034esm13863035wrs.110.2023.08.08.08.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 08:05:42 -0700 (PDT)
References: <20230706-b4-amlogic-bindings-convert-take2-v3-0-f63de6f12dcc@linaro.org>
 <9adbbde6-a12c-2857-3103-1c012eed6f27@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/3] dt-bindings: second batch of dt-schema
 conversions for Amlogic Meson bindings
Date: Tue, 08 Aug 2023 17:05:12 +0200
In-reply-to: <9adbbde6-a12c-2857-3103-1c012eed6f27@linaro.org>
Message-ID: <1jleelo9q4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_080554_114491_DAA1F7CD 
X-CRM114-Status: GOOD (  14.54  )
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


On Fri 04 Aug 2023 at 15:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi Jerome,
>
> On 06/07/2023 16:52, Neil Armstrong wrote:
>> Batch conversion of the following bindings:
>> - amlogic,gxbb-clkc.txt
>> - amlogic,gxbb-aoclkc.txt
>> 
>
> <snip>
>
>> ---
>> Neil Armstrong (3):
>>        dt-bindings: clock: amlogic: convert amlogic,gxbb-clkc.txt to dt-schema
>>        dt-bindings: clock: amlogic: convert amlogic,gxbb-aoclkc.txt to dt-schema
>
> Do you plan to take patches 1 & 2 ?
>
> If you can, it would be simpler if you could take patch 3 in the same batch.
>
> Thanks,
> Neil

Applied all 3 - fixing the checkpatch on patch 2

>
>>        dt-bindings: soc: amlogic: document System Control registers
>>   .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  64 ---------
>>   .../bindings/clock/amlogic,gxbb-aoclkc.yaml        |  85 +++++++++++
>>   .../bindings/clock/amlogic,gxbb-clkc.txt           |  53 -------
>>   .../bindings/clock/amlogic,gxbb-clkc.yaml          |  37 +++++
>>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 160 +++++++++++++++++++++
>>   5 files changed, 282 insertions(+), 117 deletions(-)
>> ---
>> base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
>> change-id: 20230209-b4-amlogic-bindings-convert-take2-e2caf8e1c13f
>> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
