Return-Path: <SRS0=/mSf=SR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF337C282DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2019 22:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8292087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2019 22:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ls5muvbK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CkHHH4Nu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8292087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=642R071KUcjKMEh0H+098jQVuLlhIFYMVegMXJXAopc=; b=Ls5muvbKRtNR7t
	KccX7+LA1ElcUN8+aVXIyrNvTTdF/QkSpfpvT4Mop55dBYzkmdcQP9ULg4kstTHuv26d4KjZVQK9F
	Nsp6yFkPK6JzDOUXBgXuqrrK86I/I4javbo0raMVSCuZ27/3gmeBJO1Onibw4VRFPW7pluMZR31TS
	KMwGdKDR5UMeidc52GH7BCZtySlMvLPSlcnHaZtFvf2/t6VVt2IuvDOcroJdo792zeu8wPoYahzmz
	9UWOBNDnSQucPfWfuQLgxS000NUjL7dbsz1xB8aX4/inInSzOQfgwfADl6OwwJ74M+8bBYwm3XGSV
	P2hxzv4aMznFhKW+ip0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGAN6-0006hF-1X; Mon, 15 Apr 2019 22:46:40 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGAMy-0006b8-EP
 for linux-amlogic@lists.infradead.org; Mon, 15 Apr 2019 22:46:34 +0000
Received: by mail-pl1-x641.google.com with SMTP id f36so9298069plb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2019 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=bG81ld+Ifo/Ibz8BPNzF6UdN7r62GWdQqkw2sfWxBIE=;
 b=CkHHH4NuB+CJi00KBtMI+2BVKiviKLnau6lg5Yv6TwUlwvwh6OUIKTqtu4CZlnbYkT
 OFWnzhoK0T0UqA9DmEUe6BvGdSUQEpzlg8CKY5J5BzaXnD9C+bc8JKfK0e9+F6j0AIHD
 3MGT0C9S69csNVqDT2UCs299JCg+upU3/5xV7J8TdCY+rQmenohIfsek84DdX/RBWjDM
 tb9u6YUy2Aeec1xqeHgN+cNfnnx3dkJJl1kalZTC6PEPhGbJXXYTTHOE3bnbfBDR+V2/
 w06nSLtMEbxHfoyGEv8LiMxcyevBH+GCqCaQo6geCIwFSSK54fCT0FXjGEGrxhGv3km+
 zibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=bG81ld+Ifo/Ibz8BPNzF6UdN7r62GWdQqkw2sfWxBIE=;
 b=U83PB4VxznvnL6ILEXeHk42LEfE2M+pU1fuNwcO8VP4vYJNaM1RNM4U0zsphZ2tRBI
 jsnAyN42OEnDmrqrjB73MD9cgwxmLgocsz3BAbUGPkbcSYc+ArM1UHuywSY8jq1G+y1m
 eMCpEsPinmH/OLH1Xu3Spvk3eSh6WcPrRsC95df28gXoCwAFc1PMF+q4z1fU27kLBYmx
 Mcl2JwLGbs98k8f+sl0ec43EztxNLQd2ZLAWGRB82fJEN4dR4G63V5fujGIDjOlb8ddB
 Cd+M7w74wagmARW4tnwWHJjT/nXY4CFjJBhkjT/tR2h4SyNUKFMElsx/pH7FhY8A3MaZ
 R7Hw==
X-Gm-Message-State: APjAAAXcHXAfMB9zmmZtrgqy+TtDmWQPCyP5bNKAodxFSiGFWMl683En
 7U1dxr96d8vu9TwLVLkHOM0MQ62dS58=
X-Google-Smtp-Source: APXvYqzO+U4ObfjyK28csaq2gUw4VrbmhMj98+DwzveBg/IggfpXO4gRQQCyro2DZBPX1uDGPVXhjA==
X-Received: by 2002:a17:902:1101:: with SMTP id
 d1mr61503457pla.16.1555368391746; 
 Mon, 15 Apr 2019 15:46:31 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id
 g64sm115360066pfg.13.2019.04.15.15.46.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Apr 2019 15:46:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: g12a: Add peripherals
In-Reply-To: <891b8b51-256f-0c31-6b16-1b70bddc73c2@baylibre.com>
References: <20190325100339.749-1-narmstrong@baylibre.com>
 <6b97b67a-3b00-81d5-1031-3a7c423f62ff@baylibre.com>
 <891b8b51-256f-0c31-6b16-1b70bddc73c2@baylibre.com>
Date: Mon, 15 Apr 2019 15:46:29 -0700
Message-ID: <7hef62rinu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_154632_490068_E51309B8 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 01/04/2019 13:51, Neil Armstrong wrote:
>> On 25/03/2019 11:03, Neil Armstrong wrote:
>>> Add following peripherals :
>>> - SAR-ADC
>>> - USB
>>> - Mali GPU
>>>
>>> Dependencies :
>>> - ADC
>>>
>>> Depends on CLKID_AO_SAR_ADC_SEL, stable clk headers tags will be
>>> available after v5.1-rc4
>>>
>>> Bindings has been merged for 5.2-rc1
>>>
>>> - USB
>>>
>>> USB depends on the CLKID_PCIE_PLL, stable clk headers tags will be
>>> available after v5.1-rc4
>>>
>>> USB2 PHY depends on missing Reset bindings, have been applied to
>>> reset/fixes, waiting to be merge into master or immutable branch/tag
>>>
>>> Bindings has been Reviewed, waiting to be applied
>>>
>>> - Mali
>>>
>>> No Clk or Reset dependencies
>>>
>>> Mali GPU bindings are still in review.
>>>
>>> Changes since v2 :
>>> - dropped applied patches
>>> - collected review tags
>>>
>>> Changes since v1 :
>>> - dropped already applied "Add AO Secure node"
>>> - dropped meson-g12a-u200.dts uart_AO change
>>> - fixed includes overall to fix build for each patches
>>> - removed disabled status in dwc2 node
>>> - removed uart_ao_a_c pinctrl
>>> - fixed uart pinctrl node name
>>>
>>> Neil Armstrong (3):
>>>   arm64: dts: meson: g12a: Add SAR ADC node
>>>   arm64: dts: meson: g12a: Add G12A USB nodes
>>>   arm64: dts: meson: g12a: Add mali-g31 gpu node
>>>
>>>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 117 ++++++++++++++++++++
>>>  1 file changed, 117 insertions(+)
>>>
>> 
>> Hi Kevin,
>> 
>> Clock headers bindings stable tag has been sent to the list,
>> USB PHY Bindings has been applied, USB Glue patches are
>> still pending.
>> The Mali Bifrost GPU bindings are still in review.
>> 
>> Neil
>> 
>
> The Mali bindings has been applied to drm-misc-next.
>
> The only remaining dependencies are the USB Glue & DWC2 bindings that has been
> reviewed, but not yet applied.

OK, those don't cause any build/boot time dependencies, so I'll queue up
this series for v5.2.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
