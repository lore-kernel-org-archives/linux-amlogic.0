Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3CCC4363C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:09:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C412076C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:09:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0DYu9coB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C412076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7TgqaUsrX1rGILSkDkEGVRkeSkNQqKmHaf+FmMZULM=; b=0DYu9coB3r4yas9BFvJ72jv2nQ
	g17N2wo92oSnLJ/OoP0Ry4Mp0gEBMcWcLKxgGVOGZi0qtLbWloXzuHD7tJB8grxXkjshcva4bggZ9
	GxpbWqIjbHPQonIGyAfJF5HGIyNx7ss9gbIf89ekiyNk66dYBvFKAlwFvm/Wtt9wcmnwb9JIVsTtn
	HjVK7t2VybhZB/cyphG4lDexnUjcEAu5BEfyqNibiZixcQWH1YU/Aw1/Q8FTGa6YUEryCqMEQxsYC
	ukBSvsxgTWc+Jvm25gD6pd+sRx7r4AbBTzbTjIb2m7oJLAh5MgzYQdHckZZcV3x/Q2Jpepa2ExPpB
	e73WRihQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6Nf-0000qV-9v; Wed, 07 Oct 2020 10:09:07 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6NU-0000k3-L3; Wed, 07 Oct 2020 10:08:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id A50A84F;
 Wed,  7 Oct 2020 12:08:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaZ7Bhmafok0; Wed,  7 Oct 2020 12:08:52 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 866A63579; Wed,  7 Oct 2020 12:08:52 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Date: Wed, 07 Oct 2020 12:08:46 +0200
Message-ID: <2640582.VKub60Wb7X@ada>
In-Reply-To: <20201007100359.GC12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de> <20201007100359.GC12224@duo.ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060856_845831_DA1611F7 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 Dan Murphy <dmurphy@ti.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hei Pavel,

Am Mittwoch, 7. Oktober 2020, 12:03:59 CEST schrieb Pavel Machek:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> > 
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> > 
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.exampl
> > e.dt.yaml: pwmleds: 'panel' does not match any of the regexes:
> > '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'> 
> >         From schema:
> >         /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/
> >         leds-pwm.yaml> 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> 
> Okay, so I need Rob's ack here, I guess... and rest of the series is
> not really for my tree.

I think so, too.

I saw you applied patch number 1, all the other patches are DT and from my 
side those can wait for the Acks required and maybe I change the indexes again 
and I'm fine resending all that after the 5.10 merge window.

Thanks for applying the non-DT patches for leds subsystem, the rest will be 
sorted out without hurry.

Greets
Alex




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
