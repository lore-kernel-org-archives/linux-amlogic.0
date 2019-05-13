Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05867C04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 15:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C825A2084A
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 15:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gcRYDT6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C825A2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kv4kz/rh0Jghws+R9JDO7mJPmYO2upe4zFVDAzeLlEs=; b=gcRYDT6jgwwpJt
	aoCJwC1NkUvoSOFIkl8TKep742eLpjCsgK1LIVPZzEL71d4uk4YYtWVe9AA2Jmyn+bQKCJcm5nOYh
	3KXaiD+3YltIruM6cQDoGMC1AOP5Mh+hOuYJHKoexjlJciYrcxi+H5z8Wdey11bRaynYfp1gIIeTb
	EeisOpn547x9XNK328KBmcmjN0qmNvikJghC9TSnJdMVvA0+DmSqEGjVDUln43iekRgz3ntaSJw9a
	ZsGXmKr3uR4TxPrrXOQVlpJway4PAzSX7jn30OP+f/gD6JdMn0sEXjgp37IFp2eQHfasfBXdknYQ/
	dxwI9T4aW8OkInPmsZMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQCox-00025H-TL; Mon, 13 May 2019 15:24:55 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCov-00024v-No
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 15:24:54 +0000
Received: by mail-ot1-f66.google.com with SMTP id j49so4457262otc.13
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 08:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Exa3++INrIvsO/2wwFbAr/g8BRRRca3wv4ypTrPlix8=;
 b=KewMD48FiXQzkctZIE3dxVBqUN4cOY8k8O+RJZ+5WX/uOHbzSFimUUoallsFKGH5PP
 bfjvPGFPQZqvWLJdVGDkGuh1iZzyc2jwlZRa+ay6p8ynWtbR79LYaE5qErCMF4rOY0l2
 trvbPJc6T6Giz+iVtKFqw1YjI680BpLXnmPIDZWWLGaoCYCKFP3NBQSPhJM9aGbzVmjF
 Brl9IA6DA5WY697hufxcQmbXpyhSk4MHA4yiJ4Bcq/emI2vrJ4Y4dwutmuIASgus2tyo
 AWsivyZEMceCVlaRnrm5FfGqcNe2jq1i+dOcNbHIqmIQcQgWI0y89/vgjVgRsVZHeQou
 lftQ==
X-Gm-Message-State: APjAAAVMucZC4W511gcDlm61xNahw5Cdi7S7PDoDgcnIaKZYDA6Ka9GW
 GoNI5Mva/VV6Hj168I1o7A==
X-Google-Smtp-Source: APXvYqxD+j5Q4AEhVMyo/hXjCt0J0a+ijOKVDszq4Ce3lGoF83FSubFyFx1OarmubB6+GoPNGDdf3Q==
X-Received: by 2002:a9d:3f61:: with SMTP id m88mr16458752otc.147.1557761092874; 
 Mon, 13 May 2019 08:24:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a24sm196287otd.37.2019.05.13.08.24.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 08:24:52 -0700 (PDT)
Date: Mon, 13 May 2019 10:24:51 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: pinctrl: add a
 'drive-strength-microamp' property
Message-ID: <20190513152451.GA25690@bogus>
References: <20190510082324.21181-1-glaroque@baylibre.com>
 <20190510082324.21181-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510082324.21181-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_082453_777461_FD77CA4D 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 10 May 2019 10:23:19 +0200, Guillaume La Roque wrote:
> This property allow drive-strength parameter in uA instead of mA.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
