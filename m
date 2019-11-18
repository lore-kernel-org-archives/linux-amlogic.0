Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ED5C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 17:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C36321D7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 17:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cjb8vpo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kibfHyKX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C36321D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrCvSF5U86M6HAVFPE/mA3nAXmdz2KChM8b4PAYqxks=; b=cjb8vpo8biIwIZ
	H0vdjGmrAubxbObqDCEpUhRW7lOZiBw3lMdaLKW8cG6p3UsHM7BqJwNp+adK4AfSvHmNogI7CCEsd
	THPU8iu/UYjbDNR3Lz1xQC+VmWVStQS2I25NzQw6znBPda942don09WuXKyegWRoMgiNoNz2ezR9T
	8fwEj3nWfNvtaIneF9qwSAVV/InjROHniPabEbSIDMQ97xLKtfiiVDuz9y8TVFpZMag82/SnTVX9I
	bwXO5UdymkvyCtRXXPN0KQYza2FbR3H4RjHaJ+2ttni1naux7ZXsMp3ZtW0liJYDvXJ39NDllXDD4
	2xVTlZ6AVCnO4G5Ym8kA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWlDU-0005FI-BI; Mon, 18 Nov 2019 17:53:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWlDS-0005Er-0m
 for linux-amlogic@lists.infradead.org; Mon, 18 Nov 2019 17:53:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id l17so230468wmh.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Nov 2019 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cNxPWLOWv0k0np4gxN1EKWDNGg29Wv6YJvCRwVBUdDc=;
 b=kibfHyKX/xzHDpBxjpj1AXHCxkg8WvKE+3Kt/CXF+W/LmvFTDrI8MzR2MqyrYuBHGt
 cRWxTpxc66eHaJI/7/Yny11QFBwAsFXCoVN2jDNVz4hs8aPkLKb18/hVhkm8uDKwarXd
 2IEBZMpBxvZoQ4jtMocgVbcRBulyT2HIMaIIpO554RtVJOXsm3Hldqu3bEv3Z2W9Nj8z
 WpKEdmYY/16aM8ov4cTuGAJQlTbxwpPkPKX8tC2GmxmSvRZ252OwMEOj8i6pDMc0alaU
 E0IoIkOEcikNL1KJCDyyIfuzvGyE8lsNbTM73Dmlq/WKd0VqR0eXokTgT03z6ad1AAGN
 zIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cNxPWLOWv0k0np4gxN1EKWDNGg29Wv6YJvCRwVBUdDc=;
 b=iJFwdC0W2l0t7hz+7R1fI11g0n7fpbExvJf4avoVJx0v95o03anT6N4zL3Tt77eFzp
 nw8mulRKjP+jrdv3TKwhHiVVecW/oYYB3aUIw3JkFVUJlQrDZALEOy2mIRtaOFdb9LPC
 YoW2GtOn9CeZbhdG6qDp59RHW7m7SCCexaa6kZkkSXOkPIGH/AzB7SvsYqqzxb7Oyo0G
 BBC0WyjzZhdrZ++L6bE4HXtPVeW5cEndPDa0ByCBpiB7XwLrI0OPJQ5Azae6iv9CpqDO
 bRT3PmP+bBR5f2JSSHyqpoJ4Q5EotcZHbCPZJsnlxrvPdU74uxpRqkHwQvoEHEQ/OiFX
 MYlg==
X-Gm-Message-State: APjAAAWU0TC5WPq2VLSJPD1E1BBk/P+YXvOL78eoFPza+7KKTWT5qbKg
 LGxbmri2wDb5MHLDg5SE0ac=
X-Google-Smtp-Source: APXvYqyCKw2sIvnMXLgPDU0JTiC91bUCKDWA9QM16mDES/ngkaqC0Mh2VKn/1bzTsVCl6Q6TshmY5g==
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr286757wma.95.1574099611923; 
 Mon, 18 Nov 2019 09:53:31 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id a2sm20332574wrt.79.2019.11.18.09.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 09:53:30 -0800 (PST)
Date: Mon, 18 Nov 2019 20:53:29 +0300
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC PATCH 2/4] dt-bindings: net: Add compatible for BCM4335A0
 bluetooth module
Message-ID: <20191118175329.fbg6qhdzra3wa5xs@manjaro.localdomain>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
 <20191117175606.5050-3-mohammad.rasim96@gmail.com>
 <94c5d608-304f-68b8-9595-4d011b60c7e8@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94c5d608-304f-68b8-9595-4d011b60c7e8@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_095334_085892_B9DE285D 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Marcel Holtmann <marcel@holtmann.org>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/11/18 11:03AM, Neil Armstrong wrote:
> Hi,
> 
> On 17/11/2019 18:56, Mohammad Rasim wrote:
> > 
> > Available in the Ampak AP6335 WiFi/Bluetooth combo
> > 
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > index 4fa00e2eafcf..0717399191a2 100644
> > --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > @@ -14,6 +14,7 @@ Required properties:
> >     * "brcm,bcm4330-bt"
> >     * "brcm,bcm43438-bt"
> >     * "brcm,bcm4345c5"
> > +   * "brcm,bcm4335a0"
> 
> Is there a specific reason to add a new compatible here ? it the BT interface of the BCM4335A0 different for the actual compatible modules ?
>
> If not, simply use a common "brcm,bcm43438-bt" compatible string.
I added a new compatible so that the dts of the device can describe the
exact model of the module, anyone reading the dts might think that the
device has a bcm43438 module which is incorrect and just looks weird to
me.
previous compatibles like 'bcm4330-bt' are only used for probing and
don't appear to be used anywhere else so I guess this is ok by the
bluetooth maintainers, if not I will use a previous compatible and add a
comment in the dts with the exact model of the chip.

Regards
> 
> Neil
> 
> >  
> >  Optional properties:
> >  
> > 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
