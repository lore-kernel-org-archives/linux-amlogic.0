Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E7C43217
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlTrjh9bRC63x5YNA8lOlbrh6Mao0ryLPY+BO/9YQkI=; b=1djo4P0MxSjtcI
	PCBAD15xL5L1lkzZEufgqgPlKdSLyDwNEAepzIfVYeMZIF39WHTzMIXYKvsCmc82pWcXYruAJUqvm
	Vw0uXtGJGWbDz68wOx+2HPnvXlPbgRxg71PRLKZ2ewIu2ItVuD8dBMtwvzze5sef6bIAAkjN0Z+zS
	NIicaFxh10lYtLEOFMhtUsGEIozO6lsIx67qWlt4Vluv3OwdbID90j9DG8vA12WoNT9aa7xDeO1YE
	cvpCvjYL97qcHj2iJ/UfLxAasll77P59IeJXB6ohK9PMqkCfLrYBQkmKFOyozfOMF71hqyj/eLw0e
	OOR8hssJ1oyDHMimXyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGXq-00C6zb-1T; Wed, 02 Nov 2022 16:24:50 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGXf-00C6th-PB; Wed, 02 Nov 2022 16:24:41 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13b23e29e36so20846840fac.8;
        Wed, 02 Nov 2022 09:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TymtfC49QCmqyHl8QfkMefC0X7Dx2Oap8HRgSBbJllo=;
        b=gIEmi69QlryhML4YGGy4J6ddJ4TQclnhoxCFqmE/deouvdnpYFEL2uORd86Lrg8xW2
         MRYUZpZBN54P6MBdx4ClExXImfyjXothsAYgLvX/N+YyyrLzW+8xIw7nPOk7c7OjLMj4
         KM9OUHA38n0A7OsX/Hvxb2sjEs2lb7uyv4AVDwyb75oSqgXhUu7rqhI+1WOhEMM/CAYg
         AGffhT++LDDI6MuiiOj0zZ0aEqn8xZ47dCYOaV4Gnv8GitpqApsP0l8zpWsQsKnCZXSX
         kxqKLgZvdrnPDGYFboIFTpADFgUPrto39TtxcMKWANQ/55+avmzhoYaHNek7DHR6MJQ8
         z97w==
X-Gm-Message-State: ACrzQf0ahQYoemxDm3WjkmOmAHmbqACdQm9hiwl7ha2dT1PPxgdd4J45
	ficSlUAQBSCX+c0Mpc8FdEYReYqobQ==
X-Google-Smtp-Source: AMsMyM6h/TEdVbnmz3cAGb9ZgLtOAdeHBDX+uj0jE4B4sLIw7YTn9d735BJOdrhMxnqs7TAuN7Ktrw==
X-Received: by 2002:a05:6871:9f:b0:131:52e5:fe7b with SMTP id u31-20020a056871009f00b0013152e5fe7bmr15173055oaa.80.1667406277603;
        Wed, 02 Nov 2022 09:24:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e8-20020a544f08000000b00354b575424csm4682216oiy.29.2022.11.02.09.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:24:37 -0700 (PDT)
Received: (nullmailer pid 3998144 invoked by uid 1000);
	Wed, 02 Nov 2022 16:24:38 -0000
Date: Wed, 2 Nov 2022 11:24:38 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: amlogic: document Odroid Go Ultra
 compatible
Message-ID: <166740627837.3998090.4730126926923594945.robh@kernel.org>
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-3-42e3dbea86d5@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-3-42e3dbea86d5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_092439_843363_5ED34FAF 
X-CRM114-Status: GOOD (  10.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIE1vbiwgMzEgT2N0IDIwMjIgMTc6NDc6MjcgKzAxMDAsIE5laWwgQXJtc3Ryb25nIHdyb3Rl
Ogo+IFRoaXMgZG9jdW1lbnRzIHRoZSBPZHJvaWQgR28gVWx0cmEsIGEgcG9ydGFibGUgZ2FtaW5n
IGRldmljZSwKPiB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhcmFjdGVyaXN0aWNzOgo+IC0gQW1sb2dp
YyBTOTIyWCBTb0MKPiAtIFJLODE3ICYgUks4MTggUE1JQ3MKPiAtIDJHaUIgTFBERFI0Cj4gLSBP
biBib2FyZCAxNkdpQiBlTU1DCj4gLSBNaWNybyBTRCBDYXJkIHNsb3QKPiAtIDVpbmNoIDg1NMOX
NDgwIE1JUEktRFNJIFRGVCBMQ0QKPiAtIEVhcnBob25lIHN0ZXJlbyBqYWNrLCAwLjVXYXR0IDjO
qSBNb25vIHNwZWFrZXIKPiAtIExpLVBvbHltZXIgMy43Vi80MDAwbUFoIEJhdHRlcnkKPiAtIFVT
Qi1BIDIuMCBIb3N0IENvbm5lY3Rvcgo+IC0geDE2IEdQSU8gSW5wdXQgQnV0dG9ucwo+IC0gMngg
QURDIEFuYWxvZyBKb3lzdGlja3MKPiAtIFVTQi1DIFBvcnQgZm9yIFVTQjIgRGV2aWNlIGFuZCBD
aGFyZ2luZwo+IAo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9u
Z0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FtbG9naWMueWFtbCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
PiAKCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
