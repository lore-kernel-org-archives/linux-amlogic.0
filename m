Return-Path: <SRS0=cBSj=7B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263E9C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:08:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEAB920578
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RHwwy+wG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZVcNchBu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEAB920578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyfzzzS/Ja2oPbiqypQCRagzz3/CUdkP3uGcClkWA40=; b=RHwwy+wGnzj5Kw
	H+x8z91jZEhed0zDSzdIkJpp4UeaH2uYD7aO8X5LFJv62ZLf/7/qLeXv+78OI6uYbjZAbCBpvHR05
	XQaurvEtbVzPMg+hY2BXm361z1gfMQ0mEZiBvLuIUOaDGug9wy8tJPaChktYGGDvVwbSf7XgBUhJa
	VZ2BX0nsJJxKLfRtBpKWW+e6XRD2JBSI8vTnuRIg3lWAD/hvYn8KPB4FjAN8TLX6SVM32IRQxTTlo
	PIEK++ViNvWKineFtVEI7P14Wu6Yjv8TwiVsTjrSv+7kjfsx36LQAP8aGVBIwhSBniAzzL9U/rU3+
	Tch681e6KxuvIcGgQu/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBL3-0001iz-Cj; Tue, 19 May 2020 23:07:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBKt-0001aF-C8
 for linux-amlogic@lists.infradead.org; Tue, 19 May 2020 23:07:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id f134so859909wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2020 16:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gtjA7rUrWvV/zWcpmtzFkkNrqaPYsU7iu5jd2njww+Y=;
 b=ZVcNchBuWC7ldH8aoRdu2LHqvs149CFaBuKaCLDqmTfS+32DVhNFKXNF/ycPayjar8
 nEnMHUME+wzXCQplMaJsIjuEG11AZRdohuMcjo8ekJRwQn8aXmJ8Fs0ZkswTqlTtZrlU
 Rr+G4dwVnuZ9jvZqlkuZZiaBTPNhEolichzmqEd3r0YJmP5sE65ximX0bXJbh+CRfqbe
 hdD9RoQ1cKMeLScbPTh8FURrNlGbbYYJdbQY7iqMmQAq3W5Dp+7sVz2wC8IZ6OBIeL56
 McRCVSE6W0h2PgjhGdDYvZsZblH939zKdMI+QnPC7SbMnUmupj+ARduQpYrz/DXMNI5n
 ZSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gtjA7rUrWvV/zWcpmtzFkkNrqaPYsU7iu5jd2njww+Y=;
 b=HyKC3I0WYykh2ScEI3TGbcSzeMLyRrjoai5RRhC/f5eWw0qpmeZt1DKNKE2URfXN/m
 NKxghDAyMhPjUeJENEA31zZ31F4g1aZkwU/uDWmXsjq9aZ1pT3GX+4UNlJKEfMpB6aAm
 lGOHzvPsaRi+NhV0Rlw7hBz4gK1HGZZh6IWalTtjaf7jSW6UB1qpijVPcGAyy3WjZ8fy
 YK2cJYAONaV0eb/w5/3nk+iTjFF/QlRA6vWZ9+Swbv1eBhoE5CmwhlRYZHG32D/IwBxx
 rF+pj6SaNlggPS8LVShOKPLAbXNLvZmMlbRAtFlNA3+acsZOWePVvhukunR3ZCVBMOSI
 k92g==
X-Gm-Message-State: AOAM530M4ye/7ggBZh/rXrblHdFsHFOlVSlLxTHuylJiaAxReCuzZvDy
 vnKmY7FyfIpy0Rlto20ABvLBXA==
X-Google-Smtp-Source: ABdhPJy6NqRygJRgngTo1yF6jvvyMz1ITIgNjTcTPD+fMJ3UDtjsVqYza5H1OiV60sFHYarrPm7FEA==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr1645458wmg.162.1589929662556; 
 Tue, 19 May 2020 16:07:42 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id p10sm968872wrn.10.2020.05.19.16.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 16:07:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 0/4] meson-ee-pwrc: support for Meson8/8b/8m2 and GX
In-Reply-To: <20200515204709.1505498-1-martin.blumenstingl@googlemail.com>
References: <20200515204709.1505498-1-martin.blumenstingl@googlemail.com>
Date: Tue, 19 May 2020 16:07:39 -0700
Message-ID: <7hv9krttfo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_160747_419421_E4967729 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series adds support for all "older" SoCs to the meson-ee-pwrc
> driver. I wanted to compare as much as I could between my Meson8b EC-100
> (Endless Mini) and the Le Potato board so I added support for GXBB, GXL
> and GXM as well as for the SoCs that I'm actually working on. I will
> send the ARM64 dts patches once all of this is reviewed and merged.
>
> I successfully tested the Meson8b part on EC-100 where u-boot does not
> initialize the VPU controller. So this the board where I have been
> struggling most.
>
> Kevin, I'm not sure if this can still make it into v5.8. If the
> series as a whole can't make it for some reason then I'd appreciate if
> patches #1 and #2 could end in v5.8 so I can push the .dts patches for
> v5.9.

Queuing for v5.8,

Thanks Martin!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
