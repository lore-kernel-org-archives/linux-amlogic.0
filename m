Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B90CC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691A820851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0cICabL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W4SndBG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691A820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLfTtRZpfUiMs31NCv7toPrOugwkjyrX8NCSqRD3aiM=; b=C0cICabLzOkmGg
	ylDbylwVYmuNcUmFi5YrJjb0a04y8lVPceDuM8E0xRHF5Da+xJPFSRvTVhjpMgbMzxJXVVBcNKK2j
	lu5OTchMvr25gRknSkYOGV7KPt5KdEV8Xg+JEgEzK5gW9AXiQvAWboXyPKBbtUig/EQfz576Kt0nG
	di/nG8AA3Vl3vz5lj03sOpRoaA7zX3klxeUcjthA3FUK8Lxnu5ftdKVdVOCzJpjfjU6n2UsKye/IF
	UKuddcZNUKrBr9D4e1naRAHU1D7df0SK5yACLV3Q/BBo52UDmmYtwLUJVsKEe2uXxam+CRi5jXki4
	QUbAPrGlPe40i4NEq2Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkES3-0005hx-E8; Thu, 17 Jan 2019 20:39:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkERQ-00054R-Qh
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:39:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id f188so2449176wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=AMH7YbOdg2Vw/ywsYuiaFgHHvXIsGR4Fj5IfkQierxM=;
 b=W4SndBG36Hb0fR9tjjWQPIe/j/UhrXHGn0+LSZSErxLFROJzswgyx6OsbL9b99tDKP
 ruj2EFs6LQSa3O5pGXEFwSpOdf5zms5vzbYLmmVoV0Y9QTtJjk5k6Ju7cldKWHB+yYeY
 0oy1Mz00lqi8OVD8wulaUB1djWGFiEDfEtJa8/WVXpjZZC/e1CYOauiu4Cu79Kn8l2H6
 2LhHlrS0/Y4q/8PI+RMqCBchwkzbPxhJ9FFmsqCvDX1jeNEActsArTs7OdQipFbHuTaP
 dNiZvsCHNnKXFx1WyYx4jyZOvyoFxOUhrHAStTsJiQL0OYBJcLkM7C77fpkwY0OpxUwh
 V84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=AMH7YbOdg2Vw/ywsYuiaFgHHvXIsGR4Fj5IfkQierxM=;
 b=Bt0atFbBXw3ThARpq5CNMlOXR3wXVXNyDQkHxqX7jJazOpdUqqyjDz2rrZ5+UqzDQq
 uLbirit/6d3dWzirxrYdmpXuID9GhbXqXEzU4lumDY4VhDwRArIWpkEIISt8g2HI1mLh
 VtaoKBa3ofL5358vMvedD+5tucuaZefLpxIcNCMdJB2dBorEYrUUpyp2uH7aKnpy7G9S
 e3y+3uSWFEgzeDX4XIqmuTiuoFtzAkJmbGkkN7o8E1ziOQvzOLuX+AUB5HNP0lpXFhca
 BQFhjx5SZVVj3coL1wJ2D3HBquvqig/cZkCjNfIij4W8lK6+oz8guu1/4AfiuNz85+wf
 iLqQ==
X-Gm-Message-State: AJcUukfzn26Ms/ExsSBxVK0jPY7Yul3tM37nmaUF1jR4RkJX9agYx+ts
 ObvjUh8cqHYq/6CpJQR6q7Vfzg==
X-Google-Smtp-Source: ALg8bN5TDA84nVo71jpNZCJl0sbhmoIwt/2aGlFca2bVairQHl0kPNsV4oyyGXACEMO8trS72TpQ2w==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr13016697wme.122.1547757546511; 
 Thu, 17 Jan 2019 12:39:06 -0800 (PST)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k128sm52082162wmd.37.2019.01.17.12.39.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:39:05 -0800 (PST)
Message-ID: <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 21:39:04 +0100
In-Reply-To: <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_123909_352752_BF7006C1 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> OK, but we had incorrect documentation in the past. did you check this
> with someone from Amlogic?
> 
> I'm curious because there seem to be two different approaches here:
> 1) hiubus name and offsets are being fixed within this patch
> 2) aobus is being dropped here and re-introduced with a different name later
> on
> 

because hiu exist and aobus does not, for which both the name and size was
wrong

> approach 1) can also be used for the "rti" region (at least in my
> opinion, the patch doesn't explain why it can't be done):

THe patch remove aobus (instead of fixing name and size) because, of the
multiple region documented covered by this 'made region', I did not anticipate
which one will be required and I did not want to add them all.

Better to add them as needed, which is want I done for pinctrl as you pointed
out

> rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> (both values can be found in mesong12a.dtsi from
> buildroot_openlinux_kernel_4.9_fbdev_20180706)

RTI is added here:
https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com

I don't really understand the problem ? result is the same


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
