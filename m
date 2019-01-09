Return-Path: <SRS0=re6n=PR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC36EC43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 16:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A72D206BB
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jan 2019 16:12:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXtgTS3/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaaHvC5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A72D206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpA+n0e3fW8ZPI4OINf9vBb41dzahk0kra9afBfwh2w=; b=RXtgTS3/UcMDRv
	0BlLVojNynCejoHyqGt5r+FSaA0nDHsPcjTM4E6GcTBbKVAu0i0wG8yVV12DYD/mBXHusS7/8TByh
	fnqcVc4lEAIJFLEh9jJ2oYL0z3hLDU9udKWrMAHmxbl3K8JBCokR8vdawkSF8Hjno89Yh1arsaGk4
	J8n5XTgIH/wGlc234MZa6V0RJQzPU0Ahj47eDWXB3dEN1p3ZAGNkBbRjyI8IFQcPVKet2hqS0kP00
	Tsp11DewKITiPysPDFG29DmtFrU5Ngo/3RiFhJCU4HEpCB9aA1hC7cCsqeGVlNgG6+iucFvb/1HyD
	ey3XHYwmEdc4RlAnOTcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghGT8-0004oL-P3; Wed, 09 Jan 2019 16:12:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghGT5-0004nt-M6; Wed, 09 Jan 2019 16:12:37 +0000
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05F0A2173B;
 Wed,  9 Jan 2019 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547050355;
 bh=0ewnFeC4FHEcj3A7zvP6jyGEqueFxUiBiflRWniyQXc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PaaHvC5SP+i6GMQmpw0obVdFYkjcvV2PeHjc001a+JP9ks+YhfO8/KmWDAxJ8pEJV
 3mkqgCmls74Qet9z2bsIVInWzuB/x5g7MsItPYiO57nHx6NiL6So6HifJmpc8JK5hJ
 ZpSLn6d0p6yV/jTyD7m7xnXZ3qlwbVk5/wx4jdc8=
Received: by mail-qt1-f172.google.com with SMTP id e5so8837803qtr.12;
 Wed, 09 Jan 2019 08:12:34 -0800 (PST)
X-Gm-Message-State: AJcUuke0XeNi0N0Z2hQec1iTzIvK8ql8q/iGvz0CGKjxyRSWPnY/XuyD
 Rxj4M4ToSfbMyayfCRBclaJHJxE9ct0MsoUUFw==
X-Google-Smtp-Source: ALg8bN4pu0jO5c5wx1wRb8Wdh/XxBNbWH/RA4JA1FVu26NTXWub+M5FQs5XxXlnpfvGYzWG+9gQUlDCyV6XWzoSBpIg=
X-Received: by 2002:ac8:2d2b:: with SMTP id n40mr6044903qta.38.1547050354186; 
 Wed, 09 Jan 2019 08:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-14-robh@kernel.org>
 <7hr2ewbxd4.fsf@baylibre.com>
 <CAL_Jsq+hZRJZZ1ZcOxZVXtsUs0013cP0fyf3A=_9J15WbzuUhw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+hZRJZZ1ZcOxZVXtsUs0013cP0fyf3A=_9J15WbzuUhw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Jan 2019 10:12:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2yN_h0FUJ_F79OBMNkpOH=ou-o4iBHffoRt4XRP8mYA@mail.gmail.com>
Message-ID: <CAL_JsqJ2yN_h0FUJ_F79OBMNkpOH=ou-o4iBHffoRt4XRP8mYA@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] dt-bindings: arm: amlogic: Move
 'amlogic,meson-gx-ao-secure' binding to its own file
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_081235_739314_20A1C702 
X-CRM114-Status: GOOD (  14.91  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>,
 Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Grant Likely <grant.likely@arm.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 4, 2018 at 10:18 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 4, 2018 at 7:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Rob Herring <robh@kernel.org> writes:
> >
> > > It is best practice to have 1 binding per file, so board level bindings
> > > should be separate for various misc SoC bindings.
> > >
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Carlo Caione <carlo@caione.org>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-amlogic@lists.infradead.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/arm/amlogic.txt       | 29 -------------------
> > >  .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ++++++++++++++++++
> > >  2 files changed, 28 insertions(+), 29 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> >
> > Acked-by: Kevin Hilman <khilman@baylibre.com>
> >
> > But this isn't really related to the schema series is it?  If you
> > prefer, I can just queue this one separately via my tree.
>
> Yes, you can take it.

Hey Kevin, doesn't look like this got applied.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
