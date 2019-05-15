Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09595C04AB7
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE5420873
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnbaBSAz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tX7XsRCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE5420873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLPfL+6MmVl/GqucXDkvb+uaBSgHNtUo26JyUBVsCeo=; b=JnbaBSAz1a8pw+
	B7zMZgBTCCFn5lZnH32jtws0RzasSx62IbMvBicybyHkrU0kBmpTExq4t2Vixs1g1egx9p0+i9XDS
	cR/FmsG+ApjGaX0sUo8onq3iDaL/wqmU559SRiAJVBYQImAOJKghXvl8/skiY8oPeP7y/4WpRt9G1
	kF6eszByHRTkNiOoiZwGDyJjahBDurCIXZL9o9bmiAT113o+Dv0ywx8evqB7ioQ97j2laWopfKhQ6
	1A8afmbD0wplXjfcHI6jSwWBzeukftLt8d9s0ACsIP5fuTVFfVwtOMFDh0OMohDtBmlobj4v2jIk+
	Z2ITif33rcMLSXzR9lDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQhMc-0002Vm-NP; Wed, 15 May 2019 00:01:42 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQhMZ-0002V0-JL
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 00:01:41 +0000
Received: by mail-pg1-x542.google.com with SMTP id t22so351634pgi.10
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 17:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Fl4BRNGtm92dLl/qzsGLS8SvffFbPXXhiHpwATSSiyU=;
 b=tX7XsRCaevKkmFvq8xy+sLXC6agZnWKTOukEF5WmKqJWO7syyKlQ2wsBCfil36LpLc
 mGlid7DLUx1dXCo0KeqHIx2sUi4nerLRHCzysY+ERtFErlU4bgmKwSpt/kEySf9ShL99
 Nc1Wp8TqRW/KaqEa81fDD/8gvS/tDUs/3ZYzDJmihvXXvXBvle3OYpXPWYJXo/JUYG06
 CxmiHlVfWhvL9JU7Cbk4RjA7TQt6iOY0+pKbm5iXrCqvis9BcB18g49DkbteGGEx0pOM
 ILitRlt7sHfp1a3edNzxFH+/qX+a8srD/b5530Ze8vMyEgOu4CRVYuJiqaNMeCH9g1vi
 weIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Fl4BRNGtm92dLl/qzsGLS8SvffFbPXXhiHpwATSSiyU=;
 b=jjLRCTYgbvsQdn5M5k/Rwy2hoZAbeP/E8t2lC3Kuxc3JDu/JMbkkNOOOXojr3qd75w
 MbWH7C2WRQRQgD08pyhuysPOiizTC8iJtv8H1oqxyL3WfWkOgCmy1WiGxKc8lvxDZHS3
 f/w+kROJ/ky+a7Iitmic9n6dfUZCNH8PVDZqvcDB81ubjb74cOJHNVWiBh74go/tpqmq
 OFWH8QG6MPoRbx6eKHF01y5+/vZE6l8l1sLDMZ+TWHGqPh3DRLg8GlOfpS9HlqMSANGQ
 ol6qeACc7OqvwnP7Nh1Ve2Dx4Kxb5KfzgEbv0Extt3ITHJOl+3YfmVH8upJAwF1zxW71
 R6vw==
X-Gm-Message-State: APjAAAWebtMbUzIWaKFzMSTCITsGFNlQgg1P0Etzu3ax68cAuCLqUF+n
 SLEuYWk863iutPVhtNnk3OGcFg==
X-Google-Smtp-Source: APXvYqwHZa5sICwqraZ9H1QVEAfGb9MwKOmlBlqopDcas/BnamGKzAjjpLLEttGsYJaVEihf/p/OVQ==
X-Received: by 2002:a63:5211:: with SMTP id g17mr11987172pgb.405.1557878498529; 
 Tue, 14 May 2019 17:01:38 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id a80sm331973pfj.105.2019.05.14.17.01.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 17:01:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/1] ARM: dts: meson8b: fix the operating voltage of the
 Mali GPU
In-Reply-To: <20190512193936.26557-2-martin.blumenstingl@googlemail.com>
References: <20190512193936.26557-1-martin.blumenstingl@googlemail.com>
 <20190512193936.26557-2-martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 17:01:37 -0700
Message-ID: <7hwoisd1r2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_170139_697343_AB82E1A5 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Amlogic's vendor kernel defines an OPP for the GPU on Meson8b boards
> with a voltage of 1.15V. It turns out that the vendor kernel relies on
> the bootloader to set up the voltage. The bootloader however sets a
> fixed voltage of 1.10V.
>
> Amlogic's patched u-boot sources (uboot-2015-01-15-23a3562521) confirm
> this:
> $ grep -oiE "VDD(EE|AO)_VOLTAGE[ ]+[0-9]+" board/amlogic/configs/m8b_*
>   board/amlogic/configs/m8b_m100_v1.h:VDDAO_VOLTAGE            1100
>   board/amlogic/configs/m8b_m101_v1.h:VDDAO_VOLTAGE            1100
>   board/amlogic/configs/m8b_m102_v1.h:VDDAO_VOLTAGE            1100
>   board/amlogic/configs/m8b_m200_v1.h:VDDAO_VOLTAGE            1100
>   board/amlogic/configs/m8b_m201_v1.h:VDDEE_VOLTAGE            1100
>   board/amlogic/configs/m8b_m201_v1.h:VDDEE_VOLTAGE            1100
>   board/amlogic/configs/m8b_m202_v1.h:VDDEE_VOLTAGE            1100
>
> Another hint at this is the VDDEE voltage on the EC-100 and Odroid-C1
> boards. The VDDEE regulator supplies the Mali GPU. It's basically a copy
> of the VCCK (CPU supply) which means it's limited to 0.86V to 1.14V.
>
> Update the operating voltage of the Mali GPU on Meson8b to 1.10V so it
> matches with what the vendor u-boot sets.
>
> Fixes: c3ea80b6138cae ("ARM: dts: meson8b: add the Mali-450 MP2 GPU")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued as a fix for v5.2-rc (branch: v5.2/fixes)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
