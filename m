Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EFBC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0914B21841
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 08:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTCz5aXF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dm51qNeH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0914B21841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUKw+jswpW3/mZs+74NBup81DKEvnuwmnnJffXbmVw0=; b=bTCz5aXFuQDn2+
	Gh8gAEXuVLUSsL8glYLCPQQ9XwuVkYTuSmZr8HVxgJOzGPOXPvrHsvkYqRxasd4JdDiOZmLIlrGEh
	5JF1T/nFyESJ5NbAqmKxHH7vgbtvAO4ku+6aAu8tkX3NgdlM05MUMh4fnakfmxGbMd6LfNWcb8SrP
	Me12MbVhdsemKVJf3ypJk9DqWovB6/2BjNe4JO3UsEnmsRa2ohA4cIY22B8xjS3jbAq9whMqPGQgQ
	p+lSCVWEqaLL/SVvQ8T/LFAFrSQuPHh+wOtAkw9VNNXSFIfhBPn1GnXVTGCTOuM6b6xIKSDbqf3N+
	KrcpgoIELISrspG3ewDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Wo4-0001xw-BM; Wed, 20 Mar 2019 08:42:40 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Wnu-0001ow-3m
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 08:42:32 +0000
Received: by mail-wr1-x443.google.com with SMTP id w2so1692919wrt.11
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Khces7qT2m8HFFKRp8AJWyypjzmE3/8KdzReFIHFBrw=;
 b=dm51qNeHXz9GimepCbpGtgX7C4ilR/qEjsT1gslXVi0b+E3GHExP/ctijqoD/wZrlb
 LEebjajzbfuBtUq+9XcGAKVM9lLTF4y+K7xw5pFSUhQd4RF3KrZThY3I4c6eJtUmneWg
 p1PlnoaMEI+2aCBoksI1wC5kq2/xtzDK435xGoeQaZ9v4TlSB3WsKvyf1U9rbQQ3AxQv
 xaScPKxQ7x26GO3qdcV6K81NDqRABJUYdC64FBkT/xcH71bFd9By341fkqxX36cJ8aqR
 s2A9+UGyH42/2u+vb6ucwLXHLnvs8AtW7XLN7k4k464tfQrSB/5tAt0xqre7KyC2reEG
 /MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Khces7qT2m8HFFKRp8AJWyypjzmE3/8KdzReFIHFBrw=;
 b=WWVaDgdnb/S2K5A6XirCRZWZXHHs5kQ0QvC4aOEAp/X018UxrXfyxoJYqQjHW1ekLQ
 cG9CMT9OvblmEURA153PbQpuefaeVPerillR5AfT/AqMcQw4bJLk0/wLHgNmZ4lNSYMm
 V/MGs0oPy++OV0Eo3RuGpc46iYBc4+IolNSrseqoCKUxUsrys4Exe5Y7VD+9tFf1JNiS
 E5Wzd0ybDLeyo5QSUfbIaZzy5/HdEVbmqspG2648c0KQtckJwbUB+T5IUwiQctngK/ww
 LvwTfTP4t9TEU0JvKAIrAvTxnMBW/JoW9/zYu0NnLinZCx2XashM5W1BD4aB5Wa+dRvY
 Co1A==
X-Gm-Message-State: APjAAAWR4p8QXV8DEnn4TkVTOhi+wbhr5KIRnLrYJ7p1FmnOmwVDK8ZO
 o+0YWuQYYXQcxvmdQS5nIrfT+Q==
X-Google-Smtp-Source: APXvYqwG97zRJsbaHLR0TvpQl+MzQJp14Irn0t2t2kj3gIKpfgEXOwxafiRrrGrdOuRzZWsb6MZ/VQ==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr12556246wrq.279.1553071348102; 
 Wed, 20 Mar 2019 01:42:28 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 n19sm1272157wmk.35.2019.03.20.01.42.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 01:42:26 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm/meson: only allow using meson-canvas
From: Neil Armstrong <narmstrong@baylibre.com>
To: Maxime Jourdan <mjourdan@baylibre.com>
References: <20190311105144.7276-1-mjourdan@baylibre.com>
 <375bb9db-50bb-000a-077b-6f090ae73039@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7c9b4a05-bfc6-39d9-f8cf-6698a7b2e3e7@baylibre.com>
Date: Wed, 20 Mar 2019 09:42:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <375bb9db-50bb-000a-077b-6f090ae73039@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_014230_157435_4755084B 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/03/2019 13:50, Neil Armstrong wrote:
> On 11/03/2019 11:51, Maxime Jourdan wrote:
>> This patch series aims at removing access to the DMC register range from
>> the meson DRM driver, and is the final step at fully migrating it to using
>> the meson canvas provider module.
>>
>> Please see the commit notes of patch 1/2
>> "dt-bindings: display: amlogic, meson-vpu: exclusively use amlogic,canvas"
>> for more information.
>>
>> This series also incorporates a probing fix proposed by Neil Armstrong [1]
>> although rewritten because of heavy code changes in the corresponding
>> location.
>>
>> [1] https://lkml.org/lkml/2019/2/4/152
>>
>> Maxime Jourdan (2):
>>   dt-bindings: display: amlogic, meson-vpu: exclusively use
>>     amlogic,canvas
>>   drm/meson: exclusively use the canvas provider module
>>
>>  .../bindings/display/amlogic,meson-vpu.txt    |  5 +-
>>  drivers/gpu/drm/meson/Makefile                |  2 +-
>>  drivers/gpu/drm/meson/meson_canvas.c          | 73 ----------------
>>  drivers/gpu/drm/meson/meson_canvas.h          | 51 -----------
>>  drivers/gpu/drm/meson/meson_crtc.c            | 84 ++++++-------------
>>  drivers/gpu/drm/meson/meson_drv.c             | 68 ++++++---------
>>  drivers/gpu/drm/meson/meson_drv.h             |  1 -
>>  drivers/gpu/drm/meson/meson_overlay.c         |  8 --
>>  drivers/gpu/drm/meson/meson_plane.c           |  6 +-
>>  drivers/gpu/drm/meson/meson_viu.c             |  1 -
>>  10 files changed, 53 insertions(+), 246 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/meson/meson_canvas.c
>>  delete mode 100644 drivers/gpu/drm/meson/meson_canvas.h
>>
> 
> Will apply on drm-misc-next for 5.2 when ready !
> 
> Neil
> 

Applied.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
