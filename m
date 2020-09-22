Return-Path: <SRS0=j4YL=C7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0E9C2D0E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2020 17:31:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C46C22206
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2020 17:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/u7TC3F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hA8Xdhw2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C46C22206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IDjsYR52GCiey/b4Aojd9chzQjiBrr3PbIgA5MI8+ZI=; b=B/u7TC3F1lbi3xgLxamDJMXYj
	IntriOFKfmffWT3qugWlEEHlq1NgiOFnDKJW55EzwunmHA/t1+J9aeF71MVEFRUzop1GdbkcIyCUp
	h+HueszPD7law/TslRx6N/jLyiJNX8FrLkMjQyuBHzX4gTp4WbmgaKGdITv/J1K3As32dbKaiwAMe
	NJ8txNjKitYfGWRuQbk9sJmeI9ohAodZxCB7Uz/4L1w1xh+2GaigHWzXGeCesCSZeG0VEtyXqqZOS
	2ySqF4yksFkobVCcOiJtmemlrYvMJBwWcFI5SYsRvlsaXld54vk7w9fKE2UihMTsIkvGqSsJMioVH
	/lN8JqT2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKm7q-0001fy-AT; Tue, 22 Sep 2020 17:30:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKm7n-0001f1-Pv; Tue, 22 Sep 2020 17:30:44 +0000
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DB9B2311C;
 Tue, 22 Sep 2020 17:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600795842;
 bh=h/Ld3B+y9ti44HaX9WBK4umuicsG2Hw4yBOtkCQsXm0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hA8Xdhw2USh4kEEPqjKDIT0mhCkpZpCochvP0DjCFvzxc+vAhm+YpgHLL9mZu5HeU
 GakRDxsjIPzPj53y2Za7Fwa3UN8BOj34bJ5v+X1TB8hzlE1YanZlO80Qyx0G018TVo
 vmRBRRVaboUuhyQvTKIIuBkvUDsfzT07l4CyQb6Y=
Received: by mail-oi1-f170.google.com with SMTP id a3so21936452oib.4;
 Tue, 22 Sep 2020 10:30:42 -0700 (PDT)
X-Gm-Message-State: AOAM531tIA6pNNBZaa4jP7N7NPLeiqIqdG7PsX/9RwByG4/OUOl+8Vkl
 Ll9RsOBJho4SFCPXRkN2l4tQj7tB58OPcInLpA==
X-Google-Smtp-Source: ABdhPJyR6TOz5P3635ttyIAV8HOhgZ+lkgMa2lt2O2qCFj7x8E0qhcXa056jzEwtzQMukGxjEo9dw8CwafWjv0lsZfM=
X-Received: by 2002:aca:1711:: with SMTP id j17mr3427994oii.152.1600795841602; 
 Tue, 22 Sep 2020 10:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200921074953.25289-1-narmstrong@baylibre.com>
In-Reply-To: <20200921074953.25289-1-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Sep 2020 11:30:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLZzxXcvoqd29NM45UjL-mbSiHphTO_zOwbCwPKd+jWEw@mail.gmail.com>
Message-ID: <CAL_JsqLZzxXcvoqd29NM45UjL-mbSiHphTO_zOwbCwPKd+jWEw@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc/meson: do not fail on wait linkup timeout
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_133043_903889_DD03780D 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 1:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When establish link timeouts, probe fails but the error is unrelated since
> the PCIe controller has been probed succesfully.
>
> Align with most of the other dw-pcie drivers and ignore return of
> dw_pcie_wait_for_link() in the host_init callback.

I think all, not most DWC drivers should be aligned. Plus the code
here is pretty much the same, so I'm working on moving all this to the
common DWC code. Drivers that need to bring up the link will need to
implement .start_link() (currently only used for EP mode). Most of the
time that is just setting the LTSSM bit which Synopsys thought letting
every vendor do their own register for was a good idea. Sigh.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
