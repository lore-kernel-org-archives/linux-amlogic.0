Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5564C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:21:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D275206B7
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wQdeigzp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeY56BON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D275206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XEwXol76Rjoe+CEBYORks7K+d5XOUD8G+uiDLXs/JbQ=; b=wQdeigzpKQr9G0c28DFpCZvjk
	tT5U8kIlOpsMYHiwksLtm/bwzFk1uiUqGADrzI+3CWvamYk5CV2bMyCGaR74rMx1EAzhFOsNLDzem
	OPOOTGpiCo9UbpmJlpkbpqDkNK2t44wW1/bXM+I4y9ndRKvLTilX2lm4wlhJz6QEE4dypciEXxCfY
	2CU2RjeStvuzBMG1k9fm21Ea9VJ0Z89lvHvg7KSpUos8WZjn8oiXzyAIoWBRGTFaXTboqszV71Q+5
	HmzqpCv9eKYGwlYkTO3s+Dj+9mO5Y//hoL+pOcX3dVpZBh/RhicACFNqbN3I3/GJrCk9zB0BLfWB8
	VrasMW8Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHFm-00054P-CB; Fri, 02 Oct 2020 09:21:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHFk-00053t-Av; Fri, 02 Oct 2020 09:21:25 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59F46206FA;
 Fri,  2 Oct 2020 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601630483;
 bh=x5VTDBtOMTRwW5Sw747OpvTmgVVW1CQQvrNgU0YSFNs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VeY56BONbbmm2FmoqnTtM9j0aC5oneFySPSit/aqtF5HMMwkvhw+S8PlR4PjMhBv2
 MgJXyVXNGNFs4aKNGCJocT13mZWvA5zI826AjQ6tKa1Sz1szZTnT/oTITNdsgyK177
 f9J+EMB3qFETAAOQ4tF6pn5moG9vszHhf+sw5NbM=
Received: by mail-ed1-f54.google.com with SMTP id g4so955734edk.0;
 Fri, 02 Oct 2020 02:21:23 -0700 (PDT)
X-Gm-Message-State: AOAM5339OShJBxHmRAsqt1pqH3f/Lv06pJw6yz+zctLk1xObTi6AKJvX
 xiQoDVPv7A3Ly9jhIFSJlnCKSPHwzYMhVt/PCEI=
X-Google-Smtp-Source: ABdhPJy5R7Q+WOsSZvDV+Obr4DkMiRhMPNxAJD8JtEaTr3YODtDYA+A/6b0kb8ZGbmu38wYHJp0uYdwzdG8IbDIrIZ8=
X-Received: by 2002:aa7:da16:: with SMTP id r22mr1364149eds.132.1601630481982; 
 Fri, 02 Oct 2020 02:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-4-post@lespocky.de>
In-Reply-To: <20200930234637.7573-4-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 11:21:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
Message-ID: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
To: Alexander Dahl <post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_052124_438120_347B2E63 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
>
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).

What warning? Please post them here and in every DTS patch.

Your schema does not enforce pwmleds node naming (the main node, not
children), or at least I could not see it. You change multiple files
in your patchset so are you sure that all these are justified by
warnings pointed out by schema?

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
