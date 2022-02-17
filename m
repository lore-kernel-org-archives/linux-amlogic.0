Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A85C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Feb 2022 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTLYEmRmphJ4SBZQybSmXIHpkrTV7VC1wULir21Wn7k=; b=TTNGKPQYySUwtq
	+3nDtGzWOP+ywU8K2uwBcRf6SFBJJ2cLjOSzlY+KjXDVl+Rk4NtEVnKwhal8+3rQKLM+M+XXW9fXc
	tfoomHKg5xS5qKvOwRuloduSYgXCb4h3hDABdNKuyliZr2l6HXkF6s4u8Sv+Nqv9Mg22OJQ+kKpVg
	qSoCni724X1Y5tG8eIbjARHgznglFreMffHif2IAzJPY+CfG8HX1rbi/fKG/IWTH1ah9Oqx64zsXZ
	NojdtB8oJ8qTiqh9OyTNncot+20Q7bdJVDwxMD3pnRj2WWPVZWu5YQE4KQw8XtFDWNj38UDpIqbFE
	2QEJsmiCLFnvgdeokaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKqFJ-00CSB5-Tu; Thu, 17 Feb 2022 23:31:33 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKqFG-00CS9n-Jo; Thu, 17 Feb 2022 23:31:31 +0000
Received: by mail-io1-f46.google.com with SMTP id e79so5593975iof.13;
 Thu, 17 Feb 2022 15:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lPptcx/vVNbCfS8mL64GHmBqshbakCqLpSIPytHgR1M=;
 b=oiVoMU0Gg2gPR6NDWgfhKFvUq0CRxk6rUuUn2GAQiNq3lRLUkydL5EEwQOMmDkKNWY
 ywz2L1x3wrRRN9IiH/ZDSm7xPWS9fOpnmuH6dWvgG9YDixUeRjcSpAVWyINvbCOSniC8
 dyGnfmSbhezeR6SrIpEqS+Qu6nJVL4jxVb1KPxsPG29dDfUtcTMdmvd90/0zBlQXpUYB
 Vjjzy5yPYaj8OgXbkY6DpiLTnsdECcJg9REqFCkJ8Rq89LTigV4sOOMpUBXk4670C3Hq
 BKCdx5+lBYUCXrMaloz/9yvCK+V8G8kSHphHAOBiFfP8nRTOoYqXG1+knUU9ppqj7Nrw
 MrCw==
X-Gm-Message-State: AOAM533pXml/oh9n7OCu4+OixdbM/023uLjL+1FecJEMOumo/am3+NzL
 p8QG1OI/JfhXVnT1GfRMEFrwWOG4Dg==
X-Google-Smtp-Source: ABdhPJzIHjzfj4OyzzRkL5V/l1fMZK8uR3PODJEv/tSK6//NfZ7TfWsGrf8XF6Vv7D7QJ6WmL7RvUA==
X-Received: by 2002:a05:6638:23b:b0:314:a260:1c0f with SMTP id
 f27-20020a056638023b00b00314a2601c0fmr1909042jaq.26.1645140689673; 
 Thu, 17 Feb 2022 15:31:29 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id o17sm466925ilg.70.2022.02.17.15.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:31:28 -0800 (PST)
Received: (nullmailer pid 3975641 invoked by uid 1000);
 Thu, 17 Feb 2022 23:31:26 -0000
Date: Thu, 17 Feb 2022 17:31:26 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: amlogic: add Vero 4K+ bindings
Message-ID: <Yg7azlMf7ZiI+L/A@robh.at.kernel.org>
References: <20220211105311.30320-1-christianshewitt@gmail.com>
 <20220211105311.30320-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211105311.30320-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_153130_692611_38BDFD43 
X-CRM114-Status: UNSURE (   9.79  )
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

On Fri, 11 Feb 2022 10:53:10 +0000, Christian Hewitt wrote:
> Add the board binding for the OSMC Vero 4K+ STB device
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
