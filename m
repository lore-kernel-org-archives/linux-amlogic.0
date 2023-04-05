Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0BEC77B6C
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 22:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:To:From:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Np/6rckpweKxJVt4F4yRqZ7/J/iXBxoPk5RCOLbYFeY=; b=tnBPz+gPmRDWDz
	f3nlHaCHJ+MGvy0JrDcrxDvTLYD0Sh6lkA2QzeH94FWqIzUf44+jiIJw1df85C5Tl62kHh7LOl6S+
	9P+mwn7riT4PY+gh9P57N4JG7SrJZ6FNCZ/CxZFmyc6Klue2gbL5rziLI/+Ewvq4P9e23swo1dahY
	7Ne1oe3i1A8AuIUmq2R65xNXzsuPpj9NrVlxl5DeJcOgHuaQ1Db8nWtdCx1Nd2gvdGklV2UIIh1eH
	5YyZ8bpAs21bM458eJQCBqE3CLrTIplU63jdxKvuFYHXuISaKpYNO1PLN9rwbzp7RgcENJKvOQlff
	FFs0+l49ZqaBERqR8GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBH4-005p3C-2T;
	Wed, 05 Apr 2023 22:06:38 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBH1-005p2C-0u
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Apr 2023 22:06:37 +0000
X-KPN-MessageId: 140384bb-d3fe-11ed-93ea-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 140384bb-d3fe-11ed-93ea-005056992ed3;
	Thu, 06 Apr 2023 00:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=f5EXuxEx+k4RZenwIaQK/guv07Xz9T3xUEt76X3neWo=;
	b=vQ4b4UBJSYJvGjWdfFSgRbNNXrvd5/5NRZZO7OGuPyfKUUYIUuz5fwo9J4vkA1IyhZPuZXpu3sHBS
	 KBC4p4MhUR2t+K43mmWcAiaegOKU4HBlXjlel3XOkAugUO7a2UHgT+lrm6aR2npAPoT0v1RnaJdZGN
	 NnWHdg3c4jUf5URtTd9U/pzXzIxVu3S8GXQWHyJ3GuPI8stnZKUT1w0ewUawRDUgt22zByYPafnJz/
	 nMbCbhvBm0J41Z2M8s6AGcUV5Qq2YKFRKjdIfhI9fpVuX5rQAP4u/udlIBaS2W97gIKNtGySC1SLiD
	 6sFyvG155ie6Fezh/tS0Z7JX/2TUmuw==
X-KPN-MID: 33|Nx0uMzf+BTwU6jqZTHGXCtzN3AfgnyZ43HrndHNXBHnFJE4mp9DrQvANn6kIX87
 LfC5n36Jl+fkqN6LP/Z9iehs/QfweJCstWFpEdoIRt20=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|T6Utx3OkSk32Pp+e0p8j33ayubux208fHjhT3+9MdTdYpxf4QZABgVx5ivr+4em
 nqjPbotp9NAYkm6EThyTaXw==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1c1ac16d-d3fe-11ed-9d31-00505699d6e5;
	Thu, 06 Apr 2023 00:06:27 +0200 (CEST)
Date: Thu, 06 Apr 2023 00:06:26 +0200
Message-Id: <871qkyasrh.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Simon Glass <sjg@chromium.org>
In-Reply-To: 	<CAPnjgZ2TNR2R+20WH_iaz0S-k8kwOSZcxFU_0_NnCfmFJo_rcA@mail.gmail.com>
	(message from Simon Glass on Thu, 6 Apr 2023 06:38:19 +1200)
Subject: Re: [PATCH v2 1/1] RFC: Move Odroid-C2 to use binman to produce the
 image
References: <20230401185458.2280200-1-sjg@chromium.org>
 <20230402065454.v2.1.I2d7f563b6a82f32478a7874e36672622aebb7893@changeid>
 <d3308f32-275d-7b37-8c03-76984a2b9ddf@linaro.org> <CAPnjgZ2TNR2R+20WH_iaz0S-k8kwOSZcxFU_0_NnCfmFJo_rcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_150635_475705_985BD6A7 
X-CRM114-Status: GOOD (  22.94  )
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
Cc: neil.armstrong@linaro.org, u-boot-amlogic@groups.io, u-boot@lists.denx.de, alpernebiyasak@gmail.com, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> From: Simon Glass <sjg@chromium.org>
> Date: Thu, 6 Apr 2023 06:38:19 +1200
> 
> Hi Neil,
> 
> On Mon, 3 Apr 2023 at 19:31, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >
> > Hi Simon !
> >
> > On 01/04/2023 20:54, Simon Glass wrote:
> > > This shows how binman can be used to replace the long and complicated
> > > instructions with an automated build. It is still complicated to read
> > > but users don't have to worry about the details.
> > >
> > > It needs some tidying up and only supports Odroid-C2 at present.
> >
> > Like the v1, the work is really nice, but the dependency on vendor
> > binary-only tools doesn't make feel confident about merging this.
> 
> So long as we can download it from somewhere, that is OK, or at least
> better than nothing. Is there a standard download location for the
> tools?

The tools are Linux x86-64 only, so...

> > We have open source implementation for all boards, but still dependeing on
> > tools we must manually build isn't optimal.
> >
> > What would be optimal would be to re-implement those tools into python
> > libraries and merge them into the u-boot tree then use them from binman.
> 
> Or C, perhaps? Then binman can call the tools.

...this would be preferable.

> > But this could be merged as first step, them the python libaray could be
> > modified to support the binary tools & a probable python re-implementation.
> 
> Yes I think it would good to get this in, even if it only supports a
> few boards. It is easy to add more, when possible.
> 
> Regards,
> SImon
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
