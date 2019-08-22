Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0227C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 09:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84676214DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 09:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chAfx0E5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mjY6H66c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84676214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q2F58+9YL9eE+VFjEDDhX4nMkPfKoGztBXm6oJYvew=; b=chAfx0E5Ojmdsa
	19asBEAEH278ig6HiRqOu3eSviNADnW9ZmueXDPrJe4qgMU/z1beRT165glvYBEagcR1knD7iNUYO
	x47MeiBWAopKZ6X6t6SNL4kD5+CodMUUs9KOeUgjW2QfL4zoofPQU+X92jcpg4FxQDqnnkqZGzvjt
	/wcHG0Dm+B+/WI/RnCJIy8aFJxDLc33DN/HQvav/Q8DkSfHBlxQybSIBQch2nwOXrHF2ac3DtKk/p
	BucTdv+qmrabJzQR1T3iCcm2sXD/6jw+M4Bh4+nBSWhEMxepmS3dzwlpYn2IB2KpFbwfsxfyQ01pB
	l/CStwEaj7oa6JzQQA4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0ixT-00089c-GV; Thu, 22 Aug 2019 09:00:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0iwc-0006L1-Ux
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 08:59:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id c3so4616549wrd.7
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=kSpdxq5R2ZXVE8nu/XqaBKCSesahRY6PDFEkyTg3anE=;
 b=mjY6H66cPe06RdfYEXFMBSc4YWclkv3FHF1xhq+GB7/uY34v/d2COdOk3tnovDAIMP
 gmQRSbXzL9wpmrHpMx+Dt5BSkE501yYYccnGwwY6npXZIxFldZ30+iqdQo6mD9u1ghoV
 lWYZ2OSYzF8haHJJDJxNqfssGbfzuHCXoPwz9/GFRiZLQud+momrAG0f6ZRlIrNKtYwO
 fyVQHwVXYvbrKcLpJWG9DS45/DMVxO/ZoPiXZ2YK4dlw4m4gMFLlZjiQrkBmrWgN2nEY
 /bIp0jnGJ2mFphi1gkqydigbK60fgpkVCBsf4q3FTdzq+yWU5TcE8Z/pp7jcpMItTobP
 b/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=kSpdxq5R2ZXVE8nu/XqaBKCSesahRY6PDFEkyTg3anE=;
 b=AJA61i0atqoOEH/DIAF01oq3sTp+JclBJb+V9gLxgjnw3dQH7s6AEjvYG2nRJy6E7P
 WoND9EOdgcssczCZatA3em9/VhSAV+vLwNdSEEu5WrzpgZB6EPoqu32HUjgEYrNt4qO4
 FkdEI/ID+/znyjT7uv6OoGNos9EWA1M+WjyKcJmhGEXrFRxSNL+kysLuNr1QCVWFgJcb
 WtU1u+bvQcKOdEKVC9OTpozTBqb9xO/bva9fWe+88DhZVrJAWq8AriigOMlqRBC9cKx4
 P0pIqmrbrID2rHbK0jdBXhkf28sepFRUp1hntViISYEjlEP49HaKkzpDAdKWYAgCzwM3
 8aKA==
X-Gm-Message-State: APjAAAWV9fuZ+o+ahndz86XRSks8z9oXQYT3KAEsdBQq+1e2+yKRs/W0
 DeDtA5DH6l94h7cgowQQZcNk3A==
X-Google-Smtp-Source: APXvYqwuKNVJFhJQRdzYNki7o1D+RUvGpp/z37PeOA04+PvNyoaR6ILYxxLPwX8JoH/GpSY3l+eqOw==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr47080873wrt.336.1566464385170; 
 Thu, 22 Aug 2019 01:59:45 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i93sm34408190wri.57.2019.08.22.01.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 01:59:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
In-Reply-To: <20190821181458.GA2886@bogus>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com> <20190821181458.GA2886@bogus>
Date: Thu, 22 Aug 2019 10:59:43 +0200
Message-ID: <1jftltpocg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_015947_030108_57D08694 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed 21 Aug 2019 at 13:14, Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 31, 2019 at 09:23:37AM +0100, Carlo Caione wrote:
>> Add a new property to link the nvmem driver to the secure-monitor. The
>> nvmem driver needs to access the secure-monitor to be able to access the
>> fuses.
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
>> index 2e0723ab3384..f7b3ed74db54 100644
>> --- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
>> +++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
>> @@ -4,6 +4,7 @@ Required properties:
>>  - compatible: should be "amlogic,meson-gxbb-efuse"
>>  - clocks: phandle to the efuse peripheral clock provided by the
>>  	  clock controller.
>> +- secure-monitor: phandle to the secure-monitor node
>>  
>>  = Data cells =
>>  Are child nodes of eFuse, bindings of which as described in
>> @@ -16,6 +17,7 @@ Example:
>>  		clocks = <&clkc CLKID_EFUSE>;
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> +		secure-monitor = <&sm>;
>>  
>>  		sn: sn@14 {
>>  			reg = <0x14 0x10>;
>> @@ -30,6 +32,10 @@ Example:
>>  		};
>>  	};
>>  
>> +	sm: secure-monitor {
>> +		compatible = "amlogic,meson-gxbb-sm";
>> +	};
>
> I guess I acked this a while back, but I'm not sure I would today. It 
> seems incomplete and a node with only a compatible string and no 
> resources doesn't need to be in DT. But that's already done...

It does have ressources (the shared memory) but the mistake (we should maybe think about
fixing) is not expressing these in DT

I think the shared memory is already in our DT, maybe the secure monitor
should get a phandle to it ?

>
> There's no need for 'secure-monitor' anyways. Just do 
> 'of_find_compatible_node(NULL, NULL, "amlogic,meson-gxbb-sm")' or search 
> for the driver directly. It's not like there's more than one secure 
> monitor...

IMO the two methods show different constraints:
- Carlo's proposition show that the efuse driver need a ressource, which
is *a* secure monitor, whatever the variant is.

- Your proposition shows that the efuse driver depends on a particular
  secure monitor variant, which is the one provided by
  "amlogic,meson-gxbb-sm"

Yes, we could make your proposition work by the keeping the
"amlogic,meson-gxbb-sm" last in the compatible list but it isn't great
if a newer variant is actually not compatible with it.

Carlo represent the HW the way it is. It seems more flexible to me,
without adding (unbearable) complexity

>
> Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
