Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E422C4727E
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:28:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E136B239D2
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b88z+sqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E136B239D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YCJZ88ubZaia7aspTcQWnWYRsCvuDuRu222KTqUSlrM=; b=b88z+sqOUUlbTcK1I5rQXEuV1
	6ifZUOZ+UyhU9n/1wE+JA1tQ4PY7rzMcQQZryUMcXQQxXDH98Y5KeklE3cQmpumNub6A/qi7Knnuu
	W9brDaKb8IGD6d344QrEF/mtXMFaJqINfzNS75D5GMJzm8xXaHGUjds6snxrluQtViHmToBg1Qc84
	N7/v5mK5TMgkunTY/2hXbQCgSaA31F5WvkDKOb9NlJ3Egc6SK3dQvdOS2yzpv/uYWMX7vUJfnb5bb
	xC0MOH25X9AoZj+x5R3npujhsNX5xDuja7usTZOHm+5PPTfyq4IWbZzKVn1YDqfqg7GpTShOlvFhi
	ekoRO72EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtZt-0004Ev-Am; Wed, 23 Sep 2020 01:28:13 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtZn-0004Dn-V5
 for linux-amlogic@lists.infradead.org; Wed, 23 Sep 2020 01:28:09 +0000
Received: by mail-il1-f193.google.com with SMTP id f82so19210025ilh.8
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2020 18:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QS25WlOeUPQHrCUw0cdos8+dV1aU1kXgtHvYAn4oQeE=;
 b=ET8flIKmpmRkUCidJvzXOC7eLsa+8W+qWhygbi4iS6FHZjHMcfQtF95sYBpoCOd3x0
 1tcPFbvr38BUq6d2w2k3P+O7V9zl76KyGtuq3ESp44uxJwYQ8w3p4DQW/UHAiT7HSvno
 tInbnz9UPhv+NqQ84T5wFbduyQPX6qysUuXawj2dNg50GV1gaav94MALJmaL25Gtavvp
 M9BBhM/Lqiui8MJr4JGbewfSA71KdTGCkPwAPAuNyxnnA/pBvPFVh+gJ1CKaV6vMgYxh
 jnkOSqAdjVW6P63zT2EayQMsAExra8elXtDJnXfyFJiKUpj+ck0u8TeEFWOYfRaZnLFe
 94ag==
X-Gm-Message-State: AOAM532g5CUMmXeqMrNzvN4N8cGSSHcs8U8mdsG8bZRPoWTqiLvjEClj
 EWVjexRt5QsaZwylCDpDCg==
X-Google-Smtp-Source: ABdhPJyDq6KsxVdqb84529uluzCnDBXafHIUSIQRG2lkorieEL37IUfKunEyKovQlRGvCFWv3dY7UA==
X-Received: by 2002:a92:dd8a:: with SMTP id g10mr4971211iln.125.1600824486322; 
 Tue, 22 Sep 2020 18:28:06 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 64sm8414847iob.36.2020.09.22.18.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:28:05 -0700 (PDT)
Received: (nullmailer pid 3655638 invoked by uid 1000);
 Wed, 23 Sep 2020 01:28:04 -0000
Date: Tue, 22 Sep 2020 19:28:04 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top
 Display Optolelectronics vendor prefix
Message-ID: <20200923012804.GA3655566@bogus>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <20200915121912.4347-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915121912.4347-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_212808_005026_E08086C9 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Sep 2020 14:19:09 +0200, Neil Armstrong wrote:
> Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
> from Shanghai.
> Web site of the company: http://www.shtdo.com/
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
