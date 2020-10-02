Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C00C47425
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:07:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7B220708
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Q3kDm5Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E7B220708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjfWp+CVOH/dpNyCBOaXThHgkK8i6P7RLvhIO/xY5wI=; b=3Q3kDm5ZZIPQRiKu2g9OG+jUJ8
	n+oe+m53VFRjdeo9jKK6R1ccojZVzNe4HC3dMIS//lAQyBqt0/QjVR2hhqxVgLRJWjfdyujm5KJo3
	4cHHS6L46GSHIpgd70AxKIucSNFvZwVtHJS2N9p3VlB2mWqfPTw/XjhTWAK6XdTgRNMVTQjPyf7RA
	PjcxNUen2tHPCHu6CXdQD/tHCszYOXQlr+/ieMZyHxTFNaHDFZp350mas1Kw1Q2O+dirQow9wyUxo
	pUvdUP+JggAKIepDjCcjOwnZVxHQcg12bLKtgsGyfY/ynzUF+5W1K6T/mGvjQuTkKG6JDmNO+FGqJ
	vAQsPVrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHye-0001lX-5X; Fri, 02 Oct 2020 10:07:48 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHyc-0001kz-5G; Fri, 02 Oct 2020 10:07:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id C953A4125;
 Fri,  2 Oct 2020 12:07:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jl9GQlD_k-xA; Fri,  2 Oct 2020 12:07:44 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 9ACE840A3; Fri,  2 Oct 2020 12:07:44 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date: Fri, 02 Oct 2020 12:07:38 +0200
Message-ID: <1708987.KbI9FDK2aH@ada>
In-Reply-To: <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-4-post@lespocky.de>
 <CAJKOXPewAhZU1Enz9HrdrG5RF==y6Mna=E_vfpD4u2747CVo8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_060746_314727_6CBC8167 
X-CRM114-Status: GOOD (  11.49  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

Am Freitag, 2. Oktober 2020, 11:21:10 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:51, Alexander Dahl <post@lespocky.de> wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).
> 
> What warning? Please post them here and in every DTS patch.

ack

> Your schema does not enforce pwmleds node naming (the main node, not
> children), or at least I could not see it. You change multiple files
> in your patchset so are you sure that all these are justified by
> warnings pointed out by schema?

The rename was suggested by Rob [1], and I think you're right, those names are 
not (yet) enforced by schema?  So at least the commit message is misleading 
for now.  I'll have to see if I rather reword or update the schema again.

Greets
Alex

[1] https://lore.kernel.org/linux-leds/20200922155747.GA2734659@bogus/



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
