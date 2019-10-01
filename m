Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866C5ECE587
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 22:21:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565B62086A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 22:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmN8ifEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565B62086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8f4v4LuxEo1VCx9Tx2cN0XiXpZVAZy8MqThc/nMAQks=; b=BmN8ifEHpgJ+IH
	8z+4bRrRvHLq+RpsvYY+S07ak8cz9IqIa2xgGt2rS7EmPzc/XtlezKWoqYXo7QqoTNc8MLeU0sBbK
	1iYARwUFkJQYI1tVGaPTbnUOkmGBQqP0mpkGn+TUcfJyTV0IQUZfG+FG2sQue5kPCkpp09OHD8GYE
	wfSsiWrFYPvsJHKAyVHaTFPEJzpcdRJycjyjfXVtmmWW82xqfA344uunVFFsbVJUmDhmNZaT2SBeW
	1Q0ANZ20Ygxv8bMU8zm7Ixx2N0mnX82ZTIj+WUU4uCoKMkUMmbd0PvcqXX0qia82SPlAi78075Jra
	73kt0jHXymNaQqoj6Zsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFQWd-0006C3-FG; Tue, 01 Oct 2019 22:21:43 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFQWM-0005sp-72; Tue, 01 Oct 2019 22:21:27 +0000
Received: by mail-io1-f67.google.com with SMTP id q10so52329018iop.2;
 Tue, 01 Oct 2019 15:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nnP/9qrpFXzWJWcSk1bbOi362G55DzTZbktKWRu2qvk=;
 b=kWIrhsa0iTA1kYsJISt0sgui8IZqwAoDXFXof2SYS2qhMvWLnakHuAZp7D79lR4hB0
 kmhQsoRTZ2+o24/otqJKPtCbEdxdwna88lLZRjw35u7QBQI2LyGrHX5btp1JuKhhIrD7
 yCiyJH7O+eHHXHgpAbLqduvzTB3CFB2IrJ6VEYKwCqCPINWKv4S091Ieb9jxJSq0kedy
 O5JN8yY6cRoKKK+aproxKtehfqyjUtwO198kmR25aZPDLmLJyWOORFkirBGe+wB/5u21
 k2AisBakZfeunNU3pL9GqY2VRvQ0K5Gz+drjxZU0PpAL2wjv0QzD9LHrgoAEE6VIg0qB
 49xA==
X-Gm-Message-State: APjAAAXw0LeL7fmAgGtGdH7XLcTXLfOoFds3B8cwXIwUYfAg7DMNkOxt
 /Z74rhuREShHnubHho6KjQ==
X-Google-Smtp-Source: APXvYqy/3gdgtXKKz0e+W7yj7BbuOZ3+SM3h3iZeJAMJr5dN41VJ8KQsfTODG8toKbXnQ6bcrS5PKA==
X-Received: by 2002:a02:c983:: with SMTP id b3mr710328jap.120.1569968484914;
 Tue, 01 Oct 2019 15:21:24 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
 by smtp.gmail.com with ESMTPSA id d14sm6455491ilm.15.2019.10.01.15.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 15:21:24 -0700 (PDT)
Date: Tue, 1 Oct 2019 17:21:21 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: watchdog: meson-gxbb-wdt: Include
 generic watchdog bindings
Message-ID: <20191001222121.GA29661@bogus>
References: <20190920162124.7036-1-krzk@kernel.org>
 <20190920162124.7036-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920162124.7036-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_152126_426500_99DF1242 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 20 Sep 2019 18:21:24 +0200, Krzysztof Kozlowski wrote:
> Include generic watchdog DT schema bindings in Amlogic GXBB Watchdog
> bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
