Return-Path: <SRS0=91Jp=YS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EDECA9EBC
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 10:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE12D21D71
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 10:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hL1zE3pq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE12D21D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBXuEPu9b80ZHUC6bimKplmJGV40p9/2SH0Qk1FNhJM=; b=hL1zE3pqhK7Moi
	J9UXX87MWuU5RsjnEekRUQFO2xZ+0MSaw1ORRU0w+hyW/xvWxWS/co4W61ioNyi8//qDQbDGaXYan
	BMgMlTFNJklJM0U4l4jpV0vbrHa+3IJSoPsK8N8DeWI9RUhJ6ZlbZJn7pyKVBiIxuHwV2H+zHmkdx
	nL6bT0SXmc1OcaFhXPViOMductHtAwXZp7PLy9zHG9qzpqcMERwZzsAL24wq9UGZF9YhDB3dwHqdQ
	HK+mDAhCeqgcLrHWKTWQ5IDApkvxCZRM2c/WrwdwFzXvWsSOMo/Qnh2vFuXNIY3dFHZrmyuP92Uxo
	+yxkNcMFsK+rvbq8cLOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNwjU-0001kO-KW; Fri, 25 Oct 2019 10:22:12 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNwjI-0001ae-AP; Fri, 25 Oct 2019 10:22:01 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 03:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="210348774"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 03:21:56 -0700
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc3: Move Amlogic G12A DWC3 Glue
 Bindings to YAML schemas
In-Reply-To: <CAFBinCBOEG6GT=dp5XQ3+nC18axSodPbgMfE6F7eHLE3gZfSoA@mail.gmail.com>
References: <20191021132322.25256-1-narmstrong@baylibre.com>
 <875zkhdye5.fsf@gmail.com>
 <CAFBinCBOEG6GT=dp5XQ3+nC18axSodPbgMfE6F7eHLE3gZfSoA@mail.gmail.com>
Date: Fri, 25 Oct 2019 13:21:55 +0300
Message-ID: <87sgnh2kho.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_032200_398481_26B9ABFD 
X-CRM114-Status: GOOD (  15.16  )
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> Hi Felipe,
>
> On Tue, Oct 22, 2019 at 9:39 AM Felipe Balbi
> <felipe.balbi@linux.intel.com> wrote:
>>
>>
>> Hi,
>>
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>
>> > Now that we have the DT validation in place, let's convert the device tree
>> > bindings for the Amlogic G12A DWC3 Glue Bindings over to a YAML schemas,
>> > the AXG and GXL glue bindings will be converted later.
>> >
>> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>
>> Is this a thing now? Why do we need a new format?
> this is a 2019 thing now, see an initial announcement from Rob from a
> year ago: [0]
>
> the new yaml schemas allow validation of the actual .dts
> this can be used for verifying that the example in the dt-bindings is
> correct, as well as for verifying the actual .dts file (so they match
> the actual dt-binding)
> (Rob's old mail - linked above - still has these two on the TODO list,
> nowadays this works fine)
>
> Neil is working towards full yaml schema based validation for all IP
> blocks used on Amlogic SoCs.
> with this patch we get a bit closer to that goal

cool, thanks for the background :-)

-- 
balbi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
