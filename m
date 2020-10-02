Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2945CC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:46:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E5E1206CD
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUZ9CtXw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E5E1206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ywqv6kI3NsOx949nv3ltH17jfbK0zx6Aa4BW6zWv+XU=; b=bUZ9CtXwEND3VwTe/xcBgzcny3
	tWwGO0zjFd0YcxmB/sbdb8nrNp3ha6BP+/ujJBzfOAF6jw7/j5As+Cz3n+mzguWvg7ev4CH4dfSea
	PeOvzhEoTNHXeDKuFpqULFiLMIqIC7NkEv3foUatkwua1afAv+mZf7AzxuA4qsnhiaE/7d+VVDQac
	vfGQIcZe9Yu1fjZzClNyfrlvnHVhnnxYGJv7rxv/z4JFoIJ5YrhxB5cqEteR0P4rY+5HjXBjdO8TZ
	P+fir+Uxf1gjcN/gKzkRmQu+w+G4icycsngkJkapqVFCYcRHxyJcNzFW7VpraHB2AQviOBtxWxMRN
	AqktfNug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOIZr-0005MB-Nz; Fri, 02 Oct 2020 10:46:15 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOIZp-0005Kl-0Q; Fri, 02 Oct 2020 10:46:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 6B3353E3A;
 Fri,  2 Oct 2020 12:46:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0ltrlPS8NWO; Fri,  2 Oct 2020 12:46:11 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id CC5233829; Fri,  2 Oct 2020 12:46:09 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Date: Fri, 02 Oct 2020 12:46:03 +0200
Message-ID: <9895379.VNsV0mSTfq@ada>
In-Reply-To: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
 <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_064613_338253_FE30C8E7 
X-CRM114-Status: GOOD (  14.40  )
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

Hei hei,

Am Freitag, 2. Oktober 2020, 11:31:09 CEST schrieb Krzysztof Kozlowski:
> On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
> > The example was adapted in the following ways:
> > 
> > - make use of the now supported 'function' and 'color' properties
> > - remove pwm nodes, those are documented elsewhere
> > - tweake node names to be matched by new dtschema rules
> 
> tweak? or align?

Depends on if schema actually checks it (child nodes) or if it's just DT 
policy (parent node).  I'll reword in v7.

> > License was discussed with the original author.
> 
> Since you relicense their work, you need an ack or signed off from
> every author. You cannot just say "I discussed" and post it. That way
> I could pretend (lie) I talked to Linus and try to relicense Linux to
> BSD...

I know.  Peter promised to give his Ack publicly on the list back when I 
worked on v2 or v3, so he is in Cc since then, but apparently he did not yet 
post it. ;-)

> You need acks/SoB from Peter and Russel.

Well, I should add Russel in v7, too, then.

Thanks
Alex




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
