Return-Path: <SRS0=Dnil=YQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7922CA9EB9
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2019 20:12:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8903E20650
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2019 20:12:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UFVaLVk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8903E20650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLueSl3s7TjV8GZmGCODrC1LvK9+k3snVOFoLsYoBfU=; b=UFVaLVk+eohLgR
	DC0ttkePOnNQ21Z3vw2cB8cIxJMqeWxkactk21eoRkv3Nw/OGTDvyXvsbztGBr7IcLBRCY08IJdmD
	7k4kZxa6WrAzFIXSpIdEDk4CuY0vRyDp/i4XnIl5D8aZ9Htp7+cedXSrOkXBYGUTabeRFudEnnuux
	aBbcDaQsK9K1kwFk2V7wrUP27E+h1/ILyX8oyghyujgJ55FLxvI2MDwDy3KvbE0EdL6rf8srQY3dB
	809nz51J52DMnx9NU3BsCNTmZPMsgvSVsyPn58Yhp9qdSEOOHBH6+M3KQgDl+9WB7dEiDIM1kHICb
	sZneGgcka6Wtk0gkOuoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNMz7-0007hQ-OW; Wed, 23 Oct 2019 20:11:57 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNMyt-0007N7-Vg; Wed, 23 Oct 2019 20:11:45 +0000
Received: by mail-oi1-f195.google.com with SMTP id g81so18535992oib.8;
 Wed, 23 Oct 2019 13:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ssgTw4r4WsQxJaQ0k03EQpF6DWzjNZA4/vVMy3/jAcM=;
 b=ZImRdKqJ7EPD/yiKvL5hEyrQmLi9eEXAQo9EqQ2qZRunZM5UpomdCZkloDjYeGtesV
 CiRU/ZrPGe4Zqpd336LMGD9c2mEml+g/+mPJ+kTu0QfSPA3BM8k2QlxY6E/ZZ1th9LL/
 cVf/Tkejshq0liT8pPwjlL0P/Z9YBfq9fEUxHvDXuoH12hU6ks/9D+OQbszjOmczS1O6
 OAmahcK/fyBc1eZZcfaMUkxtYIoYWBnG/4pivkiOebPcZaajuoRPryt67aEXLQ+Wr0yC
 0KgLro0/fv2Pf4D+s2Zu7FCTW7flfFf5G8HovkPndq8ysuRVblPh94iNmwbhJ7vmn0tC
 wzxA==
X-Gm-Message-State: APjAAAU+WGSkIUPDb/cooQzqn/uQ3MD2eNVXhAEzSvmeUmP0NewzkeW2
 tFbyW8BPXbhdUELt7Xk+FOVSOtg=
X-Google-Smtp-Source: APXvYqwwKmIXhOF7O4GFPIsSTdhEVmGYoVwlyXr/mkWIGXxrFLlArngzjnMcD7Lh9nvgON2DEJ3P2w==
X-Received: by 2002:aca:cf92:: with SMTP id f140mr1557736oig.57.1571861502798; 
 Wed, 23 Oct 2019 13:11:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a69sm5985960oib.14.2019.10.23.13.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 13:11:42 -0700 (PDT)
Date: Wed, 23 Oct 2019 15:11:41 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
Message-ID: <20191023201141.GA21235@bogus>
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014141718.22603-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_131144_058513_60550759 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: balbi@kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tim <elatllat@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 14, 2019 at 04:17:16PM +0200, Neil Armstrong wrote:
> This patch updates the documentation with the information related
> to the quirks that needs to be added for disabling all SuperSpeed XHCi
> instances in park mode.
> 
> CC: Dongjin Kim <tobetter@gmail.com>
> Cc: Jianxin Pan <jianxin.pan@amlogic.com>
> Reported-by: Tim <elatllat@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  1 file changed, 2 insertions(+)

Sigh, what's one more to the never ending list of quirks...

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
