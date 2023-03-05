Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AD0C6FA8E
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5kwLcyTK/W3WawEZ/k35010uRZC0P2k4XURjw6+i5M=; b=L8ZZd32ndbGT+g
	HXS8soUyjsS9z57mJgYeuln1OllsbmxVmvyKig1ID6/iA/FITwha62mgLjXQ9akNYVYOUFwPPRnCh
	ErE1O0HX0uA+qisfNDMTVEcTjvPBaqt8qMJdIoFrAhnhT+RNI1O04bKKS5HNtXMJhpTGXVTbio9d8
	dn0wPDdk4E+yNgiVGuVOUaIZTaI9ZTHzy/wWhpDHtHhilpVTWTfIMf+RzonKXKHu3SBha+pRTq4zT
	Gx8Z/6orHwj3Z1F47jaz+pFLfWxVseJheYwizn3QyY6jJehCqcP/AWnEjbNIgt5sT6qTUVaC5DChB
	1Mm2SPCABfFVcb4BGD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYvjk-00Aeda-P6; Sun, 05 Mar 2023 21:17:44 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYvjX-00Aebf-S9; Sun, 05 Mar 2023 21:17:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id g3so30994925eda.1;
        Sun, 05 Mar 2023 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS5AcYNrckgnL2sP6eQtWDN1tf0SfVYtcQAm6inJXI4=;
        b=AUgaa8q8C2sDbArmeSk3yD3jEPgO38WCcM1Od9JCRecyVKnyiLK2OQdBIZATikadeP
         GDuiV6akZWiSkBkZxu6XVdlmJejG+VCUxQ2bTEm/LbC5AjHgBQ1tRbvnkDrJjz8ayzCf
         jJlca3jO5Kp+ZNwl8pSuGW6I7KYdlOi+1yCz7dwfSR+30EtDz2ECKKlFvixNklRWEsLe
         nOQVPBqCnIUw1UjKYPNcoOy8KRYpTKcpsnX23ClNDvXqpHPN+jz/h3M5gDik0n4gAlZ5
         jAQc/pS7jJvWemET7flfXT2H/gf5++LwJK5E4jp2LDtY/ft2KdDBOBwmFHSc/Wt2avqQ
         I6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS5AcYNrckgnL2sP6eQtWDN1tf0SfVYtcQAm6inJXI4=;
        b=x/9xl8JgyWmDIDAYrmHsXLII+rD1zh0WKm1rDvguLz2lPPessuRb13XSQ3j0LylYqL
         Y5d7i/4xJj8wrpVBCdW/EXxu59zdGWx3iA/REWkZMLA1XNeDb4kS+0OOG6QsHwWQYd1W
         +0YZz6RQpX/wbUfU87F4LgMqT86wj7lJC3VH0VMfSVx/Ix8W2giWanoIWK014DCBB9Gx
         YZhyhSr2Yyuvf8pprmKQxNpned8qSBCwWkVvyVb2vsUDRc81k0FBbsPutv7+z9AEneUS
         m5buOEMnZsLknbjWBo97GD65eBmvaJTF2MUk+YlORZNlRIqvt8fGonadx8KEhzyNM961
         p0Ng==
X-Gm-Message-State: AO0yUKW9q0UvP7YISTXIYZHcKP0OFIad8hw1JzW/2X9vhd26HvHwiHc8
	CwBBlT0enSZxyAhYvB96v3PGb+/kdFBSWBeVAn8=
X-Google-Smtp-Source: AK7set8Td9ISwWxiHsrPXLtAYj6N7KHZR3IphBtTmPwhjPRmMwEy8LJT7H19kndrvwl9iUciDggKq2CxGD07fOwnqfI=
X-Received: by 2002:a50:c05b:0:b0:4c0:2126:ac34 with SMTP id
 u27-20020a50c05b000000b004c02126ac34mr4595186edd.6.1678051049921; Sun, 05 Mar
 2023 13:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20230305134512.1596572-1-christianshewitt@gmail.com> <20230305134512.1596572-2-christianshewitt@gmail.com>
In-Reply-To: <20230305134512.1596572-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Mar 2023 22:17:18 +0100
Message-ID: <CAFBinCBAsQ-98C6x2VEXkU9kGvM6sE3e52E_Jo9NYZRLoykdpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for
 BananaPi M2S variants
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_131731_969566_B3E1D03B 
X-CRM114-Status: UNSURE (   6.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBNYXIgNSwgMjAyMyBhdCAyOjQ14oCvUE0gQ2hyaXN0aWFuIEhld2l0dAo8Y2hyaXN0
aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQmFuYW5hUGkgTTJTIHNoaXBzIGluIHR3
byB2YXJpYW50cyB3aXRoIEFtbG9naWMgUzkyMlggb3IgQTMxMUQgY2hpcHMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPiBB
Y2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
