Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B4BFA3741
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8b2lLTi4BznHzh2noqWaqE52Pk9i1iH/fh7qgG+6fw4=; b=VAV0a3PZp0b0RF
	EavT+tmGyn/tdgcXIRXklmrMhPVGQMKd1JuaN8v1GFUqBNg+NBzc2yCkinAlDYIuyYWhF8BYTmRlF
	+lWZaj6k1kU0yogPhlPnm/QunGvncnm5Yv7++y8ykrB2xfdTwGl+0+lReLiDil/RJvRrFbUqjs4zJ
	Hnwuq5H0jM81nvvuaBojultvyJfiWFLtkY6zedKw6zdE5/a5c80GAJmSJKyTIDV1PIDbzsB842Dkq
	+k84+OqnfoHha3SKXd0KgRF1yJb38oxPXwm7ELVmdczL/cfYABDqEMssxtLsxzoZq82r1yyUKwwBD
	xPRkR3e1fexWQtSIaOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opd8n-00G9F5-UJ; Mon, 31 Oct 2022 22:20:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opd8c-00G99c-8U; Mon, 31 Oct 2022 22:20:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A027614B4;
	Mon, 31 Oct 2022 22:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DFCC43140;
	Mon, 31 Oct 2022 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667254808;
	bh=wT5an7lNQErDM6CTlDnmdsCWbDhlXk0KBFVuzjzBVe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hR5pddhAgWtHCfBpNPi1p9tL8IKyLC6cqBrd/14w5O5aLJJoFT6xQg2LK/mR189Vl
	 QzBkeAY/U0olr89EWMxGuOdeuyMGN/MzWPHfpkDi5TZlL3pxCiC+GPchwIQ2eUi+2n
	 GHJKplps8TF6tL1f4UUDaotuh2/s1ns9hvgBr2tKVOMw3AsoSlVeUSrdhFRjlcYEGW
	 KGAB1OPTcgyyPW/e+xxGdoT8/aDvF1OhsvRjqIvfocX1ODY76Lq7qM9a5ycqLhOuTZ
	 6tu8j3P0aic/Pc+emCvT6PBTwbn0dQCfTz86Jwi0NvibSRTJp0a8etCBfhzNPi5HSz
	 M4mqEIyb9o+Tw==
Received: by mail-lj1-f178.google.com with SMTP id l8so7551436ljh.13;
        Mon, 31 Oct 2022 15:20:08 -0700 (PDT)
X-Gm-Message-State: ACrzQf2q+i9P3XX1mOZxVzvDI4aSbqTGQhL8i+oi7CB/CW93TzK/52Ca
	iArEj7jnKQfE1WIz/asY9RLYyz9awAog6szA9w==
X-Google-Smtp-Source: AMsMyM6KIxI42xsWAtYjOioUEoriYt0qBvh672hZbkcPvXdhDHe0YIoj3PJAOlzyA1IUs0ylKhwlOHkXdMQOa5zrPb8=
X-Received: by 2002:a2e:b16b:0:b0:277:3946:7611 with SMTP id
 a11-20020a2eb16b000000b0027739467611mr6675591ljm.392.1667254806589; Mon, 31
 Oct 2022 15:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221031091918.531607-1-pierre.gondois@arm.com>
 <fac3eae5-687e-9eb0-ddfb-c659d3816d81@linaro.org> <3c54db0a-44fe-ee24-1833-7637e249ec79@arm.com>
 <CAFBinCBi_xT-pgdMSROHyZUfyZZE33S2YXczr9ijE52AfQVYHQ@mail.gmail.com>
In-Reply-To: <CAFBinCBi_xT-pgdMSROHyZUfyZZE33S2YXczr9ijE52AfQVYHQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 31 Oct 2022 17:19:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJMxH9hFo7uXRJ6rFcqhZL0AUhedk7Fq1xMdKcSDe5ciQ@mail.gmail.com>
Message-ID: <CAL_JsqJMxH9hFo7uXRJ6rFcqhZL0AUhedk7Fq1xMdKcSDe5ciQ@mail.gmail.com>
Subject: Re: [PATCH 02/20] arm64: dts: Update cache properties for amlogic
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Pierre Gondois <pierre.gondois@arm.com>, neil.armstrong@linaro.org, 
	linux-kernel@vger.kernel.org, Rob.Herring@arm.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_152010_375597_86DF026C 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Oct 31, 2022 at 4:09 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Pierre,
>
> On Mon, Oct 31, 2022 at 2:33 PM Pierre Gondois <pierre.gondois@arm.com> wrote:
> [...]
> > To avoid cc-ing people to DTs they are not related, the get_maintainers.pl
> > script was run on each patch individually. The cover-letter is at:
> > https://lore.kernel.org/all/20221031091848.530938-1-pierre.gondois@arm.com/
> I think Neil's question is the same as mine: is there a dt-bindings
> (yaml schema) change for this as well? The idea is to alert people (or
> let bots alert people) in future when adding a cache to a .dts{,i}
> where the cache-level property is missing.

There's not one, but it's something to look at adding. I'm not sure
how we'd check for missing 'unified-cache' which is a common problem.
The challenge here is a lot of what needs to be checked is based on
the overall structure. This probably is better checked in dtc which is
better suited to do cross node checks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
