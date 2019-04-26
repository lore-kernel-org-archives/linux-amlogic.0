Return-Path: <SRS0=lPQy=S4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4DDC43219
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 21:45:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA4E206DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 21:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnHD0BWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA4E206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+h3jJ2K1pulluCl2lbT7MrfhyV7AgxNtXwF2uRDOTvw=; b=VnHD0BWTzEUAR3
	vz11VvEYVeNPFy+wHkz+Sg2s5d6G/eJvKfzGem5mC94k+ooCZRRw2Ja4e/Q+GJIbdEp2sWMmpirp8
	kxZN5AY0TZnrYwsOexYfEd/5D/wxfqPYxxu18a3mn0osGLYfxdajJdv7Ebj540GAJcICXwA1bzX8h
	SLaY12mmUW1IwXwSKiu2RY4pj3j5buKWvewmO8Xd6Zdqz/Ysl0fz0N7vVh4FONzC/BOcO1XBF7rsk
	La31V+QM/NTG4p+MLCoVzbUQgdfNXHaDB/My25t0mgxIMxzsI8wFXb7UlGYak6Emyvh5L7G597dpp
	x4W4j7slu0Bsui58ZOSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK8fA-0001gb-Et; Fri, 26 Apr 2019 21:45:44 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK8f6-0001g1-U8; Fri, 26 Apr 2019 21:45:42 +0000
Received: by mail-ot1-f66.google.com with SMTP id t20so3912913otl.5;
 Fri, 26 Apr 2019 14:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uixqWZkXYqMmHxhf1bJFrlRr6J6RhaltFblgUArN8CY=;
 b=e6i62An37j7JIO5MqpyXAKQb+XYS3IO9839cLVEHDtSSPiMz6ONqVtikHs0XMLoMPA
 lUzOLboKteEjjAwDzTYt/8ylEggM7beVfv+xSP0G4GGuzW2L1xNf0twmnDkvsgG5iP3E
 T8n78m0/4MfVELOnsLEA13W3hRPG/UVcBH4I3T4XogHJZb6eKYT2+0NhdjR9LcN5UB2I
 tC6oHePi55i98eIHN7DXWmtYaHVfx1Y1MIidSmFoDGXbEYCyMnwPQuSH6pe6aayZCdyF
 lRgSpkgDU9NGMsxoXIZ7eDDE15ue4DQ7FPdy4uekKcFsKTe0buszPVATuAp49CUhQ3p2
 hV7w==
X-Gm-Message-State: APjAAAVfA86K99Q3CrQBQRqtQCwPeW0d2rwjOY/V4j+pmSMIT7UsHGPL
 FPpXHYQ5cdA8Cf+KRRGmPUF180rXSA==
X-Google-Smtp-Source: APXvYqyFL232FQopAeyXtwXlJdFgy4h/dz+IuPMIi6LrbiayrLXwjtQv+4qUbdp0zYZZMZTYu51jJg==
X-Received: by 2002:a9d:5f06:: with SMTP id f6mr28619446oti.18.1556315139985; 
 Fri, 26 Apr 2019 14:45:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i11sm10482364otl.27.2019.04.26.14.45.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 14:45:39 -0700 (PDT)
Date: Fri, 26 Apr 2019 16:45:38 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: g12a-clkc: add Temperature
 Sensor clock ID
Message-ID: <20190426214538.GA29979@bogus>
References: <20190412100221.26740-1-glaroque@baylibre.com>
 <20190412100221.26740-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190412100221.26740-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_144540_971234_6D5B3269 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 12:02:20PM +0200, Guillaume La Roque wrote:
> Add clock id used by temperature sensor for G12A Socs
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
