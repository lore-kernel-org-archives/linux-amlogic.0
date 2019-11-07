Return-Path: <SRS0=QqPF=Y7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93481FC6194
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Nov 2019 01:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5783C206DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Nov 2019 01:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ILpC/iYW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5783C206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wurJrMGSH221F/+CxCE63qNfKb6ncCpNkvJd0ZJDjBo=; b=ILpC/iYWh19BDX
	wJy7o6xqV486z4QPQyHVUuWrTBmnNsgKQxVL0Ey1h5DVF99FJCxMdD2L69vQ4aXXXy2runsJUz6rd
	NA87+pDOCIo2iMor64/4aDEjDrvcD1qUrfv231ao+4WWgsY/ePmzLwhYnWRtib6LRgXNoX3A6AQSX
	DxD38iKzaDae6mrzTOUY3CxaDjuMkHp22QQjPoYVHcIAnUSvUd6dabaPA49Yri/bTvmMZPr/Qzg+q
	nAWP/oEYkYF3K/1m6/wwLCox71aCxYe2UaFN0oWaFEDXJC2Zv7P3rmRWWGwyQLPN7Q/sMv7HdF21a
	4IIJq5aS+5oZcgUIb+pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSWAx-00067S-Iz; Thu, 07 Nov 2019 01:01:27 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSWAg-0005ra-IC; Thu, 07 Nov 2019 01:01:12 +0000
Received: by mail-ot1-f66.google.com with SMTP id c19so490125otr.11;
 Wed, 06 Nov 2019 17:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0UuYlDNlg6CYP1umbuTYzjw05bILsaabq8J86syVD2w=;
 b=aOOK3oUYS9BYqvQVL4M7WQ+3eUcF/OPXSj8uq97c6h+XBj2tgrVrRdX2z8moTOic6P
 CRcioQNSlRFBfrOdqIqsBa1tTsdhjhFoioKaRjNXUf07jMums8sJT12JoFcPlYZ1ytFe
 ONgmIGxMyhAzCzZcF/x7ivI8F84+T4OOluXJyeil0jwehVpA1Gl0G3MXM5ZfEQzufK+2
 Rt0sh3p+aADgLlTfM6F/BBcCoNMSced8mfZA7q3Z49FFlr2sYmt6lVYmN4d6h9K1LyrM
 GAdZIcrCAIAOKWqooESGWdW8NXGKY6IQT1teWt4VgHzRIygU3li2RdWsPHEveK693Rvl
 lFkg==
X-Gm-Message-State: APjAAAUc66Eg4J1hKwE3X8sUX0v3fj+AGbOOj2NsDxtFbxVdov1F3pxy
 OlhweFJXj5htXn8SOIxy4A==
X-Google-Smtp-Source: APXvYqyOlvqRefihFIqohvXnpjnmLfZkNeSk5z0zxj9LIO/elGrRi5RqBERx/C9tj5eOaNM2qfOfEQ==
X-Received: by 2002:a9d:7410:: with SMTP id n16mr570148otk.3.1573088469199;
 Wed, 06 Nov 2019 17:01:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a3sm222078oto.15.2019.11.06.17.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 17:01:08 -0800 (PST)
Date: Wed, 6 Nov 2019 19:01:08 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] dt-bindings: usb: dwc3: Move Amlogic G12A DWC3 Glue
 Bindings to YAML schemas
Message-ID: <20191107010108.GA5321@bogus>
References: <20191106104458.23698-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106104458.23698-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_170110_616912_59BEB48B 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed,  6 Nov 2019 11:44:58 +0100, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic G12A DWC3 Glue Bindings over to a YAML schemas,
> the AXG and GXL glue bindings will be converted later.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1:
> - fixed typo in description
> - removed dr-mode definition in favor of "true"
> 
>  .../devicetree/bindings/usb/amlogic,dwc3.txt  |  88 ------------
>  .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 88 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> 

Applied, thanks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
