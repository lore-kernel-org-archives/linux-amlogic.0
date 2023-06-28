Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE9FEB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQzmXqUqRD6b0GClMqeZen6SbDv8S+cxMTap+DE9j1E=; b=k8Jb7h80Ka1cwu
	Fj6WOheTPtb4cvgu6u5Md/WHNq7slY0JplqmW/iH0Jnh/t/BJMRfusvGuqhpG2gJrkFVlxq9v+t2I
	VXcCp7G9Jc0ejz6aJ8jJ/es30oIKT0GTylgnCAd39RI45oK13+eiyhWDtDg2v9Go7P0Oy1W6X9ezW
	hgB8+beELWaHOh3+B0n/m5hmuSR9bBRRV+Oa6Rmx/MEP+2wWPPI3GOnAXKB2qb0GmUzUvFO0iBMYk
	ccxkXRjkjbJumvyD+2Cog2FAWKjwe2opqS6Eiegma7QGYO9cZlia67ABYfVzywXrGJBv022dbbYuQ
	zHNSgJBRAD3dACk4nvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEc9u-00Gh03-1l;
	Wed, 28 Jun 2023 20:53:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEc9s-00Ggxo-1A;
	Wed, 28 Jun 2023 20:53:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99286af0260so29728966b.2;
        Wed, 28 Jun 2023 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687985575; x=1690577575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgeY2wMTlgSvSCHlBTmqcDVwb3LQt8lStfqknJt83hc=;
        b=Bk92WbZWXeWJgE7UYi3lAHkDWOXeYToZo6eT7612Xktiol6XwJRZ+vex9GjU/tylsm
         HUhUO62zUSFp8YULcBzMFgC5QnPifRld0IRjnZThPy0XrWq+2nsOFEkyzg4/ls2Ol1Y7
         aGUWxuTnOIbBsCCv6bTrPpzJdSfiSoKVOO9IIqpvDxSPMNVD5Y8dISywU0IuPitP1WJ2
         q/5umI+RIpQsD/Wbnz18usohiQQIb7Bz5InXWi7ncR4KpnD1QmcP9k00HgjUDa8wE5t/
         3sgjthC4HQ2X5dRooMbYpoNimVZWoL/4HMTriQIgy7PJRC0y6sIwobwdYFbDOZ8p/sjo
         QTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985575; x=1690577575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgeY2wMTlgSvSCHlBTmqcDVwb3LQt8lStfqknJt83hc=;
        b=eHLfyss9ZQaOE6zxZ8Q/jg4vXVNruea6o4a2iHa68D+A4TSmWHmbEoouQA+aMD1TNj
         x/++eIJiQjkjUMj5rnuiMfECqysETWdQQ5xIbZO7/WgXdF4cX+uw8LqPXD7M6x13w48i
         oOrzg2RQZtxENIaVlkiZY2b72hsKXRzPd4bMgrN7bVzox/LMvXnMMtx1+ncSJFn1WoJv
         t6VVj2Y51FIxxF4PnDMng6Cw5mAQNU7SSHw+M0TJyyuoi0NPACrCCiY6K3AIUnki2kPb
         8FkEjnvl414o+JIMtbyUASj66zSq7mOa48aRSKkA7pZorO1uTDBzei/XWAd5TsRHWqIr
         TdWg==
X-Gm-Message-State: AC+VfDyBXPD65u83LIlL14MvFerCH9epAEmUyV/yPTkKuLPKQfC78SoU
	kfLMfPW8KRS7L4YA0gfOjYBOLmdHj8VjBKiuEhw=
X-Google-Smtp-Source: ACHHUZ4pX5s00tN7NpkfZtIaiOzk1W+h0xunJeYGl14FuxeQc1OTu2WFYSJu033zkhlooHSNZRWQYI8basMEmtDLOGw=
X-Received: by 2002:a17:907:a058:b0:992:48b9:84ef with SMTP id
 gz24-20020a170907a05800b0099248b984efmr3718883ejc.29.1687985574952; Wed, 28
 Jun 2023 13:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230628091533.3884385-1-huqiang.qin@amlogic.com> <20230628091533.3884385-2-huqiang.qin@amlogic.com>
In-Reply-To: <20230628091533.3884385-2-huqiang.qin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 28 Jun 2023 22:52:44 +0200
Message-ID: <CAFBinCDvtFXRDQoim=_b94cHmiQLBAZHmeK0GJBfB4nixyBgNw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: interrupt-controller: Add support for
 Amlogic-C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	hkallweit1@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_135300_401329_3ED3D00D 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTE6MTbigK9BTSBIdXFpYW5nIFFpbiA8aHVxaWFuZy5x
aW5AYW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4gVXBkYXRlIGR0LWJpbmRpbmcgZG9jdW1lbnQgZm9y
IEdQSU8gaW50ZXJydXB0IGNvbnRyb2xsZXIgb2YgQW1sb2dpYy1DMyBTb0NzCj4KPiBTaWduZWQt
b2ZmLWJ5OiBIdXFpYW5nIFFpbiA8aHVxaWFuZy5xaW5AYW1sb2dpYy5jb20+CkFja2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
