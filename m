Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2BC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jul 2022 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQZc4+mvwRKEPBra6GHpNdXdsMjI55c1SJKNo/e9620=; b=piYlA+aiEgy4Ob
	2n9OpH9rRl84tKYDYxyu2iVxvPT9kF3UTKNCZA1qW6H0giJgxE9xLvAwwcTHVCpm0Nm4QNMDXBuVa
	q/1fQu5wOMOzKhJ2Q8Z4sZXpP6HvU7U/PbGEo+bcwBN39KvBzwGDZbw7YvTWDmkK1SLskIA60aS7i
	wG8BKVRbwpzzHcDGQqANuW2qGL+VIPvdotfzOPSOjScSn92xwXUrMw/WbYh4d2OiZ4uKZMcnNw0WX
	HfGOn/+ZozCwbMTsoFdQqEsY38ha1MqfCRWu2NciI/z28+/moMPUkLRN4kpAHZt+a+eUsH6Ej371P
	Ei3OlvdSKP/cGF4z4Dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAz6g-004JKK-2S; Mon, 11 Jul 2022 19:30:10 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAz6e-004JJX-83; Mon, 11 Jul 2022 19:30:09 +0000
Received: by mail-io1-f45.google.com with SMTP id y3so5886156iof.4;
        Mon, 11 Jul 2022 12:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b3yEB3Go+pE9ig6J6Qa9FEaP1GF3s6KwwZrn0irAjB0=;
        b=CJsbPB1+AXOEow18EadRz0fxxqvF4Yx2RrTv2ySHvh7BO8c5/wMqhvVHf7dbHBkzid
         rPcaHxQ3cPpKkeHC6hUwM5vdALPlVIvxlEPDPYGoaZwSsEbPILDhXp0ItqzXryPLtS2A
         +Gvre8Gf+jl0fil5sZ8T7Eez7P4Tgh9QLJE0pYyXnsT48HqkVzSQSJiAMUoMOrter2zr
         0p1FfLUcSErbadpLZFsGKy6KaE+Chu/oQZBtLVyYwyCv89YLvC6NfwclqXdEpGLLxaKs
         qk2L6/TaKcLN9F6n+Rp9S+WLuxjeoBbWHs4Bdb215jcqaxDz58CUq5JHSMS1dKxWe8IM
         vsYw==
X-Gm-Message-State: AJIora9Qp+gHX7OOY82ayrQk7sjNBh342RQvGoV6I+HLBy1XgAkXlYtV
	EjuIC7UCHmEqlNM6ejOdMQ==
X-Google-Smtp-Source: AGRyM1tzZKV4m0lkKkBmtNLJU+u8REcrOT3WM73Q0PtFkuQfDcLWvB9NtofF6qBbD4UZCA18b1jPUQ==
X-Received: by 2002:a02:c882:0:b0:33b:fb2e:9d49 with SMTP id m2-20020a02c882000000b0033bfb2e9d49mr10839803jao.218.1657567806987;
        Mon, 11 Jul 2022 12:30:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a16-20020a029f90000000b0033f58404535sm1561267jam.110.2022.07.11.12.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 12:30:06 -0700 (PDT)
Received: (nullmailer pid 139401 invoked by uid 1000);
	Mon, 11 Jul 2022 19:30:05 -0000
Date: Mon, 11 Jul 2022 13:30:05 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, Furkan Kardame <furkan@fkardame.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Beelink GT1 Ultimate
 binding
Message-ID: <20220711193005.GA139368-robh@kernel.org>
References: <20220707093954.21716-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707093954.21716-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_123008_307371_45FA0175 
X-CRM114-Status: UNSURE (   9.71  )
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

On Thu, 07 Jul 2022 09:39:53 +0000, Christian Hewitt wrote:
> Add the board binding for the Shenzen AZW (Beelink) GT1 Ultimate
> Android Set-Top Box device.
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
