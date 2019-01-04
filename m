Return-Path: <SRS0=8QoF=PM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8417AC43387
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 09:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E68D21871
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jan 2019 09:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuCnnsXw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eev7Cs7k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E68D21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XueFwls+BEcljt8jpcTU+ZP9XQyXNX84c5ctqBgIdw4=; b=OuCnnsXwQYHDv7
	HUB6FF66EBOUMwjAtz5sfMV5fC6E9sw3O/v6wpU8nDcSBA3s5h2OUMkzM6BQ4CUv3HYK6iuFXinka
	rL9mu4TzLv4+R/3HsyEvd/hSEJJY74ZyiFtqPP26DY6z/0JGu+MG8W8qV07vIfbwQ5TMt4J9CNIqy
	RNKoTak4AylPU9aaU8PKAcf41+fHQKySUYr8vt/sjqKUAcaw5pW4ZaE993nVtZN0x3zU98oghpWIs
	lcuzRhlkIT7WQ24gI/zadLpokoQt1/m3H7pq/FCiv4oqysWreOy6/DQwP0FAB/kAeITUVRbW0SLsz
	6CLIXKY5nH5dUUcyRm2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfLdk-0002SJ-WE; Fri, 04 Jan 2019 09:19:41 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfLdh-0002Ru-IN
 for linux-amlogic@lists.infradead.org; Fri, 04 Jan 2019 09:19:38 +0000
Received: by mail-lj1-x242.google.com with SMTP id v15-v6so31909527ljh.13
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jan 2019 01:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8wXozGI8YuI1FDVAsn4StDOzqsKBv3yD482LhH8gg9s=;
 b=Eev7Cs7kd8j1M4TS+40uT0caIasHzYAV6qcDNXUs6TJtmpZO0HFceRgTDfZFTlTxDn
 2GnUF+26eFVzBd9xA17LKaHSXnSgN9EoFZca7ZQprf8Hwdv1iHndnmYmaTbhAR81p0+B
 pt5msIIISD0g0radgnbpx7RNuwHCOjL1/0ZmaIZr84htICZhZ/yfX0K2H2+rj46A0a6t
 oRcB1hKNzVMsq5+8Kr6JCUCszuznKJLZjTzRkVfV/xWEhcaMN2FwQtOEAKYWv02L9Nta
 Ljj008Y8geGRbMmP98CgSSKSYLitj4JXqpsmBnG1WpxZ/lKav7m/XgwCx7XkDVDripJY
 5TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=8wXozGI8YuI1FDVAsn4StDOzqsKBv3yD482LhH8gg9s=;
 b=IOmTImPaNlXLx1Hj2UVlHZ+MxN8ZzHGLVB9cSMC25TujKziHh09UeLbpmFTk7DNNcT
 NglPbd0Fv7MLtaMLOQT8fFp7W3kHz90aFj83PihICKyRsZIycVfUw5I3HB8xrxCuv4ZL
 WBm37JGqqiAv/ooqJcpNxhxd9JAujwD/ZZcT/FORUFEoQNsAz2hymGYrH50YcuEENpYf
 iy5t7XSMXS0M3EWSUWJpUErZMeuouHRKIASDbefWOS0E9zIjP8nGdvOmR8hyjSlO2Qs+
 NQtYQDBeos0KcyvTo1HmS9qaoO2uWkAHgKobsBIkosPjZYWTTvb/NqHbwIXQxcZuE+de
 NpUA==
X-Gm-Message-State: AJcUukcdI6zTON4NrJxQ81XOCeMxtMSdpHZzcFTMV7qGJOvGosj0cpVc
 Ln5uMruiF5Zeo/HVi1+DO+A=
X-Google-Smtp-Source: ALg8bN7q8xNst/rRtAy4SHpBOVsSTTihoV8SnOZ3fNz6BEa6H8iZz//SoHoE/aNxPuzG56XD8jWznQ==
X-Received: by 2002:a2e:9107:: with SMTP id m7-v6mr9482272ljg.23.1546593574861; 
 Fri, 04 Jan 2019 01:19:34 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id 67-v6sm12247247ljc.26.2019.01.04.01.19.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jan 2019 01:19:33 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gfLdh-0001JA-3y; Fri, 04 Jan 2019 10:19:37 +0100
Date: Fri, 4 Jan 2019 10:19:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
Message-ID: <20190104091937.GA4737@localhost>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <86bm4x6830.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86bm4x6830.fsf@baylibre.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_011937_610970_304ABD04 
X-CRM114-Status: GOOD (  16.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 03, 2019 at 05:04:35PM +0100, Loys Ollivier wrote:
> 
> As suggested by Neil Armstrong - this GNSS device seems to behave like
> most generic GNSS receivers.
> I'll send a v2 with a generic driver that works for both GlobalTop and
> u-blox.

That doesn't sound right to me. Judging from a quick look, this device
appears to be based on a mediatek chipset, so I suggest reworking
(renaming) this as a Mediatek driver (gnss type would be MTK, reflecting
the vendor protocol) even if it happens to look a lot like the current
u-blox driver.

If we ever add more features, like support for some part of the vendor
protocol or maybe 1pps, things will start diverging. As you noticed you
already have the generic serial gnss implementation to handle a lot of
the common bits.

> Loys Ollivier writes:
> 
> > Hello !
> >
> > This patch series adds a new GNSS driver for the globaltop GNSS
> > receivers.  These receivers transmits NMEA output sequence as soon
> > as they have booted.  Power management can be done via the main
> > supply and optional backup supply as defined in the device tree.
> >
> > The driver has been tested using a GlobalTop pa6h chipset on a
> > Libretech-cc board using the expansion header. Changes made in the
> > board device tree can be found below for reference and testing.

Thanks,
Johan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
