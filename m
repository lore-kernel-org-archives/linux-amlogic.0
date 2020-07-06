Return-Path: <SRS0=zI65=AR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DD9C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2020 08:52:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCE220739
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2020 08:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mm9qwGu/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="f1jzwojW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCE220739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rXrmLzZDfENjk23JyR/cpWiSREpDxy4qi/UVbFE2Wlk=; b=Mm9qwGu/1U6gzY9JXEwHitLrF
	TkWEtrdGtFz8XYhF+W3bwZ5Cv7wK1p8fADQo4TDH20DG3d3r2E+6gL5whASIfHRsh5jBt8fEpmWF0
	XpL58Xp+JDnOq6nHZIZlXnc14bjNsWS2r5Mo9+PB7ntpAN8RVpPQofV1iy3VRNx4P9Lt2y8dOZQyJ
	x89Znroo09T6B0864E1e2BzoyNY247cAmF3TnwEJiqWZGa88FHpWNJimXN64G61z2sFZ1EHvhH3ma
	XzSw5+d4Rg1JhbDXdoZGgx9ybbiPohzz48cX3wI/uE82sQYR1Ej0OneWzcFNH8Tx5fkZBPyeFSs/y
	8/zphn4ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsMr7-0000oc-SZ; Mon, 06 Jul 2020 08:52:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsMr5-0000nR-I4
 for linux-amlogic@lists.infradead.org; Mon, 06 Jul 2020 08:52:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id z13so39912225wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2020 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BJf3+InzF6nnLMjgHWo9h5OOBIPL2qudFLidIFScLQk=;
 b=f1jzwojWdaeB13oLsvaCgv5lDME/Z3Eh0yjhYo2raxhjnI+9vnmSGNUE0Nbx4Y09sf
 GvVTXHMNzDIUs9roDyuFsntggh/8PO86wyYEqdtCZIE6F7x+BR/gNber2uJLiuZTfv80
 2PVarTj8znBrbNhdOzP9omn1g6g0INuLGLmawWsPAbR+YPK2ZYECzcNl5EfBGfMUqOCg
 2gmWy4EwsiOM9vZHwQ7aHIXGc7/ZzfXEZojq4n9ynZ4jGcbOcRezZjGPhf93UEqWKveP
 RfSBv20z4AKsSWJ9boX0wDveG4xMYLysY1urgn3I3r/XF4tIOE3Ib+IYw3t3RLYQQBbv
 hK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BJf3+InzF6nnLMjgHWo9h5OOBIPL2qudFLidIFScLQk=;
 b=Y5UpDtPjTugoPRGedtAk2r1QEGq16Ckd+24yN68ajg1oYIGNDoh8hKHyVgNMQ/EquV
 hcSKPjX5mgIcF2H9odylSs6rtRQHrdMduGjeuV1T8knWted3iHeJwWFAZnvZ0b2MkUBP
 zzEq/leFD3fDnXlvPcxdihK/GuPOxeVi3fiHDsmV7FmqqKuO4/u5WE4w77NNGa5IuFjp
 fK1pd2PPJO75oAYnF+2ooVpLRiahFJa6sI03DTctXptgC3l8ejAR/CrrdDdgPM9Imlhr
 2bzDX/JlDyZfPN7AX5btSjFDScp5L/LGg+kQPj7yqkRkzHbAmPAsHTjwtZV0pvFXKyXL
 NQPg==
X-Gm-Message-State: AOAM5325o+MEJdm+mwLh60WWKpdhEqMmjl1HNj0K7ginmupS175p13zA
 g0TkD3HH6tQugafwoV7qi8QX8Q==
X-Google-Smtp-Source: ABdhPJyaKcqjaWVlGlA6f6J39Pg0bs5QVQeZHRADvFVD/NzaNpyGC2QVYVoNN45UF0dp+LnRvIMGow==
X-Received: by 2002:adf:bc41:: with SMTP id a1mr45444993wrh.186.1594025520980; 
 Mon, 06 Jul 2020 01:52:00 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:6959:e617:6562:cabf?
 ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id l8sm23024129wrq.15.2020.07.06.01.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 01:52:00 -0700 (PDT)
Subject: Re: [PATCH v9 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
To: Simon Ser <contact@emersion.fr>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
 <20200703080728.25207-2-narmstrong@baylibre.com>
 <RRm1buCbVQy5uesUHZhz8cPiCZfllmj0r1HzM7OoBmJBNMo9tuRfs3ju0iFnlPfDqECFq0tVj10h7bboBat7i619uNUN06HbwswBvYaPWMM=@emersion.fr>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <2f948215-3a90-d0fa-061f-20690b20c441@baylibre.com>
Date: Mon, 6 Jul 2020 10:51:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <RRm1buCbVQy5uesUHZhz8cPiCZfllmj0r1HzM7OoBmJBNMo9tuRfs3ju0iFnlPfDqECFq0tVj10h7bboBat7i619uNUN06HbwswBvYaPWMM=@emersion.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_045203_744565_DA3925DC 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 03/07/2020 11:08, Simon Ser wrote:
> Thanks for the update!
> 
> The driver should also disallow importing a AMLOGIC_FBC_LAYOUT_SCATTER
> DMA-BUF from another device, but I guess this is clear enough ("not
> transferrable between Amlogic SoCs").

Good idea, I'll experiment disabling import of DRM allocated DUMB buffers,
but not sure I can disable import of other allocaters like ION.

Neil

> 
> From a user-space PoV:
> 
> Acked-by: Simon Ser <contact@emersion.fr>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
