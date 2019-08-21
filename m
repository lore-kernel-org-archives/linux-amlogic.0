Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E76C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75182332A
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W85rIJGD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a2O1vB4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75182332A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHw9KGM9Qs07lnZz9ocb6Q2r5qpO6KcuKpfDQFj/fiY=; b=W85rIJGDrbyTN5
	DhVGR0o/VbegcRVozmJjULNw23/8eGOczng4kW0S0nl9hNfv9gZFsqWZEppX4uwxqukfZs0UI/EDw
	K3NtGQxpKlPjp8TKx+l9OOAbrMN6ZwrN+wA9wvh/UB/pgSGBsC+NYb99y61Q1LTCdDiuL4++PBoqI
	4WBdq5noFYURiJaDqNm6AyNCn+mhkHedXGrpiLQK3CTVajWwMWleKoIC64fhWoM3TXIcLzvTJC+1+
	s3A46mKISTkvkrJrOb0hXBAVWBt8oA0GCYO1x0CRFdrNRo9MHGfDw+pGDVj32VucjlgQT5ZWgp+9j
	OiP692y63vknLxCpnqDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Xxu-0008WL-Sy; Wed, 21 Aug 2019 21:16:22 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Xxs-0008VV-9e; Wed, 21 Aug 2019 21:16:21 +0000
Received: by mail-ot1-x342.google.com with SMTP id g17so3472084otl.2;
 Wed, 21 Aug 2019 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wy67vtg4FuvAzi/1thnqtWwMGxJc2ol+TXZYnC2Wttg=;
 b=a2O1vB4Y49uXu/YYItvHjbx8LCiQcbyjAm/Rg+tNrA6uUwgqAM9CrmD4bSpBTTXuDu
 iSVsIo3yV2zalMhVpg9kgCyEPYK9YhA9aSaPjW2nULXZ8gnIEpLuFCFRV6DnHVyMgB7N
 CLDGK1jWYIuNGZEZXxLX244J9cI87vERUmjzloXmJ5PYEFEBp2TqVwKhqTBTVaM0iMIx
 VHQfjQ3Nj2cSMbkUWJTjC7FiB2GOjEU2DflOay1t+D2GA2j/uFkQqJCtfLVcBM+nA7DO
 /zwm4uPilpepuw83s8MkJyOWrjme1iNahWs/lJj8AaaZTiqXgsPnaJ2P/flNZ884VbAB
 0jkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wy67vtg4FuvAzi/1thnqtWwMGxJc2ol+TXZYnC2Wttg=;
 b=e44mOTh99sYjpYDOLV5hSL9at5OCbmtw0h72dShIWXqasGOCOjXMM1ztAuHZGE1ZNw
 MpWphk/FSEBZS3Gbqfq/Rgn18S34+Y+llp0Tdec5b+jmliL2o7eyxNo0y9SoiYn/EG5K
 7JxjUjH7DvaiPkioPutqMgfPq/61KmHohWsjRctzJkDwHdTL3SOEc3QDOdEL0epxpuPw
 KzpRXYptwcaJBYXJYoGL6S/wsFdQqTTh5sIAzBrlxSO/hVZe5buA902JN/Ks9qy6BQwl
 f2XAVfY/9hIO+jyYnQaSriH+nu1c6wYGeFRlPzwVJwVsr8MX006ICFZ787rLpzC0TQFA
 Je6A==
X-Gm-Message-State: APjAAAXH7U30/Yu/ivehYoEp6WhCeeV4HNGLNM7MKDKHHOgVUivMZNwd
 qU5qzNiHSDf2pKg+eN24vsguGgpdxIlTUQp21vI=
X-Google-Smtp-Source: APXvYqytlWgxY8yGmmM2cDJEDZWBH8EhWi4sU/WAkNbOda8BuOcH06CPK1GZ26evpCKulTW/urt+yxS8POSbZvKXF4s=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr27849218ote.98.1566422179039; 
 Wed, 21 Aug 2019 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190821142043.14649-1-narmstrong@baylibre.com>
 <20190821142043.14649-9-narmstrong@baylibre.com>
In-Reply-To: <20190821142043.14649-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 21 Aug 2019 23:16:08 +0200
Message-ID: <CAFBinCDd7fnUxysHFK7DTSRwYOO788TRPtB=CSHRkGVSXW6xSg@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] arm64: dts: meson-gxl: fix internal phy
 compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_141620_339281_59828BF4 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 4:23 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-gxl-s805x-libretech-ac.dt.yaml: ethernet-phy@8: compatible: ['ethernet-phy-id0181.4400', 'ethernet-phy-ieee802.3-c22'] is not valid under any of the given schemas
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
based on the explanation in v1 we can program any arbitrary PHY ID so
Jerome's argument to list the PHY ID here applies
with that:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
