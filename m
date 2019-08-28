Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D93C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 15:12:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CD622CED
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 15:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5cDeHTr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B2+UPSog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CD622CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAhmX/kpEp3ihm0vW6rC9kW81ErzCn4RbYayMAkpBaU=; b=h5cDeHTr4hUgNy
	iT48DtICDOD8W2dH26J3tedlAkDk4tDe1YgSW6OArGoWg345WLBv/l97dwHX6YHDMVlJqdJ0T/Q80
	Hy3p6K94JCC4ACcdS8wSxSFZ3V5+dr07y6rxy5dIcvaOAEndzCjWfnow1vt11UHYyTR3sogqqUMEq
	FBC8nuI5qcaIBiASoTcoYkXfGyD4Hecz4/+4i26gUJNbdjAWSm2z9Y8av8LFyVec3sysb9TuV99tX
	ISevgLNCRt23gtYSdOvwtwE6JICIoCDNsdeL/VnJhOyghT6Hl5ltUO3OeR7ntcqjk91LhYZuzSX0v
	GbXmRmRjNN88u6uwKbug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2zcc-0006io-2F; Wed, 28 Aug 2019 15:12:30 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2zcY-0006hi-Rl
 for linux-amlogic@lists.infradead.org; Wed, 28 Aug 2019 15:12:28 +0000
Received: by mail-pg1-x541.google.com with SMTP id x15so1628010pgg.8
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2019 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XcJ6NYlg/uL9WmWriXAoX9eMie6Q9zQs2ri3z33W8Do=;
 b=B2+UPSog7z8YLILm6YZplhJNxIH5DioVNm5Whk2+ecAMQWfM0n77Oz3Ge9I8H/Vpti
 z6bzqGN+baAi0yG18A2r5n2QkdsN3rtnXK/XfCMIizgEIY1jHvCBz01TICGm4RMM78OP
 xKiIL4fyqd73KHRwzu9Eo2PqQvL5qbVvdv/hI8g0PfQuP5jlQg3l4juQvANmy6I/MKXU
 uDQh9BAq/H88QsdenOLMwPYExjsjktzeUbybwynwBrdnzSmr8LimKn/fFKjG89VIAZb3
 g/pB+GdmD9Z0iurJEiuMYQXq/MYUV6eU20W+ajDVpS0S5SBMVuTNd1VlmB99/FSmiEKX
 cXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XcJ6NYlg/uL9WmWriXAoX9eMie6Q9zQs2ri3z33W8Do=;
 b=NmStDkUN92OG8ob8I6JSWQ9p2+V2x6NWiskO9y/OGFnNbgHQV11plfUXHqSDeEHCjz
 tvUeAvW/b40cXQBt5gXFkDrjTFoMGTKUHZgMQo7BA4fMbB1wGKll6TvZ85iCb7aS/qtO
 w1Ro2ivm6pwUb3poG7osu+PjjE9eYUuCxS9zAvmMUIS62TVyF61bglAZ/aGTjMGpSQuj
 fkjJEp4qZioj9rdI8BNeu7TACLMD9csOq8FvH361+wsSwh9u0b3wuuHGPMYl2JifkN0k
 Hppkg4mPOhUtHR7rORMdUkKgp0rGb+tYLu6jp+VI4tvG8U3JCm0mi+nKsrV0/7oBHuzw
 pW0w==
X-Gm-Message-State: APjAAAXBHJ+2X68msvZEiHp4Vr0VNN9r8RcjS7Dg8R+lyqCxxE5syJKN
 UGZSW592RZUbiCBkOKFAgthoWg==
X-Google-Smtp-Source: APXvYqz97Mimt+J42SvRSibm4RDZVnMCd5grLb1uXWfEqZeh5eyLN9Msos0FMr0J7qZbOn21/oz1ow==
X-Received: by 2002:a63:2b84:: with SMTP id r126mr3994757pgr.308.1567005144906; 
 Wed, 28 Aug 2019 08:12:24 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id l31sm6950443pgm.63.2019.08.28.08.12.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 28 Aug 2019 08:12:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/meson: add resume/suspend hooks
In-Reply-To: <b8ea00c4-3749-e571-edb6-ae5091b23247@baylibre.com>
References: <20190827095825.21015-1-narmstrong@baylibre.com>
 <7h5zmixvrz.fsf@baylibre.com>
 <b8ea00c4-3749-e571-edb6-ae5091b23247@baylibre.com>
Date: Wed, 28 Aug 2019 08:12:22 -0700
Message-ID: <7htva1s4rt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_081226_909254_ACD4B44D 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 27/08/2019 21:17, Kevin Hilman wrote:
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>>> This serie adds the resume/suspend hooks in the Amlogic Meson VPU main driver
>>> and the DW-HDMI Glue driver to correctly save state and disable HW before
>>> suspend, and succesfully re-init the HW to recover functionnal display
>>> after resume.
>>>
>>> This serie has been tested on Amlogic G12A based SEI510 board, using
>>> the newly accepted VRTC driver and the rtcwake utility.
>> 
>> Tested-by: Kevin Hilman <khilman@baylibre.com>
>> 
>> Tested on my G12A SEI510 board, and I verified that it fixes
>> suspend/resume issues previously seen.
>> 
>> Kevin
>> 
>
> Thanks,
>
> Applying to drm-misc-next (for v5.5), with a typo fix in the first patch commit log:
> s/suspens/suspend

Is there any chance of getting this in a a fix for v5.4 so we have a
working suspend/resume in v5.4?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
