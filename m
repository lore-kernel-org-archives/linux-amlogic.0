Return-Path: <SRS0=Y6TM=YP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAB9CA9EA0
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2019 07:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF1721783
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2019 07:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2D/n5cB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF1721783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JZUmO5/133Ruam4AUgWh2HQkcpDgD06duI0380Wdag=; b=T2D/n5cBh/3VHA
	PWNVjzOMpkAJ620RezSAyMGKaMTqKt5/tWlkHgYJkLPAGEQBiI10zXQiPaqu9dbWaquE0DwbPbkdA
	/Jd81pM6uwCdFZi9Yg5NvAYKqK0GFsBSuNUUx1i64peB4gU/XM4WPBx5urNk03pOx6KvGqAnniGcw
	JApcocOZOQ70YzMvplxv0UUOSy5P4kdr6/eqXJcf7ngk7kWgmBVpjk0qzZeFvsDamUaeph6FjaJMe
	NSGYkkcHcRSxMEf+NGBIGRBT7j4FCUipx6ZQMUG1+3Y9BTc51KElTUk9dSS2ZTv/A124qnPamj3Ze
	c5kdiz/G4etLB8/L+Osg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMolF-00082g-8a; Tue, 22 Oct 2019 07:39:21 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMol5-0007mv-Tr; Tue, 22 Oct 2019 07:39:13 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 00:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="281203584"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
 by orsmga001.jf.intel.com with ESMTP; 22 Oct 2019 00:37:07 -0700
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc3: Move Amlogic G12A DWC3 Glue
 Bindings to YAML schemas
In-Reply-To: <20191021132322.25256-1-narmstrong@baylibre.com>
References: <20191021132322.25256-1-narmstrong@baylibre.com>
Date: Tue, 22 Oct 2019 10:37:06 +0300
Message-ID: <875zkhdye5.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_003911_974497_7DAB6FA0 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi,

Neil Armstrong <narmstrong@baylibre.com> writes:

> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic G12A DWC3 Glue Bindings over to a YAML schemas,
> the AXG and GXL glue bindings will be converted later.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Is this a thing now? Why do we need a new format?

-- 
balbi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
