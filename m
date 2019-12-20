Return-Path: <SRS0=oQbn=2K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE03C43603
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2019 22:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3912082E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2019 22:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFWKUrBx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3912082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcYPTxLSDMtW0Rad7PAeD52Si5ALvXADnasXKua8puU=; b=pFWKUrBxQHloqI
	jG2vrH5cvrpw9kHP4cGLJlsQ1jkRbmIprMfe+xuw9+xWK4s0bFw8CKWoogu8bzD9gnKlwyF7AF+A3
	xQ5c63/RyfYYWtqOIXNQZRiKN9wNyAu5RYTrb7+uGBvVD9E5DaSoUAUTGcp6wMhcxP7zftEP7FU9y
	66M4ufR1SoKV7ING7bLNFxGOG4QjPPdcczwRMr7sIvdOZ7roqeYJ7UTq6sUSnkLueGDhrPuun3gcx
	vMg43kABlZabs+LcE8U26vp5KPlMgWF0uIR7FegBxuRRlU5SD0Xks8UCWuAip4xvd8HAKQfBkzR28
	+BIv4ru/Q0mVjvooHxnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiR4B-0002MV-1v; Fri, 20 Dec 2019 22:48:15 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiR40-0002CW-H8; Fri, 20 Dec 2019 22:48:05 +0000
Received: by mail-il1-f196.google.com with SMTP id v69so9265216ili.10;
 Fri, 20 Dec 2019 14:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5ydh8/8SwQZQURpsj7H5OMlNH6BqWqcQ+ZSr278ZEo8=;
 b=NfCijt5f3ZcIPG7Fz7oWMAQCWsXvqfVqs/enQPc1rH9qwFaC1xu7Qhj+ekre35/sQ7
 pk7/Wdm3FCdnlzhgrjRVlTsixly0CyMQ0yNk7w3blzh2lS509fQNe7PREvMW0u6sHSei
 8OAtXPNKSYUE/EOQq2gD0iI/UgHduDvoz92oImnPPNG7v1HJ4wlRS+EEVryyUlboUbQg
 2Ah4R8KVj519OsnHVnJkqn/VfPcsqVkuZOMOYr8D+Y1AFf/5dSrp65AECEWY3lpKma12
 umLGfMMgkxrVuTFyPoUigpxkz18IyNCCVgrat3cqJ0AdG7AXS4RfI0IW9OPiGnAp6ncQ
 YvnA==
X-Gm-Message-State: APjAAAVW64kTUC2gMrUdveBiK3F0MIrPA4KmWw3DTyzLcjhuYcyFGtrN
 MqOUD85vxDwwzdPRBpZa5wtjIYo=
X-Google-Smtp-Source: APXvYqzy+s5mc7VlnG7SFlraOtuA08IEQUgo479SMw+kCniTuFHiYyY/N6k1UpCt0aeX1y2CIkVv9Q==
X-Received: by 2002:a92:af08:: with SMTP id n8mr14166376ili.217.1576882083423; 
 Fri, 20 Dec 2019 14:48:03 -0800 (PST)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id j26sm3918819iok.3.2019.12.20.14.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 14:48:02 -0800 (PST)
Date: Fri, 20 Dec 2019 15:48:02 -0700
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic, meson-g12a-usb-ctrl: fix clock
 names
Message-ID: <20191220224802.GA26316@bogus>
References: <20191218142613.13683-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218142613.13683-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_144804_570718_E22BA8BC 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 18 Dec 2019 15:26:13 +0100, Benjamin Gaignard wrote:
> dwc2 bindings require clock-names to be "otg".
> Fix the example in amlogic,meson-g12a-usb-ctrl to follow this requirement.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
