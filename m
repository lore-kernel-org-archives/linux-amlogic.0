Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A99FC433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 01:30:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6180661396
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 01:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6180661396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R3h8uRfL4D3P88mPXZq+mTMtDFWcgz6i64ij997RBVY=; b=Ad5TU8WVmVevRHcQrmREwxkDR
	7iOBqONn4TCpnMYzIQ3trlKepWHyzgpAAuHd6C8PwieBy/d6lru/YPxLrF9Ny9fay2pa5SMC78iUP
	tsT7NDm7K6kQLziUUxSflgFNBYOGLTnyMkiYhPcbxMq+WVNQi8TT2R7ygn+u3QLEPGX8GbWo4LKJH
	WaZYrn62q1IjmAeF67zGAwQA0fPHk29TBia71WZJJuiz9RtiNuDn5YzhyFnNkzECwPyW+mWSozD2A
	wcXqE4RqShsFulb4UYVYpJ+TInnshfCiCi3+xdtm2KeHXCXy/Xq/EDezxgLS5+4vgobICdmlewPKy
	5FRvepMwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lioYa-00Gd54-Ia; Tue, 18 May 2021 01:30:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lioYL-00Gd37-79; Tue, 18 May 2021 01:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mtEq8j55mxGIhLsxC+0Tt9kquORYhapeNt/w6anQQt4=; b=V438+BychtSNOmHO+7m0OZokx4
 I+okaxLU2JlINzxzwcCCGAvwCWGcXkdDXO1ntQfrkxLoVC9dQbHfP2dPqUsDDDwE2o17tvB9VVbDU
 rdAdBoM8V8taOTBDH1gd75myTpJ8Id1Br8KT6Dl03lpZ8GT91k80Pjfj87Z5HG0XulaTE1u5TH9G5
 Q0Vq8dO7AoQYRFbIsTZklhNlTp6IOxXNO3tPZdMPfkkvMjjeolEa+bke00QLE1PpZKfkkc0BW90RD
 6rbx8fV83V7ACJBufD1eM09p6jU6VauuB4h3pYWICpHmlZ2bsd1fGtHPMK7FOqUXAuXncsfyaqdsr
 K7ASxqNA==;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lioYI-00EFst-Rb; Tue, 18 May 2021 01:29:44 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so7271790otp.4; 
 Mon, 17 May 2021 18:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mtEq8j55mxGIhLsxC+0Tt9kquORYhapeNt/w6anQQt4=;
 b=EmfYMwjBZy0yd1d1Za0lHzrO8NMsTsW32gkrNOaeYbZNsE9oNV2d/afmG003uMfHVE
 gyA1BcEXA0bpnD/blKxeGvbPu+W67GbBfFUp+tPdatMQyXCt+71ogc06y4StEphz3sax
 dGvXVw1G9oTzjxhROtYAbFV588ioSzor91/q/QdN016L6a7a+r5VHpVLCjsyH+f/D8xC
 0mauR+9i3/u+kXte+sR1ROg53GxIcZhwznZGQI409B51cgQuCnt/pRstqouCvbIRc0y3
 xGPnWP1VzZOroyyztxF3hbXvahyC4dl5C8Bt3/bE+l30gVMY/8960s5NFRJfpo6oTfte
 wVrA==
X-Gm-Message-State: AOAM533mJXOZTtKKVde23iAuhG+3r81k0OwBAZ+PBHWCQ60NyEnNKcbX
 VJPMm2GWTJexc4SfI73MTA==
X-Google-Smtp-Source: ABdhPJyaIl7Zp0SviQyZPzJ4iROXA8Xzg41TCNtFf1ajSkMLSoWadKPjaKwFMNBk0DrG19v5b3+zXw==
X-Received: by 2002:a05:6830:1196:: with SMTP id
 u22mr2046404otq.247.1621301381876; 
 Mon, 17 May 2021 18:29:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i2sm3447330oto.66.2021.05.17.18.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 18:29:41 -0700 (PDT)
Received: (nullmailer pid 3603772 invoked by uid 1000);
 Tue, 18 May 2021 01:29:40 -0000
Date: Mon, 17 May 2021 20:29:40 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, martin.blumenstingl@googlemail.com,
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Banana PI M5
 bindings
Message-ID: <20210518012940.GA3603721@robh.at.kernel.org>
References: <20210514143255.3352774-1-narmstrong@baylibre.com>
 <20210514143255.3352774-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210514143255.3352774-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_182942_910189_0AD11AFC 
X-CRM114-Status: UNSURE (   8.26  )
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

On Fri, 14 May 2021 16:32:54 +0200, Neil Armstrong wrote:
> Add bindings for the Banana PI M5 board.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
