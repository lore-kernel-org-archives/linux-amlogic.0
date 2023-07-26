Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF42C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CR2cM3n2hNQV2yaFOIcijwvnwv8ov1z2raLRHPgryhU=; b=HdW4rhYNpCWxnH
	ENCZqduaK/M/tex5YzeLzAkgrtpiwxxjguF4kBD0SYPfO2Tg0E2rXcRtqhGJFiynhodzUYho1A9X4
	kE0mAXf7U4Ydq0HlCySI4ySGZEsCDBLDFXKHLf9p3cu4Ib+w4m51F8+c4Tmzko14/B38gYaYht2VK
	+UBSFqOia+vFIQM+Bph6OG6eHanFiYMqj4aH2owG9Kb5yfQdW7oPOkKK/AD+YPHAzsu/Fen74yrkA
	QnUl6GzkxlO0W7FI37nsbAEv/910A22yfLjTZK5dbs0A63UgEcudusCWbJ99yJViOoyooQc4WyQAB
	nu9hJvJ+4PiLTP8WLdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOn4G-00BeEO-0C;
	Wed, 26 Jul 2023 22:33:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOn4D-00BeBX-1N
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jul 2023 22:33:14 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-686efa1804eso276197b3a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jul 2023 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690410785; x=1691015585;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhoPsdiptB4d7CawXcBfwFloC2tMhAybwkRKGC29HLo=;
        b=av/dLFPPKp+98RNL9nfep5UWmNIPTllIPkyIQu2zgxfP/EgHmeNkeo+Bsn1K6L2FJP
         plKEV1Z419rQ4iB4SWzjRk1vKxlHQngI3pEdxmlnahPVa7SapauU8yXS0MSJ56/wZ1Ph
         GZRRp8as5twmJ8rwBMhS/mN10XekiW12BlsQKXZeFmXPn275wb4SjFRT5RWTnC+9cY97
         D58MsfY8bvBUlpRk10/EXdaEPJACH9V5V/fvR6HuXUIn1zgy1mZEU++wyj3UgDSrXbg3
         iIz+OgIvm/WSRxT8XqMDPIRxBrjqm5Id/s6Uf1LHS5DzyAmWJv6JAXVCGrEbjA++oWnV
         lzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690410785; x=1691015585;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhoPsdiptB4d7CawXcBfwFloC2tMhAybwkRKGC29HLo=;
        b=kc4s8WvMGSP9aNXdcCE887GrUX5MFJhcy7TnbRgizx/euuF1NsD2doEeoL3cVuVE6o
         6ytXJcl9jfCwv8+7eUIWSyce7aETbasV509ZHMdVDUJDBvdhRVlirezYczdDpsz929MK
         HHEKqKWhLtethMjZkroJ3X1mRnRuohK86/QCpkBuy/8uDh0GKpyo18gc5W3bkQAEc/Dc
         87WdIJU0vDIbuiXfZlNjm2RPD0gpmjadzce6LXdiKwPhGq8QtgqoT0VpvCR87W3d6gUB
         Pq3yz+RDk1scMrxla9xhJ7yLVEurv+kEhehZiCKBivJx8x6Q/yaDYJS5s/c8KS3u2hpO
         gW5A==
X-Gm-Message-State: ABy/qLZAUNjCK5yesa5ffgvtIi+/251jaoSUo+nsXYqg1dUBzpUgGqxv
	tE4oxcy0TeSROGmLoz8qkkTI5w==
X-Google-Smtp-Source: APBJJlETtaTlzNr3kJdmanHHAsk/PIfhyrVfhs5d7qXjTiodnT7x+VyKm7/uXDQlu0rPPnC2GX11rA==
X-Received: by 2002:a05:6a20:1589:b0:12d:d615:9279 with SMTP id h9-20020a056a20158900b0012dd6159279mr3557489pzj.25.1690410785037;
        Wed, 26 Jul 2023 15:33:05 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id c5-20020aa78c05000000b00682562b1549sm114742pfd.24.2023.07.26.15.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 15:33:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: Re: [PATCH 3/3] arm64: dts: Replace the IRQ number with the IRQID
 macro definition
In-Reply-To: <20230721073214.1876417-4-huqiang.qin@amlogic.com>
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
 <20230721073214.1876417-4-huqiang.qin@amlogic.com>
Date: Wed, 26 Jul 2023 15:33:03 -0700
Message-ID: <7hcz0ei9r4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_153313_466117_45C07BF1 
X-CRM114-Status: UNSURE (   6.91  )
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

Huqiang Qin <huqiang.qin@amlogic.com> writes:

> Replacing IRQ numbers with IRQID macro definitions makes node properties
> easier to understand and also makes GPIO interrupts easier to use.
>
> Associated platforms:
> - Amlogic Meson-G12A
> - Amlogic Meson-G12B
> - Amlogic Meson-SM1

Does this mean you tested/validated these changes on those platforms
also?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
