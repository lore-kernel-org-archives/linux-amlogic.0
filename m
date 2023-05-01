Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E02C77B73
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWoYPD5hKsB4XU/i2YL5TK6O0L4WOQjdaLE6JbqhrZM=; b=kGBcx29YdQwDRX
	SQCZVKrTOvOA2U5UZimSX2vV9WgrceQf0PZA/+70aAIzefxQQSMEIlgAqhwZgjtSoxwNHMm3RR33q
	zbv5NE0UaP6yO811c87ourQoFa26rI7wSGPStTIYo34OLlp6D6vMSqTbMYu0yuNI4oPkh/FcZAw5o
	14AbCeKZ6tW/8QpImYk3nHSCf2FJbN5GJvpVpbixCmzOr0POKI2timfi9zylpnUOfszvmovqPUpr7
	or9LbgcKgiAbNb9bWKTtgbV7pjwifxOAFAOWmvMB9byQruVrnW1HRqWADXbflDRNJap5LqB2BBoyJ
	Tqhez6WROEL2QDSO36dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptT3T-00G2d3-2U;
	Mon, 01 May 2023 12:54:59 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptT3R-00G2bw-0V;
	Mon, 01 May 2023 12:54:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc394919cso2005614a12.2;
        Mon, 01 May 2023 05:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682945695; x=1685537695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAo8dNemyBmZKJzwSHPX9ecfV5E6VcgUCP+zC+HkHnY=;
        b=CmjQZiAOnFAYZR1iJFg1UyrygucofPe4yJvQZt6urfpK26nO91PXdV9f+BMTodzQ5a
         waojkO682ZSpNC/Gm6TIikFr6wmCv34IkWCSU5JckA/cU60IBQCYlK9PETNdTxLTvGC/
         UVKfF4xIHOR7nGLh4Aa/LtSmDHDVlnxXbmzbVrWYvfVygJ8QFPvwWD201twKNrU2v+No
         s02pqU5/lOUbpCWJDC3Zfvrg9PjfxZrWjAlMMfTxa7reOhT6xJn0IhLPIbP2KJ2h3MbI
         us4tajXV4x0denNJFb6rybxgUrunpeKXB7RWyGyIJARx1EVjbAmHGv8odTG6tI08sJq5
         1Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945695; x=1685537695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAo8dNemyBmZKJzwSHPX9ecfV5E6VcgUCP+zC+HkHnY=;
        b=PfOSXC5W+xjkPIBu1YmQTV0s7uFqTppFqDGZcv+30fCBDQDo2TLyxeDQne4bqfwNa0
         dXO7RYmO9kpQ1x1S9meaIU2Vq85x+cy/RqtgB7kg9bGLw/DOiVWjv6wETF5PrWb06FC8
         Sp0mzANhwSXIe9mMnKXt+B9cy11rhxpp26AjKI9/XnKxlBCzoyKesnE7oWEvs/XqSn/0
         Su73KADGT/zvYOPBdYzASdbxJR4XJfxZb7UB0kU/ttmzLsOr/tql9eq712vsyGgqqF+V
         SMbRKHtaoem1tveUCTf4DIZTsFSW+odXAwVlfZ3skF2tkpuiofD5Qmv123Ha8l//Vw0d
         28jQ==
X-Gm-Message-State: AC+VfDwdgPqHXjFYNtur3PhQf6ZN0Uyph0V1l2i/Pm/EG7mBGVcK5CNp
	5mH7YJAMatVRGwIGzutcf7qVzOTL9B63pU1QkTM=
X-Google-Smtp-Source: ACHHUZ6jCwxyd8+8g9DQaMNs8TENzwl0unrTlOJT5nyQ3e8v5ZzqmFvpuxafJO2Nh0+7grkYHMexx/wTu4vKaKPIKPA=
X-Received: by 2002:a17:907:7f89:b0:94f:24d7:64d5 with SMTP id
 qk9-20020a1709077f8900b0094f24d764d5mr13956548ejc.56.1682945695567; Mon, 01
 May 2023 05:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230425165624.11999-1-exkcmailist@inbox.lv> <20230425165624.11999-2-exkcmailist@inbox.lv>
In-Reply-To: <20230425165624.11999-2-exkcmailist@inbox.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 14:54:44 +0200
Message-ID: <CAFBinCBpMbEN5obKeF_jYXYmNX9WJSNfCTKaAd9BpgvuNAt7iw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi box 3 binding
To: Karl Chan <exkcmailist@inbox.lv>
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_055457_198781_87D20547 
X-CRM114-Status: UNSURE (   7.07  )
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

T24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgNjo1N+KAr1BNIEthcmwgQ2hhbiA8ZXhrY21haWxpc3RA
aW5ib3gubHY+IHdyb3RlOgo+Cj4gRnJvbTogIkthcmwgQ2hhbiIgIDxleGtjbWFpbGlzdEBpbmJv
eC5sdj4KPgo+IEFkZCB0aGUgYm9hcmQgYmluZGluZyBmb3IgdGhlIFhpYW9taSBNaSBib3ggMyBB
bmRyb2lkIFNldC1Ub3AgQm94IGRldmljZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEthcmwgQ2hhbiA8
ZXhrY21haWxpc3RAaW5ib3gubHY+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
