Return-Path: <SRS0=Bf+g=TQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB488C04AAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 12:52:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBB620833
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 12:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1N9rOTS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iC9xJc/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBB620833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3RS1qxM98yAUxtMNOlzUATJKXMJjxmKKZS8GMZ7efc=; b=G1N9rOTSzT6h4v
	pVDp5PjN+IBVJrp/4aus/Kl8qB2GXQ8OOphxpbqjz1g7Wdkc7HDLTbiNwb+W6r4xaGsVryLmNm19W
	IC2ed0uKuGTI5qsluSF+DOh/nv2Ppe31O2jE7vdiC/sZg+GK66vOKSXYDtN6bpL5GT9q/VI5UIKm/
	omkhQqP24QMvDOme4c7Wc1/l8574ZZITKBCEDZlB7SdUWJ76DZh0vqcrendHafGsVvHrmlOSZto70
	BnIUeKr/fsSSv7eDmpE/CPTkzlsekHni3XQ4JQdcShitGjn15ZLy57r/i92BMDqdErErU00R3hICX
	AhFE0/WtU0IhVMMtOWkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRFrv-0003X5-Sy; Thu, 16 May 2019 12:52:19 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRFrt-0003WZ-2w
 for linux-amlogic@lists.infradead.org; Thu, 16 May 2019 12:52:18 +0000
Received: by mail-lj1-x241.google.com with SMTP id h19so3003807ljj.4
 for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2019 05:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M8dIMMLTGG86thIxs/mRUU5bsghAX7RRvWXWnrAvMAs=;
 b=iC9xJc/LqP5wzVxXoivXXOnuzTrrgFiN2GtZrWRT5bsmasTGCrg1mUFbsRM8/yJ8lE
 Chia4VkQR8GHzZ1wp3SftBAPhcf0/0id8JlaHJajgdxXO4Fo/NfHfxfwZJhaYduFdKPz
 oX39O8pOX2C1YCZdt6Z1yL8eTySL64PduJAGls98JcKwJ8XtPpYNUuaPXVGg3C+bqQ0v
 G+dFQh2qz/jUZKW5/q6RWlhrG4KOpDKiBtPFLz8HkLYufM8kTyzHmC0u8Gzu6hbq2W2n
 RnAB8XpXl17EpT/Wkex+RjpHiNP90Y5JpsNjFtK5hVwJ2oSDKVetXxS0UvIQ5qd2tovw
 qhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M8dIMMLTGG86thIxs/mRUU5bsghAX7RRvWXWnrAvMAs=;
 b=GyV/0a1oneZB1xNSgQOuAaDjj2l9+Vx7XoytVWpvt0yIp9SQA9JwZpmxa/osE9gUxe
 yq2Sywp6fCcmmZYsPTZ82wzCip2biMauEYoRTi7ycJpyFfRsihbWWFhQf28TTYeX407B
 zrSOZU+xzT+tAF9HTkTxMT2BqrSIfTJ9qws93HlEFd9gFPQ/q67/zixI1Ha9LOOMgnyu
 VMCrv8a8sXlSaAe2/DqQIgt+Fpf3akhjxD6xi8GnP4IvJ07hNXZX9oZEXGrl3hb/ZaIw
 xmLAxxed1DA39W7NJSDCkaGnDhfd+t46DM/gF7JuwZTbRF1lVK6wlDX+EJ6rhXKoq8dU
 uVPQ==
X-Gm-Message-State: APjAAAVFY2bmGJvTz+7QqKM6ajk+b6D/atUm+gKriwM9ODrpaeZY203o
 /Zf4g+TdVeNGWLFO5n9XxZLhF3AE/GuKiPqEHFRO4g==
X-Google-Smtp-Source: APXvYqyKQvo32z2nDVQNlGDeWm4ClSjw2DAn7P89XY+RzmdqMHft5SDvxQb/j4IO5PU3+gOiYdzXt4I8x6QxAuXOZMU=
X-Received: by 2002:a2e:731a:: with SMTP id o26mr21431284ljc.105.1558011134949; 
 Thu, 16 May 2019 05:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190514082652.20686-1-glaroque@baylibre.com>
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 May 2019 14:52:03 +0200
Message-ID: <CACRpkdZ+p-J5Em3rzZcUwpA-a+CVOY91CgLqoRm_QVZP6E4Osw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Add drive-strength in Meson pinctrl driver
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_055217_134152_BB48C419 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2019 at 10:26 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:

> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-microamp". The change to do so
> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v5:
> - restore Tested-by/Reviewed-by/Ack-by tags

All 6 patches applied for v5.3.

They will appear in the tree once v5.2-rc1 is out.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
