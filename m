Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D325DC65BAF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 11:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F8520989
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 11:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C5Yi9Z+y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dtcJxPdl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F8520989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRsf90KEVhkdYF3oPWW7yfP3gCb5XKUC0aHJsKLY7IE=; b=C5Yi9Z+ynJRpsh
	+EWHXJ2MuJ7GOE0QQrPP/knoJu4RbclooGuLD2ntZ0z5gALUGRctRIfD5AIBeaT/iLQYj0SIMhM9S
	80tfFhHRKwlUrvhkrMmGlshMZ4WdXzBXoXmhwkaiziQuWnPXVIIsVh5C9zMqtC7uKzVpJPPQwy0RV
	E+j6z7NT+HCnv+LOJLfHRRcQfOZadWLDskpoM6ypeyKw0uYsLen2m02QWEa43SilZr+PNQdbN/iaA
	VWDQVxQIY5RYuXRpxwgxQU2nj2C2Jki1mZMA9NW6krjflefQyW2sx5AebnrX+v+a7yM2J1ot5hFLa
	tHE+zVTobk6/Wb2j8dlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVDuz-0003U0-P0; Fri, 07 Dec 2018 11:03:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDuw-0003Sc-7v
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 11:03:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id c14so3430959wrr.0
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 03:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=sehmHUdNhEP9mnyi2aBE5PWD80f9lO+Po0XOwKL8Hjw=;
 b=dtcJxPdlZs4N8ln59ci4P92mHK1uewohGZJVTd0F9l/7dTHkpUroeuY7lwS0ljDGb2
 KpZzEiVUxnaT44KZ0O/khoPfklZHYzzi/3VBWlqKgOwc5JRIutRRApO83bOY+JwDJwWc
 /wy4Th0orL1CUu/wmVm+Dw/N/qeZKndaQfc2QyxWRMUXFVwhEiEoqMHUKDU7EImUid6A
 flNYIG0U0VWub8JDLMHt78Cay01XbXtwyOJSwjFTiDBAX5qRpR+zgJpxej6ubfzFNlA5
 Q8utZJcJs00UUnO2ba+JYNgw5g7WXs+naHkrC2qFRtylsy1gypSoXXzge1pxnvvA/80t
 3pKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=sehmHUdNhEP9mnyi2aBE5PWD80f9lO+Po0XOwKL8Hjw=;
 b=DcM27Zkpq1sEB3m75Wae3MIyX3axAiQOfUocrvXSdPTFTyuayisvy3xXEIjjLAtU55
 hzebuYw3Kkp//LGSLGcjPEg39WgDSDk5p9s+YMMdHZpBUPPQR/AQU/PsCJGJ4D7bcDGv
 dMqS1PwscE+xC3qujIhvZev3A5HZm+r//baH6itYxmk7JIGy4tmpeg/SaK7HfMfzdxEO
 +sL5wffVZP6ZImIeL15IMdfoeNB2zrZeH24fyJ4CnsbqBRCJSxm+D1UrMh/MMPhFnPpJ
 VfqKU4zaZI+fti3Qs9zpV66aH+MbQ8WpzTC3fd5c6yaI+1Vgst2VeZLh2nB3vhwUxNdC
 cuYQ==
X-Gm-Message-State: AA+aEWbMqVfAE/uEoJwgVar++9E+oITAMPuAXD3Lg6WjFYML31IYK3np
 ekyPN/lReD+XcJu6W+BeMktxvg==
X-Google-Smtp-Source: AFSGD/X58vtnQ0EBX0eglh4LGvOOvMd5qx9U8apx+5Gwn0hSIDw/3NIOs11tDRDFvwj/quny1w7fSg==
X-Received: by 2002:adf:90e5:: with SMTP id i92mr1327675wri.210.1544180602490; 
 Fri, 07 Dec 2018 03:03:22 -0800 (PST)
Received: from broadband.bt.com ([2a00:23c4:f7a1:ce00:800d:14be:d1d:88c5])
 by smtp.gmail.com with ESMTPSA id 62sm2158411wra.30.2018.12.07.03.03.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Dec 2018 03:03:21 -0800 (PST)
Message-ID: <463139583299c0099c812ad12017fe6d32662db4.camel@baylibre.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
From: Carlo Caione <ccaione@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Emiliano Ingrassia
 <ingrassia@epigenesys.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Date: Fri, 07 Dec 2018 11:03:20 +0000
In-Reply-To: <44c9eedf4dc2616645c2a49b080f42a493fe03fd.camel@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
 <20181206124347.GA10676@ingrassia.epigenesys.com>
 <85973a9cd43c677ffa5c80853e86d79f36a9eb3a.camel@baylibre.com>
 <20181206155228.GA15225@ingrassia.epigenesys.com>
 <20181206185158.GA19901@ingrassia.epigenesys.com>
 <44c9eedf4dc2616645c2a49b080f42a493fe03fd.camel@baylibre.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_030334_335154_72C41AD9 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2018-12-07 at 11:49 +0100, Jerome Brunet wrote:
> On Thu, 2018-12-06 at 19:51 +0100, Emiliano Ingrassia wrote:
> > Hi Carlo,
> > 
> > I keep running tests with packet generator,
> > using nload to show bandwidth usage.
> > 
> > Here is my test results with packet generators
> > both running on laptop and board with rate 1 Gbps.
> 
> Testing in UDP is unlikely to give us clear picture of anything for
> this sort
> of fixes.
> 
> All your test seems in show it the fact the Amlogic SoC usually
> prioritize the
> TX traffic over RX, which is something we've known about for a while.
> 
> It would be helpful if you could provide TCP figures with a traffic
> generator
> we can all share an inspect, such as iperf3

For reference you can use something like:

iperf3 -c ${IP} -i ${IPERF_LOGPERIOD} -w 400k -p ${PORT} -t ${DURATION}

Cheers,

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
