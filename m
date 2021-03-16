Return-Path: <SRS0=920s=IO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF78C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Mar 2021 00:27:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9AD64DD7
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Mar 2021 00:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA9AD64DD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BhW8e1c2gLfMiSH2jIoaiUvbyob5gr/rJv7DKzJxiug=; b=U7soUJ+XnVXH4tzjyXqKtzrxW
	MpHhWzd6FHXBGFcIqivSKNhAkGtI7o4hKhsmT9apG3+XRli8FpaFtcC2S6bEkgGOPJNdEPUPucNaO
	boOeP2yyCfxgbCUfBleu1mLwT9wDEa8RNnNZIlZHs/X2j3t6Ps4RiY+KlTYoFVzXHhfWTa47qNFPd
	C1Ge01dXTe1IH3GwLtIUfrxY2TZhnsYDqRlRUycSWnIV1iDw7Zq6evnljoTTXZuQJbsyIJ5VkBchq
	1h/crFPrriC7DPo1r/5y9DedkALt4WzrIFeFr0mnvMMkhwacYdmFqAM1JOkTwU4T9/8yvwuswU7Tg
	B0fsoV6DQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLxYK-00H8Ib-Ub; Tue, 16 Mar 2021 00:27:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLxY5-00H8GS-Ta
 for linux-amlogic@lists.infradead.org; Tue, 16 Mar 2021 00:27:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id c16so16142311ply.0
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Mar 2021 17:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rZUYFJv5Y/9QIzNACfb+ndYMjACnAQceRVQGoMosV8E=;
 b=OBkNlRb6xN2ayKnNDcsEKLQ2gG31LmzeJ53uREMYQRPjArgckrti2329xjYJSuzwm6
 EXBtiaCXIiqM7X8gBMEtZHXBEQsFC7TZ9hMY4hAvLArEqEFQcZWDKPV/OtFa/x6I8uGs
 Wf2h74dXSXFFJ8Sz8u5Mnrdu/ZOdFEG6OVpbdQiNJ5edGJnJkuxycMFkN8FMINZzRRTU
 fBYgnh1oE1DYRiQYC7ysJ2+Ik7SzxK0nsZEPDKofmyAOyVEAHY5qAi5gyUjUbwwY4Oci
 LP0o81Lk1Rh6Tid+Ugt5JPPck2VD7iFJ4S7FgULsC9zKdZ9l+JoHYzPkyCpEcGl1M2Y7
 IvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rZUYFJv5Y/9QIzNACfb+ndYMjACnAQceRVQGoMosV8E=;
 b=gICygb4gjXMC3IC6zeDZdy0Tu+4gXK7Ik3vPXZi0pvF79QrLfvzrWhVYTneDh+60PX
 xkkypRl3/nMM3gkfF6BV+y27l+o1q3xNpPFsiasSFrM3RbErO1HqWKcuUP6zfO83yK17
 ZP/fO7ISlQ5qb/MvdYRUdKSSvWDdIUnqMimX5KuuzrbloF4M5JopmUQQALOyEpNz3m5R
 YWS3DwBvUEYGibM48Flls/jSim0MBeBye87TIrDjWm/4jDct8boweo5E3SMYBetUJ2l7
 FvUAB9ZQDtP3Xsmu2nVmztANZ3VlQD8BwiuP1J8ICD+WaOdOD4dt2tMvtOhWXxSoCMR+
 gw0w==
X-Gm-Message-State: AOAM532tB0BYQNW4v6iT7ZCtL1HTaYis1WjSTetdrltZpLVv027cSaMF
 t9RFZmiu93WWO5j1fjdQCfsYeg==
X-Google-Smtp-Source: ABdhPJz4b0lMXsFarjs4hvv7b56QCJbNwlB5BQ3EhjhfU5mMZX5sesLrrn5nUl1ecUAXszvidaqo3A==
X-Received: by 2002:a17:902:b78a:b029:e4:8ce6:fb64 with SMTP id
 e10-20020a170902b78ab02900e48ce6fb64mr14231808pls.77.1615854419519; 
 Mon, 15 Mar 2021 17:26:59 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id p184sm14663118pgp.13.2021.03.15.17.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 17:26:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] tty: serial: meson: retrieve port FIFO size from DT
In-Reply-To: <20210315083459.359773-3-narmstrong@baylibre.com>
References: <20210315083459.359773-1-narmstrong@baylibre.com>
 <20210315083459.359773-3-narmstrong@baylibre.com>
Date: Mon, 15 Mar 2021 17:26:58 -0700
Message-ID: <7hv99seyel.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_002702_130464_696914BB 
X-CRM114-Status: UNSURE (   5.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Now the DT bindings has a property to get the FIFO size for a particular port,
> retrieve it and use to setup the FIFO interrupts threshold.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
