Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC771C2D0C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 19:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EB5206CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 19:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pk4s/UsP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EB5206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2t1WtFfEWb7rVbqL0K7y0eI8Lyo4RS8MrTB0IhV+geQ=; b=Pk4s/UsPnTGVjy
	rM1+5ia5bXLycmGF+7TNd6S9ryFL3KxGtl5bT/yIuTBGqE08NmwjlVppK0dEuODfQOuptjCvnoAK/
	SzxMpD1JBNiT6reg3qj2/ANJl/h0CKv1S4vBLDE3D72AxPnPszrGhbWJtdmo0cPamxWx/iEDxEEf7
	sSFDUQ6XCQvofJhx4/5FvnVWbWtrAWEi3jKqzMFQKlRHMEGOo/SKCsJwB770NbpkiEimAL1uOkJ8G
	+IZJSvgv7HGHUTJy3ncnCQ8zMoV3glws1D8g40gtOio4/U+i5t1evO2yjtGtmPt0sYH9sTYJyIEL+
	/HdRZdWGurAVgL6Yg8Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikYg5-0005HC-15; Thu, 26 Dec 2019 19:20:09 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikYfk-0004VR-0U; Thu, 26 Dec 2019 19:19:49 +0000
Received: by mail-il1-f193.google.com with SMTP id v69so20793629ili.10;
 Thu, 26 Dec 2019 11:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AqWJxAJe8Vgf4p53OHB9TkZmIbkYP+Pma79n+C2GBLc=;
 b=FQ+YgZIjrkfd0QtMKnpunbYsbGyEwDzDyb52f2WVo1ePo2HNPzE1q/znzBD3ilXOe4
 TUr7JRoVE3MevfbAmKWGBTEQTcF8UidF7LfVQww7mXk6WYHHXhWlfZW8OGxHpGlBE+2O
 TfCtswY6p56JaSqlFqIHxEJmfz7NOBPKprA/kR6DexvVjy99gX82kmuwU2xLajMnskqG
 8RVZZLIaQB2j2DaOg6D+K/g3McQHPEeMJipjY+6kgj0Ph7Pz4vrzIspUHsoxmM771cVD
 kwMQigSmGRzk2YyRVY56FkMrgTPK7m0QGU59PHe18Xumrmc2lFZX7DgFG5CzxtnUfCvd
 O9JA==
X-Gm-Message-State: APjAAAXyLbbqEoSWuTaeA88FJe7Mhm8qU3BayBnN0DgSF1yO1r09DvST
 jweolLiCUDCXhY9/mKJJxpcSYTY=
X-Google-Smtp-Source: APXvYqzB6YGqCYlO6/M0ZHv5gof0FiLkRfYe1t/A15ZE+3JvhhyuAj2WMHUSJkh5iVeABFNEK6ImJg==
X-Received: by 2002:a92:5a56:: with SMTP id o83mr37720479ilb.97.1577387984062; 
 Thu, 26 Dec 2019 11:19:44 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id m24sm8871530ioc.37.2019.12.26.11.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 11:19:43 -0800 (PST)
Date: Thu, 26 Dec 2019 12:19:42 -0700
From: Rob Herring <robh@kernel.org>
To: Qianggui Song <qianggui.song@amlogic.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: New binding
 for Meson-A1 SoCs
Message-ID: <20191226191942.GA17451@bogus>
References: <20191216123645.10099-1-qianggui.song@amlogic.com>
 <20191216123645.10099-2-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216123645.10099-2-qianggui.song@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_111948_054020_E47BC97C 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jason Cooper <jason@lakedaemon.net>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 16 Dec 2019 20:36:42 +0800, Qianggui Song wrote:
> Update dt-binding document for GPIO interrupt controller of Meson-A1 SoCs
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
